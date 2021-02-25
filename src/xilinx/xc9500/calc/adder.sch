VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_183
        SIGNAL XLXN_185
        SIGNAL XLXN_187
        SIGNAL XLXN_190
        SIGNAL XLXN_204
        SIGNAL XLXN_206
        SIGNAL XLXN_209
        SIGNAL XLXN_211
        SIGNAL XLXN_213
        SIGNAL XLXN_216
        SIGNAL XLXN_218
        SIGNAL XLXN_220
        SIGNAL XLXN_231
        SIGNAL XLXN_235
        SIGNAL XLXN_242
        SIGNAL XLXN_244
        SIGNAL XLXN_246
        SIGNAL XLXN_249
        SIGNAL XLXN_259
        SIGNAL XLXN_261
        SIGNAL XLXN_264
        SIGNAL XLXN_266
        SIGNAL XLXN_268
        SIGNAL XLXN_271
        SIGNAL XLXN_273
        SIGNAL XLXN_275
        SIGNAL XLXN_171
        SIGNAL Z1
        SIGNAL Z2
        SIGNAL Z3
        SIGNAL Z4
        SIGNAL XLXN_170
        SIGNAL XLXN_286
        SIGNAL Zco
        SIGNAL XLXN_290
        SIGNAL XLXN_182
        SIGNAL XLXN_297
        SIGNAL XLXN_299
        SIGNAL XLXN_2
        SIGNAL XLXN_301
        SIGNAL XLXN_4
        SIGNAL XLXN_304
        SIGNAL XLXN_7
        SIGNAL XLXN_10
        SIGNAL XLXN_21
        SIGNAL XLXN_314
        SIGNAL XLXN_23
        SIGNAL XLXN_316
        SIGNAL XLXN_24
        SIGNAL XLXN_25
        SIGNAL XLXN_319
        SIGNAL XLXN_26
        SIGNAL XLXN_321
        SIGNAL XLXN_28
        SIGNAL XLXN_323
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL XLXN_326
        SIGNAL XLXN_35
        SIGNAL XLXN_328
        SIGNAL XLXN_37
        SIGNAL XLXN_330
        SIGNAL XLXN_38
        SIGNAL XLXN_39
        SIGNAL Enable
        SIGNAL XLXN_345
        SIGNAL XLXN_347
        SIGNAL XLXN_348
        SIGNAL XLXN_349
        SIGNAL XLXN_350
        SIGNAL XLXN_351
        SIGNAL XLXN_352
        SIGNAL XLXN_354
        SIGNAL XLXN_355
        SIGNAL XLXN_356
        SIGNAL B1
        SIGNAL B2
        SIGNAL B3
        SIGNAL B4
        SIGNAL XLXN_346
        SIGNAL XLXN_353
        SIGNAL Add_Sub
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL A4
        SIGNAL XLXN_370
        SIGNAL XLXN_371
        SIGNAL XLXN_373
        SIGNAL XLXN_374
        SIGNAL XLXN_375
        SIGNAL XLXN_378
        SIGNAL XLXN_379
        SIGNAL XLXN_381
        SIGNAL XLXN_382
        SIGNAL XLXN_383
        SIGNAL XLXN_384
        SIGNAL XLXN_385
        SIGNAL XLXN_386
        SIGNAL XLXN_387
        SIGNAL XLXN_388
        SIGNAL XLXN_389
        PORT Output Z1
        PORT Output Z2
        PORT Output Z3
        PORT Output Z4
        PORT Output Zco
        PORT Input Enable
        PORT Input B1
        PORT Input B2
        PORT Input B3
        PORT Input B4
        PORT Input Add_Sub
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Input A4
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
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 3 9 11 21 49
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
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
        BEGIN BLOCK XLXI_121 bufe4
            PIN E XLXN_182
            PIN I0 XLXN_384
            PIN I1 XLXN_383
            PIN I2 XLXN_375
            PIN I3 XLXN_378
            PIN O0 Z1
            PIN O1 Z2
            PIN O2 Z3
            PIN O3 Z4
        END BLOCK
        BEGIN BLOCK XLXI_122 bufe
            PIN E XLXN_182
            PIN I XLXN_379
            PIN O Zco
        END BLOCK
        BEGIN BLOCK XLXI_11 and2
            PIN I0 XLXN_355
            PIN I1 XLXN_2
            PIN O XLXN_21
        END BLOCK
        BEGIN BLOCK XLXI_27 xor2
            PIN I0 XLXN_355
            PIN I1 XLXN_2
            PIN O XLXN_374
        END BLOCK
        BEGIN BLOCK XLXI_12 and2
            PIN I0 XLXN_23
            PIN I1 XLXN_21
            PIN O XLXN_24
        END BLOCK
        BEGIN BLOCK XLXI_26 xor2
            PIN I0 XLXN_23
            PIN I1 XLXN_21
            PIN O XLXN_373
        END BLOCK
        BEGIN BLOCK XLXI_18 xor2
            PIN I0 XLXN_25
            PIN I1 XLXN_24
            PIN O XLXN_26
        END BLOCK
        BEGIN BLOCK XLXI_19 xor2
            PIN I0 XLXN_28
            PIN I1 XLXN_26
            PIN O XLXN_385
        END BLOCK
        BEGIN BLOCK XLXI_13 and2
            PIN I0 XLXN_28
            PIN I1 XLXN_26
            PIN O XLXN_33
        END BLOCK
        BEGIN BLOCK XLXI_20 xor2
            PIN I0 XLXN_352
            PIN I1 XLXN_4
            PIN O XLXN_23
        END BLOCK
        BEGIN BLOCK XLXI_14 and2
            PIN I0 XLXN_352
            PIN I1 XLXN_4
            PIN O XLXN_25
        END BLOCK
        BEGIN BLOCK XLXI_21 xor2
            PIN I0 XLXN_34
            PIN I1 XLXN_33
            PIN O XLXN_35
        END BLOCK
        BEGIN BLOCK XLXI_22 xor2
            PIN I0 XLXN_37
            PIN I1 XLXN_35
            PIN O XLXN_371
        END BLOCK
        BEGIN BLOCK XLXI_15 and2
            PIN I0 XLXN_37
            PIN I1 XLXN_35
            PIN O XLXN_38
        END BLOCK
        BEGIN BLOCK XLXI_23 xor2
            PIN I0 XLXN_348
            PIN I1 XLXN_7
            PIN O XLXN_28
        END BLOCK
        BEGIN BLOCK XLXI_16 and2
            PIN I0 XLXN_348
            PIN I1 XLXN_7
            PIN O XLXN_34
        END BLOCK
        BEGIN BLOCK XLXI_25 xor2
            PIN I0 XLXN_39
            PIN I1 XLXN_38
            PIN O XLXN_370
        END BLOCK
        BEGIN BLOCK XLXI_24 xor2
            PIN I0 XLXN_345
            PIN I1 XLXN_10
            PIN O XLXN_37
        END BLOCK
        BEGIN BLOCK XLXI_17 and2
            PIN I0 XLXN_345
            PIN I1 XLXN_10
            PIN O XLXN_39
        END BLOCK
        BEGIN BLOCK XLXI_123 buf
            PIN I Enable
            PIN O XLXN_182
        END BLOCK
        BEGIN BLOCK XLXI_149 xor2
            PIN I0 XLXN_346
            PIN I1 XLXN_356
            PIN O XLXN_345
        END BLOCK
        BEGIN BLOCK XLXI_198 xor2
            PIN I0 XLXN_349
            PIN I1 XLXN_356
            PIN O XLXN_348
        END BLOCK
        BEGIN BLOCK XLXI_199 xor2
            PIN I0 XLXN_356
            PIN I1 XLXN_350
            PIN O XLXN_352
        END BLOCK
        BEGIN BLOCK XLXI_200 xor2
            PIN I0 XLXN_356
            PIN I1 XLXN_353
            PIN O XLXN_355
        END BLOCK
        BEGIN BLOCK XLXI_124 buf4
            PIN I0 B1
            PIN I1 B2
            PIN I2 B3
            PIN I3 B4
            PIN O0 XLXN_346
            PIN O1 XLXN_349
            PIN O2 XLXN_350
            PIN O3 XLXN_353
        END BLOCK
        BEGIN BLOCK XLXI_150 buf
            PIN I Add_Sub
            PIN O XLXN_356
        END BLOCK
        BEGIN BLOCK XLXI_125 buf4
            PIN I0 A1
            PIN I1 A2
            PIN I2 A3
            PIN I3 A4
            PIN O0 XLXN_10
            PIN O1 XLXN_7
            PIN O2 XLXN_4
            PIN O3 XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_204 xor2
            PIN I0 XLXN_356
            PIN I1 XLXN_374
            PIN O XLXN_384
        END BLOCK
        BEGIN BLOCK XLXI_205 xor2
            PIN I0 XLXN_356
            PIN I1 XLXN_373
            PIN O XLXN_383
        END BLOCK
        BEGIN BLOCK XLXI_206 xor2
            PIN I0 XLXN_356
            PIN I1 XLXN_385
            PIN O XLXN_375
        END BLOCK
        BEGIN BLOCK XLXI_207 xor2
            PIN I0 XLXN_356
            PIN I1 XLXN_371
            PIN O XLXN_378
        END BLOCK
        BEGIN BLOCK XLXI_208 xor2
            PIN I0 XLXN_356
            PIN I1 XLXN_370
            PIN O XLXN_379
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH Z1
            WIRE 3264 1008 3296 1008
        END BRANCH
        BEGIN BRANCH Z2
            WIRE 3264 1072 3296 1072
        END BRANCH
        BEGIN BRANCH Z3
            WIRE 3264 1136 3296 1136
        END BRANCH
        BEGIN BRANCH Z4
            WIRE 3264 1200 3296 1200
        END BRANCH
        BEGIN BRANCH Zco
            WIRE 3296 1760 3328 1760
        END BRANCH
        BEGIN BRANCH XLXN_182
            WIRE 1344 2400 2944 2400
            WIRE 2944 944 3040 944
            WIRE 2944 944 2944 1696
            WIRE 2944 1696 3072 1696
            WIRE 2944 1696 2944 2400
        END BRANCH
        INSTANCE XLXI_121 3040 1232 R0
        INSTANCE XLXI_122 3072 1792 R0
        BEGIN DISPLAY 3056 388 TEXT "4Bit Adder"
            FONT 64 "Arial"
        END DISPLAY
        IOMARKER 3296 1008 Z1 R0 28
        IOMARKER 3296 1072 Z2 R0 28
        IOMARKER 3296 1136 Z3 R0 28
        IOMARKER 3296 1200 Z4 R0 28
        IOMARKER 3328 1760 Zco R0 28
        INSTANCE XLXI_11 1568 576 R0
        INSTANCE XLXI_27 1568 416 R0
        INSTANCE XLXI_12 2048 736 R0
        INSTANCE XLXI_26 2048 576 R0
        INSTANCE XLXI_18 2048 896 R0
        INSTANCE XLXI_19 2048 1056 R0
        INSTANCE XLXI_13 2048 1216 R0
        INSTANCE XLXI_20 1568 896 R0
        INSTANCE XLXI_14 1568 1056 R0
        INSTANCE XLXI_21 2048 1376 R0
        INSTANCE XLXI_22 2048 1536 R0
        INSTANCE XLXI_15 2048 1696 R0
        INSTANCE XLXI_23 1568 1376 R0
        INSTANCE XLXI_16 1568 1536 R0
        INSTANCE XLXI_25 2048 1856 R0
        INSTANCE XLXI_24 1568 1856 R0
        INSTANCE XLXI_17 1568 2016 R0
        DISPLAY 1928 256 TEXT LSB
        DISPLAY 1928 2040 TEXT MSB
        BEGIN BRANCH XLXN_2
            WIRE 1040 496 1440 496
            WIRE 1440 288 1568 288
            WIRE 1440 288 1440 448
            WIRE 1440 448 1568 448
            WIRE 1440 448 1440 496
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1040 432 1424 432
            WIRE 1424 432 1424 768
            WIRE 1424 768 1568 768
            WIRE 1424 768 1424 928
            WIRE 1424 928 1568 928
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1040 368 1408 368
            WIRE 1408 368 1408 1248
            WIRE 1408 1248 1568 1248
            WIRE 1408 1248 1408 1408
            WIRE 1408 1408 1568 1408
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 1040 304 1488 304
            WIRE 1488 304 1488 1728
            WIRE 1488 1728 1568 1728
            WIRE 1488 1728 1488 1888
            WIRE 1488 1888 1568 1888
        END BRANCH
        DISPLAY 1892 180 TEXT "4-bit adder"
        BEGIN BRANCH XLXN_21
            WIRE 1824 480 1936 480
            WIRE 1936 480 1936 608
            WIRE 1936 608 2048 608
            WIRE 1936 448 1936 480
            WIRE 1936 448 2048 448
        END BRANCH
        BEGIN BRANCH XLXN_23
            WIRE 1824 800 1920 800
            WIRE 1920 512 2048 512
            WIRE 1920 512 1920 672
            WIRE 1920 672 1920 800
            WIRE 1920 672 2048 672
        END BRANCH
        BEGIN BRANCH XLXN_24
            WIRE 1984 736 1984 768
            WIRE 1984 768 2048 768
            WIRE 1984 736 2384 736
            WIRE 2304 640 2384 640
            WIRE 2384 640 2384 736
        END BRANCH
        BEGIN BRANCH XLXN_25
            WIRE 1824 960 1936 960
            WIRE 1936 832 1936 960
            WIRE 1936 832 2048 832
        END BRANCH
        BEGIN BRANCH XLXN_26
            WIRE 1984 896 1984 928
            WIRE 1984 928 2048 928
            WIRE 1984 928 1984 1088
            WIRE 1984 1088 2048 1088
            WIRE 1984 896 2384 896
            WIRE 2304 800 2384 800
            WIRE 2384 800 2384 896
        END BRANCH
        BEGIN BRANCH XLXN_28
            WIRE 1824 1280 1936 1280
            WIRE 1936 992 2048 992
            WIRE 1936 992 1936 1152
            WIRE 1936 1152 1936 1280
            WIRE 1936 1152 2048 1152
        END BRANCH
        BEGIN BRANCH XLXN_33
            WIRE 1968 1216 2384 1216
            WIRE 1968 1216 1968 1248
            WIRE 1968 1248 2048 1248
            WIRE 2304 1120 2384 1120
            WIRE 2384 1120 2384 1216
        END BRANCH
        BEGIN BRANCH XLXN_34
            WIRE 1824 1440 1936 1440
            WIRE 1936 1312 1936 1440
            WIRE 1936 1312 2048 1312
        END BRANCH
        BEGIN BRANCH XLXN_35
            WIRE 1968 1376 2384 1376
            WIRE 1968 1376 1968 1408
            WIRE 1968 1408 2048 1408
            WIRE 1968 1408 1968 1568
            WIRE 1968 1568 2048 1568
            WIRE 2304 1280 2384 1280
            WIRE 2384 1280 2384 1376
        END BRANCH
        BEGIN BRANCH XLXN_37
            WIRE 1824 1760 1936 1760
            WIRE 1936 1472 2048 1472
            WIRE 1936 1472 1936 1632
            WIRE 1936 1632 1936 1760
            WIRE 1936 1632 2048 1632
        END BRANCH
        BEGIN BRANCH XLXN_38
            WIRE 1968 1696 1968 1728
            WIRE 1968 1728 2048 1728
            WIRE 1968 1696 2384 1696
            WIRE 2304 1600 2384 1600
            WIRE 2384 1600 2384 1696
        END BRANCH
        BEGIN BRANCH XLXN_39
            WIRE 1824 1920 1936 1920
            WIRE 1936 1792 1936 1920
            WIRE 1936 1792 2048 1792
        END BRANCH
        RECTANGLE N 1364 156 2436 2064 
        BEGIN BRANCH Enable
            WIRE 1088 2400 1120 2400
        END BRANCH
        INSTANCE XLXI_123 1120 2432 R0
        IOMARKER 1088 2400 Enable R180 28
        BEGIN BRANCH XLXN_345
            WIRE 912 1408 1248 1408
            WIRE 1248 1408 1248 1824
            WIRE 1248 1824 1248 1952
            WIRE 1248 1952 1568 1952
            WIRE 1248 1824 1472 1824
            WIRE 1472 1792 1472 1824
            WIRE 1472 1792 1568 1792
        END BRANCH
        BEGIN BRANCH XLXN_348
            WIRE 1200 1568 1392 1568
            WIRE 1392 1312 1568 1312
            WIRE 1392 1312 1392 1472
            WIRE 1392 1472 1568 1472
            WIRE 1392 1472 1392 1568
        END BRANCH
        BEGIN BRANCH XLXN_349
            WIRE 448 1664 704 1664
            WIRE 704 1600 704 1664
            WIRE 704 1600 944 1600
        END BRANCH
        BEGIN BRANCH XLXN_350
            WIRE 448 1728 720 1728
        END BRANCH
        BEGIN BRANCH XLXN_352
            WIRE 976 1760 1264 1760
            WIRE 1264 832 1568 832
            WIRE 1264 832 1264 992
            WIRE 1264 992 1568 992
            WIRE 1264 992 1264 1760
        END BRANCH
        INSTANCE XLXI_200 688 2016 R0
        BEGIN BRANCH XLXN_355
            WIRE 944 1920 1552 1920
            WIRE 1552 352 1568 352
            WIRE 1552 352 1552 512
            WIRE 1552 512 1552 1920
            WIRE 1552 512 1568 512
        END BRANCH
        BEGIN BRANCH XLXN_356
            WIRE 480 2240 576 2240
            WIRE 576 2240 2544 2240
            WIRE 576 1376 656 1376
            WIRE 576 1376 576 1536
            WIRE 576 1536 944 1536
            WIRE 576 1536 576 1792
            WIRE 576 1792 720 1792
            WIRE 576 1792 576 1952
            WIRE 576 1952 576 2240
            WIRE 576 1952 688 1952
            WIRE 2544 384 2560 384
            WIRE 2544 384 2544 544
            WIRE 2544 544 2560 544
            WIRE 2544 544 2544 1024
            WIRE 2544 1024 2560 1024
            WIRE 2544 1024 2544 1504
            WIRE 2544 1504 2560 1504
            WIRE 2544 1504 2544 1824
            WIRE 2544 1824 2560 1824
            WIRE 2544 1824 2544 2240
        END BRANCH
        BEGIN BRANCH B1
            WIRE 192 1600 224 1600
        END BRANCH
        BEGIN BRANCH B2
            WIRE 192 1664 224 1664
        END BRANCH
        BEGIN BRANCH B3
            WIRE 192 1728 224 1728
        END BRANCH
        BEGIN BRANCH B4
            WIRE 192 1792 224 1792
        END BRANCH
        DISPLAY 164 1468 TEXT nibble2
        RECTANGLE N 128 1440 416 1864 
        INSTANCE XLXI_124 224 1824 R0
        BEGIN BRANCH XLXN_353
            WIRE 448 1792 496 1792
            WIRE 496 1792 496 1888
            WIRE 496 1888 688 1888
        END BRANCH
        IOMARKER 192 1600 B1 R180 28
        IOMARKER 192 1664 B2 R180 28
        IOMARKER 192 1728 B3 R180 28
        IOMARKER 192 1792 B4 R180 28
        BEGIN BRANCH Add_Sub
            WIRE 224 2240 256 2240
        END BRANCH
        INSTANCE XLXI_150 256 2272 R0
        IOMARKER 224 2240 Add_Sub R180 28
        INSTANCE XLXI_149 656 1504 R0
        BEGIN BRANCH XLXN_346
            WIRE 448 1600 464 1600
            WIRE 464 1440 656 1440
            WIRE 464 1440 464 1600
        END BRANCH
        INSTANCE XLXI_198 944 1664 R0
        INSTANCE XLXI_199 720 1856 R0
        BEGIN BRANCH A1
            WIRE 784 304 816 304
        END BRANCH
        BEGIN BRANCH A2
            WIRE 784 368 816 368
        END BRANCH
        BEGIN BRANCH A3
            WIRE 784 432 816 432
        END BRANCH
        BEGIN BRANCH A4
            WIRE 784 496 816 496
        END BRANCH
        DISPLAY 760 180 TEXT nibble1
        RECTANGLE N 720 144 1012 556 
        INSTANCE XLXI_125 816 528 R0
        IOMARKER 784 304 A1 R180 28
        IOMARKER 784 368 A2 R180 28
        IOMARKER 784 432 A3 R180 28
        IOMARKER 784 496 A4 R180 28
        BEGIN BRANCH XLXN_370
            WIRE 2304 1760 2560 1760
        END BRANCH
        BEGIN BRANCH XLXN_371
            WIRE 2304 1440 2560 1440
        END BRANCH
        BEGIN BRANCH XLXN_373
            WIRE 2304 480 2560 480
        END BRANCH
        BEGIN BRANCH XLXN_374
            WIRE 1824 320 2560 320
        END BRANCH
        BEGIN BRANCH XLXN_375
            WIRE 2816 992 2880 992
            WIRE 2880 992 2880 1136
            WIRE 2880 1136 3040 1136
        END BRANCH
        BEGIN BRANCH XLXN_378
            WIRE 2816 1472 3024 1472
            WIRE 3024 1200 3040 1200
            WIRE 3024 1200 3024 1472
        END BRANCH
        BEGIN BRANCH XLXN_379
            WIRE 2816 1792 3056 1792
            WIRE 3056 1760 3072 1760
            WIRE 3056 1760 3056 1792
        END BRANCH
        INSTANCE XLXI_206 2560 1088 R0
        INSTANCE XLXI_207 2560 1568 R0
        INSTANCE XLXI_208 2560 1888 R0
        INSTANCE XLXI_205 2560 608 R0
        BEGIN BRANCH XLXN_383
            WIRE 2816 512 2912 512
            WIRE 2912 512 2912 1072
            WIRE 2912 1072 3040 1072
        END BRANCH
        INSTANCE XLXI_204 2560 448 R0
        BEGIN BRANCH XLXN_384
            WIRE 2816 352 2896 352
            WIRE 2896 352 2896 1008
            WIRE 2896 1008 3040 1008
        END BRANCH
        BEGIN BRANCH XLXN_385
            WIRE 2304 960 2560 960
        END BRANCH
    END SHEET
END SCHEMATIC
