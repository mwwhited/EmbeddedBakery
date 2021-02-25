VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_11
        SIGNAL A(3)
        SIGNAL A(2)
        SIGNAL A(1)
        SIGNAL A(0)
        SIGNAL XLXN_22
        SIGNAL XLXN_23
        SIGNAL XLXN_24
        SIGNAL XLXN_25
        BEGIN SIGNAL Fn(0)
        END SIGNAL
        BEGIN SIGNAL Fn(1)
        END SIGNAL
        SIGNAL En
        SIGNAL XLXN_39
        SIGNAL XLXN_40
        SIGNAL Z(0)
        SIGNAL Z(1)
        SIGNAL Z(2)
        SIGNAL Z(3)
        SIGNAL Z(4)
        SIGNAL Z(5)
        SIGNAL Z(6)
        SIGNAL Z(7)
        SIGNAL XLXN_53
        SIGNAL A(0:3)
        SIGNAL Z(0:7)
        SIGNAL Fn(0:1)
        PORT Input En
        PORT Input A(0:3)
        PORT Output Z(0:7)
        PORT Input Fn(0:1)
        BEGIN BLOCKDEF twocompl
            TIMESTAMP 2004 10 18 23 21 0
            RECTANGLE N 64 -384 320 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF d2_4e
            TIMESTAMP 2001 3 9 11 22 33
            RECTANGLE N 64 -384 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            LINE N 384 -128 320 -128 
            LINE N 384 -192 320 -192 
            LINE N 384 -256 320 -256 
            LINE N 384 -320 320 -320 
        END BLOCKDEF
        BEGIN BLOCKDEF all_low
            TIMESTAMP 2004 10 21 0 39 55
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF shift_l
            TIMESTAMP 2004 10 21 0 38 25
            RECTANGLE N 64 -320 320 0 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF shift_r
            TIMESTAMP 2004 10 21 0 38 54
            RECTANGLE N 64 -320 320 0 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
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
        BEGIN BLOCKDEF and2
            TIMESTAMP 2001 5 11 10 41 37
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 twocompl
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN A4 XLXN_11
            PIN En XLXN_1
            PIN Z0 XLXN_25
            PIN Z1 XLXN_24
            PIN Z2 XLXN_23
            PIN Z3 XLXN_22
            PIN Z4 XLXN_40
        END BLOCK
        BEGIN BLOCK XLXI_2 d2_4e
            PIN A0 Fn(0)
            PIN A1 Fn(1)
            PIN E En
            PIN D0 XLXN_1
            PIN D1 XLXN_2
            PIN D2 XLXN_3
            PIN D3 XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_3 all_low
            PIN En XLXN_4
            PIN Z0 XLXN_25
            PIN Z1 XLXN_24
            PIN Z2 XLXN_23
            PIN Z3 XLXN_22
        END BLOCK
        BEGIN BLOCK XLXI_4 shift_l
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN En XLXN_2
            PIN Z0 XLXN_25
            PIN Z1 XLXN_24
            PIN Z2 XLXN_23
            PIN Z3 XLXN_22
        END BLOCK
        BEGIN BLOCK XLXI_5 shift_r
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN En XLXN_3
            PIN Z0 XLXN_25
            PIN Z1 XLXN_24
            PIN Z2 XLXN_23
            PIN Z3 XLXN_22
        END BLOCK
        BEGIN BLOCK XLXI_6 gnd
            PIN G XLXN_11
        END BLOCK
        BEGIN BLOCK XLXI_7 bufe4
            PIN E En
            PIN I0 XLXN_25
            PIN I1 XLXN_24
            PIN I2 XLXN_23
            PIN I3 XLXN_22
            PIN O0 Z(0)
            PIN O1 Z(1)
            PIN O2 Z(2)
            PIN O3 Z(3)
        END BLOCK
        BEGIN BLOCK XLXI_8 bufe4
            PIN E En
            PIN I0 XLXN_39
            PIN I1 XLXN_53
            PIN I2 XLXN_53
            PIN I3 XLXN_53
            PIN O0 Z(4)
            PIN O1 Z(5)
            PIN O2 Z(6)
            PIN O3 Z(7)
        END BLOCK
        BEGIN BLOCK XLXI_9 and2
            PIN I0 XLXN_1
            PIN I1 XLXN_40
            PIN O XLXN_39
        END BLOCK
        BEGIN BLOCK XLXI_10 gnd
            PIN G XLXN_53
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_4 1536 1120 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_5 1536 1600 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1536 2016 R0
        END INSTANCE
        INSTANCE XLXI_2 640 2464 R0
        BEGIN BRANCH XLXN_1
            WIRE 1024 2144 1280 2144
            WIRE 1280 592 1536 592
            WIRE 1280 592 1280 656
            WIRE 1280 656 1280 2144
            WIRE 1280 656 2096 656
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 1024 2208 1296 2208
            WIRE 1296 1088 1296 2208
            WIRE 1296 1088 1536 1088
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1024 2272 1312 2272
            WIRE 1312 1568 1312 2272
            WIRE 1312 1568 1536 1568
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1024 2336 1328 2336
            WIRE 1328 1792 1328 2336
            WIRE 1328 1792 1536 1792
        END BRANCH
        INSTANCE XLXI_6 960 752 R0
        BEGIN BRANCH XLXN_11
            WIRE 1024 528 1024 624
            WIRE 1024 528 1536 528
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 896 464 912 464
            WIRE 912 464 1120 464
            WIRE 1120 464 1280 464
            WIRE 1280 464 1520 464
            WIRE 1520 464 1536 464
            WIRE 1520 464 1520 1024
            WIRE 1520 1024 1536 1024
            WIRE 1520 1024 1520 1504
            WIRE 1520 1504 1536 1504
            BEGIN DISPLAY 1120 464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 896 400 1120 400
            WIRE 1120 400 1264 400
            WIRE 1264 400 1504 400
            WIRE 1504 400 1536 400
            WIRE 1504 400 1504 960
            WIRE 1504 960 1536 960
            WIRE 1504 960 1504 1440
            WIRE 1504 1440 1536 1440
            BEGIN DISPLAY 1120 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_22
            WIRE 1920 464 1936 464
            WIRE 1936 464 2352 464
            WIRE 1936 464 1936 1024
            WIRE 1936 1024 1936 1504
            WIRE 1936 1504 1936 1984
            WIRE 1920 1024 1936 1024
            WIRE 1920 1504 1936 1504
            WIRE 1920 1984 1936 1984
        END BRANCH
        BEGIN BRANCH XLXN_23
            WIRE 1920 400 1952 400
            WIRE 1952 400 2352 400
            WIRE 1952 400 1952 960
            WIRE 1952 960 1952 1440
            WIRE 1952 1440 1952 1920
            WIRE 1920 960 1952 960
            WIRE 1920 1440 1952 1440
            WIRE 1920 1920 1952 1920
        END BRANCH
        BEGIN BRANCH XLXN_24
            WIRE 1920 336 1968 336
            WIRE 1968 336 2352 336
            WIRE 1968 336 1968 896
            WIRE 1968 896 1968 1376
            WIRE 1968 1376 1968 1856
            WIRE 1920 896 1968 896
            WIRE 1920 1376 1968 1376
            WIRE 1920 1856 1968 1856
        END BRANCH
        BEGIN BRANCH XLXN_25
            WIRE 1920 272 1984 272
            WIRE 1984 272 2352 272
            WIRE 1984 272 1984 832
            WIRE 1984 832 1984 1312
            WIRE 1984 1312 1984 1792
            WIRE 1920 832 1984 832
            WIRE 1920 1312 1984 1312
            WIRE 1920 1792 1984 1792
        END BRANCH
        BEGIN BRANCH Fn(0)
            WIRE 496 2144 592 2144
            WIRE 592 2144 608 2144
            WIRE 608 2144 640 2144
            BEGIN DISPLAY 592 2144 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(1)
            WIRE 496 2208 576 2208
            WIRE 576 2208 608 2208
            WIRE 608 2208 640 2208
            BEGIN DISPLAY 576 2208 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH En
            WIRE 496 2336 592 2336
            WIRE 592 2336 624 2336
            WIRE 624 2336 640 2336
            WIRE 592 2336 592 2560
            WIRE 592 2560 640 2560
            WIRE 640 2560 2064 2560
            WIRE 2064 560 2064 2560
            WIRE 2064 560 2336 560
            WIRE 2336 560 2400 560
            WIRE 2336 208 2352 208
            WIRE 2336 208 2336 560
        END BRANCH
        BEGIN INSTANCE XLXI_1 1536 624 R0
        END INSTANCE
        BEGIN BRANCH A(0)
            WIRE 896 272 1136 272
            WIRE 1136 272 1280 272
            WIRE 1280 272 1472 272
            WIRE 1472 272 1536 272
            WIRE 1472 272 1472 832
            WIRE 1472 832 1536 832
            WIRE 1472 832 1472 1312
            WIRE 1472 1312 1536 1312
            BEGIN DISPLAY 1136 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 896 336 1136 336
            WIRE 1136 336 1296 336
            WIRE 1296 336 1488 336
            WIRE 1488 336 1536 336
            WIRE 1488 336 1488 896
            WIRE 1488 896 1536 896
            WIRE 1488 896 1488 1376
            WIRE 1488 1376 1536 1376
            BEGIN DISPLAY 1136 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_7 2352 496 R0
        INSTANCE XLXI_8 2400 848 R0
        INSTANCE XLXI_9 2096 720 R0
        BEGIN BRANCH XLXN_39
            WIRE 2352 624 2400 624
        END BRANCH
        BEGIN BRANCH XLXN_40
            WIRE 1920 528 2000 528
            WIRE 2000 528 2000 592
            WIRE 2000 592 2096 592
        END BRANCH
        IOMARKER 496 2336 En R180 28
        BEGIN BRANCH Z(0)
            WIRE 2576 272 2608 272
            WIRE 2608 272 2656 272
            WIRE 2656 272 2720 272
            BEGIN DISPLAY 2656 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 2576 336 2608 336
            WIRE 2608 336 2656 336
            WIRE 2656 336 2720 336
            BEGIN DISPLAY 2656 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 2576 400 2608 400
            WIRE 2608 400 2672 400
            WIRE 2672 400 2720 400
            BEGIN DISPLAY 2672 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 2576 464 2608 464
            WIRE 2608 464 2672 464
            WIRE 2672 464 2720 464
            BEGIN DISPLAY 2672 464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 2624 624 2656 624
            WIRE 2656 624 2672 624
            WIRE 2672 624 2720 624
            BEGIN DISPLAY 2672 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 2624 688 2656 688
            WIRE 2656 688 2672 688
            WIRE 2672 688 2720 688
            BEGIN DISPLAY 2672 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(6)
            WIRE 2624 752 2656 752
            WIRE 2656 752 2672 752
            WIRE 2672 752 2720 752
            BEGIN DISPLAY 2672 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(7)
            WIRE 2624 816 2656 816
            WIRE 2656 816 2672 816
            WIRE 2672 816 2720 816
            BEGIN DISPLAY 2672 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_10 2208 1104 R0
        BEGIN BRANCH XLXN_53
            WIRE 2272 688 2400 688
            WIRE 2272 688 2272 752
            WIRE 2272 752 2400 752
            WIRE 2272 752 2272 816
            WIRE 2272 816 2400 816
            WIRE 2272 816 2272 976
        END BRANCH
        BEGIN BRANCH A(0:3)
            WIRE 480 240 800 240
            WIRE 800 240 800 272
            WIRE 800 272 800 336
            WIRE 800 336 800 400
            WIRE 800 400 800 464
            WIRE 800 464 800 560
        END BRANCH
        BUSTAP 800 464 896 464
        BUSTAP 800 400 896 400
        BUSTAP 800 336 896 336
        BUSTAP 800 272 896 272
        IOMARKER 480 240 A(0:3) R180 28
        BEGIN BRANCH Z(0:7)
            WIRE 2816 160 3200 160
            WIRE 2816 160 2816 272
            WIRE 2816 272 2816 336
            WIRE 2816 336 2816 400
            WIRE 2816 400 2816 464
            WIRE 2816 464 2816 624
            WIRE 2816 624 2816 688
            WIRE 2816 688 2816 752
            WIRE 2816 752 2816 816
            WIRE 2816 816 2816 912
        END BRANCH
        IOMARKER 3200 160 Z(0:7) R0 28
        BUSTAP 2816 272 2720 272
        BUSTAP 2816 336 2720 336
        BUSTAP 2816 400 2720 400
        BUSTAP 2816 464 2720 464
        BUSTAP 2816 624 2720 624
        BUSTAP 2816 688 2720 688
        BUSTAP 2816 752 2720 752
        BUSTAP 2816 816 2720 816
        BEGIN BRANCH Fn(0:1)
            WIRE 240 2080 400 2080
            WIRE 400 2080 400 2144
            WIRE 400 2144 400 2208
            WIRE 400 2208 400 2240
        END BRANCH
        BUSTAP 400 2144 496 2144
        BUSTAP 400 2208 496 2208
        IOMARKER 240 2080 Fn(0:1) R180 28
    END SHEET
END SCHEMATIC
