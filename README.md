# 4-20ma-mcu
0-5v to 4-20mA conversion using ATTINY84 and a LM324

This project is just to edify myself on making a PCB and having it fabricated.

The internal 8MHz RC oscillator is plain awful in this MCU, it is useless if
you want to do simple USI uart. Not sure if it's just ATTINY or if it's all
AVR's. I've used internal osc and uart with PICs and EFM8s just fine..
I've installed a 14.31818 MHz crystal just so I can have USI uart transmit.
Reason for this choice of crystal is that's what I have on hand..
Once I have everything else working the way I want it to, I'll TRY to switch
back to the internal osc.. hopefully the PWM output will be stable just enough.

ADC input and PWM output seems to be working. Using the PWM in phase-correct
10-bit mode to match the 10-bit ADC resolution. Feeding the ADC output to
PWM timer input in the main loop. PWM outputs to the OC1A pin.

Needed to build this project:<br/>
gcc-avr  - GNU C compiler (cross compiler for avr)<br/>
avr-libc - Standard C library for Atmel AVR development<br/>
avrdude  - software for programming Atmel AVR microcontrollers<br/>

Make:<br/>
make           - will compile and link only.<br/>
make flash     - will compile, link, and then program flash memory.<br/>
make fuse      - will compile, link, and then program fuses.<br/>
make program   - will compile, link, program fuses, and then program flash memory.<br/>