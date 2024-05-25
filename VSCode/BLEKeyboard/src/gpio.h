#ifndef GPIO_H
#define GPIO_H

#include "include.h"

#include <zephyr/drivers/gpio.h>

struct key_status_msg_data_t
{
	uint8_t rowIdx;
	bool colKeyInput[4];
}typedef key_status_msg_data;

int gpio_init(void);
int gpio_thread_start(void);

struct k_msgq *get_key_status_msg_queue_ptr(void);

#endif