#ifndef DEBUG_PINS_H
#define DEBUG_PINS_H

#include <avr/io.h>

#define DP0 PB1
#define DP1 PA1
#define DP2 PA2
#define DP3 PA3
#define DP4 PA7

#define DP0_DDR_OUT (DDRB |= (1 << DP0))
#define DP1_DDR_OUT (DDRA |= (1 << DP1))
#define DP2_DDR_OUT (DDRA |= (1 << DP2))
#define DP3_DDR_OUT (DDRA |= (1 << DP3))
#define DP4_DDR_OUT (DDRA |= (1 << DP4))

#define DP0_ON (PORTB |= (1 << DP0))
#define DP1_ON (PORTA |= (1 << DP1))
#define DP2_ON (PORTA |= (1 << DP2))
#define DP3_ON (PORTA |= (1 << DP3))
#define DP4_ON (PORTA |= (1 << DP4))

#define DP0_OFF (PORTB &= ~(1 << DP0))
#define DP1_OFF (PORTA &= ~(1 << DP1))
#define DP2_OFF (PORTA &= ~(1 << DP2))
#define DP3_OFF (PORTA &= ~(1 << DP3))
#define DP4_OFF (PORTA &= ~(1 << DP4))

#endif // DEBUG_PINS_H