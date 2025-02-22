#ifndef ADC_H
#define ADC_H

#include <stdint.h>

void init_adc(void);
uint16_t read_adc(void);

#endif // ADC_H