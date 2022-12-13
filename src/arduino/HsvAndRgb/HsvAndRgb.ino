
int red_led = 9;
int green_led = 10;
int blue_led = 11;

int isHsv_switch = 7;

int delay_time = 1;
int step = 5;

int h_pot = A0;
int s_pot = A1;
int v_pot = A2;

int deadZone = 0;
int debug = 0;

struct ColorRgb {
  uint8_t red;
  uint8_t green;
  uint8_t blue;
};

double potMax = 255.0;

#define abs(x) ((x)>0?(x):-(x))

ColorRgb fromHsv(uint8_t h, uint8_t s, uint8_t v){

  double hDegree = (h / potMax) * 359.9;
  double sPercent = s / potMax;
  double vPercent = v / potMax;

  double c = vPercent * sPercent;
  double hPrime = hDegree / 60.0;

  int hMod = hPrime;
  hMod = hMod % 2;

  double x = c * (1 - abs(hMod - 1.0));
  double m = vPercent - c;

  ColorRgb result;

  if (debug){
    Serial.print("  hDegree= ");
    Serial.print(hDegree);
    Serial.print("  sPercent= ");
    Serial.print(sPercent);
    Serial.print("  vPercent= ");
    Serial.print(vPercent);
    
    Serial.print(" c= ");
    Serial.print(c);
    Serial.print(" hPrime= ");
    Serial.print(hPrime);
    Serial.print(" x= ");
    Serial.print(x);
    Serial.print(" m= ");
    Serial.print(m);
  }

       if (0.0 <= hPrime && hPrime < 1.0) result = {(byte)(c *255),(byte)(x *255),(byte)(0 *255)};
  else if (1.0 <= hPrime && hPrime < 2.0) result = {(byte)(x *255),(byte)(c *255),(byte)(0 *255)};
  
  else if (2.0 <= hPrime && hPrime < 3.0) result = {(byte)(0 *255),(byte)(c *255),(byte)(x *255)};
  else if (3.0 <= hPrime && hPrime < 4.0) result = {(byte)(0 *255),(byte)(x *255),(byte)(c *255)};
    
  else if (4.0 <= hPrime && hPrime < 5.0) result = {(byte)(x *255),(byte)(0 *255),(byte)(c *255)};
  else if (5.0 <= hPrime && hPrime < 6.0) result = {(byte)(c *255),(byte)(0 *255),(byte)(x *255)};

  else result = {0,0,0};

  return result;
}

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.

  pinMode(red_led, OUTPUT);
  pinMode(green_led, OUTPUT);
  pinMode(blue_led, OUTPUT);
  
  pinMode(isHsv_switch, INPUT);

  if (debug){
    Serial.begin(9600);
  }
}


// the loop function runs over and over again forever
void loop() {

  int isHsv = digitalRead(isHsv_switch);

  int h = analogRead(h_pot);
  int s = analogRead(s_pot);
  int v = analogRead(v_pot);

  if (deadZone == 0) {
    h = h >>2;
    s = s >>2;
    v = v >>2;
  }
  else {
    if (h < deadZone) h = 0;
    if (s < deadZone) s = 0;
    if (v < deadZone) v = 0;
  }

  ColorRgb rgb;
  
  if (isHsv)
    rgb = {h,s,v};
  else 
    rgb = fromHsv(h,s,v);
  
  analogWrite(red_led,255 - rgb.red);
  analogWrite(green_led, 255 - rgb.green);
  analogWrite(blue_led,255 -  rgb.blue);
  
  if (debug){
    Serial.print(" HSV ");
    Serial.print(h, HEX);
    Serial.print(" ");
    Serial.print(s, HEX);
    Serial.print(" ");
    Serial.print(v, HEX);  

    Serial.print(" RGB ");
    Serial.print(rgb.red, HEX);
    Serial.print(" ");
    Serial.print(rgb.green, HEX);
    Serial.print(" ");
    Serial.print(rgb.blue, HEX);
    Serial.println("");

    delay(100);
    }

}
