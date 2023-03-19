/*************************************************** 
  This is an example for our Adafruit 16-channel PWM & Servo driver
  Servo test - this will drive 16 servos, one after the other

  Pick one up today in the adafruit shop!
  ------> http://www.adafruit.com/products/815

  These displays use I2C to communicate, 2 pins are required to  
  interface. For Arduino UNOs, thats SCL -> Analog 5, SDA -> Analog 4

  Adafruit invests time and resources providing this open source code, 
  please support Adafruit and open-source hardware by purchasing 
  products from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.  
  BSD license, all text above must be included in any redistribution
 ****************************************************/

#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>

// called this way, it uses the default address 0x40
Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver();
// you can also call it with a different address you want
//Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver(0x41);

// Depending on your servo make, the pulse width min and max may vary, you 
// want these to be as small/large as possible without hitting the hard stop
// for max range. You'll have to tweak them as necessary to match the servos you
// have!
#define SERVOMIN  150 // this is the 'minimum' pulse length count (out of 4096)
#define SERVOMAX  600 // this is the 'maximum' pulse length count (out of 4096)

// our servo # counter
#define SERVONUMMIN  0 // this is the 'maximum' pulse length count (out of 4096)
#define SERVONUMMAX  7 // this is the 'maximum' pulse length count (out of 4096)

#define LeftBackHip 0
#define LeftFrontHip 1
#define RightBackHip 2
#define RightFrontHip 3

#define LeftBackKnee 4
#define LeftFrontKnee 5
#define RightBackKnee 6
#define RightFrontKnee 7

int pulseLenCenter = ((SERVOMAX - SERVOMIN) / 2) + SERVOMIN;

void setup() {
  Serial.begin(9600);
  Serial.println("16 channel Servo test!");

  pwm.begin();
  
  pwm.setPWMFreq(60);  // Analog servos run at ~60 Hz updates
  
  parkServos();
  delay(500);
  stand();
}

void loop() {
  stand();
  delay(1000);
  
  forward();
  delay(1000);
}

// you can use this function if you'd like to set the pulse length in seconds
// e.g. setServoPulse(0, 0.001) is a ~1 millisecond pulse width. its not precise!
void setServoPulse(uint8_t n, double pulse) {
  double pulselength;
  
  pulselength = 1000000;   // 1,000,000 us per second
  pulselength /= 60;   // 60 Hz
  Serial.print(pulselength); Serial.println(" us per period"); 
  pulselength /= 4096;  // 12 bits of resolution
  Serial.print(pulselength); Serial.println(" us per bit"); 
  pulse *= 1000;
  pulse /= pulselength;
  Serial.println(pulse);
  pwm.setPWM(n, 0, pulse);
}

void servoTest() {
  uint8_t servonum = SERVONUMMIN;

  // Drive each servo one at a time
  Serial.println(servonum);
  for (uint16_t pulselen = SERVOMIN; pulselen < SERVOMAX; pulselen++) {
    pwm.setPWM(servonum, 0, pulselen);
  }
  delay(500);
  for (uint16_t pulselen = SERVOMAX; pulselen > SERVOMIN; pulselen--) {
    pwm.setPWM(servonum, 0, pulselen);
  }
  delay(500);

  pwm.setPWM(servonum, 0, pulseLenCenter);

  servonum ++;
  if (servonum > SERVONUMMAX) servonum = SERVONUMMIN;
}

void resetServos() {
  parkServos();
  for (uint16_t servo = SERVONUMMIN; servo <= SERVONUMMAX; servo++) {
    pwm.setPWM(servo, 0, SERVONUMMIN);
    delay(300);
    pwm.setPWM(servo, 0, SERVONUMMAX);
    delay(300);
    pwm.setPWM(servo, 0, pulseLenCenter);
    delay(300);
  }
}

void parkServos() {
  for (uint16_t servo = SERVONUMMIN; servo <= SERVONUMMAX; servo++) {
    pwm.setPWM(servo, 0, pulseLenCenter);
    delay(100);
  }
}

void laydown() {
  pwm.setPWM(LeftBackHip, 0, pulseLenCenter);
  pwm.setPWM(LeftFrontHip, 0, pulseLenCenter);
  pwm.setPWM(RightBackHip, 0, pulseLenCenter);
  pwm.setPWM(RightFrontHip, 0, pulseLenCenter);

  pwm.setPWM(LeftBackKnee, 0, pulseLenCenter);
  pwm.setPWM(LeftFrontKnee, 0, pulseLenCenter);
  pwm.setPWM(RightBackKnee, 0, pulseLenCenter);
  pwm.setPWM(RightFrontKnee, 0, pulseLenCenter);  
}

void playdead() {
  pwm.setPWM(LeftBackHip, 0, pulseLenCenter);
  pwm.setPWM(LeftFrontHip, 0, pulseLenCenter);
  pwm.setPWM(RightBackHip, 0, pulseLenCenter);
  pwm.setPWM(RightFrontHip, 0, pulseLenCenter);

  pwm.setPWM(LeftBackKnee, 0, 210);
  pwm.setPWM(LeftFrontKnee, 0, 210);
  pwm.setPWM(RightBackKnee, 0, 580);
  pwm.setPWM(RightFrontKnee, 0, 580);  
}

void stand() {
  pwm.setPWM(LeftBackHip, 0, pulseLenCenter);
  pwm.setPWM(LeftFrontHip, 0, pulseLenCenter);
  pwm.setPWM(RightBackHip, 0, pulseLenCenter);
  pwm.setPWM(RightFrontHip, 0, pulseLenCenter);

  pwm.setPWM(LeftBackKnee, 0, 580);
  pwm.setPWM(LeftFrontKnee, 0, 580);
  pwm.setPWM(RightBackKnee, 0, 210);
  pwm.setPWM(RightFrontKnee, 0, 210);  
}

void forward() {
  pwm.setPWM(LeftBackHip, 0, pulseLenCenter);
  pwm.setPWM(LeftFrontHip, 0, pulseLenCenter);
  pwm.setPWM(RightBackHip, 0, pulseLenCenter);
  pwm.setPWM(RightFrontHip, 0, pulseLenCenter);

  pwm.setPWM(LeftBackKnee, 0, 580);
  pwm.setPWM(LeftFrontKnee, 0, 580);
  pwm.setPWM(RightBackKnee, 0, 210);
  pwm.setPWM(RightFrontKnee, 0, 210);  
  
  delay(300);
  
  pwm.setPWM(LeftFrontKnee, 0, 400);
  pwm.setPWM(LeftFrontHip, 0, 300);
  delay(500);
  
  pwm.setPWM(RightFrontKnee, 0, 300);
  pwm.setPWM(RightFrontHip, 0, 200);
  delay(500);
}
