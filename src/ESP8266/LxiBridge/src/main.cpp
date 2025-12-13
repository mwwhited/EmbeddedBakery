/**
 * LXI Serial Bridge for ESP8266
 *
 * Provides LXI protocol support for serial-based test equipment.
 * Features:
 * - SCPI Raw Socket server (TCP port 5025)
 * - mDNS/DNS-SD service discovery
 * - Serial passthrough bridge
 * - Basic web interface for configuration
 * - Built-in IEEE 488.2 common command handling
 */

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>
#include <ESP8266WebServer.h>
#include <WiFiClient.h>
#include "config.h"

// TCP Server for LXI SCPI raw socket
WiFiServer lxiServer(LXI_PORT);
WiFiClient clients[MAX_CLIENTS];

// Web server for configuration
ESP8266WebServer webServer(WEB_PORT);

// Serial buffer for instrument communication
char serialBuffer[BUFFER_SIZE];
int serialBufferIndex = 0;

// Forward declarations
void handleRoot();
void handleIdentify();
void handleNotFound();
void processLxiClients();
void handleCommand(WiFiClient& client, const String& command);
String sendToInstrument(const String& command);
bool isLocalCommand(const String& command);
String handleLocalCommand(const String& command);
void setupMdns();
void blinkLed(int times, int delayMs);

void setup() {
    // Initialize status LED
    pinMode(STATUS_LED, OUTPUT);
    digitalWrite(STATUS_LED, LED_OFF);

    // Initialize serial for instrument communication
    Serial.begin(SERIAL_BAUD);
    Serial.setTimeout(SERIAL_TIMEOUT_MS);

    // Short delay for serial to stabilize
    delay(100);

    // Connect to WiFi
    WiFi.mode(WIFI_STA);
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

    // Wait for connection with LED blinking
    while (WiFi.status() != WL_CONNECTED) {
        digitalWrite(STATUS_LED, LED_ON);
        delay(250);
        digitalWrite(STATUS_LED, LED_OFF);
        delay(250);
    }

    // Connected - solid LED briefly
    digitalWrite(STATUS_LED, LED_ON);
    delay(1000);
    digitalWrite(STATUS_LED, LED_OFF);

    // Setup mDNS for LXI discovery
    setupMdns();

    // Setup web server
    webServer.on("/", handleRoot);
    webServer.on("/lxi/identification", handleIdentify);
    webServer.onNotFound(handleNotFound);
    webServer.begin();

    // Start LXI TCP server
    lxiServer.begin();
    lxiServer.setNoDelay(true);
}

void loop() {
    // Handle mDNS
    MDNS.update();

    // Handle web server requests
    webServer.handleClient();

    // Process LXI client connections
    processLxiClients();

    // Small yield for WiFi stack
    yield();
}

/**
 * Setup mDNS service for LXI discovery
 */
void setupMdns() {
    if (MDNS.begin(DEVICE_NAME)) {
        // Add LXI service for discovery
        MDNS.addService(MDNS_SERVICE_TYPE, MDNS_SERVICE_PROTOCOL, LXI_PORT);
        MDNS.addService("http", "tcp", WEB_PORT);

        // Add TXT records for LXI identification
        // Note: ESP8266 mDNS has limited TXT record support
    }
}

/**
 * Process incoming LXI client connections and data
 */
void processLxiClients() {
    // Check for new clients
    if (lxiServer.hasClient()) {
        // Find a free slot
        int freeSlot = -1;
        for (int i = 0; i < MAX_CLIENTS; i++) {
            if (!clients[i] || !clients[i].connected()) {
                if (clients[i]) {
                    clients[i].stop();
                }
                freeSlot = i;
                break;
            }
        }

        if (freeSlot >= 0) {
            clients[freeSlot] = lxiServer.accept();
            clients[freeSlot].setNoDelay(true);
        } else {
            // No free slots, reject connection
            WiFiClient rejected = lxiServer.accept();
            rejected.stop();
        }
    }

    // Process data from connected clients
    for (int i = 0; i < MAX_CLIENTS; i++) {
        if (clients[i] && clients[i].connected()) {
            if (clients[i].available()) {
                // Read command (SCPI commands are terminated with \n or \r\n)
                String command = clients[i].readStringUntil('\n');
                command.trim();

                if (command.length() > 0) {
                    // Blink LED to show activity
                    digitalWrite(STATUS_LED, LED_ON);

                    handleCommand(clients[i], command);

                    digitalWrite(STATUS_LED, LED_OFF);
                }
            }
        }
    }
}

/**
 * Handle an incoming SCPI command
 */
void handleCommand(WiFiClient& client, const String& command) {
    String response;

    // Check if this is a local command (handled by bridge)
    if (isLocalCommand(command)) {
        response = handleLocalCommand(command);
    } else {
        // Forward to instrument via serial
        response = sendToInstrument(command);
    }

    // Send response if command was a query
    if (command.indexOf('?') >= 0 && response.length() > 0) {
        client.println(response);
    }
}

/**
 * Check if command should be handled locally by the bridge
 */
bool isLocalCommand(const String& command) {
    String upperCmd = command;
    upperCmd.toUpperCase();

    // Handle *IDN? locally to identify the bridge
    // Other IEEE 488.2 common commands pass through to instrument
    if (upperCmd.startsWith("*IDN?")) {
        return true;
    }

    // Bridge-specific commands (optional namespace)
    if (upperCmd.startsWith("BRIDGE:") || upperCmd.startsWith("LXI:")) {
        return true;
    }

    return false;
}

/**
 * Handle commands meant for the bridge itself
 */
String handleLocalCommand(const String& command) {
    String upperCmd = command;
    upperCmd.toUpperCase();

    if (upperCmd.startsWith("*IDN?")) {
        // Return bridge identification
        return String(MANUFACTURER) + "," +
               String(MODEL) + "," +
               String(SERIAL_NUMBER) + "," +
               String(FIRMWARE_VERSION);
    }

    if (upperCmd == "BRIDGE:IP?" || upperCmd == "LXI:IP?") {
        return WiFi.localIP().toString();
    }

    if (upperCmd == "BRIDGE:MAC?" || upperCmd == "LXI:MAC?") {
        return WiFi.macAddress();
    }

    if (upperCmd == "BRIDGE:RSSI?" || upperCmd == "LXI:RSSI?") {
        return String(WiFi.RSSI());
    }

    if (upperCmd == "BRIDGE:PASSTHROUGH?" || upperCmd == "LXI:PASSTHROUGH?") {
        // Query instrument's *IDN? through serial
        return sendToInstrument("*IDN?");
    }

    return "";
}

/**
 * Send command to instrument via serial and get response
 */
String sendToInstrument(const String& command) {
    // Clear any pending data in serial buffer
    while (Serial.available()) {
        Serial.read();
    }

    // Send command to instrument
    Serial.println(command);
    Serial.flush();

    // If not a query, no response expected
    if (command.indexOf('?') < 0) {
        return "";
    }

    // Wait for response with timeout
    unsigned long startTime = millis();
    String response = "";

    while (millis() - startTime < SERIAL_TIMEOUT_MS) {
        if (Serial.available()) {
            char c = Serial.read();
            if (c == '\n' || c == '\r') {
                if (response.length() > 0) {
                    break;
                }
            } else {
                response += c;
            }
        }
        yield();
    }

    return response;
}

/**
 * Web server handler for root page
 */
void handleRoot() {
    String html = "<!DOCTYPE html><html><head>";
    html += "<title>LXI Serial Bridge</title>";
    html += "<meta name='viewport' content='width=device-width, initial-scale=1'>";
    html += "<style>";
    html += "body{font-family:Arial,sans-serif;margin:20px;background:#f0f0f0;}";
    html += ".container{max-width:600px;margin:0 auto;background:white;padding:20px;border-radius:8px;box-shadow:0 2px 4px rgba(0,0,0,0.1);}";
    html += "h1{color:#333;}";
    html += "table{width:100%;border-collapse:collapse;}";
    html += "td{padding:8px;border-bottom:1px solid #ddd;}";
    html += "td:first-child{font-weight:bold;width:40%;}";
    html += ".status{color:green;font-weight:bold;}";
    html += "</style></head><body>";
    html += "<div class='container'>";
    html += "<h1>LXI Serial Bridge</h1>";
    html += "<table>";
    html += "<tr><td>Status</td><td class='status'>Online</td></tr>";
    html += "<tr><td>Device Name</td><td>" + String(DEVICE_NAME) + "</td></tr>";
    html += "<tr><td>Manufacturer</td><td>" + String(MANUFACTURER) + "</td></tr>";
    html += "<tr><td>Model</td><td>" + String(MODEL) + "</td></tr>";
    html += "<tr><td>Serial Number</td><td>" + String(SERIAL_NUMBER) + "</td></tr>";
    html += "<tr><td>Firmware Version</td><td>" + String(FIRMWARE_VERSION) + "</td></tr>";
    html += "<tr><td>IP Address</td><td>" + WiFi.localIP().toString() + "</td></tr>";
    html += "<tr><td>MAC Address</td><td>" + WiFi.macAddress() + "</td></tr>";
    html += "<tr><td>RSSI</td><td>" + String(WiFi.RSSI()) + " dBm</td></tr>";
    html += "<tr><td>LXI Port</td><td>" + String(LXI_PORT) + "</td></tr>";
    html += "<tr><td>Serial Baud Rate</td><td>" + String(SERIAL_BAUD) + "</td></tr>";
    html += "</table>";
    html += "<h2>Usage</h2>";
    html += "<p>Connect to this device using any LXI-compatible software or SCPI client:</p>";
    html += "<ul>";
    html += "<li>TCPIP::" + WiFi.localIP().toString() + "::" + String(LXI_PORT) + "::SOCKET</li>";
    html += "<li>Or use raw TCP connection to port " + String(LXI_PORT) + "</li>";
    html += "</ul>";
    html += "<h2>Bridge Commands</h2>";
    html += "<ul>";
    html += "<li><code>BRIDGE:IP?</code> - Get bridge IP address</li>";
    html += "<li><code>BRIDGE:MAC?</code> - Get bridge MAC address</li>";
    html += "<li><code>BRIDGE:RSSI?</code> - Get WiFi signal strength</li>";
    html += "<li><code>BRIDGE:PASSTHROUGH?</code> - Get instrument *IDN?</li>";
    html += "</ul>";
    html += "</div></body></html>";

    webServer.send(200, "text/html", html);
}

/**
 * Web server handler for LXI identification (XML)
 */
void handleIdentify() {
    String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
    xml += "<LXIDevice xmlns=\"http://www.lxistandard.org/InstrumentIdentification/1.0\"";
    xml += " xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">";
    xml += "<Manufacturer>" + String(MANUFACTURER) + "</Manufacturer>";
    xml += "<Model>" + String(MODEL) + "</Model>";
    xml += "<SerialNumber>" + String(SERIAL_NUMBER) + "</SerialNumber>";
    xml += "<FirmwareRevision>" + String(FIRMWARE_VERSION) + "</FirmwareRevision>";
    xml += "<ManufacturerDescription>LXI to Serial Bridge for Test Equipment</ManufacturerDescription>";
    xml += "<HomepageURL>http://" + WiFi.localIP().toString() + "/</HomepageURL>";
    xml += "<Interface xsi:type=\"LXIInterface\" InterfaceType=\"LXI\" InterfaceName=\"LAN\">";
    xml += "<InstrumentAddressString>TCPIP::" + WiFi.localIP().toString() + "::" + String(LXI_PORT) + "::SOCKET</InstrumentAddressString>";
    xml += "</Interface>";
    xml += "</LXIDevice>";

    webServer.send(200, "application/xml", xml);
}

/**
 * Web server handler for 404
 */
void handleNotFound() {
    webServer.send(404, "text/plain", "Not Found");
}

/**
 * Blink status LED
 */
void blinkLed(int times, int delayMs) {
    for (int i = 0; i < times; i++) {
        digitalWrite(STATUS_LED, LED_ON);
        delay(delayMs);
        digitalWrite(STATUS_LED, LED_OFF);
        delay(delayMs);
    }
}
