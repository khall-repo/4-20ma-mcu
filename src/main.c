#include <avr/io.h>
#include <avr/interrupt.h>
// F_CPU frequency to be defined at command line
#include <util/delay.h>
#include <stdint.h>
#include "config.h"
#include "usi.h"
#include "debug_pins.h"

// LED is on pin 2, PB0
#define LED      PB0
#define DELAY_MS 500

void init_debug_pins(void)
{
	DP0_DDR_OUT;
	DP1_DDR_OUT;
	DP2_DDR_OUT;
	DP3_DDR_OUT;
	DP4_DDR_OUT;

  // test pins 
	DP0_OFF;
	DP1_OFF;
	DP2_OFF;
	DP3_OFF;
	DP4_OFF;

  DP0_ON;
	_delay_ms(5);
	DP0_OFF;

  DP1_ON;
	_delay_ms(5);
	DP1_OFF;

	DP2_ON;
	_delay_ms(5);
	DP2_OFF;

	DP3_ON;
	_delay_ms(5);
	DP3_OFF;

	DP4_ON;
	_delay_ms(5);
	DP4_OFF;
}

int main ()
{
	uint8_t high = 0;
	uint16_t ms = 0;
	//char message[] = "1234\r\n";
	char message[] = {0x55, 0, 0x55, 0, 0xaa, 0, 0xaa, 0};
  uint8_t len = sizeof(message)-1;
	uint8_t i;

	init_debug_pins();

	// setup LED pin for output in port B's direction register
	DDRB |= (1 << LED);

	// set LED pin LOW
	PORTB &= ~(1 << LED);

	sei();
	//usi_serial_init();

	while (1) {
		high = !high;

		if (high) {
			// set LED pin HIGH
			PORTB |= (1 << LED);
		} else {
			// set LED pin LOW
			PORTB &= ~(1 << LED);
		}

		// delay for 500 ms
		for (ms = DELAY_MS; ms > 0; ms -= 10) {
			_delay_ms(10);
		}

		for (i = 0; i<len; i++) {
			usiserial_send_byte(message[i]);
    }

	}

	return 0;
}

