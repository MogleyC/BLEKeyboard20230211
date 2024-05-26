// APIs Search Site
// https://docs.zephyrproject.org/apidoc/latest/index.html

#include "include.h"
#include <zephyr/drivers/gpio.h>

#include "BleHidKeyboard.h"
#include "gpio.h"

LOG_MODULE_REGISTER(my_module, LOG_LEVEL_INF);

int main(void)
{
	int ret;
	printk("[main] Start\n");

	ret = gpio_init();
	if (ret < 0)
	{
		printk("[gpio_init] failed\n");
		return -1;
	}
	
	ret = gpio_thread_start();
	if (ret < 0)
	{
		printk("[gpio_thread_start] failed\n");
		return -1;
	}

	ret = bleHid_init();
	if (ret < 0)
	{
		printk("[bleHid_init] failed\n");
		return -1;
	}
	
	ret = bleHid_thread_start();
	if (ret < 0)
	{
		printk("[bleHid_thread_start] failed\n");
		return -1;
	}

	printk("[main] Loop STD\n");
	
	while (1)
	{
		k_msleep(1000);
	}
	return 0;
}
