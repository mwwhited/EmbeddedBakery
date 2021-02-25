VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Q3
        SIGNAL Q2
        SIGNAL Q1
        SIGNAL Q0
        BEGIN SIGNAL B(3)
        END SIGNAL
        BEGIN SIGNAL B(2)
        END SIGNAL
        BEGIN SIGNAL B(1)
        END SIGNAL
        BEGIN SIGNAL B(0)
        END SIGNAL
        BEGIN SIGNAL A(3)
        END SIGNAL
        BEGIN SIGNAL A(1)
        END SIGNAL
        BEGIN SIGNAL A(0)
        END SIGNAL
        SIGNAL Cin
        SIGNAL Cout
        SIGNAL En
        BEGIN SIGNAL Z(4)
        END SIGNAL
        BEGIN SIGNAL Z(2)
        END SIGNAL
        BEGIN SIGNAL Z(1)
        END SIGNAL
        BEGIN SIGNAL Z(0)
        END SIGNAL
        SIGNAL Z(0:4)
        SIGNAL XLXN_2
        SIGNAL Z(3)
        SIGNAL B(0:3)
        SIGNAL A(0:3)
        SIGNAL A(2)
        PORT Input En
        PORT Output Z(0:4)
        PORT Input B(0:3)
        PORT Input A(0:3)
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF bufe4
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -224 64 -224 
            LINE N 224 -224 128 -224 
            LINE N 96 -288 64 -288 
            LINE N 96 -240 96 -288 
            LINE N 0 -288 64 -288 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 64 -128 64 -64 
            LINE N 128 -96 64 -128 
            LINE N 64 -64 128 -96 
            LINE N 64 -192 64 -128 
            LINE N 128 -160 64 -192 
            LINE N 64 -128 128 -160 
            LINE N 64 -256 64 -192 
            LINE N 128 -224 64 -256 
            LINE N 64 -192 128 -224 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -96 64 -96 
            LINE N 224 -96 128 -96 
            LINE N 0 -160 64 -160 
            LINE N 224 -160 128 -160 
            LINE N 96 -176 96 -208 
            LINE N 96 -112 96 -144 
            LINE N 96 -48 96 -80 
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
        BEGIN BLOCK add_main add4
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN B0 B(0)
            PIN B1 B(1)
            PIN B2 B(2)
            PIN B3 B(3)
            PIN CI Cin
            PIN CO Cout
            PIN OFL
            PIN S0 Q0
            PIN S1 Q1
            PIN S2 Q2
            PIN S3 Q3
        END BLOCK
        BEGIN BLOCK holdlow gnd
            PIN G Cin
        END BLOCK
        BEGIN BLOCK low4 bufe4
            PIN E En
            PIN I0 Q0
            PIN I1 Q1
            PIN I2 Q2
            PIN I3 Q3
            PIN O0 Z(0)
            PIN O1 Z(1)
            PIN O2 Z(2)
            PIN O3 Z(3)
        END BLOCK
        BEGIN BLOCK high1 bufe
            PIN E En
            PIN I Cout
            PIN O Z(4)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE add_main 1280 1152 R0
        BEGIN BRANCH Q3
            WIRE 1728 800 2080 800
        END BRANCH
        BEGIN BRANCH Q2
            WIRE 1728 736 2080 736
        END BRANCH
        BEGIN BRANCH Q1
            WIRE 1728 672 2080 672
        END BRANCH
        BEGIN BRANCH Q0
            WIRE 1728 608 2080 608
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 1136 960 1232 960
            WIRE 1232 960 1248 960
            WIRE 1248 960 1280 960
            BEGIN DISPLAY 1232 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 1136 896 1232 896
            WIRE 1232 896 1248 896
            WIRE 1248 896 1280 896
            BEGIN DISPLAY 1232 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 1136 832 1216 832
            WIRE 1216 832 1248 832
            WIRE 1248 832 1280 832
            BEGIN DISPLAY 1216 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 1136 768 1216 768
            WIRE 1216 768 1248 768
            WIRE 1248 768 1280 768
            BEGIN DISPLAY 1216 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 1056 640 1168 640
            WIRE 1168 640 1248 640
            WIRE 1248 640 1280 640
            BEGIN DISPLAY 1168 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 1056 512 1168 512
            WIRE 1168 512 1248 512
            WIRE 1248 512 1280 512
            BEGIN DISPLAY 1168 512 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 1056 448 1168 448
            WIRE 1168 448 1248 448
            WIRE 1248 448 1280 448
            BEGIN DISPLAY 1168 448 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Cin
            WIRE 640 320 640 384
            WIRE 640 320 1280 320
        END BRANCH
        INSTANCE low4 2080 832 R0
        BEGIN BRANCH Cout
            WIRE 1728 1088 2080 1088
        END BRANCH
        BEGIN BRANCH En
            WIRE 1280 1200 2016 1200
            WIRE 2016 544 2080 544
            WIRE 2016 544 2016 1024
            WIRE 2016 1024 2080 1024
            WIRE 2016 1024 2016 1200
        END BRANCH
        INSTANCE high1 2080 1120 R0
        IOMARKER 1280 1200 En R180 28
        BEGIN BRANCH Z(4)
            WIRE 2304 1088 2400 1088
            WIRE 2400 1088 2464 1088
            BEGIN DISPLAY 2400 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 2304 736 2384 736
            WIRE 2384 736 2464 736
            BEGIN DISPLAY 2384 736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 2304 672 2368 672
            WIRE 2368 672 2464 672
            BEGIN DISPLAY 2368 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0)
            WIRE 2304 608 2384 608
            WIRE 2384 608 2464 608
            BEGIN DISPLAY 2384 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0:4)
            WIRE 2560 320 2880 320
            WIRE 2560 320 2560 608
            WIRE 2560 608 2560 672
            WIRE 2560 672 2560 736
            WIRE 2560 736 2560 800
            WIRE 2560 800 2560 1088
            WIRE 2560 1088 2560 1280
        END BRANCH
        IOMARKER 2880 320 Z(0:4) R0 28
        BUSTAP 2560 608 2464 608
        BUSTAP 2560 672 2464 672
        BUSTAP 2560 736 2464 736
        BUSTAP 2560 1088 2464 1088
        BEGIN BRANCH Z(3)
            WIRE 2304 800 2368 800
            WIRE 2368 800 2464 800
            BEGIN DISPLAY 2368 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2560 800 2464 800
        BEGIN BRANCH B(0:3)
            WIRE 720 1040 1040 1040
            WIRE 1040 720 1040 768
            WIRE 1040 768 1040 832
            WIRE 1040 832 1040 896
            WIRE 1040 896 1040 960
            WIRE 1040 960 1040 960
            WIRE 1040 960 1040 1040
        END BRANCH
        INSTANCE holdlow 576 512 R0
        BEGIN BRANCH A(0:3)
            WIRE 720 720 960 720
            WIRE 960 416 960 448
            WIRE 960 448 960 448
            WIRE 960 448 960 512
            WIRE 960 512 960 512
            WIRE 960 512 960 576
            WIRE 960 576 960 576
            WIRE 960 576 960 640
            WIRE 960 640 960 720
        END BRANCH
        IOMARKER 720 720 A(0:3) R180 28
        IOMARKER 720 1040 B(0:3) R180 28
        BEGIN BRANCH A(2)
            WIRE 1056 576 1168 576
            WIRE 1168 576 1280 576
            BEGIN DISPLAY 1168 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 960 448 1056 448
        BUSTAP 960 512 1056 512
        BUSTAP 960 576 1056 576
        BUSTAP 960 640 1056 640
        BUSTAP 1040 768 1136 768
        BUSTAP 1040 832 1136 832
        BUSTAP 1040 896 1136 896
        BUSTAP 1040 960 1136 960
    END SHEET
END SCHEMATIC
