# Claude Code Prompt: ATtiny85 Line Follower Controller

Create a PlatformIO project for an ATtiny85 that replaces the LM393 dual comparator on a D2-1 line follower robot board.

## Hardware Requirements

- **MCU:** ATtiny85 in 8-pin DIP package
- **Clock:** 8MHz internal oscillator
- **Inputs:** 
  - 2 analog IR sensors (left and right)
  - 1 analog speed potentiometer
- **Outputs:**
  - 2 PWM motor control signals

## Pin Assignments

| Signal              | ATtiny85 Pin | ATtiny85 Func | ISP Pin | ISP Func | LM393 Socket Pin | LM393 Func | Pot Pin  |
|---------------------|--------------|---------------|---------|----------|------------------|------------|----------|
| RESET               | 1            | RESET         | 5       | RESET    | —                | —          | —        |
| Speed Control (ADC) | 2            | PB3/ADC3      | —       | —        | —                | —          | Wiper    |
| Right IR (ADC)      | 3            | PB4/ADC2      | —       | —        | 5                | IN2+       | —        |
| GND                 | 4            | GND           | 4       | GND      | 4                | GND        | Leg 1    |
| Left Motor (PWM)    | 5            | PB0/OC0A      | 1       | MOSI     | 1                | OUT1       | —        |
| Right Motor (PWM)   | 6            | PB1/OC0B      | —       | —        | 7                | OUT2       | —        |
| Left IR (ADC)       | 7            | PB2/ADC1      | 6       | SCK      | 3                | IN1+       | —        |
| VCC                 | 8            | VCC           | 2       | VCC      | 8                | VCC        | Leg 2    |
| NC (ISP)            | —            | —             | 3       | N/C      | —                | —          | —        |
| NC (LM393)          | —            | —             | —       | —        | 2                | IN1-       | —        |
| NC (LM393)          | —            | —             | —       | —        | 6                | IN2-       | —        |

## Behavior Specification

1. **Normal operation:** Use proportional steering based on the difference between left and right IR sensor readings. Adjust motor PWM to steer toward the line.

2. **Both sensors detect BLACK (high ADC value):** STOP both motors. This indicates end of line or intersection.

3. **Both sensors detect WHITE (low ADC value):** Go straight at minimum speed. This indicates the line was lost.

4. **Speed control:** Read the potentiometer and map it to base motor speed (MIN_SPEED to MAX_SPEED range).

5. **Hysteresis:** Use hysteresis on threshold detection to prevent jitter at line edges.

## Tunable Parameters

Include these as constants that can be easily adjusted:

- `THRESHOLD` (default 512) - ADC value for line detection
- `HYSTERESIS` (default 30) - Prevents oscillation at edges  
- `MIN_SPEED` (default 60) - Minimum PWM value
- `MAX_SPEED` (default 255) - Maximum PWM value
- `PROP_GAIN` (default 2) - Proportional steering gain

## 6-Pin ISP Header

Include wiring documentation for a standard 6-pin AVR ISP header for USBasp programming:

```
        ┌─────────────┐
   MOSI ┤ 1       2 ○ ├ VCC
        ├─────────────┤
    N/C ┤ 3       4 ○ ├ GND
        ├─────────────┤
  RESET ┤ 5       6 ○ ├ SCK
        └─────────────┘
```

- ISP Pin 1 (MOSI) → ATtiny85 Pin 5 (PB0)
- ISP Pin 2 (VCC) → ATtiny85 Pin 8
- ISP Pin 3 (N/C) → Not connected
- ISP Pin 4 (GND) → ATtiny85 Pin 4
- ISP Pin 5 (RESET) → ATtiny85 Pin 1
- ISP Pin 6 (SCK) → ATtiny85 Pin 7 (PB2)

## Perf Board Layout

The adapter board has these components:
- 1x 8-pin DIP socket for ATtiny85
- 1x 2x3 pin header for ISP programming
- 2x 1x4 pin headers to plug into the LM393 socket (left side pins 1-4, right side pins 5-8)
- 1x 10K potentiometer for speed control (mounted on adapter board)

```
                    Perf Board Top View
    ┌─────────────────────────────────────────────┐
    │                                             │
    │    ISP Header (2x3)        Speed Pot (10K)  │
    │    ┌───┬───┐                 ┌───┐          │
    │    │ 1 │ 2 │  MOSI / VCC    ┌┤ W ├┐         │
    │    ├───┼───┤                │└───┘│         │
    │    │ 3 │ 4 │  N/C  / GND    │     │         │
    │    ├───┼───┤               GND   VCC        │
    │    │ 5 │ 6 │  RST  / SCK                    │
    │    └───┴───┘                                │
    │       │   │                   │             │
    │       │   └───────────────────│─────┐       │
    │       │                       │     │       │
    │    ATtiny85 (DIP-8 Socket)    │     │       │
    │    ┌────────U────────┐        │     │       │
    │    │ 1-RST       VCC-8 │──────│─────│──┐    │
    │    │                   │      │     │  │    │
    │    │ 2-PB3       PB2-7 │──────┘     │  │    │
    │    │   │               │            │  │    │
    │    │   └─(Speed Pot Wiper)          │  │    │
    │    │                   │            │  │    │
    │    │ 3-PB4       PB1-6 │──────┐     │  │    │
    │    │                   │      │     │  │    │
    │    │ 4-GND       PB0-5 │──┐   │     │  │    │
    │    └───────────────────┘  │   │     │  │    │
    │       │   │               │   │     │  │    │
    │       │   │               │   │     │  │    │
    │    1x4 Header (Left)   1x4 Header (Right)   │
    │    ┌───┐               ┌───┐                │
    │    │ 1 │ OUT1/L Motor  │ 5 │ IN2+/R IR      │
    │    ├───┤               ├───┤                │
    │    │ 2 │ IN1- (NC)     │ 6 │ IN2- (NC)      │
    │    ├───┤               ├───┤                │
    │    │ 3 │ IN1+/L IR     │ 7 │ OUT2/R Motor   │
    │    ├───┤               ├───┤                │
    │    │ 4 │ GND           │ 8 │ VCC            │
    │    └───┘               └───┘                │
    │      ▼                   ▼                  │
    │   (plugs into LM393 socket pins 1-4, 5-8)   │
    └─────────────────────────────────────────────┘
```

## Speed Potentiometer

Mount a 10K potentiometer on the adapter board:
- One outer leg → GND
- Wiper (center) → ATtiny85 Pin 2 (PB3/ADC3)
- Other outer leg → VCC

## Deliverables

1. **platformio.ini** - Configuration for ATtiny85 with USBasp programmer option
2. **src/main.cpp** - Arduino framework firmware with all pin definitions, behavior logic, and detailed wiring comments in header
3. **README.md** - Documentation including:
   - ASCII pinout diagrams for ATtiny85, LM393 socket, and ISP header
   - Perf board layout diagram showing component placement
   - Wiring connections table
   - Programming instructions for PlatformIO and Arduino IDE
   - Tuning guide for parameters
   - Troubleshooting section

## Perf Board Components

- 1x 8-pin DIP socket (for ATtiny85)
- 1x 2x3 pin header (for ISP programming)
- 2x 1x4 pin headers (to plug into LM393 socket - left side pins 1-4, right side pins 5-8)
- 1x 10K potentiometer (for speed control, mounted on adapter board)

## Code Structure

```cpp
// Pin definitions
const int LEFT_MOTOR_PIN = 0;   // PB0
const int RIGHT_MOTOR_PIN = 1;  // PB1
const int LEFT_IR_PIN = A1;     // PB2
const int RIGHT_IR_PIN = A2;    // PB4
const int SPEED_POT_PIN = A3;   // PB3

// Tuning parameters
const int THRESHOLD = 512;
const int HYSTERESIS = 30;
const int MIN_SPEED = 60;
const int MAX_SPEED = 255;
const int PROP_GAIN = 2;

void setup() {
  // Configure motor pins as outputs
  // Delay for sensor stabilization
}

void loop() {
  // Read all 3 ADC inputs
  // Map speed pot to base speed
  // Calculate error (right - left)
  // Apply proportional correction to each motor
  // Clamp PWM values 0-255
  
  // State detection with hysteresis:
  // - Both black: STOP
  // - Both white: slow straight
  // - Otherwise: proportional steering
  
  // Small delay (10ms) to prevent oscillation
}
```