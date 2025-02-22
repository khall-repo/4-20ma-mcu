#ifndef USI_H
#define USI_H

#include <stdint.h>
#include <stdbool.h>

/**
 * Initialize USIUART
 */
void usiuart_init(void);

/**
 * Gets next character
 * @param dst Pointer to the destination
 * @return False = No character, True = Next Character received
 */
bool usiuart_getChar(char *dst);

/**
 * Transmit a string.
 * Interrupts every ongoing RX.
 * @param string Null terminated string
 * @return True = Success, False = currently Sending
 */
bool usiuart_printStr(char* string);

#endif // USI_H