#ifndef CONFIG_H
#define CONFIG_H

// WiFi Configuration
// Set your WiFi credentials here or use WiFiManager
#define WIFI_SSID "YOUR_SSID"
#define WIFI_PASSWORD "YOUR_PASSWORD"

// LXI Configuration
#ifndef LXI_PORT
#define LXI_PORT 5025  // Standard SCPI raw socket port
#endif

#ifndef DEVICE_NAME
#define DEVICE_NAME "LxiBridge"
#endif

// Device identification (returned by *IDN? query)
#define MANUFACTURER "DIY"
#define MODEL "LXI-Serial-Bridge"
#define SERIAL_NUMBER "00001"
#define FIRMWARE_VERSION "1.0.0"

// Serial Bridge Configuration
#ifndef SERIAL_BAUD
#define SERIAL_BAUD 115200
#endif

// Serial timeout for responses (milliseconds)
#define SERIAL_TIMEOUT_MS 1000

// Maximum command/response buffer size
#define BUFFER_SIZE 1024

// TCP Server Configuration
#define MAX_CLIENTS 4

// mDNS Service Configuration
#define MDNS_SERVICE_TYPE "lxi"
#define MDNS_SERVICE_PROTOCOL "tcp"

// Web Server Configuration
#define WEB_PORT 80

// LED Configuration (for status indication)
#define STATUS_LED LED_BUILTIN
#define LED_ON LOW   // Most ESP8266 boards have inverted LED
#define LED_OFF HIGH

// Debug Configuration
#define DEBUG_ENABLED 1
#if DEBUG_ENABLED
#define DEBUG_PRINT(x) Serial.print(x)
#define DEBUG_PRINTLN(x) Serial.println(x)
#else
#define DEBUG_PRINT(x)
#define DEBUG_PRINTLN(x)
#endif

#endif // CONFIG_H
