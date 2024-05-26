#if 1

#include "BleHidKeyboard.h"

#include <zephyr/shell/shell.h>

#include <zephyr/types.h>
#include <stddef.h>
#include <string.h>
#include <errno.h>
#include <zephyr/sys/printk.h>
#include <zephyr/sys/byteorder.h>
#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <soc.h>
#include <assert.h>
#include <zephyr/spinlock.h>

#include <zephyr/settings/settings.h>

#include <zephyr/bluetooth/bluetooth.h>
#include <zephyr/bluetooth/hci.h>
#include <zephyr/bluetooth/conn.h>
#include <zephyr/bluetooth/uuid.h>
#include <zephyr/bluetooth/gatt.h>

#include <zephyr/bluetooth/services/bas.h>
#include <bluetooth/services/hids.h>
#include <zephyr/bluetooth/services/dis.h>

#include "gpio.h"
#include "hid_usages.h"
#include "bleProfile_HidKeyboard_0.h"
#include "bleProfile_HidKeyboard_1.h"



// for logging
LOG_MODULE_DECLARE(my_module);

// for thread
K_THREAD_STACK_DEFINE(thread_stack_area_blehid_0, 1024);
static struct k_thread thread_data_blehid_0;

#define DEVICE_NAME     CONFIG_BT_DEVICE_NAME
#define DEVICE_NAME_LEN (sizeof(DEVICE_NAME) - 1)

/* ********************* */


static volatile bool is_adv;
static volatile bool is_BLEConnected = false;

static const struct bt_data ad[] = {
	BT_DATA_BYTES(BT_DATA_GAP_APPEARANCE,
				  (CONFIG_BT_DEVICE_APPEARANCE >> 0) & 0xff,
				  (CONFIG_BT_DEVICE_APPEARANCE >> 8) & 0xff),
	BT_DATA_BYTES(BT_DATA_FLAGS, (BT_LE_AD_GENERAL | BT_LE_AD_NO_BREDR)),
	BT_DATA_BYTES(BT_DATA_UUID16_ALL, BT_UUID_16_ENCODE(BT_UUID_HIDS_VAL),
				  BT_UUID_16_ENCODE(BT_UUID_BAS_VAL)),
};

static const struct bt_data sd[] = {
	BT_DATA(BT_DATA_NAME_COMPLETE, DEVICE_NAME, DEVICE_NAME_LEN),
};

struct pairing_data_mitm
{
	struct bt_conn *conn;
	unsigned int passkey;
};

K_MSGQ_DEFINE(mitm_queue,
			  sizeof(struct pairing_data_mitm),
			  CONFIG_BT_HIDS_MAX_CLIENT_COUNT,
			  4);


#define ISKEYPRESS_SIZE 16	// = col:4 * row:4
#define KEYS_STATE_SIZE KEY_PRESS_MAX
#define KEYPRESS_LMITE KEY_PRESS_MAX * 2
static bool isKeyPress[ISKEYPRESS_SIZE] = {0};
static bool isKeyPressPrev[ISKEYPRESS_SIZE] = {0};
static struct keyboard_state kb_state[2];

static void setPairingConfirm(bool accept);

static void advertising_start(void)
{
	int err;
	struct bt_le_adv_param *adv_param = BT_LE_ADV_PARAM(
		BT_LE_ADV_OPT_CONNECTABLE |
			BT_LE_ADV_OPT_ONE_TIME,
		BT_GAP_ADV_FAST_INT_MIN_2,
		BT_GAP_ADV_FAST_INT_MAX_2,
		NULL);

	err = bt_le_adv_start(adv_param, ad, ARRAY_SIZE(ad), sd,
						  ARRAY_SIZE(sd));
	if (err)
	{
		if (err == -EALREADY)
		{
			printk("Advertising continued\n");
		}
		else
		{
			printk("Advertising failed to start (err %d)\n", err);
		}

		return;
	}

	is_adv = true;
	printk("Advertising successfully started\n");
}

static void connected(struct bt_conn *conn, uint8_t err)
{
	char addr[BT_ADDR_LE_STR_LEN];

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

	if (err)
	{
		printk("Failed to connect to %s (%u)\n", addr, err);
		return;
	}

	printk("Connected %s\n", addr);

	err = hid_kb_0_set_connected(conn);
	err = hid_kb_1_set_connected(conn);
	
	is_adv = false;
	is_BLEConnected = true;
}

static void disconnected(struct bt_conn *conn, uint8_t reason)
{
	int err;
	char addr[BT_ADDR_LE_STR_LEN];

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

	printk("Disconnected from %s (reason %u)\n", addr, reason);

	err = hid_kb_0_set_disconnected(conn);
	err = hid_kb_1_set_disconnected(conn);

	is_BLEConnected = false;
	advertising_start();
}

static void security_changed(struct bt_conn *conn, bt_security_t level,
							 enum bt_security_err err)
{
	char addr[BT_ADDR_LE_STR_LEN];

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

	if (!err)
	{
		printk("Security changed: %s level %u\n", addr, level);
	}
	else
	{
		printk("Security failed: %s level %u err %d\n", addr, level,
			   err);
	}
}

BT_CONN_CB_DEFINE(conn_callbacks) = {
	.connected = connected,
	.disconnected = disconnected,
	.security_changed = security_changed,
};

static void auth_passkey_display(struct bt_conn *conn, unsigned int passkey)
{
	char addr[BT_ADDR_LE_STR_LEN];

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

	printk("Passkey for %s: %06u\n", addr, passkey);
}

/// @brief 페어링인증 중 유저에게 패스키 확인 요청
/// @param conn 페어링 요청한 기기 정보
/// @param passkey 페어링 요청 키
static void auth_passkey_confirm(struct bt_conn *conn, unsigned int passkey)
{
	int err;

	struct pairing_data_mitm pairing_data;
	
	pairing_data.conn = bt_conn_ref(conn);		// 불루투스 연결객체의 참조 카운트를 증가 (pairing_data.conn == conn 같은 주소값이다.)
	pairing_data.passkey = passkey;				// passkey를 프린트할때 사용한다.

	// 페어링 요청 정보를 mitm_queue에 저장
	// mitm_queue의 size만큼만 저장된다.(defualt = 1 = CONFIG_BT_HIDS_MAX_CLIENT_COUNT)
	err = k_msgq_put(&mitm_queue, &pairing_data, K_NO_WAIT);
	if (err)
	{
		printk("Pairing queue is full. Purge previous data.\n");
	}

	// 현재 받은 정보로 요청을 수락한다.
	// (즉, 제일 먼저 온 기기에 대해 곧바로 수락한다.)
	// (요청 수락을 선택적으로 하려면 이 부분의 수정이 필요하다.)
	setPairingConfirm(true);
}

/// @brief 취소된 장치의 주소를 받아 터미널에 출력한다.
/// @param conn 
static void auth_cancel(struct bt_conn *conn)
{
	char addr[BT_ADDR_LE_STR_LEN];
	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));
	printk("Pairing cancelled: %s\n", addr);
}

static void pairing_complete(struct bt_conn *conn, bool bonded)
{
	char addr[BT_ADDR_LE_STR_LEN];

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

	printk("Pairing completed: %s, bonded: %d\n", addr, bonded);
}

static void pairing_failed(struct bt_conn *conn, enum bt_security_err reason)
{
	char addr[BT_ADDR_LE_STR_LEN];
	struct pairing_data_mitm pairing_data;

	if (k_msgq_peek(&mitm_queue, &pairing_data) != 0)
	{
		return;
	}

	if (pairing_data.conn == conn)
	{
		bt_conn_unref(pairing_data.conn);
		k_msgq_get(&mitm_queue, &pairing_data, K_NO_WAIT);
	}

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

	printk("Pairing failed conn: %s, reason %d\n", addr, reason);
}

static struct bt_conn_auth_cb conn_auth_callbacks = {
	.passkey_display = auth_passkey_display,
	.passkey_confirm = auth_passkey_confirm,
	.cancel = auth_cancel,
#if CONFIG_NFC_OOB_PAIRING
	.oob_data_request = auth_oob_data_request,
#endif
};

static struct bt_conn_auth_info_cb conn_auth_info_callbacks = {
	.pairing_complete = pairing_complete,
	.pairing_failed = pairing_failed};

/// @brief 인증을 수락/취소 한다.
/// @param accept 
static void setPairingConfirm(bool accept)
{
	struct pairing_data_mitm pairing_data;
	struct bt_conn *conn;

	// 인증관련정보(메시지)가 존재하는지 확인
	if (k_msgq_get(&mitm_queue, &pairing_data, K_NO_WAIT) != 0)
	{
		return;
	}

	conn = pairing_data.conn;

	if (accept)
	{
		bt_conn_auth_passkey_confirm(conn);
		printk("Pairing Confirm accept, conn %p\n", conn);
	}
	else
	{
		bt_conn_auth_cancel(conn);
		printk("Pairing Confirm Reject, conn %p\n", conn);
	}

	// 불루투스 연결객체의 참조 카운트를 감소
	bt_conn_unref(pairing_data.conn);
}

static uint8_t getBtnIDtoHidUsages(uint8_t swID)
{
	switch (swID)
	{
	case 0:
		return HID_KEY_KP0;
		break;
	case 1:
		return HID_KEY_KPDOT;
		break;
	case 2:
		return HID_KEY_KPASTERISK;
		break;
	case 3:
		return HID_KEY_KPENTER;
		break;

	case 4:
		return HID_KEY_KP1;
		break;
	case 5:
		return HID_KEY_KP2;
		break;
	case 6:
		return HID_KEY_KP3;
		break;
	case 7:
		return HID_KEY_KPPLUS;
		break;

	case 8:
		return HID_KEY_KP4;
		break;
	case 9:
		return HID_KEY_KP5;
		break;
	case 10:
		return HID_KEY_KP6;
		break;
	case 11:
		return HID_KEY_KPMINUS;
		break;

	case 12:
		return HID_KEY_KP7;
		break;
	case 13:
		return HID_KEY_KP8;
		break;
	case 14:
		return HID_KEY_KP9;
		break;
	case 15:
		return HID_KEY_NUMLOCK;
		break;

	default:
		return HID_KEY_NONE;
		break;
	}

	return HID_KEY_NONE;
}

struct keyQue_t
{
	uint8_t id_fornt;
	uint8_t id_back;
	uint8_t data[0xFF + 1];

} typedef keyQue;

static keyQue keyQue_add;
static keyQue keyQue_remove;

static int keyQue_put(keyQue * keyQue_ptr, uint8_t key_usageVal)
{
	if(keyQue_ptr->id_fornt == keyQue_ptr->id_back + 1)
	{
		printk("[keyQue_put] err. Queue size is full\n");
		return RESERT_ERR;
	}

	keyQue_ptr->data[keyQue_ptr->id_back] = key_usageVal;
	// printk("[keyQue_put] data[%d] %d\n", keyQue_ptr->id_back, keyQue_ptr->data[keyQue_ptr->id_back]);
	++(keyQue_ptr->id_back);

	return RESERT_OK;
}

static int keyQue_pop(keyQue *keyQue_ptr, uint8_t *p_out_key_usageVal)
{
	if (keyQue_ptr->id_fornt == keyQue_ptr->id_back)
	{
		// printk("[keyQue_pop] err. No more pop data\n");
		return RESERT_ERR;
	}

	*p_out_key_usageVal = keyQue_ptr->data[keyQue_ptr->id_fornt];
	// printk("[keyQue_pop] data[%d] %d\n", keyQue_ptr->id_fornt, keyQue_ptr->data[keyQue_ptr->id_fornt]);
	++(keyQue_ptr->id_fornt);

	return RESERT_OK;
}

static uint8_t keyQue_getSize(const keyQue * keyQue_ptr)
{
	return (keyQue_ptr->id_back - keyQue_ptr->id_fornt);
}

static void keyQue_reset(keyQue * keyQue_ptr)
{
	memset(keyQue_ptr, 0, sizeof(keyQue));
}

static void thread_keyCheck(void *arg1, void *arg2, void *arg3)
{
    // arg1, arg2, arg3 사용하지 않음을 명시
    (void)arg1;
    (void)arg2;
    (void)arg3;

	int ret = 0;
	struct k_msgq * key_status_msg_queue_ptr = get_key_status_msg_queue_ptr();
	int i, j;

	while (true)
	{
		if(is_BLEConnected == false)
		{
			// Key Buffer reset
			{
				memset(isKeyPress, 0, ISKEYPRESS_SIZE);
				memset(isKeyPressPrev, 0, ISKEYPRESS_SIZE);
				memset(kb_state, 0, sizeof(kb_state));
				keyQue_reset(&keyQue_add);
				keyQue_reset(&keyQue_remove);
			}

			// 연결 되기까지 대기
			while (is_BLEConnected == false)
			{
				k_msleep(10);
				continue;
			}
			
		}
		
		memset(isKeyPress, 0, ISKEYPRESS_SIZE);
		for (i = 0; i < 4; i++)
		{
			// 메시지 수신
			key_status_msg_data msg_data;
			ret = k_msgq_get(key_status_msg_queue_ptr, &msg_data, K_FOREVER);
			if (ret != RESERT_OK)
			{
				printk("Err. [thread_keyCheck] k_msgq_get\n");
				continue;
			}
			memcpy(&isKeyPress[msg_data.rowIdx * 4], msg_data.colKeyInput, sizeof(msg_data.colKeyInput));
		}

		// for (i = 3; i >= 0; --i)
		// {
		// 	printk("[%d] %d %d %d %d\n", i, isKeyPress[i * 4 + 0], isKeyPress[i * 4 + 1], isKeyPress[i * 4 + 2], isKeyPress[i * 4 + 3]);
		// }

		// check key change
		for (i = 0; i < ISKEYPRESS_SIZE; i++)
		{
			if(isKeyPress[i] != isKeyPressPrev[i])
			{
				if(isKeyPress[i] == true)
				{
					// 큐 추가 : 새로운 키 추가 입력
					printk("[keyQue_add] %d\n", getBtnIDtoHidUsages(i));
					keyQue_put(&keyQue_add, getBtnIDtoHidUsages(i));
				}
				else{
					// 큐 추가 : 기존 키 삭제
					printk("[keyQue_remove] %d\n", getBtnIDtoHidUsages(i));
					keyQue_put(&keyQue_remove, getBtnIDtoHidUsages(i));
				}
			}
		}

		// KeyPressPrev update
		memcpy(isKeyPressPrev, isKeyPress, ISKEYPRESS_SIZE);
		if (keyQue_getSize(&keyQue_add) > 0 || keyQue_getSize(&keyQue_remove) > 0)
		{
			bool isOver = false;
			uint8_t key_usageVal;
			bool isChanged[2];
			memset(isChanged, 0, sizeof(isChanged));
			
			// printk("[keyQue_szie] add:%d remove:%d\n", keyQue_getSize(&keyQue_add), keyQue_getSize(&keyQue_remove));

			// 기존 키 삭제
			while (keyQue_pop(&keyQue_remove, &key_usageVal) == RESERT_OK)
			{
				isOver = false;

				for (i = 0; !isOver && i < 2; i++)
				{
					for (j = 0; !isOver && j < KEYS_STATE_SIZE; j++)
					{
						if (kb_state[i].keys_state[j] == key_usageVal)
						{
							// printk("[keyQue_remove] kb_state[%d].keys_state[%d] = key_usageVal:%d\n", i, j, key_usageVal);
							kb_state[i].keys_state[j] = HID_KEY_NONE;
							isOver = true;
							isChanged[i] = true;
							break;
						}
					}
				}
			}

			// 새로운 키 추가 입력
			while (keyQue_pop(&keyQue_add, &key_usageVal) == RESERT_OK)
			{
				isOver = false;

				for (i = 0; !isOver && i < 2; i++)
				{
					for (j = 0; !isOver && j < KEYS_STATE_SIZE; j++)
					{
						if (kb_state[i].keys_state[j] == HID_KEY_NONE)
						{
							// printk("[keyQue_add] kb_state[%d].keys_state[%d] = key_usageVal:%d\n", i, j, key_usageVal);
							kb_state[i].keys_state[j] = key_usageVal;
							isOver = true;
							isChanged[i] = true;
							break;
						}
					}
				}
			}

			// msg send
			// printk("[hid_kb_x_key_report_send] isChanged[0]:%d isChanged[1]:%d\n", isChanged[0], isChanged[1]);
			if (isChanged[0] == true)
			{
				hid_kb_0_key_report_send(&kb_state[0]);
			}
			if (isChanged[1] == true)
			{
				hid_kb_1_key_report_send(&kb_state[1]);
			}
		}
	}
}

int bleHid_init(void)
{
	int err;

	// 페어링 보안인증 확인/시도/취소 콜백 등록 - null로 설정시 보안 설정 안함
	err = bt_conn_auth_cb_register(&conn_auth_callbacks);
	// err = bt_conn_auth_cb_register(NULL);
	if (err)
	{
		printk("Failed to register authorization callbacks.\n");
		return 0;
	}

	// 페어링 보안인증 성공/실패 콜백 등록
	err = bt_conn_auth_info_cb_register(&conn_auth_info_callbacks);
	if (err)
	{
		printk("Failed to register authorization info callbacks.\n");
		return 0;
	}

	// hid 프로토콜 설정
	err = hid_kb_0_init();
	if (err)
	{
		printk("hid_kb_0_init failed (err %d)\n", err);
		return 0;
	}

	err = hid_kb_1_init();
	if (err)
	{
		printk("hid_kb_1_init failed (err %d)\n", err);
		return 0;
	}

	err = bt_enable(NULL);
	printk("Bluetooth init (err %d)\n", err);
	if (err)
	{
		printk("Bluetooth init failed (err %d)\n", err);
		return 0;
	}

	printk("Bluetooth initialized\n");

	// Flash에서 저장된 내용 불러오기
	// CONFIG_BT_SETTINGS에 의해 페어링 키 등을 불러옴
	if (IS_ENABLED(CONFIG_SETTINGS))
	{
		settings_load();
	}

	advertising_start();

	return 0;
}

int bleHid_thread_start(void)
{
	k_thread_create(&thread_data_blehid_0, thread_stack_area_blehid_0,
					K_THREAD_STACK_SIZEOF(thread_stack_area_blehid_0),
					thread_keyCheck,
					NULL, NULL, NULL,
					7, 0, K_NO_WAIT);

	 k_thread_start(&thread_data_blehid_0);
	 
	return 0;
}

#endif