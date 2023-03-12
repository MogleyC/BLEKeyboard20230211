#ifndef MODULE_BLE_H
#define MODULE_BLE_H

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>

	void ble_stack_init();
	void gap_params_init();
	void gatt_init();
	void advertising_init();
	void services_init();
	void conn_params_init();
	void peer_manager_init();
	void advertising_start(bool erase_bonds);

#ifdef __cplusplus
}
#endif //__cplusplus

#endif // MODULE_UART_H