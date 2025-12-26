/*
 * Phase 1 AI - Status LED Driver
 *
 * Simple abstraction for status indicator LED.
 */

#ifndef STATUS_H
#define STATUS_H

#include <Arduino.h>

/*
 * Initialize status LED pin.
 */
void status_init(void);

/*
 * Turn status LED on.
 */
void status_on(void);

/*
 * Turn status LED off.
 */
void status_off(void);

/*
 * Set status LED state.
 *
 * @param state true for on, false for off
 */
void status_set(bool state);

/*
 * Toggle status LED.
 */
void status_toggle(void);

#endif /* STATUS_H */
