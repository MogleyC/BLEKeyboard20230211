#ifndef BLEPROFILE_HIDKEYBOARD_DEF_H
#define BLEPROFILE_HIDKEYBOARD_DEF_H

#include <bluetooth/services/hids.h>
#include "hid_usages.h"

#define BASE_USB_HID_SPEC_VERSION 0x0101

#define OUTPUT_REPORT_MAX_LEN 1
#define OUTPUT_REPORT_BIT_MASK_NUM_LOCK 0x01
#define OUTPUT_REPORT_BIT_MASK_CAPS_LOCK 0x02
#define INPUT_REP_KEYS_REF_ID 0
#define OUTPUT_REP_KEYS_REF_ID 0
#define SCAN_CODE_POS 2
#define KEYS_MAX_LEN (INPUT_REPORT_KEYS_MAX_LEN - \
					  SCAN_CODE_POS)

/* Buttons configuration */

/* Note: The configuration below is the same as BOOT mode configuration
 * This simplifies the code as the BOOT mode is the same as REPORT mode.
 * Changing this configuration would require separate implementation of
 * BOOT mode report generation.
 */
#define KEY_CTRL_CODE_MIN 224 /* Control key codes - required 8 of them */
#define KEY_CTRL_CODE_MAX 231 /* Control key codes - required 8 of them */
#define KEY_CODE_MIN 0		  /* Normal key codes */
#define KEY_CODE_MAX 101	  /* Normal key codes */
#define KEY_PRESS_MAX 6		  /* Maximum number of non-control keys \
							   * pressed simultaneously             \
							   */

/* Number of bytes in key report
 *
 * 1B - control keys
 * 1B - reserved
 * rest - non-control keys
 */
#define INPUT_REPORT_KEYS_MAX_LEN (1 + 1 + KEY_PRESS_MAX)

/* Current report map construction requires exactly 8 buttons */
BUILD_ASSERT((KEY_CTRL_CODE_MAX - KEY_CTRL_CODE_MIN) + 1 == 8);

/* OUT report internal indexes.
 *
 * This is a position in internal report table and is not related to
 * report ID.
 */
enum
{
	OUTPUT_REP_KEYS_IDX = 0
};

/* INPUT report internal indexes.
 *
 * This is a position in internal report table and is not related to
 * report ID.
 */
enum
{
	INPUT_REP_KEYS_IDX = 0
};

struct conn_mode
{
	struct bt_conn *conn;
	bool in_boot_mode;
};

struct keyboard_state
{
	uint8_t ctrl_keys_state; /* Current keys state */
	uint8_t keys_state[KEY_PRESS_MAX];
};

void hid_kb_hids_pm_evt_handler(struct conn_mode *conn_mode,
									   enum bt_hids_pm_evt evt,
									   struct bt_conn *conn);

int hid_kb_init(struct bt_hids *hids_obj, bt_hids_pm_evt_handler_t pm_evt_handler);

int hid_kb_set_connected(struct bt_hids *hids_obj,
						 struct conn_mode *conn_mode,
						 struct bt_conn *conn);

int hid_kb_set_disconnected(struct bt_hids *hids_obj,
							struct conn_mode *conn_mode,
							struct bt_conn *conn);

/** @brief Function process and send keyboard state to all active connections
 *
 * Function process global keyboard state and send it to all connected
 * clients.
 *
 * @return 0 on success or negative error code.
 */
int hid_kb_key_report_send(struct bt_hids *hids_obj,
						   struct conn_mode *conn_mode,
						   const struct keyboard_state *state);

#endif