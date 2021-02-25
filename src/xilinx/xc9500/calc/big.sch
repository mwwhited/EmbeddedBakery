VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_95
        SIGNAL XLXN_120
        SIGNAL XLXN_58
        SIGNAL XLXN_59
        SIGNAL zdp
        SIGNAL zg
        SIGNAL zf
        SIGNAL ze
        SIGNAL zd
        SIGNAL zc
        SIGNAL zb
        SIGNAL za
        SIGNAL XLXN_79
        SIGNAL XLXN_80
        SIGNAL XLXN_81
        SIGNAL XLXN_82
        SIGNAL XLXN_83
        SIGNAL XLXN_84
        SIGNAL XLXN_100
        SIGNAL XLXN_101
        SIGNAL XLXN_102
        SIGNAL XLXN_103
        SIGNAL XLXN_104
        SIGNAL o8
        SIGNAL o7
        SIGNAL o6
        SIGNAL o5
        SIGNAL o4
        SIGNAL o3
        SIGNAL o2
        SIGNAL o1
        SIGNAL j4
        SIGNAL j3
        SIGNAL j2
        SIGNAL j1
        SIGNAL i4
        SIGNAL i3
        SIGNAL i2
        SIGNAL addsub
        SIGNAL i1
        SIGNAL XLXN_215
        SIGNAL XLXN_219
        SIGNAL XLXN_220
        SIGNAL XLXN_221
        SIGNAL XLXN_222
        SIGNAL XLXN_223
        SIGNAL XLXN_224
        SIGNAL XLXN_225
        SIGNAL XLXN_226
        SIGNAL XLXN_248
        SIGNAL XLXN_249
        SIGNAL XLXN_250
        SIGNAL XLXN_251
        SIGNAL XLXN_252
        SIGNAL XLXN_253
        SIGNAL XLXN_254
        SIGNAL XLXN_255
        SIGNAL XLXN_256
        PORT Output zdp
        PORT Output zg
        PORT Output zf
        PORT Output ze
        PORT Output zd
        PORT Output zc
        PORT Output zb
        PORT Output za
        PORT Output o8
        PORT Output o7
        PORT Output o6
        PORT Output o5
        PORT Output o4
        PORT Output o3
        PORT Output o2
        PORT Output o1
        PORT Input j4
        PORT Input j3
        PORT Input j2
        PORT Input j1
        PORT Input i4
        PORT Input i3
        PORT Input i2
        PORT Input addsub
        PORT Input i1
        BEGIN BLOCKDEF hex27seg
            TIMESTAMP 2004 10 8 5 19 52
            RECTANGLE N 64 -512 320 0 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF eightbits
            TIMESTAMP 2004 10 8 5 20 30
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
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF sevenseg
            TIMESTAMP 2004 10 8 5 16 9
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
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2001 3 9 11 23 11
            LINE N 96 -64 32 -64 
            LINE N 64 0 64 -32 
            LINE N 64 -32 64 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF eightleds
            TIMESTAMP 2004 10 8 5 42 41
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
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF momentsw
            TIMESTAMP 2004 10 8 22 55 3
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF adsu4
            TIMESTAMP 2001 5 11 10 40 27
            LINE N 64 -832 112 -832 
            LINE N 112 -832 112 -804 
            LINE N 128 -96 128 -64 
            LINE N 128 -64 64 -64 
            LINE N 0 -832 64 -832 
            LINE N 0 -192 64 -192 
            LINE N 448 -352 384 -352 
            LINE N 448 -416 384 -416 
            LINE N 448 -480 384 -480 
            LINE N 448 -544 384 -544 
            LINE N 0 -64 64 -64 
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            LINE N 0 -384 64 -384 
            LINE N 0 -512 64 -512 
            LINE N 0 -576 64 -576 
            LINE N 0 -640 64 -640 
            LINE N 0 -704 64 -704 
            LINE N 240 -124 240 -64 
            LINE N 240 -64 384 -64 
            LINE N 384 -128 336 -128 
            LINE N 336 -128 336 -148 
            LINE N 64 -816 64 -480 
            LINE N 64 -480 144 -448 
            LINE N 144 -448 64 -416 
            LINE N 64 -416 64 -80 
            LINE N 64 -80 384 -160 
            LINE N 384 -160 384 -736 
            LINE N 384 -736 64 -816 
            LINE N 448 -64 384 -64 
            LINE N 448 -128 384 -128 
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
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2001 3 9 11 23 50
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
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
        BEGIN BLOCK XLXI_2 hex27seg
            PIN A1 XLXN_100
            PIN A2 XLXN_101
            PIN A3 XLXN_102
            PIN A4 XLXN_103
            PIN Adp XLXN_104
            PIN Enable XLXN_95
            PIN Za XLXN_79
            PIN Zb XLXN_80
            PIN Zc XLXN_81
            PIN Zd XLXN_82
            PIN Ze XLXN_83
            PIN Zf XLXN_84
            PIN Zg XLXN_59
            PIN Zdp XLXN_58
        END BLOCK
        BEGIN BLOCK XLXI_4 sevenseg
            PIN Aa XLXN_79
            PIN Ab XLXN_80
            PIN Ac XLXN_81
            PIN Ad XLXN_82
            PIN Ae XLXN_83
            PIN Af XLXN_84
            PIN Ag XLXN_59
            PIN Adp XLXN_58
            PIN Enable XLXN_95
            PIN Za za
            PIN Zb zb
            PIN Zc zc
            PIN Zd zd
            PIN Ze ze
            PIN Zf zf
            PIN Zg zg
            PIN Zdp zdp
        END BLOCK
        BEGIN BLOCK XLXI_6 eightleds
            PIN A1 XLXN_120
            PIN A2 XLXN_254
            PIN A3 XLXN_256
            PIN A4 XLXN_104
            PIN A5 XLXN_103
            PIN A6 XLXN_102
            PIN A7 XLXN_101
            PIN A8 XLXN_100
            PIN Enable XLXN_95
            PIN Z1 o1
            PIN Z2 o2
            PIN Z3 o3
            PIN Z4 o4
            PIN Z5 o5
            PIN Z6 o6
            PIN Z7 o7
            PIN Z8 o8
        END BLOCK
        BEGIN BLOCK XLXI_8 momentsw
            PIN A1 addsub
            PIN Enable XLXN_95
            PIN Z1 XLXN_120
        END BLOCK
        BEGIN BLOCK XLXI_3 eightbits
            PIN A1 i1
            PIN A2 i2
            PIN A3 i3
            PIN A4 i4
            PIN A5 j1
            PIN A6 j2
            PIN A7 j3
            PIN A8 j4
            PIN Enable XLXN_95
            PIN Z0 XLXN_219
            PIN Z1 XLXN_220
            PIN Z2 XLXN_221
            PIN Z3 XLXN_222
            PIN Z4 XLXN_226
            PIN Z5 XLXN_225
            PIN Z6 XLXN_224
            PIN Z7 XLXN_223
        END BLOCK
        BEGIN BLOCK XLXI_24 gnd
            PIN G XLXN_215
        END BLOCK
        BEGIN BLOCK XLXI_30 vcc
            PIN P XLXN_95
        END BLOCK
        BEGIN BLOCK XLXI_36 adsu4
            PIN A0 XLXN_222
            PIN A1 XLXN_221
            PIN A2 XLXN_220
            PIN A3 XLXN_219
            PIN ADD XLXN_120
            PIN B0 XLXN_223
            PIN B1 XLXN_224
            PIN B2 XLXN_225
            PIN B3 XLXN_226
            PIN CI XLXN_215
            PIN CO XLXN_104
            PIN OFL XLXN_256
            PIN S0 XLXN_248
            PIN S1 XLXN_249
            PIN S2 XLXN_250
            PIN S3 XLXN_251
        END BLOCK
        BEGIN BLOCK XLXI_37 xor2
            PIN I0 XLXN_248
            PIN I1 XLXN_254
            PIN O XLXN_100
        END BLOCK
        BEGIN BLOCK XLXI_38 xor2
            PIN I0 XLXN_249
            PIN I1 XLXN_254
            PIN O XLXN_101
        END BLOCK
        BEGIN BLOCK XLXI_39 xor2
            PIN I0 XLXN_250
            PIN I1 XLXN_254
            PIN O XLXN_102
        END BLOCK
        BEGIN BLOCK XLXI_40 xor2
            PIN I0 XLXN_251
            PIN I1 XLXN_254
            PIN O XLXN_103
        END BLOCK
        BEGIN BLOCK XLXI_45 inv
            PIN I XLXN_120
            PIN O XLXN_254
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH XLXN_120
            WIRE 736 1168 1248 1168
            WIRE 1248 1168 1248 2048
            WIRE 1248 2048 1920 2048
            WIRE 1120 848 1120 1024
            WIRE 1120 1024 1120 2048
            WIRE 1120 2048 1248 2048
            WIRE 1120 1024 1200 1024
            WIRE 1920 1968 1920 2048
            WIRE 1920 1968 2752 1968
        END BRANCH
        BEGIN BRANCH XLXN_58
            WIRE 2576 1696 2736 1696
        END BRANCH
        BEGIN BRANCH XLXN_59
            WIRE 2576 1632 2736 1632
        END BRANCH
        BEGIN BRANCH zdp
            WIRE 3120 1696 3152 1696
        END BRANCH
        BEGIN BRANCH zg
            WIRE 3120 1632 3152 1632
        END BRANCH
        BEGIN BRANCH zf
            WIRE 3120 1568 3152 1568
        END BRANCH
        BEGIN BRANCH ze
            WIRE 3120 1504 3152 1504
        END BRANCH
        BEGIN BRANCH zd
            WIRE 3120 1440 3152 1440
        END BRANCH
        BEGIN BRANCH zc
            WIRE 3120 1376 3152 1376
        END BRANCH
        BEGIN BRANCH zb
            WIRE 3120 1312 3152 1312
        END BRANCH
        BEGIN BRANCH za
            WIRE 3120 1248 3152 1248
        END BRANCH
        BEGIN BRANCH XLXN_79
            WIRE 2576 1248 2736 1248
        END BRANCH
        BEGIN BRANCH XLXN_80
            WIRE 2576 1312 2736 1312
        END BRANCH
        BEGIN BRANCH XLXN_81
            WIRE 2576 1376 2736 1376
        END BRANCH
        BEGIN BRANCH XLXN_82
            WIRE 2576 1440 2736 1440
        END BRANCH
        BEGIN BRANCH XLXN_83
            WIRE 2576 1504 2736 1504
        END BRANCH
        BEGIN BRANCH XLXN_84
            WIRE 2576 1568 2736 1568
        END BRANCH
        BEGIN BRANCH XLXN_103
            WIRE 1936 640 1984 640
            WIRE 1984 640 1984 1440
            WIRE 1984 1440 2192 1440
            WIRE 1984 1440 1984 2224
            WIRE 1984 2224 2752 2224
        END BRANCH
        BEGIN INSTANCE XLXI_2 2192 1728 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 2736 1792 R0
        END INSTANCE
        IOMARKER 3152 1696 zdp R0 28
        IOMARKER 3152 1632 zg R0 28
        IOMARKER 3152 1568 zf R0 28
        IOMARKER 3152 1504 ze R0 28
        IOMARKER 3152 1440 zd R0 28
        IOMARKER 3152 1376 zc R0 28
        IOMARKER 3152 1312 zb R0 28
        IOMARKER 3152 1248 za R0 28
        BEGIN BRANCH XLXN_104
            WIRE 1568 848 1568 1728
            WIRE 1568 1728 2000 1728
            WIRE 2000 1728 2000 2160
            WIRE 2000 2160 2752 2160
            WIRE 2000 1504 2192 1504
            WIRE 2000 1504 2000 1728
        END BRANCH
        BEGIN BRANCH XLXN_102
            WIRE 1936 496 1968 496
            WIRE 1968 496 1968 1376
            WIRE 1968 1376 2192 1376
            WIRE 1968 1376 1968 2288
            WIRE 1968 2288 2752 2288
        END BRANCH
        BEGIN BRANCH XLXN_101
            WIRE 1936 352 1952 352
            WIRE 1952 352 1952 1312
            WIRE 1952 1312 2192 1312
            WIRE 1952 1312 1952 2352
            WIRE 1952 2352 2752 2352
        END BRANCH
        IOMARKER 3168 2416 o8 R0 28
        IOMARKER 3168 2352 o7 R0 28
        IOMARKER 3168 2288 o6 R0 28
        IOMARKER 3168 2224 o5 R0 28
        IOMARKER 3168 2160 o4 R0 28
        IOMARKER 3168 2096 o3 R0 28
        IOMARKER 3168 2032 o2 R0 28
        IOMARKER 3168 1968 o1 R0 28
        BEGIN BRANCH o8
            WIRE 3136 2416 3168 2416
        END BRANCH
        BEGIN BRANCH o7
            WIRE 3136 2352 3168 2352
        END BRANCH
        BEGIN BRANCH o6
            WIRE 3136 2288 3168 2288
        END BRANCH
        BEGIN BRANCH o5
            WIRE 3136 2224 3168 2224
        END BRANCH
        BEGIN BRANCH o4
            WIRE 3136 2160 3168 2160
        END BRANCH
        BEGIN BRANCH o3
            WIRE 3136 2096 3168 2096
        END BRANCH
        BEGIN BRANCH o2
            WIRE 3136 2032 3168 2032
        END BRANCH
        BEGIN BRANCH o1
            WIRE 3136 1968 3168 1968
        END BRANCH
        BEGIN INSTANCE XLXI_6 2752 2512 R0
        END INSTANCE
        BEGIN BRANCH j4
            WIRE 352 816 384 816
        END BRANCH
        BEGIN BRANCH j3
            WIRE 352 752 384 752
        END BRANCH
        BEGIN BRANCH j2
            WIRE 352 688 384 688
        END BRANCH
        BEGIN BRANCH j1
            WIRE 352 624 384 624
        END BRANCH
        BEGIN BRANCH i4
            WIRE 352 560 384 560
        END BRANCH
        BEGIN BRANCH i3
            WIRE 352 496 384 496
        END BRANCH
        BEGIN BRANCH i2
            WIRE 352 432 384 432
        END BRANCH
        BEGIN INSTANCE XLXI_8 352 1264 R0
        END INSTANCE
        BEGIN BRANCH addsub
            WIRE 320 1168 352 1168
        END BRANCH
        BEGIN BRANCH i1
            WIRE 352 368 384 368
        END BRANCH
        BEGIN INSTANCE XLXI_3 384 912 R0
        END INSTANCE
        BEGIN BRANCH XLXN_215
            WIRE 816 80 816 96
            WIRE 816 80 1120 80
        END BRANCH
        INSTANCE XLXI_24 752 224 R0
        BEGIN BRANCH XLXN_219
            WIRE 768 368 944 368
            WIRE 944 368 944 400
            WIRE 944 400 1120 400
        END BRANCH
        BEGIN BRANCH XLXN_220
            WIRE 768 432 928 432
            WIRE 928 336 928 432
            WIRE 928 336 1120 336
        END BRANCH
        BEGIN BRANCH XLXN_221
            WIRE 768 496 912 496
            WIRE 912 272 912 496
            WIRE 912 272 1120 272
        END BRANCH
        BEGIN BRANCH XLXN_222
            WIRE 768 560 896 560
            WIRE 896 208 896 560
            WIRE 896 208 1120 208
        END BRANCH
        BEGIN BRANCH XLXN_223
            WIRE 768 816 944 816
            WIRE 944 528 944 816
            WIRE 944 528 1120 528
        END BRANCH
        BEGIN BRANCH XLXN_224
            WIRE 768 752 928 752
            WIRE 928 592 928 752
            WIRE 928 592 1120 592
        END BRANCH
        BEGIN BRANCH XLXN_225
            WIRE 768 688 1104 688
            WIRE 1104 656 1104 688
            WIRE 1104 656 1120 656
        END BRANCH
        BEGIN BRANCH XLXN_226
            WIRE 768 624 912 624
            WIRE 912 624 912 720
            WIRE 912 720 1120 720
        END BRANCH
        IOMARKER 352 816 j4 R180 28
        IOMARKER 352 752 j3 R180 28
        IOMARKER 352 688 j2 R180 28
        IOMARKER 352 624 j1 R180 28
        IOMARKER 352 560 i4 R180 28
        IOMARKER 352 496 i3 R180 28
        IOMARKER 352 432 i2 R180 28
        IOMARKER 352 368 i1 R180 28
        IOMARKER 320 1168 addsub R180 28
        BEGIN BRANCH XLXN_95
            WIRE 112 1200 112 1232
            WIRE 112 1232 240 1232
            WIRE 240 1232 352 1232
            WIRE 240 1232 240 1872
            WIRE 240 1872 496 1872
            WIRE 496 1872 496 1952
            WIRE 496 1952 1776 1952
            WIRE 1776 1952 1776 2480
            WIRE 1776 2480 2752 2480
            WIRE 496 1872 800 1872
            WIRE 304 880 384 880
            WIRE 304 880 304 992
            WIRE 304 992 800 992
            WIRE 800 992 800 1872
            WIRE 1776 1568 2192 1568
            WIRE 1776 1568 1776 1760
            WIRE 1776 1760 1776 1952
            WIRE 1776 1760 2736 1760
        END BRANCH
        INSTANCE XLXI_30 48 1200 R0
        INSTANCE XLXI_36 1120 912 R0
        INSTANCE XLXI_37 1680 304 R0
        INSTANCE XLXI_38 1680 448 R0
        INSTANCE XLXI_39 1680 592 R0
        INSTANCE XLXI_40 1680 736 R0
        BEGIN BRANCH XLXN_100
            WIRE 1936 208 2000 208
            WIRE 2000 208 2000 1248
            WIRE 2000 1248 2192 1248
            WIRE 2000 1248 2000 2416
            WIRE 2000 2416 2752 2416
        END BRANCH
        BEGIN BRANCH XLXN_248
            WIRE 1568 368 1616 368
            WIRE 1616 240 1616 368
            WIRE 1616 240 1680 240
        END BRANCH
        BEGIN BRANCH XLXN_249
            WIRE 1568 432 1616 432
            WIRE 1616 384 1616 432
            WIRE 1616 384 1680 384
        END BRANCH
        BEGIN BRANCH XLXN_250
            WIRE 1568 496 1616 496
            WIRE 1616 496 1616 528
            WIRE 1616 528 1680 528
        END BRANCH
        BEGIN BRANCH XLXN_251
            WIRE 1568 560 1616 560
            WIRE 1616 560 1616 672
            WIRE 1616 672 1680 672
        END BRANCH
        BEGIN BRANCH XLXN_254
            WIRE 1424 1024 1664 1024
            WIRE 1664 1024 1664 2032
            WIRE 1664 2032 2752 2032
            WIRE 1664 176 1680 176
            WIRE 1664 176 1664 320
            WIRE 1664 320 1680 320
            WIRE 1664 320 1664 464
            WIRE 1664 464 1680 464
            WIRE 1664 464 1664 608
            WIRE 1664 608 1680 608
            WIRE 1664 608 1664 1024
        END BRANCH
        INSTANCE XLXI_45 1200 1056 R0
        BEGIN BRANCH XLXN_256
            WIRE 1568 784 2160 784
            WIRE 2160 784 2160 2096
            WIRE 2160 2096 2752 2096
        END BRANCH
    END SHEET
END SCHEMATIC
