#include "bleProfile_HidKeyboard_0.h"

#define HID_OBJ hids_obj_0

/* HIDS instance. */
BT_HIDS_DEF(HID_OBJ,
			OUTPUT_REPORT_MAX_LEN,
			INPUT_REPORT_KEYS_MAX_LEN);

static struct conn_mode conn_mode[CONFIG_BT_HIDS_MAX_CLIENT_COUNT];

/**
 * @brief CAPS_LOCK 상태를 표출
 * 
 */
static void caps_lock_handler(const struct bt_hids_rep *rep)
{
	// uint8_t report_val = ((*rep->data) & OUTPUT_REPORT_BIT_MASK_CAPS_LOCK) ? 1 : 0;
	// dk_set_led(LED_CAPS_LOCK, report_val);
}

static void hids_outp_rep_handler(struct bt_hids_rep *rep,
								  struct bt_conn *conn,
								  bool write)
{
	char addr[BT_ADDR_LE_STR_LEN];

	if (!write)
	{
		printk("Output report read\n");
		return;
	};

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));
	printk("Output report has been received %s\n", addr);
	caps_lock_handler(rep);
}

/**
 * @brief 부트모드에서 키보드 출력보고서 전송시 호출
 */
static void hids_boot_kb_outp_rep_handler(struct bt_hids_rep *rep,
										  struct bt_conn *conn,
										  bool write)
{
	char addr[BT_ADDR_LE_STR_LEN];

	if (!write)
	{
		printk("Output report read\n");
		return;
	};

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));
	printk("Boot Keyboard Output report has been received %s\n", addr);
	caps_lock_handler(rep);
}

static void hids_pm_evt_handler(enum bt_hids_pm_evt evt,
								struct bt_conn *conn)
{
	char addr[BT_ADDR_LE_STR_LEN];
	size_t i;

	for (i = 0; i < CONFIG_BT_HIDS_MAX_CLIENT_COUNT; i++)
	{
		if (conn_mode[i].conn == conn)
		{
			break;
		}
	}

	if (i >= CONFIG_BT_HIDS_MAX_CLIENT_COUNT)
	{
		printk("Cannot find connection handle when processing PM");
		return;
	}

	bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

	switch (evt)
	{
	case BT_HIDS_PM_EVT_BOOT_MODE_ENTERED:
		printk("Boot mode entered %s\n", addr);
		conn_mode[i].in_boot_mode = true;
		break;

	case BT_HIDS_PM_EVT_REPORT_MODE_ENTERED:
		printk("Report mode entered %s\n", addr);
		conn_mode[i].in_boot_mode = false;
		break;

	default:
		break;
	}
}

/** @brief Function process keyboard state and sends it
 *
 *  @param pstate     The state to be sent
 *  @param boot_mode  Information if boot mode protocol is selected.
 *  @param conn       Connection handler
 *
 *  @return 0 on success or negative error code.
 */
static int key_report_con_send(const struct keyboard_state *state,
							   bool boot_mode,
							   struct bt_conn *conn)
{
	int err = 0;
	uint8_t data[INPUT_REPORT_KEYS_MAX_LEN];

	memset(data, 0, sizeof(data));

	// 특수키 
	//data[0] = state->ctrl_keys_state;
	//data[1] = 0;

	// 일반 6키
	memcpy(&data[2], state->keys_state, KEY_PRESS_MAX);
	// printk("[state->keys_state[0] 1] %d\n", state->keys_state[0]);
	// if (state->keys_state[0] != HID_KEY_NONE)
	// 	data[2] = HID_KEY_1;

	if (boot_mode)
	{
		err = bt_hids_boot_kb_inp_rep_send(&HID_OBJ, conn, data,
										   sizeof(data), NULL);
	}
	else
	{
		err = bt_hids_inp_rep_send(&HID_OBJ, conn,
								   INPUT_REP_KEYS_IDX, data,
								   sizeof(data), NULL);
	}
	return err;
}

int hid_kb_0_init(void)
{
	int err;
	struct bt_hids_init_param hids_init_obj = {0};
	struct bt_hids_inp_rep *hids_inp_rep;
	struct bt_hids_outp_feat_rep *hids_outp_rep;

	static const uint8_t report_map[] = {
		0x05, 0x01, /* Usage Page (Generic Desktop) */
		0x09, 0x06, /* Usage (Keyboard) */
		0xA1, 0x01, /* Collection (Application) */

	/* Keys */
#if INPUT_REP_KEYS_REF_ID
		0x85, INPUT_REP_KEYS_REF_ID,
#endif
		0x05, 0x07, /* Usage Page (Key Codes) */
		0x19, 0xe0, /* Usage Minimum (224) */
		0x29, 0xe7, /* Usage Maximum (231) */
		0x15, 0x00, /* Logical Minimum (0) */
		0x25, 0x01, /* Logical Maximum (1) */
		0x75, 0x01, /* Report Size (1) */
		0x95, 0x08, /* Report Count (8) */
		// 0x95, INPUT_REPORT_KEYS_MAX_LEN, /* Report Count (x) */
		0x81, 0x02, /* Input (Data, Variable, Absolute) */

		0x95, 0x01, /* Report Count (1) */
		0x75, 0x08, /* Report Size (8) */
		0x81, 0x01, /* Input (Constant) reserved byte(1) */

		0x95, 0x06, /* Report Count (6) */
		0x75, 0x08, /* Report Size (8) */
		0x15, 0x00, /* Logical Minimum (0) */
		0x25, 0x65, /* Logical Maximum (101) */
		0x05, 0x07, /* Usage Page (Key codes) */
		0x19, 0x00, /* Usage Minimum (0) */
		0x29, 0x65, /* Usage Maximum (101) */
		0x81, 0x00, /* Input (Data, Array) Key array(6 bytes) */

	/* LED */
#if OUTPUT_REP_KEYS_REF_ID
		0x85, OUTPUT_REP_KEYS_REF_ID,
#endif
		0x95, 0x05, /* Report Count (5) */
		0x75, 0x01, /* Report Size (1) */
		0x05, 0x08, /* Usage Page (Page# for LEDs) */
		0x19, 0x01, /* Usage Minimum (1) */
		0x29, 0x05, /* Usage Maximum (5) */
		0x91, 0x02, /* Output (Data, Variable, Absolute), */
		/* Led report */
		0x95, 0x01, /* Report Count (1) */
		0x75, 0x03, /* Report Size (3) */
		0x91, 0x01, /* Output (Data, Variable, Absolute), */
		/* Led report padding */

		0xC0 /* End Collection (Application) */
	};

	hids_init_obj.rep_map.data = report_map;
	hids_init_obj.rep_map.size = sizeof(report_map);

	hids_init_obj.info.bcd_hid = BASE_USB_HID_SPEC_VERSION;
	hids_init_obj.info.b_country_code = 0x00;
	hids_init_obj.info.flags = (BT_HIDS_REMOTE_WAKE |
								BT_HIDS_NORMALLY_CONNECTABLE);

	hids_inp_rep =
		&hids_init_obj.inp_rep_group_init.reports[INPUT_REP_KEYS_IDX];
	hids_inp_rep->size = INPUT_REPORT_KEYS_MAX_LEN;
	hids_inp_rep->id = INPUT_REP_KEYS_REF_ID;
	hids_init_obj.inp_rep_group_init.cnt++;

	hids_outp_rep =
		&hids_init_obj.outp_rep_group_init.reports[OUTPUT_REP_KEYS_IDX];
	hids_outp_rep->size = OUTPUT_REPORT_MAX_LEN;
	hids_outp_rep->id = OUTPUT_REP_KEYS_REF_ID;
	hids_outp_rep->handler = hids_outp_rep_handler;
	hids_init_obj.outp_rep_group_init.cnt++;

	hids_init_obj.is_kb = true;
	hids_init_obj.boot_kb_outp_rep_handler = hids_boot_kb_outp_rep_handler;
	hids_init_obj.pm_evt_handler = hids_pm_evt_handler;

	err = bt_hids_init(&HID_OBJ, &hids_init_obj);
	__ASSERT(err == 0, "HIDS initialization failed\n");

	return err;
}

int hid_kb_0_set_connected(struct bt_conn *conn)
{
	int err = bt_hids_connected(&HID_OBJ, conn);

	if (err)
	{
		printk("Failed to notify HID service about connection\n");
		return err;
	}

	for (size_t i = 0; i < CONFIG_BT_HIDS_MAX_CLIENT_COUNT; i++)
	{
		if (!conn_mode[i].conn)
		{
			conn_mode[i].conn = conn;
			conn_mode[i].in_boot_mode = false;
			break;
		}
	}

	return err;
}

int hid_kb_0_set_disconnected(struct bt_conn *conn)
{
	int err = bt_hids_disconnected(&HID_OBJ, conn);

	if (err)
	{
		printk("Failed to notify HID service about disconnection\n");

	}

	for (size_t i = 0; i < CONFIG_BT_HIDS_MAX_CLIENT_COUNT; i++)
	{
		if (conn_mode[i].conn == conn)
		{
			conn_mode[i].conn = NULL;
		}
	}

	return err;
}

/** @brief Function process and send keyboard state to all active connections
 *
 * Function process global keyboard state and send it to all connected
 * clients.
 *
 * @return 0 on success or negative error code.
 */
int hid_kb_0_key_report_send(const struct keyboard_state *state)
{
	for (size_t i = 0; i < CONFIG_BT_HIDS_MAX_CLIENT_COUNT; i++)
	{
		if (conn_mode[i].conn)
		{
			int err;

			err = key_report_con_send(state,
									  conn_mode[i].in_boot_mode,
									  conn_mode[i].conn);
			if (err)
			{
				printk("Key report send error: %d\n", err);
				return err;
			}
		}
	}
	return 0;
}