/*
 * Phase 1 AI - IRPD Sensor Driver
 *
 * Abstraction layer for Lynxmotion IRPD proximity detector.
 */

#ifndef IRPD_H
#define IRPD_H

#include <Arduino.h>

/* Sensor reading results */
typedef struct {
    bool left_clear;    /* true if left side is clear */
    bool right_clear;   /* true if right side is clear */
} IrpdReading;

/* Obstacle detection state */
typedef enum {
    OBSTACLE_NONE,      /* Both sides clear */
    OBSTACLE_LEFT,      /* Obstacle on left only */
    OBSTACLE_RIGHT,     /* Obstacle on right only */
    OBSTACLE_BOTH       /* Obstacles on both sides */
} ObstacleState;

/*
 * Initialize IRPD sensor pins.
 * Must be called before any sensor operations.
 */
void irpd_init(void);

/*
 * Read a single IRPD channel.
 *
 * Performs the pulse sequence and reads the detector.
 *
 * @param led_pin Arduino pin number for the IR LED
 * @return true if path is clear, false if obstacle detected
 */
bool irpd_read_channel(uint8_t led_pin);

/*
 * Read both IRPD channels.
 *
 * @return IrpdReading structure with both sensor states
 */
IrpdReading irpd_read(void);

/*
 * Get obstacle state from sensor reading.
 *
 * @param reading Sensor reading from irpd_read()
 * @return Obstacle detection state
 */
ObstacleState irpd_get_obstacle_state(IrpdReading reading);

/*
 * Convenience function to read sensors and return obstacle state.
 *
 * @return Current obstacle detection state
 */
ObstacleState irpd_scan(void);

#endif /* IRPD_H */
