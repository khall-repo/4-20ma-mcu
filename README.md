# 4-20ma-mcu
0-5v to 4-20mA conversion using ATTINY84 and a LM324

Barely have got started. I have a serial output message and some debug pins,
that's it so far. Sorry to disappoint.

This project is just to edify myself on making a PCB and having it fabricated.

Needed to build this project:<br/>
gcc-avr  - GNU C compiler (cross compiler for avr)<br/>
avr-libc - Standard C library for Atmel AVR development<br/>
avrdude  - software for programming Atmel AVR microcontrollers<br/>

Make:<br/>
make           - will compile and link only.<br/>
make flash     - will compile, link, and then program flash memory.<br/>
make fuse      - will compile, link, and then program fuses.<br/>
make program   - will compile, link, program fuses, and then program flash memory.<br/>