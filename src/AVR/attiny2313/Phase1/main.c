/*
 * Phase 1 AI - Obstacle Avoidance Robot
 * Converted from Basic Stamp 2 to ATtiny2313
 * Original by Matthew Whited - v0.1 - 12/29/2001
 *
 * This is a direct port of the original PBASIC code.
 * See Phase2 for a modern refactored version.
 *
 * Hardware:
 *   - Lynxmotion IRPD (IR Proximity Detector)
 *   - Dual Mini H-Bridge motor driver
 *   - Status LED
 */

#include <avr/io.h>
#include <util/delay.h>

/* Pin Definitions (accent accent accent match original BS2 wiring) */
#define IRPD_LEFT_LED   PD2   /* BS2 Pin 0 */
#define IRPD_RIGHT_LED  PD3   /* BS2 Pin 1 */
#define IRPD_SIGNAL     PD4   /* BS2 Pin 2 */
#define MOTOR_LEFT_B1   PD5   /* BS2 Pin 3 */
#define MOTOR_LEFT_B2   PD6   /* BS2 Pin 4 */
#define MOTOR_RIGHT_A1  PB0   /* BS2 Pin 5 */
#define MOTOR_RIGHT_A2  PB1   /* BS2 Pin 6 */
#define STATUS_LED      PB2   /* BS2 Pin 7 */

/* Read IRPD sensor - pulse LED and read detector */
static uint8_t read_irpd(uint8_t led_pin)
{
    uint8_t result;

    PORTD |= (1 << led_pin);   /* HIGH */
    _delay_ms(5);
    PORTD &= ~(1 << led_pin);  /* LOW */
    _delay_ms(5);
    PORTD |= (1 << led_pin);   /* HIGH */
    _delay_ms(5);

    result = (PIND & (1 << IRPD_SIGNAL)) ? 1 : 0;

    PORTD &= ~(1 << led_pin);  /* LOW */

    return result;
}

/* Motor: Forward */
static void forward(void)
{
    PORTD &= ~(1 << MOTOR_LEFT_B1);   /* LOW 3 */
    PORTB &= ~(1 << MOTOR_RIGHT_A2);  /* LOW 6 */
    PORTB |= (1 << MOTOR_RIGHT_A1);   /* HIGH 5 */
    PORTD |= (1 << MOTOR_LEFT_B2);    /* HIGH 4 */
    PORTB &= ~(1 << STATUS_LED);      /* LOW 7 */
}

/* Motor: Turn Right */
static void turn_r(void)
{
    PORTD &= ~(1 << MOTOR_LEFT_B1);   /* LOW 3 */
    PORTB &= ~(1 << MOTOR_RIGHT_A1);  /* LOW 5 */
    PORTD |= (1 << MOTOR_LEFT_B2);    /* HIGH 4 */
    PORTB |= (1 << MOTOR_RIGHT_A2);   /* HIGH 6 */
    PORTB &= ~(1 << STATUS_LED);      /* LOW 7 */
}

/* Motor: Turn Left */
static void turn_l(void)
{
    PORTD &= ~(1 << MOTOR_LEFT_B2);   /* LOW 4 */
    PORTB &= ~(1 << MOTOR_RIGHT_A2);  /* LOW 6 */
    PORTD |= (1 << MOTOR_LEFT_B1);    /* HIGH 3 */
    PORTB |= (1 << MOTOR_RIGHT_A1);   /* HIGH 5 */
    PORTB &= ~(1 << STATUS_LED);      /* LOW 7 */
}

/* Motor: Backup */
static void backup(void)
{
    PORTD &= ~(1 << MOTOR_LEFT_B2);   /* LOW 4 */
    PORTB &= ~(1 << MOTOR_RIGHT_A1);  /* LOW 5 */
    PORTD |= (1 << MOTOR_LEFT_B1);    /* HIGH 3 */
    PORTB |= (1 << MOTOR_RIGHT_A2);   /* HIGH 6 */
    PORTB |= (1 << STATUS_LED);       /* HIGH 7 */
}

int main(void)
{
    uint8_t templ, tempr, action;

    /* Configure outputs */
    DDRD = (1 << IRPD_LEFT_LED) | (1 << IRPD_RIGHT_LED) |
           (1 << MOTOR_LEFT_B1) | (1 << MOTOR_LEFT_B2);
    DDRB = (1 << MOTOR_RIGHT_A1) | (1 << MOTOR_RIGHT_A2) | (1 << STATUS_LED);

    /* Initial delay */
    _delay_ms(1000);

    /* Main loop */
    while (1) {
        _delay_ms(750);

        /* Test right sensor */
        tempr = read_irpd(IRPD_RIGHT_LED);

        /* Test left sensor */
        templ = read_irpd(IRPD_LEFT_LED);

        /* Calculate action (matches original BS2 logic) */
        action = 0;
        if (templ == 0) action += 1;
        if (tempr == 0) action += 2;

        /* Execute action */
        switch (action) {
            case 0: forward(); break;
            case 1: turn_r();  break;
            case 2: turn_l();  break;
            case 3: backup();  break;
        }
    }

    return 0;
}
