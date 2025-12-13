# FreeRTOS Interrupt and Queue Demo

Demonstrates FreeRTOS interrupt handling with queue-based communication.

## Description

Example project showing how to handle hardware interrupts in FreeRTOS and pass events to tasks via queues. Features a button interrupt that sends messages to a serial output task.

## Features

- Hardware interrupt handling with FreeRTOS
- Queue-based inter-task communication
- LED blink task running concurrently
- Button debouncing

## Hardware Requirements

- Arduino Leonardo or compatible (32u4-based for native USB)
- Push buttons on interrupt-capable pins

## Pin Configuration

| Function | Pin |
|----------|-----|
| Button 1 | 2   |
| Button 2 | 4   |
| Button 3 | 7   |

## Architecture

```plantuml
@startuml
[Button ISR] --> (eventQueue) : xQueueSendFromISR
(eventQueue) --> [TaskSerial] : xQueueReceive
[TaskBlink] : Independent LED task
@enduml
```

## Dependencies

- Arduino_FreeRTOS
- queue.h

## Serial Output

- Baud rate: 9600
- Outputs pin number and event count on button press
