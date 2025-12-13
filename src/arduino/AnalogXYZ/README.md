# AnalogXYZ

3-axis analog waveform generator using PWM outputs.

## Description

Generates sine and cosine waveforms on X and Y outputs with a sawtooth pattern on Z. Useful for driving oscilloscope displays or testing analog circuits.

## Hardware Requirements

- Arduino Uno or compatible
- External low-pass filters for smooth analog output (optional)

## Pin Configuration

| Output | Pin |
|--------|-----|
| X      | 3   |
| Y      | 5   |
| Z      | 6   |

## Waveform Parameters

- Resolution: 900 steps per cycle
- Amplitude: 127 (8-bit PWM centered at 127)
- X/Y: Quadrature sine/cosine waves
- Z: Incrementing sawtooth pattern
