VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Z(0:4)
        SIGNAL Z(0)
        SIGNAL Z(1)
        SIGNAL Z(2)
        SIGNAL Z(3)
        SIGNAL Z(4)
        SIGNAL XLXN_54
        SIGNAL A(0:4)
        SIGNAL A(0)
        SIGNAL A(1)
        SIGNAL A(2)
        SIGNAL A(3)
        SIGNAL A(4)
        SIGNAL Y
        SIGNAL holdlow
        SIGNAL B(0:3)
        SIGNAL B(3)
        SIGNAL B(2)
        SIGNAL B(1)
        SIGNAL B(0)
        PORT Output Z(0:4)
        PORT Input A(0:4)
        PORT Output Y
        PORT Input B(0:3)
        BEGIN BLOCKDEF add4
            TIMESTAMP 2001 5 11 10 37 7
            LINE N 448 -128 384 -128 
            LINE N 448 -64 384 -64 
            LINE N 64 -816 64 -480 
            LINE N 64 -480 144 -448 
            LINE N 144 -448 64 -416 
            LINE N 64 -416 64 -80 
            LINE N 64 -80 384 -160 
            LINE N 384 -160 384 -736 
            LINE N 384 -736 64 -816 
            LINE N 384 -128 336 -128 
            LINE N 336 -128 336 -148 
            LINE N 240 -124 240 -64 
            LINE N 240 -64 384 -64 
            LINE N 0 -704 64 -704 
            LINE N 0 -640 64 -640 
            LINE N 0 -576 64 -576 
            LINE N 0 -512 64 -512 
            LINE N 0 -384 64 -384 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 64 -256 
            LINE N 448 -544 384 -544 
            LINE N 448 -480 384 -480 
            LINE N 448 -416 384 -416 
            LINE N 448 -352 384 -352 
            LINE N 0 -192 64 -192 
            LINE N 0 -832 64 -832 
            LINE N 64 -832 112 -832 
            LINE N 112 -832 112 -804 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
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
        BEGIN BLOCK f_adder add4
            PIN A0 A(1)
            PIN A1 A(2)
            PIN A2 A(3)
            PIN A3 A(4)
            PIN B0 B(0)
            PIN B1 B(1)
            PIN B2 B(2)
            PIN B3 B(3)
            PIN CI holdlow
            PIN CO Z(4)
            PIN OFL
            PIN S0 Z(0)
            PIN S1 Z(1)
            PIN S2 Z(2)
            PIN S3 Z(3)
        END BLOCK
        BEGIN BLOCK m_buf buf
            PIN I A(0)
            PIN O Y
        END BLOCK
        BEGIN BLOCK low gnd
            PIN G holdlow
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE f_adder 1376 1440 R0
        BEGIN BRANCH Z(0:4)
            WIRE 2016 560 2016 896
            WIRE 2016 896 2016 960
            WIRE 2016 960 2016 1024
            WIRE 2016 1024 2016 1088
            WIRE 2016 1088 2016 1376
            WIRE 2016 1376 2016 1440
            WIRE 2016 560 2176 560
        END BRANCH
        IOMARKER 2176 560 Z(0:4) R0 28
        BEGIN BRANCH Z(0)
            WIRE 1824 896 1856 896
            WIRE 1856 896 1920 896
            BEGIN DISPLAY 1856 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 1824 960 1872 960
            WIRE 1872 960 1920 960
            BEGIN DISPLAY 1872 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 1824 1024 1856 1024
            WIRE 1856 1024 1920 1024
            BEGIN DISPLAY 1856 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 1824 1088 1856 1088
            WIRE 1856 1088 1920 1088
            BEGIN DISPLAY 1856 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 1824 1376 1856 1376
            WIRE 1856 1376 1920 1376
            BEGIN DISPLAY 1856 1376 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2016 896 1920 896
        BUSTAP 2016 960 1920 960
        BUSTAP 2016 1024 1920 1024
        BUSTAP 2016 1088 1920 1088
        BUSTAP 2016 1376 1920 1376
        BEGIN BRANCH A(0:4)
            WIRE 1088 304 1104 304
            WIRE 1104 304 1200 304
            WIRE 1200 304 1200 400
            WIRE 1200 400 1200 736
            WIRE 1200 736 1200 800
            WIRE 1200 800 1200 864
            WIRE 1200 864 1200 928
            WIRE 1200 928 1200 960
        END BRANCH
        INSTANCE m_buf 1376 432 R0
        BEGIN BRANCH A(0)
            WIRE 1296 400 1328 400
            WIRE 1328 400 1376 400
            BEGIN DISPLAY 1328 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 1296 736 1296 736
            WIRE 1296 736 1328 736
            WIRE 1328 736 1376 736
            BEGIN DISPLAY 1328 736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 1296 800 1328 800
            WIRE 1328 800 1376 800
            BEGIN DISPLAY 1328 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 1296 864 1328 864
            WIRE 1328 864 1376 864
            BEGIN DISPLAY 1328 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(4)
            WIRE 1296 928 1328 928
            WIRE 1328 928 1376 928
            BEGIN DISPLAY 1328 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Y
            WIRE 1600 400 1616 400
            WIRE 1616 400 2176 400
        END BRANCH
        IOMARKER 2176 400 Y R0 28
        BUSTAP 1200 400 1296 400
        BUSTAP 1200 736 1296 736
        BUSTAP 1200 800 1296 800
        BUSTAP 1200 864 1296 864
        BUSTAP 1200 928 1296 928
        INSTANCE low 992 848 R0
        BEGIN BRANCH holdlow
            WIRE 1056 608 1376 608
            WIRE 1056 608 1056 720
        END BRANCH
        IOMARKER 1088 304 A(0:4) R180 28
        BEGIN BRANCH B(0:3)
            WIRE 1056 1360 1200 1360
            WIRE 1200 1008 1200 1056
            WIRE 1200 1056 1200 1120
            WIRE 1200 1120 1200 1184
            WIRE 1200 1184 1200 1248
            WIRE 1200 1248 1200 1360
        END BRANCH
        IOMARKER 1056 1360 B(0:3) R180 28
        BEGIN BRANCH B(3)
            WIRE 1296 1248 1328 1248
            WIRE 1328 1248 1376 1248
            BEGIN DISPLAY 1328 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 1296 1184 1328 1184
            WIRE 1328 1184 1376 1184
            BEGIN DISPLAY 1328 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 1296 1120 1328 1120
            WIRE 1328 1120 1376 1120
            BEGIN DISPLAY 1328 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 1296 1056 1328 1056
            WIRE 1328 1056 1376 1056
            BEGIN DISPLAY 1328 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 1056 1296 1056
        BUSTAP 1200 1120 1296 1120
        BUSTAP 1200 1184 1296 1184
        BUSTAP 1200 1248 1296 1248
    END SHEET
END SCHEMATIC
