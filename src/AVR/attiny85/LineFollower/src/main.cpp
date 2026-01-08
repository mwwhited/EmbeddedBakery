/**
 * ATtiny85 Line Follower Controller
 *
 * Replaces the LM393 dual comparator on a D2-1 line follower robot board.
 * Provides proportional steering control with adjustable speed.
 *
 * Hardware: ATtiny85 @ 8MHz internal oscillator
 *
 * ============================================================================
 * WIRING DIAGRAM - ATtiny85 DIP-8 Pinout
 * ============================================================================
 *
 *                    ATtiny85
 *                  +----U----+
 *    RESET     1  -|         |- 8   VCC
 *    PB3/ADC3  2  -|         |- 7   PB2/ADC1/SCK
 *    PB4/ADC2  3  -|         |- 6   PB1/OC0B/MISO
 *    GND       4  -|         |- 5   PB0/OC0A/MOSI
 *                  +---------+
 *
 * ============================================================================
 * PIN ASSIGNMENTS (Simplified Wiring - Both IR on Left Header)
 * ============================================================================
 *
 * | ATtiny85 Pin | Function      | Connection              | LM393 Socket |
 * |--------------|---------------|-------------------------|--------------|
 * | 1 (RESET)    | Reset         | ISP Header Pin 5        | --           |
 * | 2 (PB3)      | ADC3 Input    | Speed Pot Wiper         | --           |
 * | 3 (PB4)      | ADC2 Input    | Right IR Sensor         | Pin 2 (IN1-) |
 * | 4 (GND)      | Ground        | GND Rail                | Pin 4 (GND)  |
 * | 5 (PB0)      | PWM Output    | Left Motor Driver       | Pin 1 (OUT1) |
 * | 6 (PB1)      | PWM Output    | Right Motor Driver      | Pin 7 (OUT2) |
 * | 7 (PB2)      | ADC1 Input    | Left IR Sensor          | Pin 3 (IN1+) |
 * | 8 (VCC)      | Power         | +5V Rail                | Pin 8 (VCC)  |
 *
 * ============================================================================
 * LM393 SOCKET PINOUT (DIP-8) - Simplified Wiring
 * ============================================================================
 *
 *                    LM393
 *                  +----U----+
 *    OUT1      1  -|         |- 8   VCC       <- Right Header
 *    IN1-      2  -|  R_IR   |- 7   OUT2      <- Right Header (R Motor)
 *    IN1+      3  -|  L_IR   |- 6   IN2-      (NC)
 *    GND       4  -|         |- 5   IN2+      (NC)
 *                  +---------+
 *                  Left Header
 *
 * Benefits: Both IR sensors on left header (pins 1-4) simplifies perf board.
 * Right header (pins 5-8) only needs VCC and Right Motor connections.
 *
 * ============================================================================
 * ISP HEADER (2x3) - USBasp Programming
 * ============================================================================
 *
 *            +-------------+
 *       MOSI | 1         2 | VCC
 *            +-------------+
 *        N/C | 3         4 | GND
 *            +-------------+
 *      RESET | 5         6 | SCK
 *            +-------------+
 *
 * ISP Pin 1 (MOSI)  -> ATtiny85 Pin 5 (PB0) - shared with Left Motor
 * ISP Pin 2 (VCC)   -> ATtiny85 Pin 8 (VCC)
 * ISP Pin 3 (N/C)   -> Not connected
 * ISP Pin 4 (GND)   -> ATtiny85 Pin 4 (GND)
 * ISP Pin 5 (RESET) -> ATtiny85 Pin 1 (RESET)
 * ISP Pin 6 (SCK)   -> ATtiny85 Pin 7 (PB2) - shared with Left IR
 *
 * Note: Disconnect motors during programming to avoid interference.
 *
 * ============================================================================
 * SPEED POTENTIOMETER (10K)
 * ============================================================================
 *
 * Leg 1 (outer)  -> GND
 * Leg 2 (wiper)  -> ATtiny85 Pin 2 (PB3/ADC3)
 * Leg 3 (outer)  -> VCC
 *
 * ============================================================================
 * BEHAVIOR
 * ============================================================================
 *
 * 1. Normal: Proportional steering based on IR sensor difference
 * 2. Both BLACK (high ADC): STOP - end of line or intersection
 * 3. Both WHITE (low ADC): Go straight slow - line lost, search mode
 * 4. Speed pot controls base motor speed
 * 5. Hysteresis prevents oscillation at line edges
 *
 * ============================================================================
 */

#include <Arduino.h>

// ============================================================================
// PIN DEFINITIONS
// ============================================================================

const uint8_t LEFT_MOTOR_PIN  = 0;   // PB0 - OC0A PWM output
const uint8_t RIGHT_MOTOR_PIN = 1;   // PB1 - OC0B PWM output
const uint8_t LEFT_IR_PIN     = A1;  // PB2 - ADC1 input
const uint8_t RIGHT_IR_PIN    = A2;  // PB4 - ADC2 input
const uint8_t SPEED_POT_PIN   = A3;  // PB3 - ADC3 input

// ============================================================================
// TUNABLE PARAMETERS
// Adjust these values to tune line following behavior
// ============================================================================

const int THRESHOLD   = 512;   // ADC value for black/white detection (0-1023)
const int HYSTERESIS  = 30;    // Prevents oscillation at line edges
const int MIN_SPEED   = 60;    // Minimum motor PWM (0-255)
const int MAX_SPEED   = 255;   // Maximum motor PWM (0-255)
const int PROP_GAIN   = 2;     // Proportional steering gain (higher = sharper turns)
const int LOOP_DELAY  = 10;    // Main loop delay in ms (prevents oscillation)
const int SEARCH_SPEED = 80;   // Speed when line is lost (both white)

// ============================================================================
// STATE VARIABLES
// ============================================================================

// Hysteresis state for each sensor
bool leftOnLine  = false;
bool rightOnLine = false;

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

/**
 * Apply hysteresis to sensor reading
 * Prevents rapid toggling when sensor is near the threshold
 */
bool isOnLine(int adcValue, bool previousState) {
    if (previousState) {
        // Currently on line, need to drop below threshold - hysteresis to leave
        return adcValue > (THRESHOLD - HYSTERESIS);
    } else {
        // Currently off line, need to rise above threshold + hysteresis to enter
        return adcValue > (THRESHOLD + HYSTERESIS);
    }
}

/**
 * Clamp a value to 0-255 range for PWM output
 */
uint8_t clampPWM(int value) {
    if (value < 0) return 0;
    if (value > 255) return 255;
    return (uint8_t)value;
}

// ============================================================================
// SETUP
// ============================================================================

void setup() {
    // Configure motor pins as outputs
    pinMode(LEFT_MOTOR_PIN, OUTPUT);
    pinMode(RIGHT_MOTOR_PIN, OUTPUT);

    // Ensure motors are stopped at startup
    analogWrite(LEFT_MOTOR_PIN, 0);
    analogWrite(RIGHT_MOTOR_PIN, 0);

    // Allow sensors to stabilize after power-on
    delay(100);
}

// ============================================================================
// MAIN LOOP
// ============================================================================

void loop() {
    // -------------------------------------------------------------------------
    // Read all ADC inputs
    // -------------------------------------------------------------------------
    int leftIR   = analogRead(LEFT_IR_PIN);    // 0-1023, higher = darker/black
    int rightIR  = analogRead(RIGHT_IR_PIN);   // 0-1023, higher = darker/black
    int speedPot = analogRead(SPEED_POT_PIN);  // 0-1023, maps to speed

    // -------------------------------------------------------------------------
    // Map speed pot to base motor speed
    // -------------------------------------------------------------------------
    int baseSpeed = map(speedPot, 0, 1023, MIN_SPEED, MAX_SPEED);

    // -------------------------------------------------------------------------
    // Apply hysteresis to determine if sensors are on line
    // -------------------------------------------------------------------------
    leftOnLine  = isOnLine(leftIR, leftOnLine);
    rightOnLine = isOnLine(rightIR, rightOnLine);

    // -------------------------------------------------------------------------
    // Determine motor speeds based on sensor state
    // -------------------------------------------------------------------------
    int leftMotor  = 0;
    int rightMotor = 0;

    if (leftOnLine && rightOnLine) {
        // BOTH BLACK: Stop - intersection or end of line
        leftMotor  = 0;
        rightMotor = 0;
    }
    else if (!leftOnLine && !rightOnLine) {
        // BOTH WHITE: Line lost - go straight slowly to search
        leftMotor  = SEARCH_SPEED;
        rightMotor = SEARCH_SPEED;
    }
    else {
        // NORMAL: Proportional steering
        // Calculate error: positive = line is to the right, negative = line is to the left
        int error = rightIR - leftIR;

        // Apply proportional correction
        // If error positive (line right): slow right motor, speed up left motor
        // If error negative (line left): slow left motor, speed up right motor
        int correction = (error * PROP_GAIN) / 100;  // Scale down the correction

        leftMotor  = baseSpeed + correction;
        rightMotor = baseSpeed - correction;
    }

    // -------------------------------------------------------------------------
    // Clamp and output PWM values
    // -------------------------------------------------------------------------
    analogWrite(LEFT_MOTOR_PIN, clampPWM(leftMotor));
    analogWrite(RIGHT_MOTOR_PIN, clampPWM(rightMotor));

    // -------------------------------------------------------------------------
    // Small delay to prevent oscillation and reduce power consumption
    // -------------------------------------------------------------------------
    delay(LOOP_DELAY);
}
