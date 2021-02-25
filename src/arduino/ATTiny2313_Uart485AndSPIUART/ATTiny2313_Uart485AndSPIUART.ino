/*  
                ATiny2313
  Reset,17,PA2 -| 1 V 20|- Vcc
  RXD  ,00,PD0 -1 2   19|- PB7,PCINT7,16,SCK/SCL
  TXD  ,01,PD1 -| 3   18|- PB6,PCINT6,15,MISO
  XTAL2,02,PA1 -| 4   17|- PB5,PCINT5,14,MOSI/SDA
  XTAL1,03,PA0 -| 5   16|- PB4,PCINT4,13,OC1B
  INT0 ,04,PD2 -| 6   15|- PB3,PCINT3,12,OC1A
  INIT1,05,PD3 -| 7   14|- PB2,PCINT2,11,OC0A
       ,06,PD4 -| 8   13|- PB1,PCINT1,10
       ,07,PD5 -| 9   12|- PB0.PCINT0,09
       ,  ,GND -|10   11|- PD6,      ,08
 */
 
 #include <tinySPI.h>

  #define LED 4

  #define DIRECTION 2
  #define RS485_READ digitalWrite(DIRECTION, LOW)
  #define RS485_WRITE digitalWrite(DIRECTION, HIGH)  
  #define H4N SPI 
  #define RS485 Serial
  #define OFFSET 250;


void setup() {
    H4N.begin();
    
    RS485.begin(9600);
    pinMode(DIRECTION, OUTPUT);
    
    pinMode(LED, OUTPUT);
}

int scheduled = 0;
void loop() {
  RS485_READ;
  WatchDog();
    
  if (RS485.available() > 0) {
    byte rsRxBuffer[] = {0x00,0x00};
    RS486.readBytes(rsRxBuffer, 2);
    scheduled = millis() + OFFSET;
    SendMessage(rsRxBuffer, 2);
  }
  
  if (scheduled && scheduled <= millis()) {      
    scheduled = 0x00;
    byte rsRxBuffer[] = {0x80,0x00};
    SendMessage(rsRxBuffer, 2);
  }
/*    
    if (H4N.available() > 0) {
      RS485_WRITE;
      RS485.write(H4N.read());
      RS485_READ;
    }
  */
}

byte[] ReadMessage() {
  RS485_WRITE;
  delay(10);
  RS485.write({0x65,0x66}, 2); // /*H4N.read()*/);
  delay(10);
  RS485_READ;
}

void SendMessage(byte[] message, int len) {
  //H4N.write(message, len); //This should be SPI
}

#define period (1000)
unsigned long time_now = 0;
bool set = 0;
void WatchDog() {
  if (millis() > time_now + period) {
    time_now = millis();
    set = !set;
    digitalWrite(LED, set);
  }
}
