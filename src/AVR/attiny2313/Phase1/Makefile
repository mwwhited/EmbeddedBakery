# Phase 1 AI - ATtiny2313
# Obstacle avoidance robot converted from Basic Stamp 2

# MCU name
MCU = attiny2313

# Processor frequency (1MHz internal RC oscillator default)
# Change to 8000000 if using 8MHz fuse settings
F_CPU = 1000000

# Output format
FORMAT = ihex

# Target file name (without extension)
TARGET = main

# Object files directory
OBJDIR = .

# List C source files
SRC = $(TARGET).c

# Optimization level
OPT = s

# Debugging format
DEBUG = dwarf-2

# C Standard
CSTANDARD = -std=gnu99

# C defines
CDEFS = -DF_CPU=$(F_CPU)UL

#---------------- Compiler Options ----------------
CFLAGS = -g$(DEBUG)
CFLAGS += $(CDEFS)
CFLAGS += -O$(OPT)
CFLAGS += -funsigned-char
CFLAGS += -funsigned-bitfields
CFLAGS += -fpack-struct
CFLAGS += -fshort-enums
CFLAGS += -Wall
CFLAGS += -Wstrict-prototypes
CFLAGS += -Wa,-adhlns=$(<:%.c=$(OBJDIR)/%.lst)
CFLAGS += $(CSTANDARD)

#---------------- Linker Options ----------------
LDFLAGS = -Wl,-Map=$(TARGET).map,--cref

#---------------- Programming Options (avrdude) ----------------
# Common programmers: usbtiny, usbasp, avrisp2, arduino
AVRDUDE_PROGRAMMER = usbtiny
AVRDUDE_PORT =

AVRDUDE_WRITE_FLASH = -U flash:w:$(TARGET).hex

# Fuses for 1MHz internal RC (default)
# lfuse: 0x64 (1MHz internal RC)
# hfuse: 0xDF (default)
# For 8MHz: lfuse=0xE4
AVRDUDE_WRITE_FUSES =

AVRDUDE_FLAGS = -p $(MCU) -c $(AVRDUDE_PROGRAMMER)
ifdef AVRDUDE_PORT
AVRDUDE_FLAGS += -P $(AVRDUDE_PORT)
endif

#---------------- Tools ----------------
CC = avr-gcc
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE = avr-size
NM = avr-nm
AVRDUDE = avrdude
REMOVE = rm -f
REMOVEDIR = rm -rf

#---------------- Build ----------------
ALL_CFLAGS = -mmcu=$(MCU) -I. $(CFLAGS)

# Object files
OBJ = $(SRC:%.c=$(OBJDIR)/%.o)

# Default target
all: $(TARGET).elf $(TARGET).hex $(TARGET).lss size

$(TARGET).elf: $(OBJ)
	$(CC) $(ALL_CFLAGS) $^ --output $@ $(LDFLAGS)

%.hex: %.elf
	$(OBJCOPY) -O $(FORMAT) -R .eeprom -R .fuse -R .lock $< $@

%.lss: %.elf
	$(OBJDUMP) -h -S -z $< > $@

$(OBJDIR)/%.o: %.c
	$(CC) -c $(ALL_CFLAGS) $< -o $@

size: $(TARGET).elf
	@echo
	@$(SIZE) --mcu=$(MCU) --format=avr $(TARGET).elf

# Program the device
program: $(TARGET).hex
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH)

# Set fuses (be careful!)
fuses:
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FUSES)

# Clean
clean:
	$(REMOVE) $(TARGET).hex
	$(REMOVE) $(TARGET).elf
	$(REMOVE) $(TARGET).map
	$(REMOVE) $(TARGET).lss
	$(REMOVE) $(OBJ)
	$(REMOVE) $(SRC:%.c=$(OBJDIR)/%.lst)

.PHONY: all size program fuses clean
