#include <avr/io.h>
//#include <avr/interrupt.h>

void init_adc(void)
{
  // Set PA0 as input
  DDRA &= ~_BV(PA0);

  // Set Vref to AVcc, input on PA0
  ADMUX = 0;

  // Enable ADC, no interrupt, no prescaler, manual trigger
  ADCSRA = _BV(ADEN);

  // Disable digital input on PA0
  DIDR0 = _BV(ADC0D);
}

uint16_t read_adc(void)
{
  // Start conversion
  ADCSRA |= _BV(ADSC);

  // Wait for conversion to finish
  while (ADCSRA & _BV(ADSC));

  // Return result
  return ADC;
}