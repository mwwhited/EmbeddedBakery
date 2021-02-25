#include <Wire.h>
#include <LiquidCrystal_I2C.h>


#define CHARACTER 20
#define LINE 4
#define LCDADDRESS 0x27

LiquidCrystal_I2C lcd(LCDADDRESS, CHARACTER, LINE);

int cnt, line;
char tmp;

void setup() {
  lcd.init();
  lcd.backlight();
  Serial.begin(9600);
}

int sent = 0;

void loop() {

  if (sent == 0){
    lcd.clear();
    for(int i = 0;; i++) {
      lcd.write(i);
     // delay(2);
    }
    sent = 1;
  }
  
  if(Serial.available() ){
    delay(100);
    lcd.clear();
    cnt = line = 0;
    while(Serial.available() > 0) {
      cnt++;
      if(line > LINE-1) {
        Serial.println("Opps....");
        break;
      }
      if(cnt > CHARACTER) {
        cnt = 0;
        line++;
        lcd.setCursor(0, line);
        Serial.println("");
      }
      tmp = Serial.read();
      lcd.write(tmp);
      Serial.print(tmp);
    }
    Serial.println("");
  } else {
   //   lcd.write("abc123ABC123");
  }
}
