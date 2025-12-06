# Intel 8085

## Shared Bus Access (DMA)

```plantuml
@startuml

robust "Clock" as CLK
robust "HOLD (Input)" as HOLD
robust "HLDA (Output)" as HLDA
robust "Bus Control\n(1=CPU, 0=DMA)" as BUS

CLK is high
HOLD is low
HLDA is low
BUS is high

@0
CLK is high
@1
CLK is low
@2
CLK is high
HOLD is high
@3
CLK is low
@4
CLK is high
HLDA is high
BUS is low
@5
CLK is low
@6
CLK is high
@7
CLK is low
@8
CLK is high
HOLD is low
HLDA is low
BUS is high
@9
CLK is low
@10
CLK is high
@11
CLK is low
@enduml
```

* **HOLD** goes high first (DMA requests bus).
* After a delay, **HLDA** goes high (CPU acknowledges).
* **Bus Control** goes low (DMA has control).
* Once **HOLD** goes low, CPU regains control and HLDA drops.
