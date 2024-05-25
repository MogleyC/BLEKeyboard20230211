#ifndef BLEPROFILE_HIDKEYBOARD_0_H
#define BLEPROFILE_HIDKEYBOARD_0_H

#include "include.h"
#include "bleProfile_HidKeyboard_def.h"

int hid_kb_0_init(void);
int hid_kb_0_set_connected(struct bt_conn *conn);
int hid_kb_0_set_disconnected(struct bt_conn *conn);
int hid_kb_0_key_report_send(const struct keyboard_state *state);

#endif