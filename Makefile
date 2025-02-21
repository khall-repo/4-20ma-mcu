DEVICE     := attiny84
CLOCK      := 8000000
PROGRAMMER := -c dragon_isp
OBJCOPY    := avr-objcopy

OBJDIR  := obj
HEXDIR  := hex
SRCDIR  := src
INCDIR  := inc

TARGET  := main

# for ATTiny85 - unset CKDIV8
FUSES	:= -U lfuse:w:0xe2:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m 

AVRDUDE	:= avrdude $(PROGRAMMER) -p $(DEVICE)
COMPILE	:= avr-gcc -Wall -Os -DF_CPU=$(CLOCK) -mmcu=$(DEVICE) -I$(INCDIR)

SRC_FILES := $(wildcard $(SRCDIR)/*.c)
OBJ_FILES := $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRC_FILES))

all: $(HEXDIR)/$(TARGET).hex flash
#all: $(HEXDIR)/$(TARGET).hex

#flash: fuse $(HEXDIR)/$(TARGET).hex
flash: $(HEXDIR)/$(TARGET).hex
	$(AVRDUDE) -U flash:w:$(HEXDIR)/$(TARGET).hex:i
#	$(AVRDUDE) -U flash:w:$<:i

fuse:
	$(AVRDUDE) $(FUSES)

$(HEXDIR)/$(TARGET).hex: $(HEXDIR)/$(TARGET).elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

$(HEXDIR)/$(TARGET).elf: $(OBJ_FILES) | $(HEXDIR)
	$(COMPILE) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(COMPILE) -c $< -o $@

clean:
	rm -f $(HEXDIR)/*.hex $(HEXDIR)/*.elf $(OBJDIR)/*.o