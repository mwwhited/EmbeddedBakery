

/*
This board has 2 RGB LED, 3 switches, 3 buttons and 6 pots

| Device   | Pin      
|----------|     
| Button 0 | Digital 02    
| Button 1 | Digital 04   
| Button 2 | Digital 07   
| Switch 0 | Digital 08   
| Switch 1 | Digital 12   
| Switch 2 | Digital 13   
| LED 0 R  | Digital 09  
| LED 0 G  | Digital 10  
| LED 0 B  | Digital 11  
| LED 1 R  | Digital 06  
| LED 1 G  | Digital 05  
| LED 1 B  | Digital 03  
| POT 0    | Analog 0
| POT 1    | Analog 1
| POT 2    | Analog 2
| POT 3    | Analog 3
| POT 4    | Analog 4
| POT 5    | Analog 5
| POT 6    | Analog 6
*/

uint8_t buttons[3] = { 2, 4, 7 };
uint8_t switches[3] = { 8, 12, 13 };
uint8_t led0[3] = { 9, 10, 11 };
uint8_t led1[3] = { 6, 5, 3 };
uint8_t pot[6] = { A0, A1, A2, A3, A4, A5 };


void setup() {

  // put your setup code here, to run once:
  Serial.begin(9600);

  for (uint8_t x = 0; x < 3; x++) {
    pinMode(buttons[x], INPUT);
    pinMode(switches[x], INPUT);
    pinMode(led0[x], OUTPUT);
    pinMode(led1[x], OUTPUT);
  }
}

void loop() {
  // put your main code here, to run repeatedly:

  uint8_t btn = 0;
  uint8_t swt = 0;

  for (uint8_t x = 0; x < 3; x++) {
    btn |= (digitalRead(buttons[x]) << x);
    swt |= (digitalRead(switches[x]) << x);

    analogWrite(led0[x], analogRead(pot[x])>>2);
    analogWrite(led1[x], analogRead(pot[x + 3])>>2);
  }

  Serial.print(btn, HEX);
  Serial.print(" ");
  Serial.print(swt, HEX);
  Serial.println();
}
