/*  Copyright (C) 2016  Florian Menne

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#include "usi.h"

#include <stdlib.h>
#include <string.h>
#include <avr/io.h>
//#include <avr/iotn85.h>
#include <avr/interrupt.h>

#include "bit-reverse.h"

#ifndef F_CPU
#define F_CPU 1431818UL
#warning USIUART.c: F_CPU not defined defaulting to 8000000 Hz
#endif

#ifndef TIMER_DIVIDER
#define TIMER_DIVIDER 8
#endif

#ifndef BAUD
#define BAUD 57600
#endif

#ifndef RXBUFFERSIZE
#define RXBUFFERSIZE 8
#endif

#if 255 < (F_CPU/TIMER_DIVIDER)/BAUD + ((F_CPU/TIMER_DIVIDER)/BAUD)/2
#error USIUART.c: Required ticks overflows OCR0A, try increasing TIMER_DIVIDER
#endif

#define TIMER_TICK ((float) (F_CPU/TIMER_DIVIDER)/BAUD)

enum
{
	RX = 0,
	TX,
	NEXTCHAR,
};

static uint8_t rxBuffer[RXBUFFERSIZE];
static volatile uint8_t rxWriter = 0;
static uint8_t rxReader = RXBUFFERSIZE-1;
static volatile uint8_t state;
static volatile uint8_t tempTxChar;
static volatile char* currentChar;

void usiuart_init()
{
	state = RX;

  //PA6 as input
	DDRA &= ~_BV(PA6);

  //PA5 as output and high
	DDRA |= _BV(PA5);
	PORTA |= _BV(PA5);

	/*
	 * Set Timer settings
	 */
	TCCR0A |= _BV(WGM01);
#if	TIMER_DIVIDER == 1
	TCCR0B |= _BV(CS00);
#elif TIMER_DIVIDER == 8
	TCCR0B |= _BV(CS01);
#elif TIMER_DIVIDER == 64
	TCCR0B |= _BV(CS01) | _BV(CS00);
#elif TIMER_DIVIDER == 256
	TCCR0B |= _BV(CS02);
#elif TIMER_DIVIDER == 1024
	TCCR0B |= _BV(CS02) | _BV(CS00);
#else
#error USIUART.c: Unsupported timer divider
#endif

	/*
	 * Enable PCINT0
	 */
	GIFR = _BV(PCIF0);
	PCMSK0 |= _BV(PCINT6);
	GIMSK |= _BV(PCIE0);

	OCR0A = (uint8_t) TIMER_TICK + TIMER_TICK/2;
}

bool usiuart_getChar(char *dst)
{
	uint8_t temp;

	//Calculate next reader position
	temp = (rxReader + 1) & (RXBUFFERSIZE-1);

	//Return if no char available
	if(temp == rxWriter) return false;

	//Get data from buffer and bitswap
	*dst = bitReverse(rxBuffer[temp]);

	rxReader = temp;

	return true;
}


bool usiuart_printStr(char* string)
{
	/*
	 * If RX is currently in progress don't care - bad luck...
	 */

	if(state != RX) return false;

	//Disable PCINT0 interrupt
	PCMSK0 &= ~_BV(PCINT6);

	//Disable TIM Interrupt
	TIMSK0 = 0;

	//Disable USI
	USICR = 0;

	state = TX;


	currentChar = string;

	tempTxChar = bitReverse(*currentChar++);

	//Prefill with data and startbit
	USIDR = tempTxChar>>1;

	TCNT0 = 0;
	OCR0A = (uint8_t) TIMER_TICK;

	/*
	 * USI settings
	 */
	USISR = _BV(USIOIF) | 14;
	USICR = _BV(USICS0) | _BV(USIOIE) | _BV(USIWM0);

	return true;
}

ISR(PCINT0_vect)
{
	//Only react if Pin is low (startbit)
	if( PINA & _BV(PA6) ) return;
	PCMSK0 = 0;

	TCNT0 = 0;
	OCR0A = (uint8_t) TIMER_TICK + TIMER_TICK/2;

	// Clear flag
	TIFR0 = _BV(OCF0A);

	//Enable OCIE0A
	TIMSK0 = _BV(OCIE0A);


	/*
	 * USI settings
	 */
	USISR = _BV(USIOIF) | 8;
	USICR |= _BV(USICS0) | _BV(USIOIE);

}

ISR(TIM0_COMPA_vect)
{
	OCR0A = (uint8_t) TIMER_TICK;
	TIMSK0 = 0;
}

ISR(USI_OVF_vect)
{
	uint8_t temp;
	uint8_t data;

	/*
	 * Handle RX
	 */
	if(state == RX)
	{
		USICR = 0;
		data = USIDR;
		//Calculate next position
		temp = (rxWriter + 1) & (RXBUFFERSIZE-1);

		//Check if next position collides with reader
		if(temp != rxReader)
		{
			//Write to rxBuffer
			rxBuffer[rxWriter] = data;
		}

		//Set rxWriter to next position
		rxWriter = temp;

		PCMSK0 |= _BV(PCINT6);
	}

	/*
	 * Handle TX
	 */
	else if(state == TX)
	{
		USIDR = (tempTxChar<<1) | _BV(0);

		USISR = _BV(USIOIF) | 8;
		USICR = _BV(USICS0) | _BV(USIOIE) | _BV(USIWM0);
		state = NEXTCHAR;
	}

	/*
	 * Handle NEXTCHAR
	 */
	else if (state == NEXTCHAR)
	{
		/*
		 * Check for next character
		 */
		if(*currentChar)
		{
			//Get next character
			tempTxChar = bitReverse(*currentChar++);

			//Prefill with data and startbit
			USIDR = tempTxChar>>1;

			TCNT0 = 0;
			state = TX;

			/*
			 * USI settings
			 */
			USISR = _BV(USIOIF) | 14;
			return;
		}

		/*
		 * Reenable RX
		 */

		//Disable USI
		USICR = 0;

		//Change to RX state
		state = RX;

		//Clear Pin change interrupt flag
		GIFR |= _BV(PCIF0);

		//Reenable interrupt on PCINT6
		PCMSK0 |= _BV(PCINT6);
	}
}
