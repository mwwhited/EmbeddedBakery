/*
 * Phase 1 AI - Obstacle Avoidance Robot
 * Converted from Basic Stamp 2 to ATtiny2313
 * Original by Matthew Whited - v0.1 - 12/29/2001
 * ATtiny2313 port - 2025
 *
 * Hardware:
 *   - Lynxmotion IRPD (IR Proximity Detector)
 *   - Dual Mini H-Bridge motor driver
 *   - Status LED
 *
 * Pin Mapping (ATtiny2313):
 *   PD2 - IRPD Left LED control (output)
 *   PD3 - IRPD Right LED control (output)
 *   PD4 - IRPD Signal input (input)
 *   PD5 - H-Bridge B1 (left motor)
 *   PD6 - H-Bridge B2 (left motor)
 *   PB0 - H-Bridge A1 (right motor)
 *   PB1 - H-Bridge A2 (right motor)
 *   PB2 - Status LED
 */

#include <avr/io.h>
#include <util/delay.h>

/* Pin definitions */
#define IRPD_LEFT_LED   PD2
#define IRPD_RIGHT_LED  PD3
#define IRPD_SIGNAL     PD4

#define MOTOR_LEFT_B1   PD5
#define MOTOR_LEFT_B2   PD6
#define MOTOR_RIGHT_A1  PB0
#define MOTOR_RIGHT_A2  PB1

#define STATUS_LED      PB2

/* Helper macros */
#define SET_HIGH(port, pin)   ((port) |= (1 << (pin)))
#define SET_LOW(port, pin)    ((port) &= ~(1 << (pin)))
#define READ_PIN(pinreg, pin) ((pinreg) & (1 << (pin)))

/* Motor control functions */
static void motor_forward(void)
{
    /* Left motor forward: B1=LOW, B2=HIGH */
    SET_LOW(PORTD, MOTOR_LEFT_B1);
    SET_HIGH(PORTD, MOTOR_LEFT_B2);

    /* Right motor forward: A1=HIGH, A2=LOW */
    SET_HIGH(PORTB, MOTOR_RIGHT_A1);
    SET_LOW(PORTB, MOTOR_RIGHT_A2);

    /* Status LED off */
    SET_LOW(PORTB, STATUS_LED);
}

static void motor_turn_right(void)
{
    /* Left motor forward: B1=LOW, B2=HIGH */
    SET_LOW(PORTD, MOTOR_LEFT_B1);
    SET_HIGH(PORTD, MOTOR_LEFT_B2);

    /* Right motor backward: A1=LOW, A2=HIGH */
    SET_LOW(PORTB, MOTOR_RIGHT_A1);
    SET_HIGH(PORTB, MOTOR_RIGHT_A2);

    /* Status LED off */
    SET_LOW(PORTB, STATUS_LED);
}

static void motor_turn_left(void)
{
    /* Left motor backward: B1=HIGH, B2=LOW */
    SET_HIGH(PORTD, MOTOR_LEFT_B1);
    SET_LOW(PORTD, MOTOR_LEFT_B2);

    /* Right motor forward: A1=HIGH, A2=LOW */
    SET_HIGH(PORTB, MOTOR_RIGHT_A1);
    SET_LOW(PORTB, MOTOR_RIGHT_A2);

    /* Status LED off */
    SET_LOW(PORTB, STATUS_LED);
}

static void motor_backup(void)
{
    /* Left motor backward: B1=HIGH, B2=LOW */
    SET_HIGH(PORTD, MOTOR_LEFT_B1);
    SET_LOW(PORTD, MOTOR_LEFT_B2);

    /* Right motor backward: A1=LOW, A2=HIGH */
    SET_LOW(PORTB, MOTOR_RIGHT_A1);
    SET_HIGH(PORTB, MOTOR_RIGHT_A2);

    /* Status LED on (indicates backup) */
    SET_HIGH(PORTB, STATUS_LED);
}

/*
 * Read IRPD sensor
 * The IRPD works by pulsing an IR LED and reading the detector.
 * Pulse sequence: HIGH 5ms, LOW 5ms, HIGH 5ms, then read.
 * Returns 1 if clear (no obstacle), 0 if obstacle detected.
 */
static uint8_t read_irpd(uint8_t led_pin)
{
    uint8_t result;

    /* Pulse sequence for IRPD */
    SET_HIGH(PORTD, led_pin);
    _delay_ms(5);
    SET_LOW(PORTD, led_pin);
    _delay_ms(5);
    SET_HIGH(PORTD, led_pin);
    _delay_ms(5);

    /* Read detector signal */
    result = READ_PIN(PIND, IRPD_SIGNAL) ? 1 : 0;

    /* Turn off LED */
    SET_LOW(PORTD, led_pin);

    return result;
}

static void init_ports(void)
{
    /* PORTD: PD2, PD3, PD5, PD6 as outputs; PD4 as input */
    DDRD = (1 << IRPD_LEFT_LED) | (1 << IRPD_RIGHT_LED) |
           (1 << MOTOR_LEFT_B1) | (1 << MOTOR_LEFT_B2);
    PORTD = 0;

    /* PORTB: PB0, PB1, PB2 as outputs */
    DDRB = (1 << MOTOR_RIGHT_A1) | (1 << MOTOR_RIGHT_A2) | (1 << STATUS_LED);
    PORTB = 0;
}

int main(void)
{
    uint8_t temp_left, temp_right;
    uint8_t action;

    init_ports();

    /* Initial delay (1 second) */
    _delay_ms(1000);

    while (1) {
        /* Main loop delay */
        _delay_ms(750);

        /* Test right sensor */
        temp_right = read_irpd(IRPD_RIGHT_LED);

        /* Test left sensor */
        temp_left = read_irpd(IRPD_LEFT_LED);

        /*
         * Calculate action based on sensor readings:
         * temp_left=1, temp_right=1: both clear -> action=0 -> forward
         * temp_left=0, temp_right=1: left obstacle -> action=1 -> turn right
         * temp_left=1, temp_right=0: right obstacle -> action=2 -> turn left
         * temp_left=0, temp_right=0: both obstacle -> action=3 -> backup
         */
        action = 0;
        if (temp_left == 0) {
            action += 1;
        }
        if (temp_right == 0) {
            action += 2;
        }

        switch (action) {
            case 0:
                motor_forward();
                break;
            case 1:
                motor_turn_right();
                break;
            case 2:
                motor_turn_left();
                break;
            case 3:
            default:
                motor_backup();
                break;
        }
    }

    return 0;
}
