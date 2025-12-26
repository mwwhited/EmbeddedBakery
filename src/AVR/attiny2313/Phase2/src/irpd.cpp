/*
 * Phase 1 AI - IRPD Sensor Implementation
 *
 * The IRPD works by pulsing an IR LED and reading the detector.
 * Pulse sequence: HIGH -> delay -> LOW -> delay -> HIGH -> delay -> read
 *
 * Signal interpretation:
 *   HIGH = path clear (no IR reflection)
 *   LOW  = obstacle detected (IR reflected back)
 */

#include "config.h"
#include "irpd.h"

void irpd_init(void)
{
    pinMode(PIN_IRPD_LEFT, OUTPUT);
    pinMode(PIN_IRPD_RIGHT, OUTPUT);
    pinMode(PIN_IRPD_SIGNAL, INPUT);

    /* Ensure LEDs are off */
    digitalWrite(PIN_IRPD_LEFT, LOW);
    digitalWrite(PIN_IRPD_RIGHT, LOW);
}

bool irpd_read_channel(uint8_t led_pin)
{
    bool result;

    /* Pulse sequence for IRPD */
    digitalWrite(led_pin, HIGH);
    delay(IRPD_PULSE_MS);

    digitalWrite(led_pin, LOW);
    delay(IRPD_PULSE_MS);

    digitalWrite(led_pin, HIGH);
    delay(IRPD_PULSE_MS);

    /* Read detector - HIGH means clear, LOW means obstacle */
    result = (digitalRead(PIN_IRPD_SIGNAL) == IRPD_CLEAR);

    /* Turn off LED */
    digitalWrite(led_pin, LOW);

    return result;
}

IrpdReading irpd_read(void)
{
    IrpdReading reading;

    /* Read right sensor first (matches original BS2 code order) */
    reading.right_clear = irpd_read_channel(PIN_IRPD_RIGHT);

    /* Read left sensor */
    reading.left_clear = irpd_read_channel(PIN_IRPD_LEFT);

    return reading;
}

ObstacleState irpd_get_obstacle_state(IrpdReading reading)
{
    if (reading.left_clear && reading.right_clear) {
        return OBSTACLE_NONE;
    } else if (!reading.left_clear && reading.right_clear) {
        return OBSTACLE_LEFT;
    } else if (reading.left_clear && !reading.right_clear) {
        return OBSTACLE_RIGHT;
    } else {
        return OBSTACLE_BOTH;
    }
}

ObstacleState irpd_scan(void)
{
    IrpdReading reading = irpd_read();
    return irpd_get_obstacle_state(reading);
}
