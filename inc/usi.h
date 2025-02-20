#ifndef USI_H
#define USI_H

#include <stdint.h>
#include <stdbool.h>

//enum USISERIAL_SEND_STATE { AVAILABLE, FIRST, SECOND };
//enum USISERIAL_SEND_STATE usi_get_send_state(void);
void usi_serial_init(void);
bool usiserial_send_available();
void usiserial_send_byte(uint8_t data);


/*uint8_t usi_uart_receive(void);
uint8_t usi_uart_available(void);
uint8_t usi_uart_read(void);
void usi_uart_write(uint8_t data);
void usi_uart_print(const char *str);*/

#endif // USI_H