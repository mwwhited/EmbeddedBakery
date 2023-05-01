#include <Arduino_FreeRTOS.h>
#include <queue.h>

#include <Wire.h>
#include <hd44780.h>
#include <hd44780ioClass/hd44780_I2Cexp.h>

#include <Keyboard.h>
// #include <KeyboardLayout.h>
// #include <Keyboard_da_DK.h>
// #include <Keyboard_de_DE.h>
// #include <Keyboard_es_ES.h>
// #include <Keyboard_fr_FR.h>
// #include <Keyboard_it_IT.h>
// #include <Keyboard_sv_SE.h>

#include "MatrixKeypad.h"

/*
 * Configuration Values
 */
#define SERIAL_BAUD_RATE 9600

#define LCD_DISPLAY_ROWS 4
#define LCD_DISPLAY_COLUMNS 20
#define LCD_DISPLAY_QUEUE_DEPTH 10

#define KEYPAD_QUEUE_DEPTH 10
#define KEYPAD_SCAN_PERIOD 500

TaskHandle_t taskSerialHandle;
TaskHandle_t taskKeypadHandle;
TaskHandle_t taskDisplayHandle;

QueueHandle_t displayQueue;
QueueHandle_t keypadQueue;

const int keypad_cols[] = { A3, A2, A1, A0 };
const int keypad_rows[] = { 0, 1, 4, 5, 6, 7, 8, 9, 15, 14, 16, 10 };
const char keypad_keyMap[] = ">v<~_098\\POI/^LKMNBV7654UYTRJHGF++++ZQA1XWS2CED3";

//TODO: setup scan loop for keypad
//TODO: debounce input from keypad though queue
//TODO: output keypress to USB HID

//TODO: store mapping config in EEPROM

void setup() {
  // put your setup code here, to run once:

  displayQueue = xQueueCreate(LCD_DISPLAY_QUEUE_DEPTH, sizeof(int));  //TODO: this should be a struct
  keypadQueue  = xQueueCreate(KEYPAD_QUEUE_DEPTH,      sizeof(int));  //TODO: this should be a struct

  xTaskCreate(TaskSerial,  "Serial",  128, NULL, 2, &taskSerialHandle );
  xTaskCreate(TaskKeypad,  "Keypad",  128, NULL, 1, &taskKeypadHandle );
  xTaskCreate(TaskDisplay, "Display", 128, NULL, 1, &taskDisplayHandle);
}

void loop() {}  // using RTOS

/*****************************
 * Tasks
 *****************************/
/**
 * Serial processing
 *   read the serial input
 */
void TaskSerial(void *pvParameters) {
  (void)pvParameters;

  Serial.begin(SERIAL_BAUD_RATE);
  Serial.println("Ready!");

  //TODO: if serial open, read bytes and write to displayQueue
  int value = Serial.read();
  xQueueSendFromISR(displayQueue, &value, portMAX_DELAY);

  // int readValue=0;
  // for (;;){
  //   Serial.println("waiting!");
  //   // https://github.com/feilipu/Arduino_FreeRTOS_Library
  //   // https://github.com/feilipu/Arduino_FreeRTOS_Library/blob/fa5efea27574e0d6bb25ce4270e1f6a1dc1b11df/examples/TaskUtilities/TaskUtilities.ino
  //   // TODO: need to block thread until alive

  //   // if(xQueueReceive(eventQueue,&readValue,portMAX_DELAY) == pdPASS){
  //   //   if(pcLast == readValue) {
  //   //     // debounce and delay values
  //   //     vTaskDelay(500/portTICK_PERIOD_MS);
  //   //     continue;
  //   //   }
  //   //   pcLast = readValue;
  //   //   if (pcLast){
  //   //     Serial.print("PIN:");
  //   //     Serial.print(readValue);
  //   //     Serial.print(" cnt:");
  //   //     Serial.print(cnt++);
  //   //     Serial.println();
  //   //   }
  //   // }
  // }
}

/**
 * Keypad processing
 */

MatrixKeypad matrixKeypad(keypad_rows, keypad_cols, keypad_keyMap);
void TaskKeypad(void *pvParameters) {
  (void)pvParameters;

  matrixKeypad.init();

  int readValue = 0;
  for (;;) {
    vTaskDelay(KEYPAD_SCAN_PERIOD / portTICK_PERIOD_MS);
    int scanCode = matrixKeypad.readScan();
    
    //   Serial.println("waiting!");
    //   // https://github.com/feilipu/Arduino_FreeRTOS_Library
    //   // https://github.com/feilipu/Arduino_FreeRTOS_Library/blob/fa5efea27574e0d6bb25ce4270e1f6a1dc1b11df/examples/TaskUtilities/TaskUtilities.ino
    //   // TODO: need to block thread until alive

    //   // if(xQueueReceive(displayQueue,&readValue,portMAX_DELAY) == pdPASS){
    //   //   if(pcLast == readValue) {
    //   //     // debounce and delay values
    //   //     vTaskDelay(KEYPAD_SCAN_PERIOD/portTICK_PERIOD_MS);
    //   //     continue;
    //   //   }
    //   //   pcLast = readValue;
    //   //   if (pcLast){
    //   //     Serial.print("PIN:");
    //   //     Serial.print(readValue);
    //   //     Serial.print(" cnt:");
    //   //     Serial.print(cnt++);
    //   //     Serial.println();
    //   //   }
    //   // }
  }
}

//TODO: Read Serial and output to LCD
//TODO: Add escape codes for character postion
// https://learn.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences
// https://arduinogetstarted.com/tutorials/arduino-lcd-i2c
// https://arduinogetstarted.com/reference/library/arduino-lcd-library
// https://www.electronics-lab.com/project/using-20x4-i2c-character-lcd-display-with-arduino-uno/
// https://arduino.stackexchange.com/questions/4721/20x4-lcd-shows-alternating-blank-lines
// https://github.com/duinoWitchery/hd44780?ref=https://githubhelp.com
// ESC]X;Y <- postioning

/**
 * Display processing
 */
hd44780_I2Cexp lcd(0x27);
void TaskDisplay(void *pvParameters) {
  (void)pvParameters;

  int status = lcd.begin(LCD_DISPLAY_COLUMNS, LCD_DISPLAY_ROWS);
  if (status) {
    hd44780::fatalError(status);  // does not return
  }
  lcd.home();
  lcd.lineWrap();

  lcd.print("Ready!");

  int readValue = 0;
  for (;;) {
    if (xQueueReceive(displayQueue, &readValue, portMAX_DELAY) == pdPASS) {
      //TODO: read from queue.  if escape
      // if(pcLast == readValue) {
      //   // debounce and delay values
      //   vTaskDelay(500/portTICK_PERIOD_MS);
      //   continue;
      // }
      // pcLast = readValue;
      // if (pcLast){
      //   Serial.print("PIN:");
      //   Serial.print(readValue);
      //   Serial.print(" cnt:");
      //   Serial.print(cnt++);
      //   Serial.println();
      // }
    }
  }
}
