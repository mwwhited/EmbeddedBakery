/*
 * Phase 1 AI - Status LED Implementation
 */

#include "config.h"
#include "status.h"

static bool led_state = false;

void status_init(void)
{
    pinMode(PIN_STATUS_LED, OUTPUT);
    status_off();
}

void status_on(void)
{
    digitalWrite(PIN_STATUS_LED, HIGH);
    led_state = true;
}

void status_off(void)
{
    digitalWrite(PIN_STATUS_LED, LOW);
    led_state = false;
}

void status_set(bool state)
{
    if (state) {
        status_on();
    } else {
        status_off();
    }
}

void status_toggle(void)
{
    status_set(!led_state);
}
