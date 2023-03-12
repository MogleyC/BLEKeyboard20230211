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
	//// 배터리 확인용 타이머를 생성
	//// 일정 주기마다 반복해서 배터리 확인 함수를 실행한다.
	//// 그냥 매개변수 구조체에 매개변수를 넣어주는 기능만 한다.
 //   err_code = app_timer_create(&m_battery_timer_id,
 //                               APP_TIMER_MODE_REPEATED,
 //                               battery_level_meas_timeout_handler);
    APP_ERROR_CHECK(err_code);
}