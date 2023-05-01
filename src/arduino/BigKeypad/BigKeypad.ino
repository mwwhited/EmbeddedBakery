#include <LiquidCrystal_I2C.h>
//#include <Keyboard.h>

/*
see readme for pin outs
*/

int cols[] = { A3, A2, A1, A0 };
int rows[] = { 0, 1, 4, 5, 6, 7, 8, 9, 15, 14, 16, 10 };

char keyMap[] = ">v<~_098\\POI/^LKMNBV7654UYTRJHGF++++ZQA1XWS2CED3";

LiquidCrystal_I2C lcd(0x27, 20, 4);  // I2C address 0x27, 16 column and 2 rows

//#define DEBUG 1

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //Keyboard.begin();

  // while (!Serial) {
  // }
  Serial.println("Ready!");

  // https://arduinogetstarted.com/tutorials/arduino-lcd-i2c
  lcd.init();       //initialize the lcd
  lcd.backlight();  //open the backlight
  lcd.noBlink();
  lcd.noCursor();
  //lcd.lineWrap(); :(
  lcd.home();
  lcd.clear();
  lcd.print("Ready!");
  lcd.setCursor(0,1);
  lcd.print("1111");
  lcd.setCursor(0,2);
  lcd.print("2222");
  lcd.setCursor(0,3);
  lcd.print("3333");

  for (int i = 0; i < 4; i++) {
    pinMode(cols[i], OUTPUT);
    digitalWrite(cols[i], 1);
  }

  for (int i = 0; i < 12; i++) {
    pinMode(rows[i], INPUT_PULLUP);
  }
  
}

long last[] = { 0xFFF, 0xFFF, 0xFFF, 0xFFF };
long colIndex = 0;

void loop() { 

//}  void loopXX() {
  // put your main code here, to run repeatedly:

  colIndex = setColumn(colIndex);
  long read = readRow();
  if (read != last[colIndex]) {
    last[colIndex] = read;
    int ret = simpler(colIndex, read);

#ifdef DEBUG
    Serial.print("b");
    Serial.print(ret, BIN);
    // Serial.print(" o");
    // Serial.print(ret, OCT);
    // Serial.print(" h");
    // Serial.print(ret, HEX);
    Serial.print(" d");
    Serial.print(ret);
    Serial.print(" a");
    Serial.print(keyMap[ret & 0x7f]);

    Serial.println();
#endif

    if (ret) {
      if (keyMap[ret & 0x7f] == '\\') {
        lcd.home();
        Serial.println();
      } else {
        char key = keyMap[ret & 0x7f];
        Serial.print(key);
        lcd.print(key);    
        delay(100);
        // Keyboard.press(key);
      }
    }
  }
}

/*
10KKCCRR

MM  -> Keypad
CCC -> Column
RRR -> Row
*/
int simpler(int colVal, long rowVal) {
  for (int i = 0; i < 3; i++) {
    int n = nibble(rowVal >> (4 * i));
    if (n) {
      long ret = 0b10000000;
      ret |= (n & 0b0011);
      ret |= (colVal << 2);
      ret |= ((long)i) << 4;
      return ret;
    }
  }

  return 0;
}

/*
KKCCCRRR

MM  -> Keypad
CCC -> Column
RRR -> Row
*/
int simple(int colVal, long rowVal) {
  for (int i = 0; i < 3; i++) {
    int n = nibble(rowVal >> (4 * i));
    if (n) {
      long ret = 0;
      ret |= (n);
      ret |= (colVal << 3);
      ret |= ((long)i) << 6;
      return ret;
    }
  }

  return 0;
}

int nibble(int val) {
  switch (val & 0x0f) {
    case 0b1110: return 0b0100;
    case 0b1101: return 0b0101;
    case 0b1011: return 0b0110;
    case 0b0111: return 0b0111;
    default: return 0b0000;
  }
}

int setColumn(int colVal) {
  for (int i = 0; i < 4; i++) {
    digitalWrite(cols[i], colVal == i ? 0 : 1);
  }
  return (colVal + 1) % 4;
}

long readRow() {
  long outValue = 0;
  for (int i = 0; i < 12; i++) {
    outValue |= (digitalRead(rows[i]) << i);
  }
  return outValue;
}
