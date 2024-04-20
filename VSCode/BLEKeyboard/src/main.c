#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>

#include <zephyr/logging/log.h>
LOG_MODULE_REGISTER(my_module, LOG_LEVEL_INF);

#define SLEEP_TIME_MS 500

// /* The devicetree node identifier for the "led0" alias. */
#define LED0_NODE DT_ALIAS(led0)

static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(LED0_NODE, gpios);

// how logging
// LOG_INF("Hi!!");
// printk("Hey! %d\n", cnt);

int main(void)
{
	int ret;

	if (!gpio_is_ready_dt(&led))
	{
		return 0;
	}

	gpio_flags_t flags = GPIO_OUTPUT_INACTIVE;	//GPIO_OUTPUT
	ret = gpio_pin_configure_dt(&led, flags);
	// gpio_pin_set_dt(&led, 0);
	if (ret < 0)
	{
		return 0;
	}

	int cnt = 0;
	while (1)
	{
		ret = gpio_pin_toggle_dt(&led);
		printk("Hey! %d\n", cnt);
		++cnt;

		if (ret < 0)
		{
			return 0;
		}
		k_msleep(SLEEP_TIME_MS);
	}
	return 0;
}
