# WiFi Manual Web Server

Simple HTTP server for GPIO control.

## Description

Creates a web server that allows controlling GPIO2 via HTTP requests. Also displays GPIO0 input state.

## Hardware Requirements

- ESP8266 module (NodeMCU, ESP-12, etc.)

## WiFi Configuration

Update the following defines in the code:
```cpp
#define STASSID "your-ssid"
#define STAPSK "your-password"
```

## HTTP API

| URL | Action |
|-----|--------|
| `/gpio2/0` | Set GPIO2 LOW |
| `/gpio2/1` | Set GPIO2 HIGH |

## Response

Returns HTML page showing:
- Current GPIO2 state
- GPIO0 input state
- Links to toggle GPIO2

## Serial Output

- Baud rate: 115200
- Outputs IP address on connection
- Logs client requests
