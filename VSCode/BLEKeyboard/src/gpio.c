#include "gpio.h"

#include <zephyr/shell/shell.h>

// for logging
LOG_MODULE_DECLARE(my_module);

// for thread
K_THREAD_STACK_DEFINE(thread_stack_area_gpio_0, 256);
K_THREAD_STACK_DEFINE(thread_stack_area_gpio_1, 512);
static struct k_thread thread_data_gpio_0;
static struct k_thread thread_data_gpio_1;


#define gpio_set gpio_pin_set_dt
#define gpio_get gpio_pin_get_dt
#define gpio_tgl gpio_pin_toggle_dt

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


/// @brief 준비 + 초기화
/// @param spec gpioID (GPIO_DT_SPEC_GET을 통해 얻은 ID)
/// @param extra_flags 추가할 GPIO속성 (aleady setted ACTIVE)
/// @return
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

static void thread_KeyUpdate(void *arg1, void *arg2, void *arg3)
{
	// arg1, arg2, arg3 사용하지 않음을 명시
	(void)arg1;
	(void)arg2;
	(void)arg3;

	uint32_t callcnt = 0;
	uint8_t arrIdx = 0;
	int ret = 0;
	while (true)
	{
		arrIdx = 3 - callcnt % 4;
		ret = gpio_set(&btnpwr[arrIdx], 1);
		if (ret < 0)
			return;
		k_msleep(1);

		//printk("btnsens [%d] %d %d %d %d\n", arrIdx, gpio_get(&btnsens[0]), gpio_get(&btnsens[1]), gpio_get(&btnsens[2]), gpio_get(&btnsens[3]));
		k_msleep(1);
		ret = gpio_set(&btnpwr[arrIdx], 0);
		if (ret < 0)
			return;

		++callcnt;
		k_msleep(48);
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
					thread_KeyUpdate,
					NULL, NULL, NULL,
					3, 0, K_NO_WAIT);

    k_thread_start(&thread_data_gpio_0);
    k_thread_start(&thread_data_gpio_1);

	return 0;
}

