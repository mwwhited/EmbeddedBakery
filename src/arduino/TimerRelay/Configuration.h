#ifndef CONFIGURATION_H
#define CONFIGURATION_H

#include "Settings.h"

// LED and Relay states
#define SET_LED_ON 1
#define SET_LED_OFF 0
#define SET_RELAY_ON 0
#define SET_RELAY_OFF 1

// LCD Pins
#define LCD_RS_PIN 2
#define LCD_EN_PIN 3
#define LCD_D4_PIN 4
#define LCD_D5_PIN 5
#define LCD_D6_PIN A4
#define LCD_D7_PIN A5

#if defined(ARDUINO_AVR_PRO)
    #define LED_BLUE_PIN A3
    #define LED_GREEN_PIN A2
    #define LED_YELLOW_PIN A1
    #define LED_RED_PIN A0
    
    #define BUTTON_BLUE_PIN 13
    #define BUTTON_GREEN_PIN 12
    #define BUTTON_YELLOW_PIN 11
    #define BUTTON_RED_PIN 10
    
    #define RELAY_BLUE_PIN 6
    #define RELAY_GREEN_PIN 7
    #define RELAY_YELLOW_PIN 8
    #define RELAY_RED_PIN 9
#elif defined(ARDUINO_AVR_LEONARDO)
    #define LED_BLUE_PIN A3
    #define LED_GREEN_PIN A2
    #define LED_YELLOW_PIN A1
    #define LED_RED_PIN A0
    
    #define BUTTON_BLUE_PIN 15
    #define BUTTON_GREEN_PIN 14
    #define BUTTON_YELLOW_PIN 16
    #define BUTTON_RED_PIN 10
    
    #define RELAY_BLUE_PIN 6
    #define RELAY_GREEN_PIN 7
    #define RELAY_YELLOW_PIN 8
    #define RELAY_RED_PIN 9
#else
    #error "Unsupported board"
#endif

#endif