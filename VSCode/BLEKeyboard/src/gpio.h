#ifndef GPIO_H
#define GPIO_H

#include "include.h"

#include <zephyr/drivers/gpio.h>

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

int gpio_init(void);
int gpio_update(void);

#endif