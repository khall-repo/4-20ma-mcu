/**
 * @file main.c
 * @brief Main file for the ATtiny85 4-20mA MCU project
 * @par Copyright (c) 2025 Keith Hall
 */ 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "config.h"
#include "usi.h"
#include "pwm.h"
#include "adc.h"
#include "debug_pins.h"

// LED is on pin 12, PA1
#define LED      PA1
#define DELAY_MS 1000

int main ()
{
  uint16_t adc_val = 0;
	bool one_sec_toggle = 0;
  char msg_buf[32] = {0};

	// setup LED pin for output in port B's direction register 
	DDRA |= (1 << LED);
	// set LED pin LOW
	PORTA &= ~(1 << LED);

	init_usi_uart();
  init_pwm();
  init_adc();
	sei();

	while (1) {
    one_sec_toggle ^= 1;

    // toggle the I'm alive LED
    if (one_sec_toggle) {
      // set LED pin HIGH
      PORTA |= (1 << LED);
    } else {
      // set LED pin LOW
      PORTA &= ~(1 << LED);
    }

    adc_val = read_adc();
    set_pwm(adc_val);
    sprintf(msg_buf, "ADC: %d\n", adc_val);
    usiuart_print_str(msg_buf);

    _delay_ms(1000);
}

	return 0;
}

