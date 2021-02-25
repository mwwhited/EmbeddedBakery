VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL Cin
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL B0
        SIGNAL B1
        SIGNAL B3
        SIGNAL A4
        SIGNAL A5
        SIGNAL A6
        SIGNAL A7
        SIGNAL B4
        SIGNAL B5
        SIGNAL B6
        SIGNAL B7
        SIGNAL Cout
        SIGNAL Z7
        SIGNAL Z6
        SIGNAL Z5
        SIGNAL Z4
        SIGNAL Z3
        SIGNAL Z2
        SIGNAL Z1
        SIGNAL Z0
        SIGNAL XLXN_39
        SIGNAL XLXN_47
        SIGNAL B2
        PORT Input Cin
        PORT Input A0
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Input B0
        PORT Input B1
        PORT Input B3
        PORT Input A4
        PORT Input A5
        PORT Input A6
        PORT Input A7
        PORT Input B4
        PORT Input B5
        PORT Input B6
        PORT Input B7
        PORT Output Cout
        PORT Output Z7
        PORT Output Z6
        PORT Output Z5
        PORT Output Z4
        PORT Output Z3
        PORT Output Z2
        PORT Output Z1
        PORT Output Z0
        PORT Input B2
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
        BEGIN BLOCK XLXI_1 add4
            PIN A0 A0
            PIN A1 A1
            PIN A2 A2
            PIN A3 A3
            PIN B0 B0
            PIN B1 B1
            PIN B2 B2
            PIN B3 B3
            PIN CI Cin
            PIN CO XLXN_1
            PIN OFL
            PIN S0 Z0
            PIN S1 Z1
            PIN S2 Z2
            PIN S3 Z3
        END BLOCK
        BEGIN BLOCK XLXI_2 add4
            PIN A0 A4
            PIN A1 A5
            PIN A2 A6
            PIN A3 A7
            PIN B0 B4
            PIN B1 B5
            PIN B2 B6
            PIN B3 B7
            PIN CI XLXN_1
            PIN CO Cout
            PIN OFL
            PIN S0 Z4
            PIN S1 Z5
            PIN S2 Z6
            PIN S3 Z7
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1280 992 R0
        BEGIN BRANCH XLXN_1
            WIRE 1728 928 1920 928
        END BRANCH
        INSTANCE XLXI_2 1920 1760 R0
        BEGIN BRANCH Cin
            WIRE 416 80 1264 80
            WIRE 1264 80 1264 160
            WIRE 1264 160 1280 160
        END BRANCH
        BEGIN BRANCH A0
            WIRE 416 176 1120 176
            WIRE 1120 176 1120 288
            WIRE 1120 288 1280 288
        END BRANCH
        BEGIN BRANCH B3
            WIRE 416 704 960 704
            WIRE 960 704 960 800
            WIRE 960 800 1280 800
        END BRANCH
        BEGIN BRANCH Cout
            WIRE 2368 1696 2384 1696
            WIRE 2384 1696 2624 1696
        END BRANCH
        BEGIN BRANCH Z7
            WIRE 2368 1408 2528 1408
            WIRE 2528 560 2528 1408
            WIRE 2528 560 2608 560
        END BRANCH
        BEGIN BRANCH Z6
            WIRE 2368 1344 2512 1344
            WIRE 2512 528 2512 1344
            WIRE 2512 528 2608 528
        END BRANCH
        BEGIN BRANCH Z5
            WIRE 2368 1280 2496 1280
            WIRE 2496 496 2496 1280
            WIRE 2496 496 2608 496
        END BRANCH
        BEGIN BRANCH Z3
            WIRE 1728 640 2464 640
            WIRE 2464 432 2608 432
            WIRE 2464 432 2464 640
        END BRANCH
        BEGIN BRANCH Z2
            WIRE 1728 576 2448 576
            WIRE 2448 400 2608 400
            WIRE 2448 400 2448 576
        END BRANCH
        BEGIN BRANCH Z1
            WIRE 1728 512 2432 512
            WIRE 2432 368 2608 368
            WIRE 2432 368 2432 512
        END BRANCH
        IOMARKER 416 80 Cin R180 28
        IOMARKER 416 176 A0 R180 28
        BEGIN BRANCH A1
            WIRE 416 208 1104 208
            WIRE 1104 208 1104 352
            WIRE 1104 352 1280 352
        END BRANCH
        BEGIN BRANCH A2
            WIRE 416 240 1088 240
            WIRE 1088 240 1088 416
            WIRE 1088 416 1280 416
        END BRANCH
        BEGIN BRANCH A3
            WIRE 416 272 1072 272
            WIRE 1072 272 1072 480
            WIRE 1072 480 1280 480
        END BRANCH
        BEGIN BRANCH B0
            WIRE 416 608 1280 608
        END BRANCH
        IOMARKER 416 208 A1 R180 28
        IOMARKER 416 240 A2 R180 28
        IOMARKER 416 272 A3 R180 28
        IOMARKER 416 304 A4 R180 28
        BEGIN BRANCH A4
            WIRE 416 304 1056 304
            WIRE 1056 304 1056 1056
            WIRE 1056 1056 1920 1056
        END BRANCH
        IOMARKER 416 336 A5 R180 28
        BEGIN BRANCH A5
            WIRE 416 336 1040 336
            WIRE 1040 336 1040 1120
            WIRE 1040 1120 1920 1120
        END BRANCH
        IOMARKER 416 368 A6 R180 28
        BEGIN BRANCH A6
            WIRE 416 368 1024 368
            WIRE 1024 368 1024 1184
            WIRE 1024 1184 1920 1184
        END BRANCH
        IOMARKER 416 400 A7 R180 28
        BEGIN BRANCH A7
            WIRE 416 400 1008 400
            WIRE 1008 400 1008 1248
            WIRE 1008 1248 1920 1248
        END BRANCH
        BEGIN BRANCH B1
            WIRE 416 640 992 640
            WIRE 992 640 992 672
            WIRE 992 672 1280 672
        END BRANCH
        IOMARKER 416 608 B0 R180 28
        IOMARKER 416 640 B1 R180 28
        IOMARKER 416 672 B2 R180 28
        BEGIN BRANCH B2
            WIRE 416 672 976 672
            WIRE 976 672 976 736
            WIRE 976 736 1280 736
        END BRANCH
        IOMARKER 416 704 B3 R180 28
        IOMARKER 416 736 B4 R180 28
        BEGIN BRANCH B4
            WIRE 416 736 944 736
            WIRE 944 736 944 1376
            WIRE 944 1376 1920 1376
        END BRANCH
        IOMARKER 416 768 B5 R180 28
        BEGIN BRANCH B5
            WIRE 416 768 928 768
            WIRE 928 768 928 1440
            WIRE 928 1440 1920 1440
        END BRANCH
        IOMARKER 416 800 B6 R180 28
        BEGIN BRANCH B6
            WIRE 416 800 912 800
            WIRE 912 800 912 1504
            WIRE 912 1504 1920 1504
        END BRANCH
        IOMARKER 416 832 B7 R180 28
        BEGIN BRANCH B7
            WIRE 416 832 896 832
            WIRE 896 832 896 1568
            WIRE 896 1568 1920 1568
        END BRANCH
        IOMARKER 2608 336 Z0 R0 28
        BEGIN BRANCH Z0
            WIRE 1728 448 2416 448
            WIRE 2416 336 2608 336
            WIRE 2416 336 2416 448
        END BRANCH
        IOMARKER 2608 368 Z1 R0 28
        IOMARKER 2608 400 Z2 R0 28
        IOMARKER 2608 432 Z3 R0 28
        IOMARKER 2608 464 Z4 R0 28
        BEGIN BRANCH Z4
            WIRE 2368 1216 2480 1216
            WIRE 2480 464 2608 464
            WIRE 2480 464 2480 1216
        END BRANCH
        IOMARKER 2608 496 Z5 R0 28
        IOMARKER 2608 528 Z6 R0 28
        IOMARKER 2608 560 Z7 R0 28
        IOMARKER 2624 1696 Cout R0 28
    END SHEET
END SCHEMATIC
