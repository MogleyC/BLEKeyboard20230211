#ifndef BLEPROFILE_HIDKEYBOARD_1_H
#define BLEPROFILE_HIDKEYBOARD_1_H

#include "include.h"
#include "bleProfile_HidKeyboard_def.h"

int hid_kb_1_init(void);
int hid_kb_1_set_connected(struct bt_conn *conn);
int hid_kb_1_set_disconnected(struct bt_conn *conn);
int hid_kb_1_key_report_send(const struct keyboard_state *state);

#endif