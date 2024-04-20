#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>c

#include <zephyr/logging/log.h>
LOG_MODULE_REGISTER(my_module, LOG_LEVEL_INF);

/* 1000 msec = 1 sec */
#define SLEEP_TIME_MS 1000

// /* The devicetree node identifier for the "led0" alias. */
#define LED0_NODE DT_ALIAS(led0)

static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(LED0_NODE, gpios);

int main(void)
{
        int ret;

        if (!gpio_is_ready_dt(&led))
        {
                return 0;
        }

        ret = gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE);
        if (ret < 0)
        {
                return 0;
        }

        while (1)
        {
                ret = gpio_pin_toggle_dt(&led);
                // printf("Hello!!\n");
                LOG_INF("Hello!!");

                if (ret < 0)
                {
                        return 0;
                }
                k_msleep(SLEEP_TIME_MS);
        }
        return 0;
}
