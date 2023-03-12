#include <stdint.h>
#include <stdio.h>

#include "module_nrf_log.h"
#include "module_app_timer.h"
#include "module_pwr_mgmt.h"
#include "module_app_scheduler.h"
#include "module_ble.h"

int main()
{
	// nrf기본 로그 시스템을 초기화 한다.
	log_init();
	
	// 타이머 시스템을 초기화 한다. 배터리 확인용 타이머를 생성한다.
	timers_init();
	
	// 보드설정의 초기화
	// 주로 led와 Key이지만 그외의 것들도 있다.
	// Key의 경우 인터럽트를 이용하고 있다.
	//buttons_leds_init(&erase_bonds);
	
	// 전원부 설정을 초기화
	power_management_init();
	
	// BLE 소프트 디바이스 활성화
	ble_stack_init();
	
	// 스케쥴러 모듈을 초기화
	// 현재 프로젝트는 AppTimer와 소프트디바이스가 스케쥴러 기반으로 설정되어 있다.
	// NRF_SDH_DISPATCH_MODEL을 참고
	scheduler_init();
	
	// GAP (Generic Access Profile)의 정보를 입력하고 소프트디바이스에 보내준다.
	// 장치의 정보를 보내주는데 사용
	// 디바이스 이름, 종류 등
	gap_params_init();
	
	// GATT는 (Generic Attribute Profile)의  정보를 입력하고 소프트디바이스에 보내준다.
	// 두 BLE 장치가 데이터를 교환하는 방식을 정의하는 데 사용
	// MTU 및 GAP 크기
	gatt_init();
	
	// BLE 광고 초기화
	// LE장치 사용 등을 결정한다.
	advertising_init();
	
	// 서비스 초기화
	services_init();
	
	// 배터리용 삼각파형 생성기다. 의미 없다.
	// 추후 배터리값을 어떻게 BLE에 보내는지만 확인하자
	//sensor_simulator_init();
	
	// BLE 컨넥트시에 대한 설정
	// timeOut등의 설정을 한다.
	conn_params_init();
	
	// 전송되지 못한 데이터(키)를 저장할 공간 초기화
	// 아마 필요 없을 듯 하다.
	//buffer_init();
	
	// BLE 피어 메니져 초기화
	// 필수요소는 아니지만 피어 관리(재연결등) 및 보안 강화를 위해 사용된다.
	peer_manager_init();
	
	// 앱 타이머를 시작한다.
	// 배터리 체크용이다.
	//timers_start();
	
	// BLE 광고 시작
	//advertising_start(erase_bonds);
	advertising_start(false);

	// Enter main loop.
	for (;;)
	{
		//idle_state_handle();
	}
}