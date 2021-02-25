VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL InBus(0:12)
        SIGNAL OutBus(0:4)
        SIGNAL InBus(0)
        SIGNAL InBus(1)
        SIGNAL InBus(2)
        SIGNAL InBus(3)
        SIGNAL InBus(4)
        SIGNAL InBus(5)
        SIGNAL InBus(6)
        SIGNAL InBus(7)
        SIGNAL InBus(9)
        SIGNAL InBus(10)
        SIGNAL InBus(11)
        SIGNAL InBus(8)
        BEGIN SIGNAL Fn(0)
        END SIGNAL
        BEGIN SIGNAL Fn(1)
        END SIGNAL
        SIGNAL En
        SIGNAL InBus(12)
        SIGNAL OutBus(4)
        SIGNAL OutBus(0)
        SIGNAL OutBus(1)
        SIGNAL OutBus(2)
        SIGNAL OutBus(3)
        SIGNAL XLXN_61
        SIGNAL XLXN_82
        SIGNAL B(0:3)
        SIGNAL Fn(0:1)
        SIGNAL Z(0:7)
        SIGNAL A(0)
        SIGNAL A(1)
        SIGNAL A(2)
        SIGNAL A(3)
        SIGNAL A(0:3)
        SIGNAL B(3)
        SIGNAL B(2)
        SIGNAL B(1)
        SIGNAL B(0)
        SIGNAL Z(7)
        SIGNAL Z(6)
        SIGNAL Z(5)
        SIGNAL Z(4)
        SIGNAL Z(3)
        SIGNAL Z(2)
        SIGNAL Z(1)
        SIGNAL Z(0)
        PORT Input En
        PORT Input B(0:3)
        PORT Input Fn(0:1)
        PORT Output Z(0:7)
        PORT Input A(0:3)
        BEGIN BLOCKDEF or_array
            TIMESTAMP 2004 10 19 0 21 18
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
        END BLOCKDEF
        BEGIN BLOCKDEF nor_array
            TIMESTAMP 2004 10 19 0 16 49
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
        END BLOCKDEF
        BEGIN BLOCKDEF xnor_array
            TIMESTAMP 2004 10 19 0 21 54
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
        END BLOCKDEF
        BEGIN BLOCKDEF xor_array
            TIMESTAMP 2004 10 19 0 22 28
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
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
        BEGIN BLOCKDEF buf4
            TIMESTAMP 2001 5 18 10 41 48
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 64 -128 64 -192 
            LINE N 128 -160 64 -128 
            LINE N 64 -192 128 -160 
            LINE N 64 -192 64 -256 
            LINE N 128 -224 64 -192 
            LINE N 64 -256 128 -224 
            LINE N 224 -224 128 -224 
            LINE N 224 -160 128 -160 
            LINE N 0 -96 64 -96 
            LINE N 224 -96 128 -96 
            LINE N 64 -64 64 -128 
            LINE N 128 -96 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 0 -160 64 -160 
            LINE N 0 -224 64 -224 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_5 d2_4e
            PIN A0 Fn(0)
            PIN A1 Fn(1)
            PIN E En
            PIN D0 InBus(8)
            PIN D1 InBus(9)
            PIN D2 InBus(10)
            PIN D3 InBus(11)
        END BLOCK
        BEGIN BLOCK XLXI_1 or_array
            PIN A0 InBus(0)
            PIN A1 InBus(1)
            PIN A2 InBus(2)
            PIN A3 InBus(3)
            PIN B0 InBus(4)
            PIN B1 InBus(5)
            PIN B2 InBus(6)
            PIN B3 InBus(7)
            PIN En InBus(8)
            PIN Z0 OutBus(0)
            PIN Z1 OutBus(1)
            PIN Z2 OutBus(2)
            PIN Z3 OutBus(3)
        END BLOCK
        BEGIN BLOCK XLXI_2 nor_array
            PIN A0 InBus(0)
            PIN A1 InBus(1)
            PIN A2 InBus(2)
            PIN A3 InBus(3)
            PIN B0 InBus(4)
            PIN B1 InBus(5)
            PIN B2 InBus(6)
            PIN B3 InBus(7)
            PIN En InBus(9)
            PIN Z0 OutBus(0)
            PIN Z1 OutBus(1)
            PIN Z2 OutBus(2)
            PIN Z3 OutBus(3)
        END BLOCK
        BEGIN BLOCK XLXI_3 xnor_array
            PIN A0 InBus(0)
            PIN A1 InBus(1)
            PIN A2 InBus(2)
            PIN A3 InBus(3)
            PIN B0 InBus(4)
            PIN B1 InBus(5)
            PIN B2 InBus(6)
            PIN B3 InBus(7)
            PIN En InBus(10)
            PIN Z0 OutBus(0)
            PIN Z1 OutBus(1)
            PIN Z2 OutBus(2)
            PIN Z3 OutBus(3)
        END BLOCK
        BEGIN BLOCK XLXI_4 xor_array
            PIN A0 InBus(0)
            PIN A1 InBus(1)
            PIN A2 InBus(2)
            PIN A3 InBus(3)
            PIN B0 InBus(4)
            PIN B1 InBus(5)
            PIN B2 InBus(6)
            PIN B3 InBus(7)
            PIN En InBus(11)
            PIN Z0 OutBus(0)
            PIN Z1 OutBus(1)
            PIN Z2 OutBus(2)
            PIN Z3 OutBus(3)
        END BLOCK
        BEGIN BLOCK XLXI_10 buf4
            PIN I0 A(0)
            PIN I1 A(1)
            PIN I2 A(2)
            PIN I3 A(3)
            PIN O0 InBus(0)
            PIN O1 InBus(1)
            PIN O2 InBus(2)
            PIN O3 InBus(3)
        END BLOCK
        BEGIN BLOCK XLXI_11 buf4
            PIN I0 B(0)
            PIN I1 B(1)
            PIN I2 B(2)
            PIN I3 B(3)
            PIN O0 InBus(4)
            PIN O1 InBus(5)
            PIN O2 InBus(6)
            PIN O3 InBus(7)
        END BLOCK
        BEGIN BLOCK XLXI_12 bufe4
            PIN E OutBus(4)
            PIN I0 OutBus(0)
            PIN I1 OutBus(1)
            PIN I2 OutBus(2)
            PIN I3 OutBus(3)
            PIN O0 Z(0)
            PIN O1 Z(1)
            PIN O2 Z(2)
            PIN O3 Z(3)
        END BLOCK
        BEGIN BLOCK XLXI_13 buf
            PIN I En
            PIN O InBus(12)
        END BLOCK
        BEGIN BLOCK XLXI_14 buf
            PIN I InBus(12)
            PIN O OutBus(4)
        END BLOCK
        BEGIN BLOCK XLXI_15 bufe4
            PIN E OutBus(4)
            PIN I0 XLXN_61
            PIN I1 XLXN_61
            PIN I2 XLXN_61
            PIN I3 XLXN_61
            PIN O0 Z(4)
            PIN O1 Z(5)
            PIN O2 Z(6)
            PIN O3 Z(7)
        END BLOCK
        BEGIN BLOCK XLXI_16 gnd
            PIN G XLXN_61
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_2 896 2016 R0
        END INSTANCE
        BEGIN BRANCH InBus(0:12)
            WIRE 640 320 1760 320
            WIRE 1760 320 1760 512
            WIRE 1760 512 1760 576
            WIRE 1760 576 1760 640
            WIRE 1760 640 1760 704
            WIRE 1760 704 1760 768
            WIRE 1760 768 1760 832
            WIRE 1760 832 1760 896
            WIRE 1760 896 1760 960
            WIRE 1760 960 1760 1024
            WIRE 1760 1024 1760 1472
            WIRE 1760 1472 1760 1536
            WIRE 1760 1536 1760 1600
            WIRE 1760 1600 1760 1664
            WIRE 1760 1664 1760 1728
            WIRE 1760 1728 1760 1792
            WIRE 1760 1792 1760 1856
            WIRE 1760 1856 1760 1920
            WIRE 1760 1920 1760 1984
            WIRE 1760 1984 1760 2096
            WIRE 640 320 640 352
            WIRE 640 352 640 400
            WIRE 640 400 640 448
            WIRE 640 448 640 496
            WIRE 640 496 640 592
            WIRE 640 592 640 656
            WIRE 640 656 640 720
            WIRE 640 720 640 784
            WIRE 640 784 640 848
            WIRE 640 848 640 912
            WIRE 640 912 640 976
            WIRE 640 976 640 1040
            WIRE 640 1040 640 1104
            WIRE 640 1104 640 1200
            WIRE 640 1200 640 1248
            WIRE 640 1248 640 1296
            WIRE 640 1296 640 1344
            WIRE 640 1344 640 1472
            WIRE 640 1472 640 1536
            WIRE 640 1536 640 1600
            WIRE 640 1600 640 1664
            WIRE 640 1664 640 1728
            WIRE 640 1728 640 1792
            WIRE 640 1792 640 1856
            WIRE 640 1856 640 1920
            WIRE 640 1920 640 1984
            WIRE 640 1984 640 2080
            WIRE 640 2080 960 2080
            WIRE 960 2080 960 2160
            WIRE 960 2160 960 2304
            WIRE 960 2304 960 2368
            WIRE 960 2368 960 2432
            WIRE 960 2432 960 2496
            WIRE 960 2496 960 2608
            WIRE 960 2608 960 2640
        END BRANCH
        BEGIN INSTANCE XLXI_3 2016 1056 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 2016 2016 R0
        END INSTANCE
        BEGIN BRANCH OutBus(0:4)
            WIRE 1600 464 1600 592
            WIRE 1600 592 1600 656
            WIRE 1600 656 1600 720
            WIRE 1600 720 1600 784
            WIRE 1600 784 1600 1472
            WIRE 1600 1472 1600 1536
            WIRE 1600 1536 1600 1600
            WIRE 1600 1600 1600 1664
            WIRE 1600 1664 1600 2160
            WIRE 1600 2160 1600 2240
            WIRE 1600 2240 2720 2240
            WIRE 2720 320 2720 512
            WIRE 2720 512 2720 576
            WIRE 2720 576 2720 640
            WIRE 2720 640 2720 704
            WIRE 2720 704 2720 1040
            WIRE 2720 1040 2720 1104
            WIRE 2720 1104 2720 1168
            WIRE 2720 1168 2720 1232
            WIRE 2720 1232 2720 1296
            WIRE 2720 1296 2720 1472
            WIRE 2720 1472 2720 1536
            WIRE 2720 1536 2720 1600
            WIRE 2720 1600 2720 1664
            WIRE 2720 1664 2720 1760
            WIRE 2720 1760 2720 2240
        END BRANCH
        BEGIN INSTANCE XLXI_1 896 1136 R0
        END INSTANCE
        BUSTAP 640 592 736 592
        BUSTAP 640 656 736 656
        BUSTAP 640 1472 736 1472
        BUSTAP 640 1536 736 1536
        BUSTAP 640 1600 736 1600
        BEGIN BRANCH InBus(0)
            WIRE 736 592 800 592
            WIRE 800 592 896 592
            BEGIN DISPLAY 800 592 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(1)
            WIRE 736 656 816 656
            WIRE 816 656 896 656
            BEGIN DISPLAY 816 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(2)
            WIRE 736 720 816 720
            WIRE 816 720 896 720
            BEGIN DISPLAY 816 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(3)
            WIRE 736 784 816 784
            WIRE 816 784 896 784
            BEGIN DISPLAY 816 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(4)
            WIRE 736 848 816 848
            WIRE 816 848 896 848
            BEGIN DISPLAY 816 848 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(5)
            WIRE 736 912 816 912
            WIRE 816 912 896 912
            BEGIN DISPLAY 816 912 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(6)
            WIRE 736 976 832 976
            WIRE 832 976 896 976
            BEGIN DISPLAY 832 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(7)
            WIRE 736 1040 832 1040
            WIRE 832 1040 896 1040
            BEGIN DISPLAY 832 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(0)
            WIRE 736 1472 816 1472
            WIRE 816 1472 896 1472
            BEGIN DISPLAY 816 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(1)
            WIRE 736 1536 816 1536
            WIRE 816 1536 896 1536
            BEGIN DISPLAY 816 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(2)
            WIRE 736 1600 816 1600
            WIRE 816 1600 896 1600
            BEGIN DISPLAY 816 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(3)
            WIRE 736 1664 816 1664
            WIRE 816 1664 896 1664
            BEGIN DISPLAY 816 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(4)
            WIRE 736 1728 832 1728
            WIRE 832 1728 896 1728
            BEGIN DISPLAY 832 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(5)
            WIRE 736 1792 832 1792
            WIRE 832 1792 896 1792
            BEGIN DISPLAY 832 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(6)
            WIRE 736 1856 816 1856
            WIRE 816 1856 896 1856
            BEGIN DISPLAY 816 1856 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 640 1920 736 1920
        BEGIN BRANCH InBus(7)
            WIRE 736 1920 816 1920
            WIRE 816 1920 896 1920
            BEGIN DISPLAY 816 1920 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 640 1664 736 1664
        BUSTAP 640 1856 736 1856
        BUSTAP 640 1792 736 1792
        BUSTAP 640 1728 736 1728
        INSTANCE XLXI_5 336 2624 R0
        BEGIN BRANCH InBus(8)
            WIRE 720 2304 800 2304
            WIRE 800 2304 864 2304
            BEGIN DISPLAY 800 2304 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(9)
            WIRE 720 2368 784 2368
            WIRE 784 2368 864 2368
            BEGIN DISPLAY 784 2368 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(10)
            WIRE 720 2432 800 2432
            WIRE 800 2432 864 2432
            BEGIN DISPLAY 800 2432 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(11)
            WIRE 720 2496 784 2496
            WIRE 784 2496 864 2496
            BEGIN DISPLAY 784 2496 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 640 1984 736 1984
        BUSTAP 640 1040 736 1040
        BUSTAP 640 976 736 976
        BUSTAP 640 912 736 912
        BUSTAP 640 848 736 848
        BUSTAP 640 784 736 784
        BUSTAP 640 720 736 720
        BEGIN BRANCH InBus(8)
            WIRE 736 1104 800 1104
            WIRE 800 1104 896 1104
            BEGIN DISPLAY 800 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 640 1104 736 1104
        BUSTAP 960 2304 864 2304
        BUSTAP 960 2368 864 2368
        BUSTAP 960 2432 864 2432
        BUSTAP 960 2496 864 2496
        BEGIN BRANCH InBus(9)
            WIRE 736 1984 800 1984
            WIRE 800 1984 896 1984
            BEGIN DISPLAY 800 1984 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(0)
            WIRE 432 336 496 336
            WIRE 496 336 496 352
            WIRE 496 352 544 352
            BEGIN DISPLAY 496 352 ATTR Name
                ALIGNMENT SOFT-TCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(1)
            WIRE 432 400 496 400
            WIRE 496 400 544 400
            BEGIN DISPLAY 496 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(2)
            WIRE 432 464 480 464
            WIRE 480 448 544 448
            WIRE 480 448 480 464
            BEGIN DISPLAY 480 448 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(3)
            WIRE 432 528 480 528
            WIRE 480 496 544 496
            WIRE 480 496 480 528
            BEGIN DISPLAY 480 496 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(4)
            WIRE 432 1184 480 1184
            WIRE 480 1184 544 1184
            WIRE 544 1184 544 1200
            BEGIN DISPLAY 480 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(5)
            WIRE 432 1248 480 1248
            WIRE 480 1248 544 1248
            BEGIN DISPLAY 480 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(6)
            WIRE 432 1312 496 1312
            WIRE 496 1296 544 1296
            WIRE 496 1296 496 1312
            BEGIN DISPLAY 496 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(7)
            WIRE 432 1376 512 1376
            WIRE 512 1344 544 1344
            WIRE 512 1344 512 1376
            BEGIN DISPLAY 512 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(0)
            WIRE 256 2304 272 2304
            WIRE 272 2304 304 2304
            WIRE 304 2304 336 2304
            BEGIN DISPLAY 272 2304 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Fn(1)
            WIRE 256 2368 272 2368
            WIRE 272 2368 304 2368
            WIRE 304 2368 336 2368
            BEGIN DISPLAY 272 2368 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH En
            WIRE 240 2496 304 2496
            WIRE 304 2496 336 2496
            WIRE 304 2496 304 2608
            WIRE 304 2608 400 2608
        END BRANCH
        BUSTAP 640 352 544 352
        BUSTAP 640 448 544 448
        BUSTAP 640 496 544 496
        BUSTAP 640 1200 544 1200
        BUSTAP 640 1248 544 1248
        BUSTAP 640 1296 544 1296
        BUSTAP 640 1344 544 1344
        BUSTAP 640 400 544 400
        INSTANCE XLXI_13 400 2640 R0
        BEGIN BRANCH InBus(12)
            WIRE 624 2608 720 2608
            WIRE 720 2608 864 2608
            BEGIN DISPLAY 720 2608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 240 2496 En R180 28
        BUSTAP 960 2608 864 2608
        INSTANCE XLXI_14 1168 2192 R0
        BEGIN BRANCH InBus(12)
            WIRE 1056 2160 1104 2160
            WIRE 1104 2160 1168 2160
            BEGIN DISPLAY 1104 2160 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(4)
            WIRE 1392 2160 1440 2160
            WIRE 1440 2160 1504 2160
            BEGIN DISPLAY 1440 2160 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 960 2160 1056 2160
        BEGIN BRANCH OutBus(0)
            WIRE 1280 592 1376 592
            WIRE 1376 592 1504 592
            BEGIN DISPLAY 1376 592 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(1)
            WIRE 1280 656 1376 656
            WIRE 1376 656 1504 656
            BEGIN DISPLAY 1376 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(2)
            WIRE 1280 720 1376 720
            WIRE 1376 720 1504 720
            BEGIN DISPLAY 1376 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(3)
            WIRE 1280 784 1392 784
            WIRE 1392 784 1504 784
            BEGIN DISPLAY 1392 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(0)
            WIRE 1280 1472 1408 1472
            WIRE 1408 1472 1504 1472
            BEGIN DISPLAY 1408 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(1)
            WIRE 1280 1536 1392 1536
            WIRE 1392 1536 1504 1536
            BEGIN DISPLAY 1392 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(2)
            WIRE 1280 1600 1392 1600
            WIRE 1392 1600 1504 1600
            BEGIN DISPLAY 1392 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(3)
            WIRE 1280 1664 1392 1664
            WIRE 1392 1664 1504 1664
            BEGIN DISPLAY 1392 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(3)
            WIRE 2400 1664 2528 1664
            WIRE 2528 1664 2624 1664
            BEGIN DISPLAY 2528 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(2)
            WIRE 2400 1600 2528 1600
            WIRE 2528 1600 2624 1600
            BEGIN DISPLAY 2528 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(1)
            WIRE 2400 1536 2528 1536
            WIRE 2528 1536 2624 1536
            BEGIN DISPLAY 2528 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(0)
            WIRE 2400 1472 2528 1472
            WIRE 2528 1472 2624 1472
            BEGIN DISPLAY 2528 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(3)
            WIRE 2400 704 2544 704
            WIRE 2544 704 2624 704
            BEGIN DISPLAY 2544 704 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(2)
            WIRE 2400 640 2544 640
            WIRE 2544 640 2624 640
            BEGIN DISPLAY 2544 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(1)
            WIRE 2400 576 2528 576
            WIRE 2528 576 2624 576
            BEGIN DISPLAY 2528 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(0)
            WIRE 2400 512 2544 512
            WIRE 2544 512 2624 512
            BEGIN DISPLAY 2544 512 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(4)
            WIRE 2816 1040 2992 1040
            WIRE 2992 1040 3056 1040
            BEGIN DISPLAY 2992 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(0)
            WIRE 2816 1104 2976 1104
            WIRE 2976 1104 3056 1104
            BEGIN DISPLAY 2976 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(1)
            WIRE 2816 1168 2976 1168
            WIRE 2976 1168 3056 1168
            BEGIN DISPLAY 2976 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(2)
            WIRE 2816 1232 2976 1232
            WIRE 2976 1232 3056 1232
            BEGIN DISPLAY 2976 1232 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OutBus(3)
            WIRE 2816 1296 2976 1296
            WIRE 2976 1296 3056 1296
            BEGIN DISPLAY 2976 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 656 1504 656
        BUSTAP 1600 720 1504 720
        BUSTAP 1600 784 1504 784
        BUSTAP 1600 592 1504 592
        BUSTAP 1600 1472 1504 1472
        BUSTAP 1600 1536 1504 1536
        BUSTAP 1600 1600 1504 1600
        BUSTAP 1600 1664 1504 1664
        BUSTAP 2720 512 2624 512
        BUSTAP 2720 576 2624 576
        BUSTAP 2720 640 2624 640
        BUSTAP 2720 704 2624 704
        BUSTAP 2720 1472 2624 1472
        BUSTAP 2720 1536 2624 1536
        BUSTAP 2720 1600 2624 1600
        BUSTAP 2720 1664 2624 1664
        BEGIN BRANCH InBus(0)
            WIRE 1856 512 1968 512
            WIRE 1968 512 2016 512
            BEGIN DISPLAY 1968 512 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(1)
            WIRE 1856 576 1952 576
            WIRE 1952 576 2016 576
            BEGIN DISPLAY 1952 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(2)
            WIRE 1856 640 1952 640
            WIRE 1952 640 2016 640
            BEGIN DISPLAY 1952 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(3)
            WIRE 1856 704 1952 704
            WIRE 1952 704 2016 704
            BEGIN DISPLAY 1952 704 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(4)
            WIRE 1856 768 1952 768
            WIRE 1952 768 2016 768
            BEGIN DISPLAY 1952 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(5)
            WIRE 1856 832 1952 832
            WIRE 1952 832 2016 832
            BEGIN DISPLAY 1952 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(6)
            WIRE 1856 896 1952 896
            WIRE 1952 896 2016 896
            BEGIN DISPLAY 1952 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(7)
            WIRE 1856 960 1968 960
            WIRE 1968 960 2016 960
            BEGIN DISPLAY 1968 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(10)
            WIRE 1856 1024 1952 1024
            WIRE 1952 1024 2016 1024
            BEGIN DISPLAY 1952 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(11)
            WIRE 1856 1984 1952 1984
            WIRE 1952 1984 2016 1984
            BEGIN DISPLAY 1952 1984 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(7)
            WIRE 1856 1920 1936 1920
            WIRE 1936 1920 2016 1920
            BEGIN DISPLAY 1936 1920 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(6)
            WIRE 1856 1856 1952 1856
            WIRE 1952 1856 2016 1856
            BEGIN DISPLAY 1952 1856 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(5)
            WIRE 1856 1792 1936 1792
            WIRE 1936 1792 2016 1792
            BEGIN DISPLAY 1936 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(4)
            WIRE 1856 1728 1968 1728
            WIRE 1968 1728 2016 1728
            BEGIN DISPLAY 1968 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(3)
            WIRE 1856 1664 1968 1664
            WIRE 1968 1664 2016 1664
            BEGIN DISPLAY 1968 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(2)
            WIRE 1856 1600 1968 1600
            WIRE 1968 1600 2016 1600
            BEGIN DISPLAY 1968 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(1)
            WIRE 1856 1536 1968 1536
            WIRE 1968 1536 2016 1536
            BEGIN DISPLAY 1968 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH InBus(0)
            WIRE 1856 1472 1952 1472
            WIRE 1952 1472 2016 1472
            BEGIN DISPLAY 1952 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1760 512 1856 512
        BUSTAP 1760 576 1856 576
        BUSTAP 1760 640 1856 640
        BUSTAP 1760 704 1856 704
        BUSTAP 1760 768 1856 768
        BUSTAP 1760 832 1856 832
        BUSTAP 1760 896 1856 896
        BUSTAP 1760 960 1856 960
        BUSTAP 1760 1024 1856 1024
        BUSTAP 2720 1040 2816 1040
        BUSTAP 2720 1104 2816 1104
        BUSTAP 2720 1168 2816 1168
        BUSTAP 2720 1232 2816 1232
        BUSTAP 2720 1296 2816 1296
        BUSTAP 1760 1472 1856 1472
        BUSTAP 1760 1536 1856 1536
        BUSTAP 1760 1600 1856 1600
        BUSTAP 1760 1664 1856 1664
        BUSTAP 1760 1728 1856 1728
        BUSTAP 1760 1792 1856 1792
        BUSTAP 1760 1856 1856 1856
        BUSTAP 1760 1920 1856 1920
        BUSTAP 1760 1984 1856 1984
        BUSTAP 1600 2160 1504 2160
        BEGIN BRANCH OutBus(4)
            WIRE 2816 1760 3024 1760
            WIRE 3024 1760 3056 1760
            BEGIN DISPLAY 3024 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2720 1760 2816 1760
        INSTANCE XLXI_10 208 560 R0
        INSTANCE XLXI_11 208 1408 R0
        INSTANCE XLXI_16 2800 2192 R0
        INSTANCE XLXI_15 3056 2048 R0
        BEGIN BRANCH XLXN_61
            WIRE 2864 1824 3056 1824
            WIRE 2864 1824 2864 1888
            WIRE 2864 1888 2864 1952
            WIRE 2864 1952 2864 2016
            WIRE 2864 2016 2864 2064
            WIRE 2864 2016 3056 2016
            WIRE 2864 1952 3056 1952
            WIRE 2864 1888 3056 1888
        END BRANCH
        INSTANCE XLXI_12 3056 1328 R0
        BEGIN BRANCH B(0:3)
            WIRE 16 1056 192 1056
            WIRE 16 1056 16 1184
            WIRE 16 1184 16 1248
            WIRE 16 1248 16 1312
            WIRE 16 1312 16 1376
            WIRE 16 1376 16 1392
        END BRANCH
        BEGIN BRANCH Fn(0:1)
            WIRE 128 2224 160 2224
            WIRE 160 2224 160 2304
            WIRE 160 2304 160 2368
            WIRE 160 2368 160 2384
        END BRANCH
        BEGIN BRANCH Z(0:7)
            WIRE 3280 832 3504 832
            WIRE 3504 832 3504 1104
            WIRE 3504 1104 3504 1168
            WIRE 3504 1168 3504 1232
            WIRE 3504 1232 3504 1296
            WIRE 3504 1296 3504 1824
            WIRE 3504 1824 3504 1888
            WIRE 3504 1888 3504 1952
            WIRE 3504 1952 3504 2016
            WIRE 3504 2016 3504 2112
        END BRANCH
        BEGIN BRANCH A(0)
            WIRE 112 336 176 336
            WIRE 176 336 208 336
            BEGIN DISPLAY 176 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 112 400 176 400
            WIRE 176 400 208 400
            BEGIN DISPLAY 176 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 112 464 176 464
            WIRE 176 464 208 464
            BEGIN DISPLAY 176 464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 112 528 176 528
            WIRE 176 528 208 528
            BEGIN DISPLAY 176 528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 176 160 A(0:3) R0 28
        BEGIN BRANCH A(0:3)
            WIRE 16 160 176 160
            WIRE 16 160 16 336
            WIRE 16 336 16 400
            WIRE 16 400 16 464
            WIRE 16 464 16 528
            WIRE 16 528 16 560
        END BRANCH
        BUSTAP 16 336 112 336
        BUSTAP 16 400 112 400
        BUSTAP 16 464 112 464
        BUSTAP 16 528 112 528
        BEGIN BRANCH B(3)
            WIRE 112 1376 192 1376
            WIRE 192 1376 208 1376
            BEGIN DISPLAY 192 1376 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 112 1312 176 1312
            WIRE 176 1312 208 1312
            BEGIN DISPLAY 176 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 112 1248 176 1248
            WIRE 176 1248 208 1248
            BEGIN DISPLAY 176 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 112 1184 176 1184
            WIRE 176 1184 208 1184
            BEGIN DISPLAY 176 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 192 1056 B(0:3) R0 28
        BUSTAP 16 1184 112 1184
        BUSTAP 16 1312 112 1312
        BUSTAP 16 1376 112 1376
        BUSTAP 16 1248 112 1248
        BUSTAP 160 2304 256 2304
        BUSTAP 160 2368 256 2368
        IOMARKER 128 2224 Fn(0:1) R180 28
        IOMARKER 3280 832 Z(0:7) R180 28
        BEGIN BRANCH Z(7)
            WIRE 3280 2016 3376 2016
            WIRE 3376 2016 3408 2016
            BEGIN DISPLAY 3376 2016 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(6)
            WIRE 3280 1952 3360 1952
            WIRE 3360 1952 3408 1952
            BEGIN DISPLAY 3360 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(5)
            WIRE 3280 1888 3360 1888
            WIRE 3360 1888 3408 1888
            BEGIN DISPLAY 3360 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(4)
            WIRE 3280 1824 3360 1824
            WIRE 3360 1824 3408 1824
            BEGIN DISPLAY 3360 1824 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(3)
            WIRE 3280 1296 3360 1296
            WIRE 3360 1296 3408 1296
            BEGIN DISPLAY 3360 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(2)
            WIRE 3280 1232 3360 1232
            WIRE 3360 1232 3408 1232
            BEGIN DISPLAY 3360 1232 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(1)
            WIRE 3280 1168 3360 1168
            WIRE 3360 1168 3408 1168
            BEGIN DISPLAY 3360 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z(0)
            WIRE 3280 1104 3344 1104
            WIRE 3344 1104 3408 1104
            BEGIN DISPLAY 3344 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 3504 1104 3408 1104
        BUSTAP 3504 1168 3408 1168
        BUSTAP 3504 1232 3408 1232
        BUSTAP 3504 1296 3408 1296
        BUSTAP 3504 1824 3408 1824
        BUSTAP 3504 1888 3408 1888
        BUSTAP 3504 1952 3408 1952
        BUSTAP 3504 2016 3408 2016
    END SHEET
END SCHEMATIC
