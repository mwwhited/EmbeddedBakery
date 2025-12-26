/*
 * Phase 1 AI - Motor Driver Implementation
 */

#include "config.h"
#include "motor.h"

void motor_init(void)
{
    pinMode(PIN_MOTOR_LEFT_A, OUTPUT);
    pinMode(PIN_MOTOR_LEFT_B, OUTPUT);
    pinMode(PIN_MOTOR_RIGHT_A, OUTPUT);
    pinMode(PIN_MOTOR_RIGHT_B, OUTPUT);

    motor_stop();
}

static void set_left_motor(MotorDirection dir)
{
    switch (dir) {
        case MOTOR_FORWARD:
            digitalWrite(PIN_MOTOR_LEFT_A, LOW);
            digitalWrite(PIN_MOTOR_LEFT_B, HIGH);
            break;
        case MOTOR_BACKWARD:
            digitalWrite(PIN_MOTOR_LEFT_A, HIGH);
            digitalWrite(PIN_MOTOR_LEFT_B, LOW);
            break;
        case MOTOR_STOP:
        default:
            digitalWrite(PIN_MOTOR_LEFT_A, LOW);
            digitalWrite(PIN_MOTOR_LEFT_B, LOW);
            break;
    }
}

static void set_right_motor(MotorDirection dir)
{
    switch (dir) {
        case MOTOR_FORWARD:
            digitalWrite(PIN_MOTOR_RIGHT_A, HIGH);
            digitalWrite(PIN_MOTOR_RIGHT_B, LOW);
            break;
        case MOTOR_BACKWARD:
            digitalWrite(PIN_MOTOR_RIGHT_A, LOW);
            digitalWrite(PIN_MOTOR_RIGHT_B, HIGH);
            break;
        case MOTOR_STOP:
        default:
            digitalWrite(PIN_MOTOR_RIGHT_A, LOW);
            digitalWrite(PIN_MOTOR_RIGHT_B, LOW);
            break;
    }
}

void motor_set(MotorDirection left, MotorDirection right)
{
    set_left_motor(left);
    set_right_motor(right);
}

void motor_move(MoveCommand cmd)
{
    switch (cmd) {
        case MOVE_FORWARD:
            motor_set(MOTOR_FORWARD, MOTOR_FORWARD);
            break;
        case MOVE_BACKWARD:
            motor_set(MOTOR_BACKWARD, MOTOR_BACKWARD);
            break;
        case MOVE_TURN_LEFT:
            motor_set(MOTOR_STOP, MOTOR_FORWARD);
            break;
        case MOVE_TURN_RIGHT:
            motor_set(MOTOR_FORWARD, MOTOR_STOP);
            break;
        case MOVE_SPIN_LEFT:
            motor_set(MOTOR_BACKWARD, MOTOR_FORWARD);
            break;
        case MOVE_SPIN_RIGHT:
            motor_set(MOTOR_FORWARD, MOTOR_BACKWARD);
            break;
        case MOVE_STOP:
        default:
            motor_stop();
            break;
    }
}

void motor_stop(void)
{
    motor_set(MOTOR_STOP, MOTOR_STOP);
}
