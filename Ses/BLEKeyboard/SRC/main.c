#include <stdint.h>
#include <stdio.h>

#include "module_nrf_log.h"
#include "module_app_timer.h"
#include "module_pwr_mgmt.h"
#include "module_app_scheduler.h"
#include "module_ble.h"

int main()
{
	// nrf�⺻ �α� �ý����� �ʱ�ȭ �Ѵ�.
	log_init();
	
	// Ÿ�̸� �ý����� �ʱ�ȭ �Ѵ�. ���͸� Ȯ�ο� Ÿ�̸Ӹ� �����Ѵ�.
	timers_init();
	
	// ���弳���� �ʱ�ȭ
	// �ַ� led�� Key������ �׿��� �͵鵵 �ִ�.
	// Key�� ��� ���ͷ�Ʈ�� �̿��ϰ� �ִ�.
	//buttons_leds_init(&erase_bonds);
	
	// ������ ������ �ʱ�ȭ
	power_management_init();
	
	// BLE ����Ʈ ����̽� Ȱ��ȭ
	ble_stack_init();
	
	// �����췯 ����� �ʱ�ȭ
	// ���� ������Ʈ�� AppTimer�� ����Ʈ����̽��� �����췯 ������� �����Ǿ� �ִ�.
	// NRF_SDH_DISPATCH_MODEL�� ����
	scheduler_init();
	
	// GAP (Generic Access Profile)�� ������ �Է��ϰ� ����Ʈ����̽��� �����ش�.
	// ��ġ�� ������ �����ִµ� ���
	// ����̽� �̸�, ���� ��
	gap_params_init();
	
	// GATT�� (Generic Attribute Profile)��  ������ �Է��ϰ� ����Ʈ����̽��� �����ش�.
	// �� BLE ��ġ�� �����͸� ��ȯ�ϴ� ����� �����ϴ� �� ���
	// MTU �� GAP ũ��
	gatt_init();
	
	// BLE ���� �ʱ�ȭ
	// LE��ġ ��� ���� �����Ѵ�.
	advertising_init();
	
	// ���� �ʱ�ȭ
	services_init();
	
	// ���͸��� �ﰢ���� �������. �ǹ� ����.
	// ���� ���͸����� ��� BLE�� ���������� Ȯ������
	//sensor_simulator_init();
	
	// BLE ����Ʈ�ÿ� ���� ����
	// timeOut���� ������ �Ѵ�.
	conn_params_init();
	
	// ���۵��� ���� ������(Ű)�� ������ ���� �ʱ�ȭ
	// �Ƹ� �ʿ� ���� �� �ϴ�.
	//buffer_init();
	
	// BLE �Ǿ� �޴��� �ʱ�ȭ
	// �ʼ���Ҵ� �ƴ����� �Ǿ� ����(�翬���) �� ���� ��ȭ�� ���� ���ȴ�.
	peer_manager_init();
	
	// �� Ÿ�̸Ӹ� �����Ѵ�.
	// ���͸� üũ���̴�.
	//timers_start();
	
	// BLE ���� ����
	//advertising_start(erase_bonds);
	advertising_start(false);

	// Enter main loop.
	for (;;)
	{
		//idle_state_handle();
	}
}