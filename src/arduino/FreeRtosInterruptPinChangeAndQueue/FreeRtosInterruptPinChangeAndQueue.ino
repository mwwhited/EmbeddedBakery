
#include <Arduino_FreeRTOS.h>
#include <queue.h>

/* Notes
 * https://www.freertos.org/Embedded-RTOS-Queues.html
 * https://www.tutorialspoint.com/arduino/arduino_interrupts.htm
 * https://www.freertos.org/a00116.html
 */

/*****************************
 * Setup
 *****************************/
#define BUTTON1 2
#define BUTTON2 4
#define BUTTON3 7
#define SERIAL_BAUD 9600
#define PORTD_MASK B10010100

/*****************************
 * Configure Handlers 
 *****************************/
QueueHandle_t eventQueue;
TaskHandle_t serialHandler;
TaskHandle_t blinkHandler;

// Declare Task Functions
void TaskSerial(void *pvParameters);

void setup() {
  // put your setup code here, to run once:
  
  Serial.begin(SERIAL_BAUD);  
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB, on LEONARDO, MICRO, YUN, and other 32u4 based boards.
  }
  Serial.println("init!");  
  
  eventQueue=xQueueCreate(10, sizeof(int)); 
  
  if(eventQueue!=NULL){
    // Configure Tasks  
    xTaskCreate(TaskSerial, "PrintSerial", 128, NULL, 1, &serialHandler);    
    xTaskCreate(TaskBlink, "Blink", 128, NULL, 2, &blinkHandler);
  }
    
  //Configure Interrupts  
  
  pinMode(BUTTON1, INPUT);
  pinMode(BUTTON2, INPUT);
  pinMode(BUTTON3, INPUT);

  // Use pin change detection
  PCICR  |= B00000100; //Pin Change Interrupt port D
  PCMSK2 |= PORTD_MASK; //Pin 7,3,2 on port D
}

void loop() {} // ignore this, handled by tasks

/*****************************
 * ISR Functions
 *****************************/
ISR(PCINT2_vect){
  //this is reading all pins on portd that are part of the pin change mask
  int btn = PIND & PORTD_MASK;
  xQueueSendFromISR(eventQueue, &btn, portMAX_DELAY);
}

/*****************************
 * Tasks
 *****************************/
 /**
 * Serial task.
 * Prints the received items from the queue to the serial monitor.
 */
int cnt=0;
int pcLast=0;
void TaskSerial(void *pvParameters){
  (void) pvParameters;

  Serial.println("ready!");  
  int readValue=0;
  for (;;){    
    Serial.println("waiting!");
    if(xQueueReceive(eventQueue,&readValue,portMAX_DELAY) == pdPASS){

      if(pcLast == readValue) {
        // debounce and delay values
        vTaskDelay(500/portTICK_PERIOD_MS);
        continue;
      }

      pcLast = readValue;
      if (pcLast){
        Serial.print("PIN:");
        Serial.print(readValue);
        Serial.print(" cnt:");
        Serial.print(cnt++);
        Serial.println();
      }
    }
  }
}

void TaskBlink(void *pvParameters)  
{
  (void) pvParameters;
  pinMode(LED_BUILTIN, OUTPUT);
  for (;;) // A Task shall never return or exit.
  {
    //Serial.println(11);
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    vTaskDelay( 1000 / portTICK_PERIOD_MS ); // wait for one second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    vTaskDelay( 1000 / portTICK_PERIOD_MS ); // wait for one second
  }
}