#include "debug_pins.h"
#include <util/delay.h>

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