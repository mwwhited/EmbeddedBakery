#include <etherShield.h>
#include <ETHER_28J60.h>
#define ON      HIGH
#define OFF     LOW

#define RELAY0  A0
#define RELAY1  A1
#define RELAY2  A2
#define RELAY3  A3
#define RELAY4  A4
#define RELAY5  A5
#define RELAY6  PD4
#define RELAY7  PD5

static uint8_t mac[6] = {0x54, 0x55, 0x58, 0x10, 0x00, 0x24};  
static uint8_t ip[4] = {192, 168, 1, 13}; 
static uint16_t port = 80; 

ETHER_28J60 client;

void setup() {
  client.setup(mac, ip, port);
  pinMode(RELAY0, OUTPUT);
  pinMode(RELAY1, OUTPUT);
  pinMode(RELAY2, OUTPUT);
  pinMode(RELAY3, OUTPUT);
  pinMode(RELAY4, OUTPUT);
  pinMode(RELAY5, OUTPUT);
  pinMode(RELAY6, OUTPUT);
  pinMode(RELAY7, OUTPUT);

  digitalWrite(RELAY0, HIGH);
  digitalWrite(RELAY1, HIGH);
  digitalWrite(RELAY2, HIGH);
  digitalWrite(RELAY3, HIGH);
  digitalWrite(RELAY4, HIGH);
  digitalWrite(RELAY5, HIGH);
  digitalWrite(RELAY6, HIGH);
  digitalWrite(RELAY7, HIGH);
}

byte values = 0;

void loop() {
  char* params;
  if (params = client.serviceRequest()) {    
    // custom buttons
    client.print("<h2>SFE Ethernet Relay Control</h2></br>");

    // client.print("<input type=submit value='RELAY0 ON' href='/?R0=ON'>&nbsp;");
    // client.print("<input type=submit value='RELAY0 OFF' href='/?R0=OFF'><br/>");
    if (strcmp(params, "?R0=ON") == 0) {
      digitalWrite(RELAY0, ON);
    } else if (strcmp(params, "?R0=OFF") == 0) {
      digitalWrite(RELAY0, OFF);
    } 
    
    // client.print("<input type=submit value='RELAY1 ON' href='/?R1=ON'>&nbsp;");
    // client.print("<input type=submit value='RELAY1 OFF' href='/?R1=OFF'><br/>");
    if (strcmp(params, "?R1=ON") == 0) {
      digitalWrite(RELAY1, ON);
    } else if (strcmp(params, "?R1=OFF") == 0) {
      digitalWrite(RELAY1, OFF);
    } 
    
    // client.print("<input type=submit value='RELAY2 ON' href='/?R2=ON'>&nbsp;");
    // client.print("<input type=submit value='RELAY2 OFF' href='/?R2=OFF'><br/>");
    if (strcmp(params, "?R2=ON") == 0) {
      digitalWrite(RELAY2, ON);
    } else if (strcmp(params, "?R2=OFF") == 0) {
      digitalWrite(RELAY2, OFF);
    } 
    
    // client.print("<input type=submit value='RELAY3 ON' href='/?R3=ON'>&nbsp;");
    // client.print("<input type=submit value='RELAY3 OFF' href='/?R3=OFF'><br/>");
    if (strcmp(params, "?R3=ON") == 0) {
      digitalWrite(RELAY3, ON);
    } else if (strcmp(params, "?R3=OFF") == 0) {
      digitalWrite(RELAY3, OFF);
    }  
    
    // client.print("<input type=submit value='RELAY4 ON' href='/?R4=ON'>&nbsp;");
    // client.print("<input type=submit value='RELAY4 OFF' href='/?R4=OFF'><br/>");
    if (strcmp(params, "?R4=ON") == 0) {
      digitalWrite(RELAY4, ON);
    } else if (strcmp(params, "?R4=OFF") == 0) {
      digitalWrite(RELAY4, OFF);
    } 
    
    // client.print("<input type=submit value='RELAY5 ON' href='/?R5=ON'>&nbsp;");
    // client.print("<input type=submit value='RELAY5 OFF' href='/?R5=OFF'><br/>");
    if (strcmp(params, "?R5=ON") == 0) {
      digitalWrite(RELAY5, ON);
    } else if (strcmp(params, "?R5=OFF") == 0) {
      digitalWrite(RELAY5, OFF);
    } 
    
    // client.print("<input type=submit value='RELAY6 ON' href='/?R6=ON'>&nbsp;");
    // client.print("<input type=submit value='RELAY6 OFF' href='/?R6=OFF'><br/>");
    if (strcmp(params, "?R6=ON") == 0) {
      digitalWrite(RELAY6, ON);
    } else if (strcmp(params, "?R6=OFF") == 0) {
      digitalWrite(RELAY6, OFF);
    } 
    
    // client.print("<input type=submit value='RELAY7 ON' href='/?R7=ON'>&nbsp;");
    // client.print("<input type=submit value='RELAY7 OFF' href='/?R7=OFF'><br/>");
    if (strcmp(params, "?R7=ON") == 0) {
      digitalWrite(RELAY7, ON);
    } else if (strcmp(params, "?R7=OFF") == 0) {
      digitalWrite(RELAY7, OFF);
    } 

    client.respond();
  }
  
}
