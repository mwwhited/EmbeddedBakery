/*
 * Phase 1 AI - Obstacle Avoidance Robot
 *
 * Converted from Basic Stamp 2 to ATtiny2313
 * Original by Matthew Whited - v0.1 - 12/29/2001
 * ATtiny2313/PlatformIO port - 2025
 *
 * Hardware:
 *   - Lynxmotion IRPD (IR Proximity Detector)
 *   - Dual Mini H-Bridge motor driver
 *   - Status LED
 *
 * Algorithm:
 *   1. Scan for obstacles using IRPD
 *   2. React based on obstacle location:
 *      - Clear: go forward
 *      - Left obstacle: spin right
 *      - Right obstacle: spin left
 *      - Both obstacles: backup (LED on)
 *   3. Repeat
 */

#include <Arduino.h>
#include "config.h"
#include "motor.h"
#include "irpd.h"
#include "status.h"

/*
 * Map obstacle state to movement command.
 *
 * This implements the original BS2 logic:
 *   - OBSTACLE_NONE  -> forward
 *   - OBSTACLE_LEFT  -> spin right (avoid left obstacle)
 *   - OBSTACLE_RIGHT -> spin left (avoid right obstacle)
 *   - OBSTACLE_BOTH  -> backup
 */
static MoveCommand get_move_command(ObstacleState state)
{
    switch (state) {
        case OBSTACLE_NONE:
            return MOVE_FORWARD;
        case OBSTACLE_LEFT:
            return MOVE_SPIN_RIGHT;
        case OBSTACLE_RIGHT:
            return MOVE_SPIN_LEFT;
        case OBSTACLE_BOTH:
        default:
            return MOVE_BACKWARD;
    }
}

void setup(void)
{
    /* Initialize all hardware */
    motor_init();
    irpd_init();
    status_init();

    /* Startup delay - allows time for power stabilization */
    delay(STARTUP_DELAY_MS);
}

void loop(void)
{
    ObstacleState obstacles;
    MoveCommand   command;

    /* Delay between sensor readings */
    delay(LOOP_DELAY_MS);

    /* Scan for obstacles */
    obstacles = irpd_scan();

    /* Determine movement */
    command = get_move_command(obstacles);

    /* Status LED indicates backup mode */
    status_set(obstacles == OBSTACLE_BOTH);

    /* Execute movement */
    motor_move(command);
}
