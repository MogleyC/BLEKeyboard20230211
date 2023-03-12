#include "module_app_timer.h"
//#include <stdint.h>
#include "app_timer.h"

/**@brief Function for the Timer initialization.
 *
 * @details Initializes the timer module.
 */
void timers_init()
{
    ret_code_t err_code;

    err_code = app_timer_init();
    APP_ERROR_CHECK(err_code);

 //   // Create battery timer.
	//// ���͸� Ȯ�ο� Ÿ�̸Ӹ� ����
	//// ���� �ֱ⸶�� �ݺ��ؼ� ���͸� Ȯ�� �Լ��� �����Ѵ�.
	//// �׳� �Ű����� ����ü�� �Ű������� �־��ִ� ��ɸ� �Ѵ�.
 //   err_code = app_timer_create(&m_battery_timer_id,
 //                               APP_TIMER_MODE_REPEATED,
 //                               battery_level_meas_timeout_handler);
    APP_ERROR_CHECK(err_code);
}