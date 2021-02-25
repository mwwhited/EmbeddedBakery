VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Z(0:3)
        SIGNAL holdlow
        SIGNAL En
        SIGNAL Z(0)
        SIGNAL Z(1)
        SIGNAL Z(2)
        SIGNAL Z(3)
        SIGNAL Clk
        PORT Output Z(0:3)
        PORT Input En
        PORT Input Clk
        BEGIN BLOCKDEF cb4re
            TIMESTAMP 2001 5 11 10 51 21
            LINE N 384 -192 320 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -128 64 -128 
            LINE N 384 -256 320 -256 
            LINE N 384 -320 320 -320 
            LINE N 384 -384 320 -384 
            LINE N 384 -448 320 -448 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 384 -128 320 -128 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 0 -192 64 -192 
            RECTANGLE N 64 -512 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCK Cntr cb4re
            PIN C Clk
            PIN CE En
            PIN R holdlow
            PIN CEO
            PIN Q0 Z(0)
            PIN Q1 Z(1)
            PIN Q2 Z(2)
            PIN Q3 Z(3)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_8 gnd
            PIN G holdlow
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE Cntr 896 1632 R0
        BEGIN BRANCH Z(0:3)
            WIRE 1440 1040 1600 1040
            WIRE 1440 1040 1440 1184
            WIRE 1440 1184 1440 1248
            WIRE 1440 1248 1440 1312
            WIRE 1440 1312 1440 1376
            WIRE 1440 1376 1440 1600
        END BRANCH
        IOMARKER 1600 1040 Z(0:3) R0 28
        INSTANCE XLXI_8 736 1856 R0
        BEGIN BRANCH holdlow
            WIRE 800 1600 896 1600
            WIRE 800 1600 800 1728
        END BRANCH
        BEGIN BRANCH En
            WIRE 416 1472 880 1472
            WIRE 880 1440 896 1440
            WIRE 880 1440 880 1472
        END BRANCH
        BEGIN BRANCH Z(0)
            WIRE 1280 1184 1296 1184
            WIRE 1296 1184 1344 1184
            BEGIN DISPLAY 1296 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 1280 1248 1312 1248
            WIRE 1312 1248 1344 1248
            BEGIN DISPLAY 1312 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 1280 1312 1312 1312
            WIRE 1312 1312 1344 1312
            BEGIN DISPLAY 1312 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 1280 1376 1296 1376
            WIRE 1296 1376 1344 1376
            BEGIN DISPLAY 1296 1376 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 400 1376 640 1376
            WIRE 640 1376 640 1504
            WIRE 640 1504 880 1504
            WIRE 880 1504 896 1504
        END BRANCH
        IOMARKER 400 1376 Clk R180 28
        IOMARKER 416 1472 En R180 28
        BUSTAP 1440 1184 1344 1184
        BUSTAP 1440 1248 1344 1248
        BUSTAP 1440 1312 1344 1312
        BUSTAP 1440 1376 1344 1376
    END SHEET
END SCHEMATIC
