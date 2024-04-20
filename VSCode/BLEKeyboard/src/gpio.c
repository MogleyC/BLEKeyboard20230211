#include "gpio.h"

LOG_MODULE_DECLARE(my_module);

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

int gpio_set(const struct gpio_dt_spec *spec, int value)
{
	return gpio_pin_set_dt(spec, value);
}

int gpio_get(const struct gpio_dt_spec *spec)
{
	return gpio_pin_get_dt(spec);
}

int gpio_tgl(const struct gpio_dt_spec *spec)
{
	return gpio_pin_toggle_dt(spec);
}

int test;

int gpio_update(void)
{
	int ret = 0;
	ret = gpio_tgl(&led0);
	if (ret < 0)
	{
		return -1;
	}

	++test;
	gpio_set(&btnpwr[3-test%4], 1);
	k_msleep(25);
	printk("btnsens [%d] %d %d %d %d\n", 3-test%4, gpio_get(&btnsens[0]), gpio_get(&btnsens[1]), gpio_get(&btnsens[2]), gpio_get(&btnsens[3]));
	gpio_set(&btnpwr[3-test%4], 0);
	k_msleep(25);
	return 0;
}