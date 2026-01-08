# D2-1 / D2-5 Intelligent Line Follower Kit Reference

Technical reference compiled from multiple sources for the D2-1 and D2-5 line follower robot kits.

## Official Documentation Sources

- [D2-1 Instructions PDF (Elecrow)](https://www.elecrow.com/download/D2-1%20Intelligent%20Tracking%20Car%20Instructions.pdf)
- [D2-1 Instructions PDF (Turibot)](https://www.turibot.es/downloads/D2-1%20Intelligent%20Tracking%20Car%20Instructions.pdf)
- [D2-5 User Manual PDF (ICStation)](https://www.icstation.com/product_document/Download/10168_User_Manual.pdf)
- [LEAP#416 Line Follower Kit Analysis](https://leap.tardate.com/kinetics/linefollowerkit/)
- [D2-1 Assembly Guide (Instructables)](https://www.instructables.com/D2-1-Linefollowing-Robot-Assembly-Guide-Ultra-Chea/)

## Kit Overview

The D2-1/D2-5 Intelligent Tracking Car is a budget DIY robotics kit (~$4-5 USD) that demonstrates basic feedback control using analog electronics. No microcontroller or programming is required in the original design.

### Key Features
- LM393 dual voltage comparator as the "brain"
- Light-based line detection (LDR + LED sensors)
- S8550 PNP transistors for high-side motor switching
- Two TT gear motors with 40mm wheels
- Powered by 2x AA batteries (3V)

## Circuit Architecture

### Block Diagram

```
                    +---------------------+
                    |       LM393         |
   +--------+       |  Dual Comparator    |       +----------+
   | Left   |------>| IN1+ (pin 3)        |       |  S8550   |
   | LDR    |       |              OUT1 --|------>| Q1 (PNP) |---> Left Motor
   +--------+       |                     |       +----------+
                    | IN1- (pin 2)        |
   +--------+       |   (reference)       |       +----------+
   | Right  |------>| IN2+ (pin 5)        |       |  S8550   |
   | LDR    |       |              OUT2 --|------>| Q2 (PNP) |---> Right Motor
   +--------+       | IN2- (pin 6)        |       +----------+
                    |   (reference)       |
                    +---------------------+
```

### LM393 Pinout (DIP-8)

```
              LM393
            +---U---+
   OUT1  1 -|       |- 8  VCC
   IN1-  2 -|       |- 7  OUT2
   IN1+  3 -|       |- 6  IN2-
   GND   4 -|       |- 5  IN2+
            +-------+
```

### Pin Functions

| Pin | Name | Function                              |
|-----|------|---------------------------------------|
| 1   | OUT1 | Comparator 1 output (open collector)  |
| 2   | IN1- | Comparator 1 inverting input          |
| 3   | IN1+ | Comparator 1 non-inverting input      |
| 4   | GND  | Ground                                |
| 5   | IN2+ | Comparator 2 non-inverting input      |
| 6   | IN2- | Comparator 2 inverting input          |
| 7   | OUT2 | Comparator 2 output (open collector)  |
| 8   | VCC  | Power supply (+3V to +5V)             |

## Component List

| Qty | Component             | Value/Type    | Reference    |
|-----|-----------------------|---------------|--------------|
| 1   | Dual Comparator IC    | LM393         | IC1          |
| 2   | PNP Transistor        | S8550         | Q1, Q2       |
| 2   | Electrolytic Capacitor| 100µF         | C1, C2       |
| 2   | Potentiometer         | 10kΩ          | R1, R2       |
| 4   | Resistor              | 51Ω           | R5,R6,R11,R12|
| 2   | Resistor              | 1kΩ           | R7, R8       |
| 2   | Resistor              | 10Ω           | R9, R10      |
| 2   | Resistor (some kits)  | 3.3kΩ         | R3, R4       |
| 2   | Photoresistor (LDR)   | CDS5          | R13, R14     |
| 2   | LED (indicator)       | Red 3mm       | D1, D2       |
| 2   | LED (sensor)          | White/Clear   | D4, D5       |
| 2   | DC Motor              | TT Gear Motor | M1, M2       |
| 2   | Wheel                 | 40mm          | --           |
| 1   | Battery Holder        | 2x AA         | --           |
| 1   | PCB                   | Single-sided  | --           |
| 1   | IC Socket             | 8-pin DIP     | --           |

## Operating Principle

### Line Detection

The sensor system uses paired LED + photoresistor (LDR) modules:

1. **White/clear LEDs** emit light downward toward the track surface
2. **Photoresistors** detect the reflected light intensity
3. **Black surfaces** absorb light → low reflection → high LDR resistance
4. **White surfaces** reflect light → high reflection → low LDR resistance

### Comparator Logic

The LM393 compares the voltage from each LDR against a reference threshold:

- When LDR detects **black** (high resistance): voltage rises above threshold → output LOW → motor ON
- When LDR detects **white** (low resistance): voltage falls below threshold → output HIGH → motor OFF

The two comparators receive the same inputs but with opposite polarity, creating complementary left/right control.

### Motor Control

S8550 PNP transistors provide high-side switching:

```
    VCC (+3V)
       |
       |
    [Motor]
       |
       +--[LED]--+
       |         |
    Collector    |
       |         |
    [S8550]------+
       |
    Base <---- LM393 Output (via 1kΩ)
       |
    Emitter
       |
      GND
```

- **LM393 output LOW**: Base pulled low → PNP conducts → Motor runs
- **LM393 output HIGH**: Base high → PNP off → Motor stops

Status LEDs in parallel with motors provide visual feedback.

## Calibration

Two 10kΩ potentiometers (R1, R2) adjust the detection threshold for each sensor:

1. Place robot on the track with sensors over white surface
2. Turn potentiometers until motors just stop
3. Move sensors over black line
4. Verify motors run when detecting black
5. Fine-tune to reduce hunting/oscillation

## Assembly Notes

### Critical Points

1. **Polarized components**: Observe correct orientation for:
   - Electrolytic capacitors (negative stripe to GND)
   - LEDs (flat side/short leg to cathode)
   - Transistors (flat side orientation per silkscreen)

2. **Sensor mounting**: LDRs and white LEDs mount on the **bottom** of the PCB, facing downward toward the track.

3. **Mechanical alignment**:
   - Gear wheels must not bind against PCB or motor housing
   - Use plastic spacers for proper axle height
   - Don't overtighten wheel screws into plastic

4. **Sensor height**: Optimal distance from track surface is 5-15mm.

### Common Issues

| Problem | Cause | Solution |
|---------|-------|----------|
| Motors don't run | Bad solder joints | Reflow connections |
| Erratic behavior | Sensor height wrong | Adjust to 5-15mm |
| Robot oscillates | Threshold too sensitive | Adjust potentiometers |
| One motor weak | Transistor orientation | Check Q1/Q2 mounting |
| No line following | Ambient light interference | Shield sensors |

## Circuit Variations

### D2-1 vs D2-5

- **D2-1**: Enclosed TT motors, easier alignment
- **D2-5**: Open motor design, requires more careful assembly
- Both use identical electronics

### Pull-up Resistors

Some kit versions include 3.3kΩ pull-up resistors (R3, R4) on transistor bases. Later cost-reduced versions omit these - the circuit works either way.

## ATtiny85 Replacement Advantages

Replacing the LM393 with an ATtiny85 microcontroller provides:

| Feature | LM393 Original | ATtiny85 Replacement |
|---------|----------------|----------------------|
| Control type | Bang-bang (on/off) | Proportional (PWM) |
| Speed control | None | Potentiometer adjustable |
| Line response | Abrupt steering | Smooth steering |
| Programmable | No | Yes |
| Intersection handling | Random | Stop detection |
| Line lost behavior | Undefined | Search mode |

## References

1. LEAP#416 Line Follower Kit - https://leap.tardate.com/kinetics/linefollowerkit/
2. Instructables D2-1 Assembly Guide - https://www.instructables.com/D2-1-Linefollowing-Robot-Assembly-Guide-Ultra-Chea/
3. SriTu Hobby LDR Line Follower - https://srituhobby.com/how-to-make-a-line-follower-robot-without-a-development-board-ldr-based-line-follower-robot/
4. Elecrow D2-1 Product Page - https://www.elecrow.com/d2-1-intelligent-tracking-car.html
