# ESP8266 Projects

WiFi-enabled projects using ESP8266 (NodeMCU) microcontroller.

## Projects

### LxiBridge
LXI Serial Bridge for test equipment. Provides LXI protocol support over WiFi.
- SCPI Raw Socket server (TCP port 5025)
- mDNS/DNS-SD service discovery
- Serial passthrough to instruments
- Web configuration interface
- Built using PlatformIO

### NetworkRelays/NetworkRelayController
WiFi/Ethernet relay controller using ESP8266 with ENC28J60 Ethernet module.

### SerialDetectBaudrate
Serial baud rate detection utility for debugging serial communication.

### WiFiManualWebServer
Simple HTTP server for GPIO control via web interface.
- Control GPIO2 via HTTP requests
- Read GPIO0 input state
- Displays connection status

## Build Environments

### Arduino IDE
Most projects use Arduino IDE with ESP8266 board support.
Board URL: `http://arduino.esp8266.com/stable/package_esp8266com_index.json`

### PlatformIO
LxiBridge uses PlatformIO for build management.

```bash
cd LxiBridge
pio run                    # Build
pio run --target upload    # Upload
pio device monitor         # Serial monitor
```

## Common Pin Configurations

### NodeMCU v2
| Function | GPIO |
|----------|------|
| LED_BUILTIN | GPIO2 |
| SPI MOSI | GPIO13 |
| SPI MISO | GPIO12 |
| SPI SCK | GPIO14 |
| SPI SS | GPIO16 |
