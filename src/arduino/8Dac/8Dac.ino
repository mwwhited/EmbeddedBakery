#include <util/delay.h>

void setup() {
    DDRA = 0xFF;  // Set all PORTB pins as outputs
    DDRC = 0xFF;  // Set all PORTB pins as outputs
    DDRL = 0xFF;  // Set all PORTB pins as outputs
    DDRK = 0xFF;  // Set all PORTB pins as outputs
    pinMode(13, OUTPUT); 
}

int a,c,l,k;

void loop() {
    digitalWrite(13, HIGH);
    digitalWrite(13, LOW);
  for(int x = 0; x < 0xff; x++){
    PORTA = a = x;
    PORTC = c = x;
    PORTL = l = x;
    PORTK = k = x;
    //delayMicroseconds(10);
  }
  /*
  for(int x = 0xff; x > 0; x--){
    PORTA = a = c;
    PORTC = c = l;
    PORTL = l = k;
    PORTK = k = x;
    //delayMicroseconds(2);
  }
  */
    //delay(1);
    //_delay_us(0.0625);
    //delayMicroseconds(127);
}
