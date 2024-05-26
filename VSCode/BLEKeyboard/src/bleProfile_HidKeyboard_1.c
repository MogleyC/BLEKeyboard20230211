#include "bleProfile_HidKeyboard_1.h"

#define HID_OBJ hids_obj_1

/* HIDS instance. */
BT_HIDS_DEF(HID_OBJ,
			OUTPUT_REPORT_MAX_LEN,
			INPUT_REPORT_KEYS_MAX_LEN);

static struct conn_mode conn_mode[CONFIG_BT_HIDS_MAX_CLIENT_COUNT];

static void hids_pm_evt_handler(enum bt_hids_pm_evt evt,
								struct bt_conn *conn)
{
	hid_kb_hids_pm_evt_handler(conn_mode, evt, conn);
}

int hid_kb_1_init(void)
{
	return hid_kb_init(&HID_OBJ, hids_pm_evt_handler);
}

int hid_kb_1_set_connected(struct bt_conn *conn)
{
	return hid_kb_set_connected(&HID_OBJ, conn_mode, conn);
}

int hid_kb_1_set_disconnected(struct bt_conn *conn)
{
	return hid_kb_set_disconnected(&HID_OBJ, conn_mode, conn);
}

int hid_kb_1_key_report_send(const struct keyboard_state *state)
{
	return hid_kb_key_report_send(&HID_OBJ, conn_mode, state);
}