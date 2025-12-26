# Phase 1 AI - Obstacle Avoidance Robot

Converted from Basic Stamp 2 to ATtiny2313.

Original by Matthew Whited - v0.1 - 12/29/2001

## Hardware

- **MCU**: ATtiny2313 @ 1MHz (internal RC oscillator)
- **IR Sensor**: Lynxmotion IRPD (IR Proximity Detector)
- **Motor Driver**: Dual Mini H-Bridge
- **Status LED**: Indicates backup mode

## Pin Mapping

### Basic Stamp 2 to ATtiny2313 Adapter

```
BS2 Pin   Function              ATtiny2313 Pin    ATtiny2313 Physical Pin
-------   --------              --------------    -----------------------
Pin 0     IRPD Left LED         PD2               6
Pin 1     IRPD Right LED        PD3               7
Pin 2     IRPD Signal (input)   PD4               8
Pin 3     H-Bridge B1 (L Motor) PD5               9
Pin 4     H-Bridge B2 (L Motor) PD6               11
Pin 5     H-Bridge A1 (R Motor) PB0               12
Pin 6     H-Bridge A2 (R Motor) PB1               13
Pin 7     Status LED            PB2               14
```

### ATtiny2313 Pinout (20-pin DIP)

```
              +----U----+
(RESET) PA2  1|         |20  VCC
   (RX) PD0  2|         |19  PB7 (SCK)  - ISP
   (TX) PD1  3|         |18  PB6 (MISO) - ISP
        PA1  4|         |17  PB5 (MOSI) - ISP
        PA0  5|         |16  PB4
 IRPD_L PD2  6|         |15  PB3
 IRPD_R PD3  7|         |14  PB2  LED
 IRPD_S PD4  8|         |13  PB1  A2 (R)
 B1 (L) PD5  9|         |12  PB0  A1 (R)
        GND 10|         |11  PD6  B2 (L)
              +---------+
```

### Wiring Diagram for Perfboard Adapter

```
IRPD Connector (from BS2 board):
  Left LED  -----> PD2 (pin 6)
  Right LED -----> PD3 (pin 7)
  Signal    -----> PD4 (pin 8)
  VCC       -----> VCC (pin 20)
  GND       -----> GND (pin 10)

H-Bridge Connector (from BS2 board):
  B1 (Left)  -----> PD5 (pin 9)
  B2 (Left)  -----> PD6 (pin 11)
  A1 (Right) -----> PB0 (pin 12)
  A2 (Right) -----> PB1 (pin 13)

Status LED:
  Anode  -----> PB2 (pin 14) via 330-470 ohm resistor
  Cathode ----> GND

Power:
  VCC (5V) -----> Pin 20
  GND      -----> Pin 10

ISP Header (optional, for programming):
  MOSI -----> PB5 (pin 17)
  MISO -----> PB6 (pin 18)
  SCK  -----> PB7 (pin 19)
  RESET ----> PA2 (pin 1)
  VCC  -----> Pin 20
  GND  -----> Pin 10
```

### Motor Control Truth Table

| Action  | B1 (PD5) | B2 (PD6) | A1 (PB0) | A2 (PB1) | Left Motor | Right Motor |
|---------|----------|----------|----------|----------|------------|-------------|
| Forward | LOW      | HIGH     | HIGH     | LOW      | Forward    | Forward     |
| Turn R  | LOW      | HIGH     | LOW      | HIGH     | Forward    | Backward    |
| Turn L  | HIGH     | LOW      | HIGH     | LOW      | Backward   | Forward     |
| Backup  | HIGH     | LOW      | LOW      | HIGH     | Backward   | Backward    |

## Build

```bash
make all      # Compile
make program  # Flash to device (requires avrdude)
make clean    # Clean build artifacts
```

### Programmer Configuration

Edit `Makefile` to set your programmer:
- `AVRDUDE_PROGRAMMER`: usbtiny, usbasp, avrisp2, etc.
- `AVRDUDE_PORT`: COM port if needed

## Algorithm

1. Wait 750ms between sensor readings
2. Pulse right IR LED (5ms on, 5ms off, 5ms on) and read detector
3. Pulse left IR LED (5ms on, 5ms off, 5ms on) and read detector
4. Determine action:
   - Both clear: go forward
   - Left obstacle only: turn right
   - Right obstacle only: turn left
   - Both obstacles: backup (LED on)
5. Repeat
