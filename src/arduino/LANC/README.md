# LANC

## Summary

[LANC](https://en.wikipedia.org/wiki/LANC) (Local Application Control Bus) is a serial protocol used to control/synchronize video equipment. Originally developed by Sony, it's used for remote camera control and device synchronization.

## Projects

* **LanCRelayCamera**: Generate commands to control Sony video camera from a serial interface
* **LanCRelayCapture**: Monitor and capture LANC messages on the bus
* **LanCRelayRecorder**: Generate signals to control recording on digital video recorders like [Atomos Ninja](https://www.atomos.com/ninja/)

## LANC Protocol Overview

- Single-wire half-duplex serial communication
- 9600 baud equivalent timing
- 8 bytes per frame (sent every 50ms)
- Bytes 0-1: Command data
- Bytes 2-7: Status/response data

## Hardware Requirements

- Arduino (ATmega328 or compatible)
- RS485 transceiver (for long-distance communication)
- LANC interface circuit (level shifting)

## Serial Commands

| Command | Action        |
|---------|---------------|
| R/r     | Start Record  |
| S/s     | Stop Record   |

## Status Responses

| Code | Status      |
|------|-------------|
| P    | Powered On  |
| R    | Recording   |
| S    | Stopped     |
| U    | Unknown     |

## Pin Configuration (LanCRelayCamera)

| Function  | Pin |
|-----------|-----|
| LANC      | 11  |
| Direction | 2   |

## Dependencies

- lanc.h (custom LANC timing library)