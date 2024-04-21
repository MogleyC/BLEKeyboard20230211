#ifndef GPIO_H
#define GPIO_H

#include "include.h"

#include <zephyr/drivers/gpio.h>

int gpio_init(void);
int gpio_thread_start(void);

#endif