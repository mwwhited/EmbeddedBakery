
int red_led = 9;
int green_led = 10;
int blue_led = 11;

int delay_time = 1;
int step = 5;

// the setup function runs once when you press reset or power the board
void setup() {
  pinMode(red_led, OUTPUT);
  pinMode(green_led, OUTPUT);
  pinMode(blue_led, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {

  for(int r=0; r<255; r+=step){    
    for(int g=0; g<255; g+=step){      
      for(int b=0; b<255; b+=step){
        
        analogWrite(red_led,255- r);
        analogWrite(green_led, 255- g);
        analogWrite(blue_led,255-  b);
        delay(delay_time);
      }
    }
  }
}
