/*
 * Phase 1 AI - Motor Driver
 *
 * Abstraction layer for dual H-bridge motor control.
 */

#ifndef MOTOR_H
#define MOTOR_H

#include <Arduino.h>

/* Motor direction enumeration */
typedef enum {
    MOTOR_STOP,
    MOTOR_FORWARD,
    MOTOR_BACKWARD
} MotorDirection;

/* Robot movement commands */
typedef enum {
    MOVE_STOP,
    MOVE_FORWARD,
    MOVE_BACKWARD,
    MOVE_TURN_LEFT,
    MOVE_TURN_RIGHT,
    MOVE_SPIN_LEFT,
    MOVE_SPIN_RIGHT
} MoveCommand;

/*
 * Initialize motor driver pins.
 * Must be called before any motor operations.
 */
void motor_init(void);

/*
 * Set individual motor direction.
 *
 * @param left  Direction for left motor
 * @param right Direction for right motor
 */
void motor_set(MotorDirection left, MotorDirection right);

/*
 * Execute a movement command.
 *
 * @param cmd Movement command to execute
 */
void motor_move(MoveCommand cmd);

/*
 * Stop both motors immediately.
 */
void motor_stop(void);

#endif /* MOTOR_H */
