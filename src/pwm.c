#include <avr/io.h>
//#include <avr/interrupt.h>
#include "pwm.h"

// init 16 bit pwm on timer 1
void init_pwm(void)
{
  DDRA |= _BV(PA6); // PA5 (OC1A) as output
  PORTA &= ~_BV(PA6); // set low

  // Clear OC1A on compare match when up-counting, set OC1A on compare match
  // when downcounting.
  // WGM mode 3 PWM, phase correct, 10-bit (to match ADC resolution)
  TCCR1A = (_BV(COM1A1) | _BV(WGM11) | _BV(WGM10));

  TCCR1B = _BV(CS10); // clk i/o, no prescaling

  TCCR1C = 0; // no force output compare

  // set initial duty cycle to 50%
  OCR1A = 0x200;
}

// set pwm duty cycle
void set_pwm(uint16_t duty)
{
  OCR1A = duty;
}