VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL A4
        SIGNAL XLXN_24
        SIGNAL XLXN_25
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL Adp
        SIGNAL XLXN_40
        SIGNAL XLXN_41
        SIGNAL XLXN_42
        SIGNAL XLXN_43
        SIGNAL XLXN_44
        SIGNAL XLXN_45
        SIGNAL XLXN_47
        SIGNAL XLXN_48
        SIGNAL XLXN_49
        SIGNAL XLXN_52
        SIGNAL XLXN_53
        SIGNAL XLXN_55
        SIGNAL XLXN_56
        SIGNAL XLXN_59
        SIGNAL XLXN_68
        SIGNAL XLXN_74
        SIGNAL XLXN_104
        SIGNAL XLXN_105
        SIGNAL XLXN_106
        SIGNAL XLXN_107
        SIGNAL XLXN_108
        SIGNAL XLXN_109
        SIGNAL XLXN_110
        SIGNAL XLXN_111
        SIGNAL XLXN_112
        SIGNAL XLXN_113
        SIGNAL XLXN_114
        SIGNAL XLXN_115
        SIGNAL XLXN_116
        SIGNAL XLXN_117
        SIGNAL Zdp
        SIGNAL Zg
        SIGNAL Zf
        SIGNAL Ze
        SIGNAL XLXN_134
        SIGNAL Za
        SIGNAL Zb
        SIGNAL Zc
        SIGNAL Zd
        SIGNAL Enable
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Input A4
        PORT Input Adp
        PORT Output Zdp
        PORT Output Zg
        PORT Output Zf
        PORT Output Ze
        PORT Output Za
        PORT Output Zb
        PORT Output Zc
        PORT Output Zd
        PORT Input Enable
        BEGIN BLOCKDEF d4_16e
            TIMESTAMP 2001 3 9 11 22 33
            RECTANGLE N 64 -1152 320 -64 
            LINE N 384 -1088 320 -1088 
            LINE N 384 -1024 320 -1024 
            LINE N 384 -960 320 -960 
            LINE N 384 -896 320 -896 
            LINE N 384 -832 320 -832 
            LINE N 384 -768 320 -768 
            LINE N 384 -704 320 -704 
            LINE N 384 -640 320 -640 
            LINE N 384 -576 320 -576 
            LINE N 384 -512 320 -512 
            LINE N 384 -448 320 -448 
            LINE N 384 -384 320 -384 
            LINE N 384 -320 320 -320 
            LINE N 384 -256 320 -256 
            LINE N 384 -192 320 -192 
            LINE N 384 -128 320 -128 
            LINE N 0 -896 64 -896 
            LINE N 0 -960 64 -960 
            LINE N 0 -1024 64 -1024 
            LINE N 0 -1088 64 -1088 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF or4
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -64 48 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 48 -256 
            LINE N 256 -160 192 -160 
            ARC N 28 -208 204 -32 192 -160 112 -208 
            LINE N 112 -208 48 -208 
            LINE N 112 -112 48 -112 
            LINE N 48 -256 48 -208 
            LINE N 48 -64 48 -112 
            ARC N -40 -216 72 -104 48 -112 48 -208 
            ARC N 28 -288 204 -112 112 -112 192 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF or6
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -64 48 -64 
            LINE N 0 -128 48 -128 
            LINE N 0 -320 48 -320 
            LINE N 0 -384 48 -384 
            LINE N 256 -224 192 -224 
            LINE N 0 -256 64 -256 
            LINE N 0 -192 64 -192 
            ARC N 28 -272 204 -96 192 -224 112 -272 
            LINE N 112 -176 48 -176 
            ARC N 28 -352 204 -176 112 -176 192 -224 
            ARC N -40 -280 72 -168 48 -176 48 -272 
            LINE N 112 -272 48 -272 
            LINE N 48 -64 48 -176 
            LINE N 48 -272 48 -384 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
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
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_14 d4_16e
            PIN A0 XLXN_24
            PIN A1 XLXN_25
            PIN A2 XLXN_26
            PIN A3 XLXN_27
            PIN E XLXN_134
            PIN D0 XLXN_68
            PIN D1 XLXN_40
            PIN D10 XLXN_56
            PIN D11 XLXN_42
            PIN D12 XLXN_55
            PIN D13 XLXN_43
            PIN D14 XLXN_47
            PIN D15 XLXN_48
            PIN D2 XLXN_49
            PIN D3 XLXN_59
            PIN D4 XLXN_41
            PIN D5 XLXN_44
            PIN D6 XLXN_45
            PIN D7 XLXN_52
            PIN D8
            PIN D9 XLXN_53
        END BLOCK
        BEGIN BLOCK XLXI_16 or4
            PIN I0 XLXN_43
            PIN I1 XLXN_42
            PIN I2 XLXN_41
            PIN I3 XLXN_40
            PIN O XLXN_104
        END BLOCK
        BEGIN BLOCK XLXI_17 or6
            PIN I0 XLXN_48
            PIN I1 XLXN_47
            PIN I2 XLXN_55
            PIN I3 XLXN_42
            PIN I4 XLXN_45
            PIN I5 XLXN_44
            PIN O XLXN_105
        END BLOCK
        BEGIN BLOCK XLXI_18 or4
            PIN I0 XLXN_48
            PIN I1 XLXN_47
            PIN I2 XLXN_55
            PIN I3 XLXN_49
            PIN O XLXN_106
        END BLOCK
        BEGIN BLOCK XLXI_19 or6
            PIN I0 XLXN_48
            PIN I1 XLXN_56
            PIN I2 XLXN_53
            PIN I3 XLXN_52
            PIN I4 XLXN_41
            PIN I5 XLXN_40
            PIN O XLXN_107
        END BLOCK
        BEGIN BLOCK XLXI_20 or6
            PIN I0 XLXN_53
            PIN I1 XLXN_52
            PIN I2 XLXN_44
            PIN I3 XLXN_41
            PIN I4 XLXN_59
            PIN I5 XLXN_40
            PIN O XLXN_108
        END BLOCK
        BEGIN BLOCK XLXI_21 or4
            PIN I0 XLXN_43
            PIN I1 XLXN_59
            PIN I2 XLXN_49
            PIN I3 XLXN_40
            PIN O XLXN_109
        END BLOCK
        BEGIN BLOCK XLXI_22 or4
            PIN I0 XLXN_55
            PIN I1 XLXN_52
            PIN I2 XLXN_40
            PIN I3 XLXN_68
            PIN O XLXN_110
        END BLOCK
        BEGIN BLOCK XLXI_32 inv
            PIN I XLXN_104
            PIN O XLXN_117
        END BLOCK
        BEGIN BLOCK XLXI_33 inv
            PIN I XLXN_105
            PIN O XLXN_116
        END BLOCK
        BEGIN BLOCK XLXI_34 inv
            PIN I XLXN_106
            PIN O XLXN_115
        END BLOCK
        BEGIN BLOCK XLXI_35 inv
            PIN I XLXN_107
            PIN O XLXN_114
        END BLOCK
        BEGIN BLOCK XLXI_36 inv
            PIN I XLXN_108
            PIN O XLXN_113
        END BLOCK
        BEGIN BLOCK XLXI_37 inv
            PIN I XLXN_109
            PIN O XLXN_112
        END BLOCK
        BEGIN BLOCK XLXI_38 inv
            PIN I XLXN_110
            PIN O XLXN_111
        END BLOCK
        BEGIN BLOCK XLXI_41 bufe4
            PIN E XLXN_134
            PIN I0 XLXN_113
            PIN I1 XLXN_112
            PIN I2 XLXN_111
            PIN I3 XLXN_74
            PIN O0 Ze
            PIN O1 Zf
            PIN O2 Zg
            PIN O3 Zdp
        END BLOCK
        BEGIN BLOCK XLXI_42 bufe4
            PIN E XLXN_134
            PIN I0 XLXN_117
            PIN I1 XLXN_116
            PIN I2 XLXN_115
            PIN I3 XLXN_114
            PIN O0 Za
            PIN O1 Zb
            PIN O2 Zc
            PIN O3 Zd
        END BLOCK
        BEGIN BLOCK XLXI_43 buf4
            PIN I0 A1
            PIN I1 A2
            PIN I2 A3
            PIN I3 A4
            PIN O0 XLXN_24
            PIN O1 XLXN_25
            PIN O2 XLXN_26
            PIN O3 XLXN_27
        END BLOCK
        BEGIN BLOCK XLXI_45 buf
            PIN I Adp
            PIN O XLXN_74
        END BLOCK
        BEGIN BLOCK XLXI_44 buf
            PIN I Enable
            PIN O XLXN_134
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH A1
            WIRE 224 160 256 160
        END BRANCH
        IOMARKER 224 160 A1 R180 28
        BEGIN BRANCH A2
            WIRE 224 224 256 224
        END BRANCH
        IOMARKER 224 224 A2 R180 28
        BEGIN BRANCH A3
            WIRE 224 288 256 288
        END BRANCH
        IOMARKER 224 288 A3 R180 28
        BEGIN BRANCH A4
            WIRE 224 352 256 352
        END BRANCH
        IOMARKER 224 352 A4 R180 28
        INSTANCE XLXI_14 800 1248 R0
        BEGIN BRANCH XLXN_24
            WIRE 480 160 800 160
        END BRANCH
        BEGIN BRANCH XLXN_25
            WIRE 480 224 800 224
        END BRANCH
        BEGIN BRANCH XLXN_26
            WIRE 480 288 800 288
        END BRANCH
        BEGIN BRANCH XLXN_27
            WIRE 480 352 800 352
        END BRANCH
        BEGIN BRANCH Adp
            WIRE 224 672 256 672
        END BRANCH
        IOMARKER 224 672 Adp R180 28
        BEGIN BRANCH XLXN_49
            WIRE 1184 288 1328 288
            WIRE 1328 288 1328 784
            WIRE 1328 784 1328 1888
            WIRE 1328 1888 1984 1888
            WIRE 1328 784 1984 784
        END BRANCH
        BEGIN BRANCH XLXN_52
            WIRE 1184 608 1520 608
            WIRE 1520 608 1520 1168
            WIRE 1520 1168 1520 1696
            WIRE 1520 1696 1984 1696
            WIRE 1520 1696 1520 2208
            WIRE 1520 2208 1984 2208
            WIRE 1520 1168 1984 1168
        END BRANCH
        BEGIN BRANCH XLXN_53
            WIRE 1184 736 1600 736
            WIRE 1600 736 1600 1232
            WIRE 1600 1232 1600 1760
            WIRE 1600 1760 1984 1760
            WIRE 1600 1232 1984 1232
        END BRANCH
        BEGIN BRANCH XLXN_59
            WIRE 1184 352 1360 352
            WIRE 1360 352 1360 1504
            WIRE 1360 1504 1360 1952
            WIRE 1360 1952 1984 1952
            WIRE 1360 1504 1984 1504
        END BRANCH
        BEGIN BRANCH XLXN_68
            WIRE 1184 160 1584 160
            WIRE 1584 160 1584 2080
            WIRE 1584 2080 1984 2080
        END BRANCH
        INSTANCE XLXI_16 1984 400 R0
        INSTANCE XLXI_17 1984 784 R0
        INSTANCE XLXI_18 1984 1040 R0
        INSTANCE XLXI_19 1984 1424 R0
        INSTANCE XLXI_20 1984 1824 R0
        INSTANCE XLXI_21 1984 2080 R0
        INSTANCE XLXI_22 1984 2336 R0
        BEGIN BRANCH XLXN_74
            WIRE 480 672 496 672
            WIRE 496 672 496 2384
            WIRE 496 2384 2880 2384
            WIRE 2880 960 3040 960
            WIRE 2880 960 2880 2384
        END BRANCH
        BEGIN BRANCH XLXN_45
            WIRE 1184 544 1200 544
            WIRE 1200 464 1984 464
            WIRE 1200 464 1200 544
        END BRANCH
        BEGIN BRANCH XLXN_56
            WIRE 1184 800 1200 800
            WIRE 1200 800 1200 1296
            WIRE 1200 1296 1984 1296
        END BRANCH
        BEGIN BRANCH XLXN_40
            WIRE 1184 224 1280 224
            WIRE 1280 224 1280 1040
            WIRE 1280 1040 1280 1440
            WIRE 1280 1440 1280 1824
            WIRE 1280 1824 1984 1824
            WIRE 1280 1824 1280 2144
            WIRE 1280 2144 1984 2144
            WIRE 1280 1440 1984 1440
            WIRE 1280 1040 1984 1040
            WIRE 1280 144 1984 144
            WIRE 1280 144 1280 224
        END BRANCH
        BEGIN BRANCH XLXN_41
            WIRE 1184 416 1408 416
            WIRE 1408 416 1408 1104
            WIRE 1408 1104 1984 1104
            WIRE 1408 1104 1408 1568
            WIRE 1408 1568 1984 1568
            WIRE 1408 208 1984 208
            WIRE 1408 208 1408 416
        END BRANCH
        BEGIN BRANCH XLXN_44
            WIRE 1184 480 1440 480
            WIRE 1440 480 1440 1632
            WIRE 1440 1632 1984 1632
            WIRE 1440 400 1984 400
            WIRE 1440 400 1440 480
        END BRANCH
        BEGIN BRANCH XLXN_42
            WIRE 1184 864 1632 864
            WIRE 1632 272 1984 272
            WIRE 1632 272 1632 528
            WIRE 1632 528 1632 864
            WIRE 1632 528 1984 528
        END BRANCH
        BEGIN BRANCH XLXN_55
            WIRE 1184 928 1680 928
            WIRE 1680 928 1680 2272
            WIRE 1680 2272 1984 2272
            WIRE 1680 592 1984 592
            WIRE 1680 592 1680 848
            WIRE 1680 848 1680 928
            WIRE 1680 848 1984 848
        END BRANCH
        BEGIN BRANCH XLXN_43
            WIRE 1184 992 1712 992
            WIRE 1712 992 1712 2016
            WIRE 1712 2016 1984 2016
            WIRE 1712 336 1984 336
            WIRE 1712 336 1712 992
        END BRANCH
        BEGIN BRANCH XLXN_47
            WIRE 1184 1056 1760 1056
            WIRE 1760 656 1984 656
            WIRE 1760 656 1760 912
            WIRE 1760 912 1760 1056
            WIRE 1760 912 1984 912
        END BRANCH
        BEGIN BRANCH XLXN_48
            WIRE 1184 1120 1792 1120
            WIRE 1792 1120 1792 1360
            WIRE 1792 1360 1984 1360
            WIRE 1792 720 1984 720
            WIRE 1792 720 1792 976
            WIRE 1792 976 1792 1120
            WIRE 1792 976 1984 976
        END BRANCH
        INSTANCE XLXI_32 2320 272 R0
        INSTANCE XLXI_33 2320 592 R0
        INSTANCE XLXI_34 2304 912 R0
        INSTANCE XLXI_35 2288 1232 R0
        INSTANCE XLXI_36 2288 1632 R0
        INSTANCE XLXI_37 2288 1952 R0
        INSTANCE XLXI_38 2272 2208 R0
        BEGIN BRANCH XLXN_104
            WIRE 2240 240 2320 240
        END BRANCH
        BEGIN BRANCH XLXN_105
            WIRE 2240 560 2320 560
        END BRANCH
        BEGIN BRANCH XLXN_106
            WIRE 2240 880 2304 880
        END BRANCH
        BEGIN BRANCH XLXN_107
            WIRE 2240 1200 2288 1200
        END BRANCH
        BEGIN BRANCH XLXN_108
            WIRE 2240 1600 2288 1600
        END BRANCH
        BEGIN BRANCH XLXN_109
            WIRE 2240 1920 2288 1920
        END BRANCH
        BEGIN BRANCH XLXN_110
            WIRE 2240 2176 2272 2176
        END BRANCH
        BEGIN BRANCH XLXN_111
            WIRE 2496 2176 2768 2176
            WIRE 2768 896 2768 2176
            WIRE 2768 896 3040 896
        END BRANCH
        BEGIN BRANCH XLXN_112
            WIRE 2512 1920 2752 1920
            WIRE 2752 832 2752 1920
            WIRE 2752 832 3040 832
        END BRANCH
        BEGIN BRANCH XLXN_113
            WIRE 2512 1600 2784 1600
            WIRE 2784 768 2784 1600
            WIRE 2784 768 3040 768
        END BRANCH
        BEGIN BRANCH XLXN_114
            WIRE 2512 1200 2528 1200
            WIRE 2528 1200 2736 1200
            WIRE 2736 432 2736 1200
            WIRE 2736 432 3040 432
        END BRANCH
        BEGIN BRANCH XLXN_115
            WIRE 2528 880 2544 880
            WIRE 2544 880 2720 880
            WIRE 2720 368 2720 880
            WIRE 2720 368 3040 368
        END BRANCH
        BEGIN BRANCH XLXN_117
            WIRE 2544 240 2560 240
            WIRE 2560 240 3040 240
        END BRANCH
        BEGIN BRANCH Zdp
            WIRE 3264 960 3296 960
        END BRANCH
        BEGIN BRANCH Zg
            WIRE 3264 896 3296 896
        END BRANCH
        BEGIN BRANCH Zf
            WIRE 3264 832 3296 832
        END BRANCH
        BEGIN BRANCH Ze
            WIRE 3264 768 3296 768
        END BRANCH
        IOMARKER 3296 960 Zdp R0 28
        IOMARKER 3296 832 Zf R0 28
        IOMARKER 3296 896 Zg R0 28
        IOMARKER 3296 768 Ze R0 28
        BEGIN BRANCH Za
            WIRE 3264 240 3280 240
            WIRE 3280 240 3296 240
        END BRANCH
        BEGIN BRANCH Zb
            WIRE 3264 304 3280 304
            WIRE 3280 304 3296 304
        END BRANCH
        BEGIN BRANCH Zc
            WIRE 3264 368 3280 368
            WIRE 3280 368 3296 368
        END BRANCH
        BEGIN BRANCH Zd
            WIRE 3264 432 3280 432
            WIRE 3280 432 3296 432
        END BRANCH
        IOMARKER 3296 240 Za R0 28
        IOMARKER 3296 304 Zb R0 28
        IOMARKER 3296 368 Zc R0 28
        IOMARKER 3296 432 Zd R0 28
        BEGIN BRANCH XLXN_116
            WIRE 2544 560 2560 560
            WIRE 2560 304 3040 304
            WIRE 2560 304 2560 560
        END BRANCH
        BEGIN BRANCH XLXN_134
            WIRE 480 912 640 912
            WIRE 640 912 640 1120
            WIRE 640 1120 800 1120
            WIRE 640 1120 640 2432
            WIRE 640 2432 2912 2432
            WIRE 2912 176 3040 176
            WIRE 2912 176 2912 704
            WIRE 2912 704 3040 704
            WIRE 2912 704 2912 2432
        END BRANCH
        INSTANCE XLXI_41 3040 992 R0
        INSTANCE XLXI_42 3040 464 R0
        INSTANCE XLXI_43 256 384 R0
        INSTANCE XLXI_45 256 704 R0
        BEGIN BRANCH Enable
            WIRE 224 912 256 912
        END BRANCH
        INSTANCE XLXI_44 256 944 R0
        IOMARKER 224 912 Enable R180 28
        BEGIN DISPLAY 1224 2536 TEXT "Hex to 7Seg Display"
            FONT 64 "Arial"
        END DISPLAY
    END SHEET
END SCHEMATIC
