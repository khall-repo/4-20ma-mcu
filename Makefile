DEVICE     := attiny84
CLOCK      := 14318180
PROGRAMMER := -c dragon_isp
OBJCOPY    := avr-objcopy

OBJDIR  := obj
HEXDIR  := hex
SRCDIR  := src
INCDIR  := inc

CFLAGS		 := -g -Wall -Os -DF_CPU=$(CLOCK) -mmcu=$(DEVICE) -I$(INCDIR)

TARGET  := main

# for ATTiny85 - internal osc 8mhz, unset CKDIV8
#FUSES	:= -U lfuse:w:0xe2:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m
# xtal osc, unset CKDIV8
FUSES	:= -U lfuse:w:0xff:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m

AVRDUDE	:= avrdude $(PROGRAMMER) -p $(DEVICE)
#COMPILE	:= avr-gcc -Wall -Os -DF_CPU=$(CLOCK) -mmcu=$(DEVICE) -I$(INCDIR)
COMPILE	:= avr-gcc $(CFLAGS)

SRC_FILES := $(wildcard $(SRCDIR)/*.c)
OBJ_FILES := $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRC_FILES))

# Default target: compile and link only
all: $(HEXDIR)/$(TARGET).hex size

size: $(HEXDIR)/$(TARGET).elf
	avr-size --mcu=$(DEVICE) --format=avr $(HEXDIR)/$(TARGET).elf

asm: $(OBJ_FILES:.o=.s)
$(OBJDIR)/%.s: $(SRCDIR)/%.c | $(OBJDIR)
	$(COMPILE) -S $< -o $@

flash: $(HEXDIR)/$(TARGET).hex
	$(AVRDUDE) -U flash:w:$(HEXDIR)/$(TARGET).hex:i

fuse: $(HEXDIR)/$(TARGET).hex
	$(AVRDUDE) $(FUSES)

program: fuse flash

$(HEXDIR)/$(TARGET).hex: $(HEXDIR)/$(TARGET).elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

$(HEXDIR)/$(TARGET).elf: $(OBJ_FILES) | $(HEXDIR)
	$(COMPILE) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(COMPILE) -c $< -o $@

$(HEXDIR) $(OBJDIR):
	mkdir -p $@

clean:
	rm -f $(HEXDIR)/*.hex $(HEXDIR)/*.elf $(OBJDIR)/*.o