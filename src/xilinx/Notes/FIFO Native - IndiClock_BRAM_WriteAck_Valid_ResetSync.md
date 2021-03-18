# XILINX FIO Generator - Native Interface

## Summary

The intent of this documnent is to describe the state flow of a XILINX Native FIFO with Independent Clocks

## Configuration

* Native Interface
* Independent Clocks
* Block RAM
* Write Acknowledgement
* Valid Flag
* Synchronized Reset

## Reset

```plantuml
@startuml

state FIFO_Register {
    [*] --> wr_en : clear
    [*] --> rd_en : clear
    [*] --> rst : clear
}

state ResetRequested {
    [*] -> wr_en : clear
    [*] -> rd_en : clear
    [*] -> rst : set
}

state ResetProcessing {
    [*] --> rst : clear
}


[*] --> ResetRequested
ResetRequested --> ResetProcessing : [wr_rst_busy && rd_rst_busy]
ResetRequested --> ResetRequested : [ELSE]

ResetProcessing --> ResetComplete : [~wr_rst_busy && ~rd_rst_busy]
ResetProcessing --> ResetProcessing : [ELSE]

ResetComplete --> [*]

@enduml
```

## Write 

```plantuml
@startuml

state FIFO_Register {
    [*] --> wr_en : clear
    [*] --> rd_en : clear
    [*] --> din : *'bZ
}

state WriteRequest {
    [*] --> wr_en : clear
    [*] --> din : *Value
}

state WriteStart {
    [*] --> wr_en : set
}

state WriteProcessing {
    [*] --> wr_en : clear

}

state WriteComplete {
}
state NoWrite {
}

[*] --> WriteRequest
WriteRequest --> WriteStart : [~wr_ack]
WriteRequest --> WriteRequest : [ELSE]
WriteRequest --> NoWrite : [full]
WriteStart --> WriteProcessing
WriteProcessing --> WriteComplete : [wr_ack]
WriteProcessing --> WriteProcessing : [ELSE]
WriteComplete --> [*]
NoWrite --> [*]

@enduml
```

## Read

```plantuml
@startuml

state FIFO_Register {
    [*] --> rd_en : clear
    [*] --> dout : *'bZ
}

state ReadRequest {
    [*] --> rd_en : clear
}

state ReadStart {
    [*] --> rd_en : set
}

state ReadProcessing {
    [*] --> rd_en : clear
}
state ReadComplete { 
    [*] --> dout : *Value
}
state NoRead { 

}

[*] --> ReadRequest

ReadRequest --> ReadStart : [~valid]
ReadRequest --> ReadRequest : [ELSE]
ReadRequest --> NoRead : [empty]

ReadStart --> ReadProcessing

ReadProcessing --> ReadComplete : [valid]
ReadProcessing --> ReadProcessing : [ELSE]


ReadComplete --> [*]
NoRead --> [*]

@enduml
```
