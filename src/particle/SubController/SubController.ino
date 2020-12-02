// This #include statement was automatically added by the Spark IDE.
#include "BinaryLed.h"

// This #include statement was automatically added by the Spark IDE.
#include "MessagePacket.h"

// This #include statement was automatically added by the Spark IDE.
#include "Motor.h"

//https://github.com/spark/firmware/tree/master/inc

// telnet defaults to port 23
TCPServer server = TCPServer(23);
TCPClient client;

Motor leftMotor(D0,D1,A0);
Motor rightMotor(D2,D3,A1);
BinaryLed led(D7);// This one is the built-in tiny one to the right of the USB jack

void setup()
{
    leftMotor.Setup();
    rightMotor.Setup();
    led.Setup();
   
    // start listening for clients
    server.begin();
    
    // Make sure your Serial Terminal app is closed before powering your Core
    Serial.begin(9600);
}

void loop()
{
    
    if(Serial.available() > 0)
    {
        Serial.println();
        Serial.println("Sub Controller!");
        Serial.println(WiFi.localIP());
        Serial.println(WiFi.gatewayIP());
        Serial.println(WiFi.SSID());
        Serial.println();
        while(Serial.available() > 0 && Serial.read() >= 0);
    }
           
    if (client.connected()) {
        MessagePacket packet;
        
        while (MessagePacket::TryRead(client, packet)) {
            
            leftMotor.Set(packet.get_LeftForward(), packet.get_LeftSpeed());
            rightMotor.Set(packet.get_RightForward(), packet.get_RightSpeed());
            led.Set(packet.get_AButton());

            //Serial.print("L:> "); leftMotor.Debug(Serial);
            //Serial.print("R:> "); rightMotor.Debug(Serial);
            //Serial.print("U:> "); led.Debug(Serial);
            packet.Debug(Serial);
        }
    } else {
        // if no client is yet connected, check for a new connection
        client = server.available();
    }
}