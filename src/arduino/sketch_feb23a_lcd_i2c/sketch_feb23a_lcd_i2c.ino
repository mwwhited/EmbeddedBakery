#include <Wire.h>


// P0 => Rs
// P1 => R/W
// P2 => En
// P3 => LED Control
// P4 => D4
// P5 => D5
// P6 => D6
// P7 => D7
// P
//       A  => LED+
//       K  => LED- 

// P7 => D7
// P3?
#define Backlight       B00001000  // Backlight Control    :: P3
#define Enable          B00000100  // Enable bit           :: P2
#define ReadWrite       B00000010  // Read/Write bit       :: P1
#define RegisterSelect  B00000001  // Register select bit  :: P0

#define CHARACTERS  20
#define LINES       4
#define I2C_ADDRESS 0x27

void setup() {
  
  Wire.begin();

  // SEE PAGE 45/46 FOR INITIALIZATION SPECIFICATION!
  // according to datasheet, we need at least 40ms after power rises above 2.7V
  // before sending commands. Arduino can turn on way befer 4.5V so we'll wait 50
  Wire.beginTransmission(LCD_ADDRESS);
  Wire.write(0x00); // reset
  Wire.endTransmission();    
  delay(50); 
                                          
  // Now we pull both RS and R/W low to begin commands
  write4bits(Backlight);  
  delay(1000);  

  //put the LCD into 4 bit mode
  // this is according to the hitachi HD44780 datasheet
  // figure 24, pg 46

  // we start in 8bit mode, try to set 4 bit mode
  write4bits(0x30);
  delayMicroseconds(4500); // wait min 4.1ms
  
  // second try
  write4bits(0x30);
  delayMicroseconds(4500); // wait min 4.1ms
   
  // third go!
  write4bits(0x30); 
  delayMicroseconds(150);
  
  // finally, set to 4-bit interface
  write4bits(0x20); 
  
}

void write4bits(uint8_t value) {
  Wire.beginTransmission(_Addr);
  Wire.write((int)(value) | _backlightval);
  Wire.endTransmission();  

   // En high
  Wire.beginTransmission(_Addr);
  Wire.write((int)(value) | _backlightval | En);
  Wire.endTransmission();  
  delayMicroseconds(1);   // enable pulse must be >450ns
  
  // En low
  Wire.write(((int)(value) | _backlightval) & ~En);
  delayMicroseconds(50);    // commands need > 37us to settle
}



void loop() {
  // put your main code here, to run repeatedly:

  clear();
  for(int i = 0;; i++) {
    write(i);
    delay(10);
  }
}

// =======================================================================
// https://github.com/johnrickman/LiquidCrystal_I2C/blob/master/LiquidCrystal_I2C.cpp


// Pin out

void init_lcd() {
  


  
  _displayfunction = LCD_4BITMODE | LCD_5x8DOTS | LCD_2LINE; // 0x00 | 0x00 | 0x08; 
  _numlines = _rows;
  
  
  // set # lines, font size, etc.
  send(LCD_FUNCTIONSET | _displayfunction, 0);  
  
  // turn the display on with no cursor or blinking default
  _displaycontrol = LCD_DISPLAYON | LCD_CURSOROFF | LCD_BLINKOFF; // 0x04 | 0x00 | 0x00
  
  send(LCD_DISPLAYCONTROL | _displaycontrol, 0);
  
  // clear it off
  clear();

  // Initialize to default text direction (for roman languages)
  _displaymode = LCD_ENTRYLEFT | LCD_ENTRYSHIFTDECREMENT;
  
  // set the entry mode
  send(LCD_ENTRYMODESET | _displaymode, 0);
    
  send(LCD_RETURNHOME, 0);  // set cursor position to zero
  delayMicroseconds(2000);  // this command takes a long time!
}
void clear(){
  send(LCD_CLEARDISPLAY, 0);// clear display, set cursor position to zero
  delayMicroseconds(2000);  // this command takes a long time!
}


void backlight() {
  _backlightval=LCD_BACKLIGHT;
  expanderWrite(0);
}

void send(uint8_t value, uint8_t mode) {
  uint8_t highnib=value&0xf0;
  uint8_t lownib=(value<<4)&0xf0;
  write4bits((highnib)|mode);
  write4bits((lownib)|mode); 
  //expanderWrite(value | mode);
}
void write(uint8_t value) {
  send(value, Rs); // B00000001  // Register select bit
}

void expanderWrite(uint8_t _data){                                        
  Wire.beginTransmission(_Addr);
  Wire.write((int)(_data) | _backlightval);
  Wire.endTransmission();   
}
void pulseEnable(uint8_t _data){
  expanderWrite(_data | En);  // En high
  delayMicroseconds(1);   // enable pulse must be >450ns
  
  expanderWrite(_data & ~En); // En low
  delayMicroseconds(50);    // commands need > 37us to settle
} 
