/* Servo motor with Arduino example code. Position and sweep. More info: https://www.makerguides.com/ */

// Include the servo library:
#include <Servo.h>

// Create a new servo object:
Servo myservo[8];

// Define the servo pin:
#define servoPin 9

int angle = 90;

void setup() {
  Serial.begin(9600);
  // Attach the Servo variable to a pin:
  myservo.attach(servoPin);
}

void loop() {
  // Tell the servo to go to a particular angle:
  myservo.write(angle);
  delay(500);

  Serial.println(angle, DEC);

  if(Serial.available()){
    int temp = Serial.parseInt();
    if (temp == 1) {
      angle = 0;      
    } else if (temp > 0) {
      angle = temp;
    }
  }

}