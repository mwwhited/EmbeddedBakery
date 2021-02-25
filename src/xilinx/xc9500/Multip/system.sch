VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Z_Out(0:7)
        SIGNAL DBus(0:7)
        SIGNAL A_In(0:7)
        SIGNAL ABus(0:7)
        SIGNAL ABus(4:7)
        SIGNAL ABus(0:3)
        SIGNAL En
        SIGNAL Clock
        SIGNAL C_Bus(0:3)
        SIGNAL M_In
        PORT Output Z_Out(0:7)
        PORT Input A_In(0:7)
        PORT Input M_In
        BEGIN BLOCKDEF calc
            TIMESTAMP 2004 10 25 0 13 37
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF eightbits
            TIMESTAMP 2004 10 22 2 26 4
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
        END BLOCKDEF
        BEGIN BLOCKDEF eightleds
            TIMESTAMP 2004 10 22 2 40 16
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 96 -64 32 -64 
            LINE N 64 0 64 -32 
            LINE N 64 -32 64 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF counter
            TIMESTAMP 2004 10 22 2 59 36
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
        END BLOCKDEF
        BEGIN BLOCKDEF momentsw
            TIMESTAMP 2004 10 22 2 59 51
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCK Calc_S calc
            PIN A(0:3) ABus(0:3)
            PIN B(0:3) ABus(4:7)
            PIN Fn(0:3) C_Bus(0:3)
            PIN En En
            PIN Z(7:0) DBus(0:7)
        END BLOCK
        BEGIN BLOCK Bits_In eightbits
            PIN A(0:7) A_In(0:7)
            PIN En En
            PIN Z(0:7) ABus(0:7)
        END BLOCK
        BEGIN BLOCK Bits_Out eightleds
            PIN A(0:7) DBus(0:7)
            PIN Enable En
            PIN Z(0:7) Z_Out(0:7)
        END BLOCK
        BEGIN BLOCK FixedHigh vcc
            PIN P En
        END BLOCK
        BEGIN BLOCK Cntr counter
            PIN Clk Clock
            PIN En En
            PIN Z(0:3) C_Bus(0:3)
        END BLOCK
        BEGIN BLOCK Sw momentsw
            PIN A1 M_In
            PIN Enable En
            PIN Z1 Clock
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE Calc_S 1536 576 R0
        END INSTANCE
        BEGIN BRANCH Z_Out(0:7)
            WIRE 2480 352 2560 352
        END BRANCH
        BEGIN BRANCH DBus(0:7)
            WIRE 1920 352 2096 352
        END BRANCH
        BEGIN BRANCH A_In(0:7)
            WIRE 656 176 736 176
        END BRANCH
        BEGIN BRANCH ABus(0:7)
            WIRE 1120 176 1280 176
            WIRE 1280 176 1280 352
            WIRE 1280 352 1280 416
            WIRE 1280 416 1280 480
        END BRANCH
        BEGIN BRANCH ABus(4:7)
            WIRE 1376 416 1440 416
            WIRE 1440 416 1536 416
            BEGIN DISPLAY 1440 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ABus(0:3)
            WIRE 1376 352 1440 352
            WIRE 1440 352 1536 352
            BEGIN DISPLAY 1440 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1280 416 1376 416
        BUSTAP 1280 352 1376 352
        BEGIN INSTANCE Bits_In 736 272 R0
        END INSTANCE
        BEGIN INSTANCE Bits_Out 2096 448 R0
        END INSTANCE
        BEGIN BRANCH En
            WIRE 160 544 160 1056
            WIRE 160 1056 336 1056
            WIRE 160 544 480 544
            WIRE 480 544 656 544
            WIRE 656 544 800 544
            WIRE 800 544 1360 544
            WIRE 1360 544 1536 544
            WIRE 1360 544 1360 752
            WIRE 1360 752 2000 752
            WIRE 800 544 800 1056
            WIRE 800 1056 896 1056
            WIRE 480 480 480 544
            WIRE 656 240 736 240
            WIRE 656 240 656 544
            WIRE 2000 416 2096 416
            WIRE 2000 416 2000 752
        END BRANCH
        INSTANCE FixedHigh 416 480 R0
        IOMARKER 656 176 A_In(0:7) R180 28
        IOMARKER 2560 352 Z_Out(0:7) R0 28
        BEGIN INSTANCE Cntr 896 1088 R0
        END INSTANCE
        BEGIN BRANCH Clock
            WIRE 720 992 896 992
        END BRANCH
        BEGIN BRANCH C_Bus(0:3)
            WIRE 1280 992 1440 992
            WIRE 1440 480 1536 480
            WIRE 1440 480 1440 992
        END BRANCH
        BEGIN INSTANCE Sw 336 1088 R0
        END INSTANCE
        BEGIN BRANCH M_In
            WIRE 304 992 336 992
        END BRANCH
        IOMARKER 304 992 M_In R180 28
    END SHEET
END SCHEMATIC
