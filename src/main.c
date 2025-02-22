#include <avr/io.h>
#include <avr/interrupt.h>
// F_CPU frequency to be defined at command line
#include <util/delay.h>
#include <stdint.h>
#include "config.h"
#include "usi.h"
#include "debug_pins.h"

// LED is on pin 13, PA0
#define LED      PA0
#define DELAY_MS 1000

/*void init_debug_pins(void)
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
}*/

int main ()
{
	uint8_t high = 0;
	char message[] = "Test\n";

	// setup LED pin for output in port B's direction register 
	DDRA |= (1 << LED);

	// set LED pin LOW
	PORTA &= ~(1 << LED);

	usiuart_init();
	sei();

	while (1) {
		high = !high;

		if (high) {
			// set LED pin HIGH
			PORTA |= (1 << LED);
		} else {
			// set LED pin LOW
			PORTA &= ~(1 << LED);
		}

	  _delay_ms(1000);

		usiuart_printStr(message);

	}

	return 0;
}

