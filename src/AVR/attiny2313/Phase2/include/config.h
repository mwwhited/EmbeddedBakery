/*
 * Phase 1 AI - Configuration
 *
 * Hardware pin assignments and timing configuration.
 * Modify this file to match your wiring.
 */

#ifndef CONFIG_H
#define CONFIG_H

#include <Arduino.h>

/*
 * Pin Assignments
 *
 * ATtiny2313 Arduino pin mapping:
 *   PD0 = 0,  PD1 = 1,  PA1 = 2,  PA0 = 3
 *   PD2 = 4,  PD3 = 5,  PD4 = 6,  PD5 = 7
 *   PD6 = 8,  PB0 = 9,  PB1 = 10, PB2 = 11
 *   PB3 = 12, PB4 = 13, PB5 = 14, PB6 = 15
 *   PB7 = 16, PA2 = 17
 */

/* IRPD Sensor Pins */
#define PIN_IRPD_LEFT       4   /* PD2 - Left IR LED control */
#define PIN_IRPD_RIGHT      5   /* PD3 - Right IR LED control */
#define PIN_IRPD_SIGNAL     6   /* PD4 - IR detector input */

/* Motor Driver Pins (H-Bridge) */
#define PIN_MOTOR_LEFT_A    7   /* PD5 - Left motor input A (B1) */
#define PIN_MOTOR_LEFT_B    8   /* PD6 - Left motor input B (B2) */
#define PIN_MOTOR_RIGHT_A   9   /* PB0 - Right motor input A (A1) */
#define PIN_MOTOR_RIGHT_B   10  /* PB1 - Right motor input B (A2) */

/* Status LED */
#define PIN_STATUS_LED      11  /* PB2 - Status indicator */

/*
 * Timing Configuration
 * Can be overridden via build_flags in platformio.ini
 */

#ifndef IRPD_PULSE_MS
#define IRPD_PULSE_MS       5   /* IR LED pulse duration (ms) */
#endif

#ifndef LOOP_DELAY_MS
#define LOOP_DELAY_MS       750 /* Main loop delay (ms) */
#endif

#ifndef STARTUP_DELAY_MS
#define STARTUP_DELAY_MS    1000 /* Power-on delay (ms) */
#endif

/*
 * IRPD Signal Interpretation
 * The IRPD returns HIGH when path is clear, LOW when obstacle detected.
 * Invert these if your sensor has opposite logic.
 */
#define IRPD_CLEAR          HIGH
#define IRPD_OBSTACLE       LOW

#endif /* CONFIG_H */
