# Network Relay Controller

## Summary

## Required Devices

* [Nodemcu ESP8266](https://www.nodemcu.com/index_en.html)
* [ENC28J60](https://www.microchip.com/en-us/product/ENC28J60)
* [Sainsmart 8 Relay Module](https://www.sainsmart.com/products/8-channel-5v-relay-module)


## Pinouts 

AsyncHTTPRequest_Generic/examples/AsyncHTTPRequest_ESP8266_Ethernet/AsyncHTTPRequest_ESP8266_Ethernet.ino

Line 65 in e3dd512

 #define CSPIN       16      // 5 
W5x00/ENC28J60 Ethernet	<--->	ESP8266
MOSI	                  <--->	MOSI = GPIO13
MISO	                  <--->	MISO = GPIO12
SCK	                    <--->	SCK = GPIO14
SS	                    <--->	GPIO16
GND	                    <--->	GND
VCC	                    <--->	+3.3V

## Notes and References

* https://github.com/ESP32DE/esp_enc28j60
* https://esp8266hints.wordpress.com/2016/06/09/compiling-ciceros-esp-enc28j60-package-on-linux/
* https://github.com/MetalPhreak/ESP8266_SPI_Driver
* https://www.esp8266.com/viewforum.php?f=34&sid=cd5a2e06f4567c5293795af3709402e7
* https://www.esp8266.com/viewtopic.php?f=34&t=376
* https://github.com/khoih-prog/AsyncHTTPRequest_Generic#use-arduino-library-manager