#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "config.h"
#include "usi.h"
#include "debug_pins.h"
// Set your baud rate and number of stop bits here 
#define BAUDRATE            9600
#define STOPBITS            1

// If bit width in cpu cycles is greater than 255 then  divide by 8 to fit in timer
// Calculate prescaler setting
#define CYCLES_PER_BIT       ( (F_CPU) / (BAUDRATE) )
#if (CYCLES_PER_BIT > 255)
#define DIVISOR             8
#define CLOCKSELECT         2
#else
#define DIVISOR             1
#define CLOCKSELECT         1
#endif
#define FULL_BIT_TICKS      ( (CYCLES_PER_BIT) / (DIVISOR) )

// USISerial send state variable and accessors
enum USISERIAL_SEND_STATE { AVAILABLE, FIRST, SECOND };
static volatile enum USISERIAL_SEND_STATE usiserial_send_state = AVAILABLE;

/*void usi_serial_init(void)
{
  // Configure Timer0
  TCCR0A = 2<<WGM00;                      // CTC mode
  TCCR0B = CLOCKSELECT;                   // Set prescaler to clk or clk /8
  GTCCR |= 1 << PSR10;                    // Reset prescaler
  OCR0A = FULL_BIT_TICKS;                 // Trigger every full bit width
  TCNT0 = 0;                              // Count up from 0 

  USICR = (1<<USIOIE)|                     // Enable USI Counter OVF interrupt.
          (0<<USIWM1)|(1<<USIWM0)|              // Select three wire mode to ensure USI written to PB1
          (0<<USICS1)|(1<<USICS0)|(0<<USICLK);  // Select Timer0 Compare match as USI Clock source.
  DDRA |= (1<<PA5);                        // Configure USI_DO as output.
}*/

static inline enum USISERIAL_SEND_STATE usiserial_send_get_state(void)
{
  return usiserial_send_state;
}
static inline void usiserial_send_set_state(enum USISERIAL_SEND_STATE state)
{
  usiserial_send_state=state;
}
bool usiserial_send_available()
{
  return usiserial_send_get_state()==AVAILABLE;
}

// Transmit data persistent between USI OVF interrupts
static volatile uint8_t usiserial_tx_data;
static inline uint8_t usiserial_get_tx_data(void)
{
  return usiserial_tx_data;
}
static inline void usiserial_set_tx_data(uint8_t tx_data)
{
  usiserial_tx_data = tx_data;
}

static uint8_t reverse_byte (uint8_t x) {
  x = ((x >> 1) & 0x55) | ((x << 1) & 0xaa);
  x = ((x >> 2) & 0x33) | ((x << 2) & 0xcc);
  x = ((x >> 4) & 0x0f) | ((x << 4) & 0xf0);
  return x;
}
void usiserial_send_byte(uint8_t data)
{
  DP0_ON;
  while (usiserial_send_get_state() != AVAILABLE)
  {
    // Spin until we finish sending previous packet
  };
  usiserial_send_set_state(FIRST);
  usiserial_set_tx_data(reverse_byte(data));
  // Configure Timer0
  TCCR0A = (1 << WGM01);                      // CTC mode
  TCCR0B = CLOCKSELECT;                   // Set prescaler to clk or clk /8
  GTCCR |= 1 << PSR10;                    // Reset prescaler
  OCR0A = FULL_BIT_TICKS;                 // Trigger every full bit width
  TCNT0 = 0;                              // Count up from 0
  TIMSK0 = (1 << OCIE0A); // Enable Timer0 compare match interrupt

  // Configure USI to send high start bit and 7 bits of data
  USIDR = 0x00 | usiserial_get_tx_data() >> 1;  // Start bit (low) followed by first 7 bits of serial data
  USICR  = (1<<USIOIE)|                         // Enable USI Counter OVF interrupt.
           (0<<USIWM1)|(1<<USIWM0)|             // Select three wire mode to ensure USI written to PB1
           (0<<USICS1)|(1<<USICS0)|(0<<USICLK); // Select Timer0 Compare match as USI Clock source.
  DDRA  |= (1<<PA5);                            // Configure USI_DO as output.
  USISR = 1<<USIOIF |                           // Clear USI overflow interrupt flag
          (16 - 8);                             // and set USI counter to count 8 bits
  DP0_OFF;
}

ISR(TIM0_COMPA_vect)
{
  DP4_ON;
  // Toggle USI clock
  USICR |= (1 << USITC);
  DP4_OFF;
}

// USI overflow interrupt indicates we have sent a buffer
ISR (USI_OVF_vect)
{
  DP1_ON;
  if (usiserial_send_get_state() == FIRST)
  {
    DP2_ON;
    usiserial_send_set_state(SECOND);
    USIDR = usiserial_get_tx_data() << 7  // Send last 1 bit of data
        | 0x7F;                           // and stop bits (high)
    USISR = (1<<USIOIF) |                 // Clear USI overflow interrupt flag
      (16 - (1 + (STOPBITS)));            // Set USI counter to send last data bit and stop bits
    DP2_OFF;
  }
  else
  {
    DP3_ON;
    PORTA |= 1 << PA5;              // Ensure output is high
    DDRA  |= (1<<PA5);              // Configure USI_DO as output.
    USICR = 0;                      // Disable USI.
    USISR |= (1<<USIOIF);             // clear interrupt flag
    usiserial_send_set_state(AVAILABLE);
    TIMSK0 &= ~(1 << OCIE0A); // Disable Timer0 compare match interrupt
    DP3_OFF;
  }
  DP1_OFF;
}



/*ISR(USI_OVF_vect)
{
  DP1_ON;
  if (usiserial_send_get_state() == FIRST)
  {
    DP2_ON;
    USIDR = usiserial_get_tx_data() << 7; // Send the last bit and stop bit
    usiserial_send_set_state(SECOND);
    DP2_OFF;
  }
  else if (usiserial_send_get_state() == SECOND)
  {
    DP3_ON;
    usiserial_send_set_state(AVAILABLE);
    TIMSK0 &= ~(1 << OCIE0A); // Disable Timer0 compare match interrupt
    DP3_OFF;
  }
  USISR = (1 << USIOIF); // Clear USI overflow interrupt flag
  DP1_OFF;
}*/

/*ISR(TIM0_COMPA_vect)
{
  // Toggle USI clock
  USICR |= (1 << USITC);
  OCR0A = FULL_BIT_TICKS;                 // Trigger every full bit width
  TCNT0 = 0;                              // Count up from 0
}*/