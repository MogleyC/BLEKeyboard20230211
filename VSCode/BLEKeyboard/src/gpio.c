/**
 * @file gpio.c
 * @author Kang Shin Gu (indra1469@naver.com)
 * @brief GPIO 초기화 와 업데이트 관련
 * @version 1.0
 * @date 2024-05-25
 * 
 * @copyright Copyright (c) 2024
 */
#include "gpio.h"

#include <zephyr/shell/shell.h>

// for gpio control func rename
#define gpio_set gpio_pin_set_dt
#define gpio_get gpio_pin_get_dt
#define gpio_tgl gpio_pin_toggle_dt

// for logging
LOG_MODULE_DECLARE(my_module);

// for thread
K_THREAD_STACK_DEFINE(thread_stack_area_gpio_0, 256);
K_THREAD_STACK_DEFINE(thread_stack_area_gpio_1, 512);
static struct k_thread thread_data_gpio_0;
static struct k_thread thread_data_gpio_1;

// for keyStatus

#define KEY_STATUS_MSG_QUEUE_MAX_CNT 4

K_MSGQ_DEFINE(key_status_msg_queue,
			  sizeof(key_status_msg_data),
			  KEY_STATUS_MSG_QUEUE_MAX_CNT,
			  4);

/**
 * ------------ define gpioID -----------------
*/
#define GPIO_SPEC_AND_COMMA(node_id) GPIO_DT_SPEC_GET(node_id, gpios),

#define LED0_NODE DT_ALIAS(led0)
static const struct gpio_dt_spec led0 = GPIO_DT_SPEC_GET(LED0_NODE, gpios);

static const struct gpio_dt_spec btnpwr[] = {
    GPIO_DT_SPEC_GET(DT_NODELABEL(pins), btnpwr_0_gpios),
    GPIO_DT_SPEC_GET(DT_NODELABEL(pins), btnpwr_1_gpios),
    GPIO_DT_SPEC_GET(DT_NODELABEL(pins), btnpwr_2_gpios),
    GPIO_DT_SPEC_GET(DT_NODELABEL(pins), btnpwr_3_gpios),
};

static const struct gpio_dt_spec btnsens[] = {
    GPIO_DT_SPEC_GET(DT_NODELABEL(btn_0), gpios),
    GPIO_DT_SPEC_GET(DT_NODELABEL(btn_1), gpios),
    GPIO_DT_SPEC_GET(DT_NODELABEL(btn_2), gpios),
    GPIO_DT_SPEC_GET(DT_NODELABEL(btn_3), gpios),
};

// #define BUTTONS_NODE DT_PATH(buttons)
// static const struct gpio_dt_spec btnsens[] = {
// #if DT_NODE_EXISTS(BUTTONS_NODE)
// 	DT_FOREACH_CHILD(BUTTONS_NODE, GPIO_SPEC_AND_COMMA)
// #endif
// };

/**
 * ------------ define gpioID end -----------------
*/

/**
 * @brief 준비 + 초기화
 * 
 * @param spec gpioID (GPIO_DT_SPEC_GET을 통해 얻은 ID)
 * @param extra_flags 추가할 GPIO속성 (aleady setted ACTIVE)
 * @return int 
 */
static int pin_init(const struct gpio_dt_spec *spec, gpio_flags_t extra_flags)
{
	if (!gpio_is_ready_dt(spec))
	{
		return -1;
	}

	return gpio_pin_configure_dt(spec, extra_flags);
}
int gpio_init(void)
{
	int ret = 0;
	ret = pin_init(&led0, GPIO_OUTPUT_INACTIVE);
	if (ret < 0)
	{
		return -1;
	}

	for (int i = 0; i < ARRAY_SIZE(btnpwr); i++)
	{
		// ret = pin_init(&btnpwr[i], GPIO_OUTPUT_ACTIVE);
		ret = pin_init(&btnpwr[i], GPIO_OUTPUT_INACTIVE);
		if (ret < 0)
		{
			return -1;
		}
	}

	for (int i = 0; i < ARRAY_SIZE(btnsens); i++)
	{
		ret = pin_init(&btnsens[i], GPIO_INPUT);
		if (ret < 0)
		{
			return -1;
		}
	}

	return 0;
}

// int gpio_set(const struct gpio_dt_spec *spec, int value)
// {
// 	return gpio_pin_set_dt(spec, value);
// }

// int gpio_get(const struct gpio_dt_spec *spec)
// {
// 	return gpio_pin_get_dt(spec);
// }

// int gpio_tgl(const struct gpio_dt_spec *spec)
// {
// 	return gpio_pin_toggle_dt(spec);
// }

static void thread_LedUpdate(void *arg1, void *arg2, void *arg3)
{
    // arg1, arg2, arg3 사용하지 않음을 명시
    (void)arg1;
    (void)arg2;
    (void)arg3;

	int ret = 0;
	while (true)
	{
		ret = gpio_tgl(&led0);
		if (ret < 0)
			return;
		k_msleep(250);
	}
}

/**
 * @brief 키보드 입력 체크(쓰레드)
 * 
 * @param arg1 no use
 * @param arg2 no use
 * @param arg3 no use
 */
static void thread_KeyInputUpdate(void *arg1, void *arg2, void *arg3)
{
	// arg1, arg2, arg3 사용하지 않음을 명시
	(void)arg1;
	(void)arg2;
	(void)arg3;

	uint16_t callcnt = 0;
	uint8_t rowIdx = 0;
	int ret = 0;

	while (true)
	{
		// 메시지 큐 확인
		if (k_msgq_num_free_get(&key_status_msg_queue) == 0)
		{
			// 메시지 큐가 가득 찼을 경우

			// option1. 모든 메시지를 비우기
			k_msgq_purge(&key_status_msg_queue);

			// option2. 메시지 1개 버리기
			// key_status_msg_data msg_data_discard;
			// k_msgq_get(&key_status_msg_queue, &msg_data_discard, K_NO_WAIT);
		}

		for (rowIdx = 0; rowIdx < 4; rowIdx++)
		{

			// 체크할 행 지정
			{
				ret = gpio_set(&btnpwr[rowIdx], 1);
				if (ret != SUCCESS)
				{
					printk("Err. [thread_KeyInputUpdate] gpio_set\n");
					return;
				}
			}
			k_usleep(100);

			// GPIO Input(키입력) 체크
			{
				// printk("btnsens [%d] %d %d %d %d\n", rowIdx, gpio_get(&btnsens[0]), gpio_get(&btnsens[1]), gpio_get(&btnsens[2]), gpio_get(&btnsens[3]));
				key_status_msg_data msg_data;
				msg_data.rowIdx = rowIdx;
				for (size_t i = 0; i < 4; i++)
				{
					msg_data.colKeyInput[i] = gpio_get(&btnsens[i]);
				}

				// 메시지 발송
				ret = k_msgq_put(&key_status_msg_queue, &msg_data, K_NO_WAIT);
				if (ret != SUCCESS)
				{
					printk("Err. [thread_KeyInputUpdate] k_msgq_put\n");
					return;
				}
			}
			k_usleep(100);

			// GPIO 초기화
			{
				ret = gpio_set(&btnpwr[rowIdx], 0);
				if (ret != SUCCESS)
				{
					printk("Err. [thread_KeyInputUpdate] gpio_set\n");
					return;
				}
			}

			++callcnt;
			k_msleep(10);
		}
	}
}

int gpio_thread_start(void)
{
	k_thread_create(&thread_data_gpio_0, thread_stack_area_gpio_0,
					K_THREAD_STACK_SIZEOF(thread_stack_area_gpio_0),
					thread_LedUpdate,
					NULL, NULL, NULL,
					7, 0, K_NO_WAIT);
					
	k_thread_create(&thread_data_gpio_1, thread_stack_area_gpio_1,
					K_THREAD_STACK_SIZEOF(thread_stack_area_gpio_1),
					thread_KeyInputUpdate,
					NULL, NULL, NULL,
					3, 0, K_NO_WAIT);

    k_thread_start(&thread_data_gpio_0);
    k_thread_start(&thread_data_gpio_1);

	return 0;
}

struct k_msgq *get_key_status_msg_queue_ptr(void)
{
	return &key_status_msg_queue;
}

