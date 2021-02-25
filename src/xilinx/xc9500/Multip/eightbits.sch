VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL qen
        SIGNAL q0
        SIGNAL q1
        SIGNAL q2
        SIGNAL q3
        SIGNAL q4
        SIGNAL q5
        SIGNAL q6
        SIGNAL q7
        SIGNAL En
        BEGIN SIGNAL A(7)
            BEGIN ATTR LOC "p70"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A(6)
            BEGIN ATTR LOC "p66"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A(5)
            BEGIN ATTR LOC "p71"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A(4)
            BEGIN ATTR LOC "p72"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A(3)
            BEGIN ATTR LOC "p5"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A(1)
            BEGIN ATTR LOC "p7"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        SIGNAL Z(0)
        SIGNAL Z(1)
        SIGNAL Z(2)
        SIGNAL Z(3)
        SIGNAL Z(4)
        SIGNAL Z(5)
        SIGNAL Z(6)
        SIGNAL Z(7)
        SIGNAL Z(0:7)
        SIGNAL A(0:7)
        BEGIN SIGNAL A(2)
            BEGIN ATTR LOC "p11"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        BEGIN SIGNAL A(0)
            BEGIN ATTR LOC "p6"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        PORT Input En
        PORT Output Z(0:7)
        PORT Input A(0:7)
        BEGIN BLOCKDEF ibuf4
            TIMESTAMP 2001 3 9 11 23 23
            LINE N 0 -224 64 -224 
            LINE N 224 -160 128 -160 
            LINE N 0 -32 64 -32 
            LINE N 64 -192 64 -256 
            LINE N 128 -224 64 -192 
            LINE N 64 -256 128 -224 
            LINE N 64 -128 64 -192 
            LINE N 128 -160 64 -128 
            LINE N 64 -192 128 -160 
            LINE N 64 -64 64 -128 
            LINE N 128 -96 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -96 64 -96 
            LINE N 0 -160 64 -160 
            LINE N 224 -224 128 -224 
            LINE N 224 -96 128 -96 
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
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
        END BLOCKDEF
        BEGIN BLOCK in_buf0 ibuf4
            PIN I0 A(0)
            PIN I1 A(1)
            PIN I2 A(2)
            PIN I3 A(3)
            PIN O0 q0
            PIN O1 q1
            PIN O2 q2
            PIN O3 q3
        END BLOCK
        BEGIN BLOCK in_buf1 ibuf4
            PIN I0 A(4)
            PIN I1 A(5)
            PIN I2 A(6)
            PIN I3 A(7)
            PIN O0 q4
            PIN O1 q5
            PIN O2 q6
            PIN O3 q7
        END BLOCK
        BEGIN BLOCK out_buf1 bufe4
            PIN E qen
            PIN I0 q4
            PIN I1 q5
            PIN I2 q6
            PIN I3 q7
            PIN O0 Z(4)
            PIN O1 Z(5)
            PIN O2 Z(6)
            PIN O3 Z(7)
        END BLOCK
        BEGIN BLOCK out_buf0 bufe4
            PIN E qen
            PIN I0 q0
            PIN I1 q1
            PIN I2 q2
            PIN I3 q3
            PIN O0 Z(0)
            PIN O1 Z(1)
            PIN O2 Z(2)
            PIN O3 Z(3)
        END BLOCK
        BEGIN BLOCK in_buf2 buf
            PIN I En
            PIN O qen
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE in_buf0 1376 704 R0
        INSTANCE in_buf1 1376 1184 R0
        BEGIN BRANCH qen
            WIRE 1600 1440 1808 1440
            WIRE 1808 416 2016 416
            WIRE 1808 416 1808 896
            WIRE 1808 896 1808 1440
            WIRE 1808 896 2016 896
        END BRANCH
        BEGIN BRANCH q0
            WIRE 1600 480 2016 480
        END BRANCH
        BEGIN BRANCH q1
            WIRE 1600 544 2016 544
        END BRANCH
        BEGIN BRANCH q2
            WIRE 1600 608 2016 608
        END BRANCH
        BEGIN BRANCH q3
            WIRE 1600 672 2016 672
        END BRANCH
        BEGIN BRANCH q4
            WIRE 1600 960 2016 960
        END BRANCH
        BEGIN BRANCH q5
            WIRE 1600 1024 2016 1024
        END BRANCH
        BEGIN BRANCH q6
            WIRE 1600 1088 2016 1088
        END BRANCH
        BEGIN BRANCH q7
            WIRE 1600 1152 2016 1152
        END BRANCH
        BEGIN BRANCH En
            WIRE 1344 1440 1376 1440
        END BRANCH
        IOMARKER 1344 1440 En R180 28
        BEGIN BRANCH A(7)
            WIRE 1296 1152 1328 1152
            WIRE 1328 1152 1344 1152
            WIRE 1344 1152 1376 1152
            BEGIN DISPLAY 1328 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(6)
            WIRE 1296 1088 1328 1088
            WIRE 1328 1088 1344 1088
            WIRE 1344 1088 1376 1088
            BEGIN DISPLAY 1328 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(5)
            WIRE 1296 1024 1328 1024
            WIRE 1328 1024 1344 1024
            WIRE 1344 1024 1376 1024
            BEGIN DISPLAY 1328 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(4)
            WIRE 1296 960 1328 960
            WIRE 1328 960 1344 960
            WIRE 1344 960 1376 960
            BEGIN DISPLAY 1328 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 1296 672 1312 672
            WIRE 1312 672 1344 672
            WIRE 1344 672 1376 672
            BEGIN DISPLAY 1312 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 1296 544 1312 544
            WIRE 1312 544 1344 544
            WIRE 1344 544 1376 544
            BEGIN DISPLAY 1312 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0)
            WIRE 2240 480 2256 480
            WIRE 2256 480 2272 480
            WIRE 2272 480 2304 480
            BEGIN DISPLAY 2256 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 2240 544 2256 544
            WIRE 2256 544 2272 544
            WIRE 2272 544 2304 544
            BEGIN DISPLAY 2256 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 2240 608 2256 608
            WIRE 2256 608 2272 608
            WIRE 2272 608 2304 608
            BEGIN DISPLAY 2256 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 2240 672 2256 672
            WIRE 2256 672 2272 672
            WIRE 2272 672 2304 672
            BEGIN DISPLAY 2256 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 2240 960 2256 960
            WIRE 2256 960 2272 960
            WIRE 2272 960 2304 960
            BEGIN DISPLAY 2256 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 2240 1024 2256 1024
            WIRE 2256 1024 2272 1024
            WIRE 2272 1024 2304 1024
            BEGIN DISPLAY 2256 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(6)
            WIRE 2240 1088 2256 1088
            WIRE 2256 1088 2272 1088
            WIRE 2272 1088 2304 1088
            BEGIN DISPLAY 2256 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(7)
            WIRE 2240 1152 2256 1152
            WIRE 2256 1152 2272 1152
            WIRE 2272 1152 2304 1152
            BEGIN DISPLAY 2256 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE out_buf1 2016 1184 R0
        INSTANCE out_buf0 2016 704 R0
        INSTANCE in_buf2 1376 1472 R0
        BEGIN BRANCH Z(0:7)
            WIRE 2400 240 2560 240
            WIRE 2400 240 2400 480
            WIRE 2400 480 2400 544
            WIRE 2400 544 2400 608
            WIRE 2400 608 2400 672
            WIRE 2400 672 2400 960
            WIRE 2400 960 2400 1024
            WIRE 2400 1024 2400 1088
            WIRE 2400 1088 2400 1152
            WIRE 2400 1152 2400 1280
        END BRANCH
        IOMARKER 2560 240 Z(0:7) R0 28
        BEGIN BRANCH A(0:7)
            WIRE 1024 224 1200 224
            WIRE 1200 224 1200 480
            WIRE 1200 480 1200 544
            WIRE 1200 544 1200 608
            WIRE 1200 608 1200 672
            WIRE 1200 672 1200 960
            WIRE 1200 960 1200 1024
            WIRE 1200 1024 1200 1088
            WIRE 1200 1088 1200 1152
            WIRE 1200 1152 1200 1200
        END BRANCH
        IOMARKER 1024 224 A(0:7) R180 28
        BUSTAP 1200 1152 1296 1152
        BUSTAP 1200 1088 1296 1088
        BUSTAP 1200 1024 1296 1024
        BUSTAP 1200 960 1296 960
        BUSTAP 1200 672 1296 672
        BUSTAP 1200 544 1296 544
        BEGIN BRANCH A(2)
            WIRE 1296 608 1344 608
            WIRE 1344 608 1376 608
            BEGIN DISPLAY 1344 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 1296 480 1312 480
            WIRE 1312 480 1376 480
            BEGIN DISPLAY 1312 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 608 1296 608
        BUSTAP 1200 480 1296 480
        BUSTAP 2400 1152 2304 1152
        BUSTAP 2400 1088 2304 1088
        BUSTAP 2400 1024 2304 1024
        BUSTAP 2400 960 2304 960
        BUSTAP 2400 672 2304 672
        BUSTAP 2400 608 2304 608
        BUSTAP 2400 544 2304 544
        BUSTAP 2400 480 2304 480
    END SHEET
END SCHEMATIC
