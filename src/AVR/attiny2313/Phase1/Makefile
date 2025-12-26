# Phase 1 AI - ATtiny2313
# Direct port from Basic Stamp 2
# See Phase2 for modern PlatformIO version

MCU = attiny2313
F_CPU = 1000000
TARGET = main
FORMAT = ihex

CC = avr-gcc
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE = avr-size
AVRDUDE = avrdude

CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL -Os -Wall -std=gnu99

# Programmer settings
AVRDUDE_PROGRAMMER = usbtiny
AVRDUDE_FLAGS = -p $(MCU) -c $(AVRDUDE_PROGRAMMER)

all: $(TARGET).hex size

$(TARGET).elf: $(TARGET).c
	$(CC) $(CFLAGS) -o $@ $<

$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -O $(FORMAT) -R .eeprom $< $@

$(TARGET).lst: $(TARGET).elf
	$(OBJDUMP) -h -S $< > $@

size: $(TARGET).elf
	$(SIZE) --mcu=$(MCU) --format=avr $<

program: $(TARGET).hex
	$(AVRDUDE) $(AVRDUDE_FLAGS) -U flash:w:$<

clean:
	rm -f $(TARGET).elf $(TARGET).hex $(TARGET).lst

.PHONY: all size program clean
