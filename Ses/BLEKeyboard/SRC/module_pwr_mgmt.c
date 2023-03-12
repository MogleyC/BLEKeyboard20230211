#include "module_pwr_mgmt.h"
//#include <stdint.h>
#include "nrf_pwr_mgmt.h"
#include "app_error.h"

/**@brief Function for initializing power management.
 */
void power_management_init()
{
    ret_code_t err_code;
    err_code = nrf_pwr_mgmt_init();
    APP_ERROR_CHECK(err_code);
}