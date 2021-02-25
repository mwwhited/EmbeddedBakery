VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL A1
            BEGIN ATTR LOC "p67"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        SIGNAL XLXN_2
        SIGNAL Z1
        SIGNAL Enable
        PORT Input A1
        PORT Output Z1
        PORT Input Enable
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2001 3 9 11 23 23
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF bufe
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 96 -96 64 -96 
            LINE N 96 -48 96 -96 
            LINE N 0 -96 64 -96 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 ibuf
            PIN I A1
            PIN O XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_3 bufe
            PIN E Enable
            PIN I XLXN_2
            PIN O Z1
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH A1
            WIRE 1408 1056 1440 1056
        END BRANCH
        IOMARKER 1408 1056 A1 R180 28
        INSTANCE XLXI_2 1440 1088 R0
        INSTANCE XLXI_3 1824 1088 R0
        BEGIN BRANCH XLXN_2
            WIRE 1664 1056 1680 1056
            WIRE 1680 1056 1824 1056
        END BRANCH
        BEGIN BRANCH Z1
            WIRE 2048 1056 2064 1056
            WIRE 2064 1056 2080 1056
        END BRANCH
        IOMARKER 2080 1056 Z1 R0 28
        BEGIN BRANCH Enable
            WIRE 1440 1232 1808 1232
            WIRE 1808 992 1824 992
            WIRE 1808 992 1808 1232
        END BRANCH
        IOMARKER 1440 1232 Enable R180 28
    END SHEET
END SCHEMATIC
