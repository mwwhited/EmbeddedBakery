const int servo1Pin = 3;
const int ledPin = 13;

void setup() {
  // put your setup code here, to run once:
  pinMode(servo1Pin, OUTPUT);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  analogWrite(servo1Pin, 0);
  analogWrite(ledPin, 0);
  delay(1000);
  analogWrite(servo1Pin, 127);
  analogWrite(ledPin, 127);
  delay(1000);
  analogWrite(servo1Pin, 255);
  analogWrite(ledPin, 255);
  delay(1000);

}
