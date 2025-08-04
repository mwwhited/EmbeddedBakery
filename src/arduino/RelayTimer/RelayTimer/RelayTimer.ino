
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(A0, OUTPUT);
  pinMode(A1, OUTPUT);
  pinMode(A2, OUTPUT);
  pinMode(A3, OUTPUT);
}


int x = 0;

// the loop function runs over and over again forever
void loop() {

  
  digitalWrite(A0, x % 2 == 0 ?  HIGH : LOW);
  digitalWrite(A1, x % 3 == 0 ?  HIGH : LOW);
  digitalWrite(A2, x % 4 == 0 ?  HIGH : LOW);
  digitalWrite(A3, x % 5 == 0 ?  HIGH : LOW);
  delay(500);
  
  x++;
}
