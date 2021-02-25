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
        PORT Output Z_Out(0:7)
        PORT Input A_In(0:7)
        BEGIN BLOCKDEF calc
            TIMESTAMP 2004 10 22 3 19 44
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
        BEGIN BLOCK XLXI_1 calc
            PIN A(0:3) ABus(0:3)
            PIN B(0:3) ABus(4:7)
            PIN Fn(0:3)
            PIN En En
            PIN Z(7:0) DBus(0:7)
        END BLOCK
        BEGIN BLOCK XLXI_2 eightbits
            PIN A(0:7) A_In(0:7)
            PIN En En
            PIN Z(0:7) ABus(0:7)
        END BLOCK
        BEGIN BLOCK XLXI_4 eightleds
            PIN A(0:7) DBus(0:7)
            PIN Enable En
            PIN Z(0:7) Z_Out(0:7)
        END BLOCK
        BEGIN BLOCK XLXI_5 vcc
            PIN P En
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 1616 1216 R0
        END INSTANCE
        BEGIN BRANCH Z_Out(0:7)
            WIRE 2560 992 2640 992
        END BRANCH
        BEGIN BRANCH DBus(0:7)
            WIRE 2000 992 2176 992
        END BRANCH
        BEGIN BRANCH A_In(0:7)
            WIRE 736 816 816 816
        END BRANCH
        BEGIN BRANCH ABus(0:7)
            WIRE 1200 816 1360 816
            WIRE 1360 816 1360 992
            WIRE 1360 992 1360 1056
            WIRE 1360 1056 1360 1120
        END BRANCH
        BEGIN BRANCH ABus(4:7)
            WIRE 1456 1056 1520 1056
            WIRE 1520 1056 1616 1056
            BEGIN DISPLAY 1520 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ABus(0:3)
            WIRE 1456 992 1520 992
            WIRE 1520 992 1616 992
            BEGIN DISPLAY 1520 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1360 1056 1456 1056
        BUSTAP 1360 992 1456 992
        BEGIN INSTANCE XLXI_2 816 912 R0
        END INSTANCE
        IOMARKER 736 816 A_In(0:7) R180 28
        BEGIN INSTANCE XLXI_4 2176 1088 R0
        END INSTANCE
        IOMARKER 2640 992 Z_Out(0:7) R0 28
        BEGIN BRANCH En
            WIRE 560 1120 560 1184
            WIRE 560 1184 736 1184
            WIRE 736 1184 1440 1184
            WIRE 1440 1184 1616 1184
            WIRE 1440 1184 1440 1392
            WIRE 1440 1392 2080 1392
            WIRE 736 880 816 880
            WIRE 736 880 736 1184
            WIRE 2080 1056 2176 1056
            WIRE 2080 1056 2080 1392
        END BRANCH
        INSTANCE XLXI_5 496 1120 R0
    END SHEET
END SCHEMATIC
