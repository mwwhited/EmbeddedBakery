﻿using System.Collections.Generic;

namespace ImageBuilder
{
    public static class CharacterRom
    {
        public static ulong GetValue(byte index) => _map[index];
        public static readonly IDictionary<byte, ulong> _map = new Dictionary<byte, ulong>
        {
            { 000, 0x1C_22_4A_56_4C_20_1E_00 },
            { 001, 0x3C_24_24_7E_62_62_62_00 },
            { 002, 0x78_44_44_7C_62_62_7E_00 },
            { 003, 0x7E_42_40_60_60_62_7E_00 },
            { 004, 0x7C_46_42_62_62_66_7C_00 },
            { 005, 0x7E_40_40_7C_60_60_7E_00 },
            { 006, 0x7E_40_40_7E_60_60_60_00 },
            { 007, 0x7E_42_40_6E_62_62_7E_00 },
            { 008, 0x42_42_42_7E_62_62_62_00 },
            { 009, 0x08_08_08_0C_0C_0C_0C_00 },
            { 010, 0x04_04_04_06_06_46_7E_00 },
            { 011, 0x42_44_48_7C_62_62_62_00 },
            { 012, 0x40_40_40_60_60_60_7E_00 },
            { 013, 0x7E_4A_4A_6A_6A_6A_6A_00 },
            { 014, 0x7E_42_42_62_62_62_62_00 },
            { 015, 0x7E_46_42_42_42_42_7E_00 },
            { 016, 0x7E_42_42_7E_60_60_60_00 },
            { 017, 0x7E_42_42_42_4A_4E_7E_00 },
            { 018, 0x7C_44_44_7C_62_62_62_00 },
            { 019, 0x7E_42_40_7E_06_46_7E_00 },
            { 020, 0x3E_10_10_18_18_18_18_00 },
            { 021, 0x42_42_42_62_62_62_7E_00 },
            { 022, 0x62_62_62_66_24_24_3C_00 },
            { 023, 0x4A_4A_4A_6A_6A_6A_7E_00 },
            { 024, 0x42_42_66_18_66_62_62_00 },
            { 025, 0x22_22_22_3E_18_18_18_00 },
            { 026, 0x7E_42_06_18_60_62_7E_00 },
            { 027, 0x3C_20_20_20_20_20_3C_00 },
            { 028, 0x00_40_20_10_08_04_02_00 },
            { 029, 0x3C_04_04_04_04_04_3C_00 },
            { 030, 0x00_08_1C_2A_08_08_14_14 },
            { 031, 0x00_00_10_20_7F_20_10_00 },
            { 032, 0x00_00_00_00_00_00_00_00 },
            { 033, 0x08_08_08_0C_0C_00_0C_00 },
            { 034, 0x6C_24_6C_00_00_00_00_00 },
            { 035, 0x24_24_7E_24_7E_24_24_00 },
            { 036, 0x08_3E_20_3E_06_3E_08_00 },
            { 037, 0x00_62_64_08_10_26_46_00 },
            { 038, 0x3C_20_24_7E_64_64_7C_00 },
            { 039, 0x1C_18_10_00_00_00_00_00 },
            { 040, 0x04_08_10_10_10_08_04_00 },
            { 041, 0x20_10_08_08_08_10_20_00 },
            { 042, 0x08_2A_1C_3E_1C_2A_08_00 },
            { 043, 0x00_08_08_3E_08_08_00_00 },
            { 044, 0x00_00_00_00_00_18_18_08 },
            { 045, 0x00_00_00_7E_00_00_00_00 },
            { 046, 0x00_00_00_00_00_18_18_00 },
            { 047, 0x00_02_04_08_10_20_40_00 },
            { 048, 0x7E_62_52_4A_46_46_7E_00 },
            { 049, 0x18_08_08_18_18_1A_3E_00 },
            { 050, 0x7E_42_02_7E_60_60_7E_00 },
            { 051, 0x7C_44_04_1E_06_46_7E_00 },
            { 052, 0x44_44_44_44_7E_0C_0C_00 },
            { 053, 0x7E_40_7E_06_06_46_7E_00 },
            { 054, 0x7E_42_40_7E_46_46_7E_00 },
            { 055, 0x7E_02_02_06_06_06_06_00 },
            { 056, 0x3C_24_24_7E_46_46_7E_00 },
            { 057, 0x7E_42_42_7E_06_06_06_00 },
            { 058, 0x00_00_18_00_00_18_00_00 },
            { 059, 0x00_00_18_00_00_18_18_08 },
            { 060, 0x0E_18_30_60_30_18_0E_00 },
            { 061, 0x00_00_7E_00_7E_00_00_00 },
            { 062, 0x70_18_0C_06_0C_18_70_00 },
            { 063, 0x7E_02_02_7E_60_00_60_00 },
            { 064, 0x00_00_00_00_FF_00_00_00 },
            { 065, 0x08_1C_3E_7F_7F_1C_3E_00 },
            { 066, 0x10_10_10_10_10_10_10_10 },
            { 067, 0x00_00_00_FF_00_00_00_00 },
            { 068, 0x00_00_FF_00_00_00_00_00 },
            { 069, 0x00_FF_00_00_00_00_00_00 },
            { 070, 0x00_00_00_00_00_FF_00_00 },
            { 071, 0x20_20_20_20_20_20_20_20 },
            { 072, 0x04_04_04_04_04_04_04_04 },
            { 073, 0x00_00_00_00_E0_10_08_08 },
            { 074, 0x08_08_08_04_03_00_00_00 },
            { 075, 0x08_08_08_10_E0_00_00_00 },
            { 076, 0x80_80_80_80_80_80_80_FF },
            { 077, 0x80_40_20_10_08_04_02_01 },
            { 078, 0x01_02_04_08_10_20_40_80 },
            { 079, 0xFF_80_80_80_80_80_80_80 },
            { 080, 0xFF_01_01_01_01_01_01_01 },
            { 081, 0x00_3C_7E_7E_7E_7E_3C_00 },
            { 082, 0x00_00_00_00_00_00_FF_00 },
            { 083, 0x36_7F_7F_7F_3E_1C_08_00 },
            { 084, 0x40_40_40_40_40_40_40_40 },
            { 085, 0x00_00_00_00_03_04_08_08 },
            { 086, 0x81_42_24_18_18_24_42_81 },
            { 087, 0x00_3C_42_42_42_42_3C_00 },
            { 088, 0x08_1C_2A_77_2A_08_08_00 },
            { 089, 0x02_02_02_02_02_02_02_02 },
            { 090, 0x08_1C_3E_7F_3E_1C_08_00 },
            { 091, 0x08_08_08_08_FF_08_08_08 },
            { 092, 0xA0_50_A0_50_A0_50_A0_50 },
            { 093, 0x08_08_08_08_08_08_08_08 },
            { 094, 0x00_00_01_3E_54_14_14_00 },
            { 095, 0xFF_7F_3F_1F_0F_07_03_01 },
            { 096, 0x00_00_00_00_00_00_00_00 },
            { 097, 0xF0_F0_F0_F0_F0_F0_F0_F0 },
            { 098, 0x00_00_00_00_FF_FF_FF_FF },
            { 099, 0xFF_00_00_00_00_00_00_00 },
            { 100, 0x00_00_00_00_00_00_00_FF },
            { 101, 0x80_80_80_80_80_80_80_80 },
            { 102, 0xAA_55_AA_55_AA_55_AA_55 },
            { 103, 0x01_01_01_01_01_01_01_01 },
            { 104, 0x00_00_00_00_AA_55_AA_55 },
            { 105, 0xFF_FE_FC_F8_F0_E0_C0_80 },
            { 106, 0x03_03_03_03_03_03_03_03 },
            { 107, 0x08_08_08_08_0F_08_08_08 },
            { 108, 0x00_00_00_00_0F_0F_0F_0F },
            { 109, 0x08_08_08_08_0F_00_00_00 },
            { 110, 0x00_00_00_00_F8_08_08_08 },
            { 111, 0x00_00_00_00_00_00_FF_FF },
            { 112, 0x00_00_00_00_0F_08_08_08 },
            { 113, 0x08_08_08_08_FF_00_00_00 },
            { 114, 0x00_00_00_00_FF_08_08_08 },
            { 115, 0x08_08_08_08_F8_08_08_08 },
            { 116, 0xC0_C0_C0_C0_C0_C0_C0_C0 },
            { 117, 0xE0_E0_E0_E0_E0_E0_E0_E0 },
            { 118, 0x07_07_07_07_07_07_07_07 },
            { 119, 0xFF_FF_00_00_00_00_00_00 },
            { 120, 0xFF_FF_FF_00_00_00_00_00 },
            { 121, 0x00_00_00_00_00_FF_FF_FF },
            { 122, 0x01_01_01_01_01_01_01_FF },
            { 123, 0x00_00_00_00_F0_F0_F0_F0 },
            { 124, 0x0F_0F_0F_0F_00_00_00_00 },
            { 125, 0x08_08_08_08_F8_00_00_00 },
            { 126, 0xF0_F0_F0_F0_00_00_00_00 },
            { 127, 0xF0_F0_F0_F0_0F_0F_0F_0F },
            { 128, 0x1C_22_4A_56_4C_20_1E_00 },
            { 129, 0x00_00_3C_04_7C_64_7C_00 },
            { 130, 0x40_40_7E_42_62_62_7E_00 },
            { 131, 0x00_00_7E_42_60_62_7E_00 },
            { 132, 0x02_02_7E_42_62_62_7E_00 },
            { 133, 0x00_00_7E_42_7E_60_7E_00 },
            { 134, 0x1E_12_10_7C_18_18_18_00 },
            { 135, 0x00_00_7E_42_62_7E_02_7E },
            { 136, 0x40_40_7E_42_62_62_62_00 },
            { 137, 0x18_00_10_10_18_18_18_00 },
            { 138, 0x0C_00_08_0C_0C_0C_44_7C },
            { 139, 0x40_40_44_48_78_64_64_00 },
            { 140, 0x10_10_10_10_18_18_18_00 },
            { 141, 0x00_00_7F_49_6D_6D_6D_00 },
            { 142, 0x00_00_7E_42_62_62_62_00 },
            { 143, 0x00_00_7E_42_62_62_7E_00 },
            { 144, 0x00_00_7E_42_62_7E_40_40 },
            { 145, 0x00_00_7E_42_46_7E_02_02 },
            { 146, 0x00_00_7E_40_60_60_60_00 },
            { 147, 0x00_00_7E_40_7E_06_7E_00 },
            { 148, 0x10_10_7C_10_18_18_18_00 },
            { 149, 0x00_00_42_42_62_62_7E_00 },
            { 150, 0x00_00_62_62_66_24_3C_00 },
            { 151, 0x00_00_49_49_6D_6D_7F_00 },
            { 152, 0x00_00_42_42_3C_62_62_00 },
            { 153, 0x00_00_62_62_42_7E_02_7E },
            { 154, 0x00_00_7E_06_18_60_7E_00 },
            { 155, 0x3C_20_20_20_20_20_3C_00 },
            { 156, 0x00_40_20_10_08_04_02_00 },
            { 157, 0x3C_04_04_04_04_04_3C_00 },
            { 158, 0x00_08_1C_2A_08_08_14_14 },
            { 159, 0x00_00_10_20_7F_20_10_00 },
            { 160, 0x00_00_00_00_00_00_00_00 },
            { 161, 0x08_08_08_0C_0C_00_0C_00 },
            { 162, 0x6C_24_6C_00_00_00_00_00 },
            { 163, 0x24_24_7E_24_7E_24_24_00 },
            { 164, 0x08_3E_20_3E_06_3E_08_00 },
            { 165, 0x00_62_64_08_10_26_46_00 },
            { 166, 0x3C_20_24_7E_64_64_7C_00 },
            { 167, 0x1C_18_10_00_00_00_00_00 },
            { 168, 0x04_08_10_10_10_08_04_00 },
            { 169, 0x20_10_08_08_08_10_20_00 },
            { 170, 0x08_2A_1C_3E_1C_2A_08_00 },
            { 171, 0x00_08_08_3E_08_08_00_00 },
            { 172, 0x00_00_00_00_00_18_18_08 },
            { 173, 0x00_00_00_7E_00_00_00_00 },
            { 174, 0x00_00_00_00_00_18_18_00 },
            { 175, 0x00_02_04_08_10_20_40_00 },
            { 176, 0x7E_62_52_4A_46_46_7E_00 },
            { 177, 0x38_08_08_18_18_1A_3E_00 },
            { 178, 0x7E_42_02_7E_60_60_7E_00 },
            { 179, 0x7C_44_04_1E_06_46_7E_00 },
            { 180, 0x44_44_44_44_7E_0C_0C_00 },
            { 181, 0x7E_40_7E_06_06_46_7E_00 },
            { 182, 0x7E_42_40_7E_46_46_7E_00 },
            { 183, 0x7E_02_02_06_06_06_06_00 },
            { 184, 0x3C_24_24_7E_46_46_7E_00 },
            { 185, 0x7E_42_42_7E_06_06_06_00 },
            { 186, 0x00_00_18_00_00_18_00_00 },
            { 187, 0x00_00_18_00_00_18_18_08 },
            { 188, 0x0E_18_30_60_30_18_0E_00 },
            { 189, 0x00_00_7E_00_7E_00_00_00 },
            { 190, 0x70_18_0C_06_0C_18_70_00 },
            { 191, 0x7E_02_02_7E_60_00_60_00 },
            { 192, 0x00_00_00_00_FF_00_00_00 },
            { 193, 0x3C_24_24_7E_62_62_62_00 },
            { 194, 0x78_44_44_7C_62_62_7E_00 },
            { 195, 0x7E_42_40_60_60_62_7E_00 },
            { 196, 0x7C_46_42_62_62_66_7C_00 },
            { 197, 0x7E_40_40_78_60_60_7E_00 },
            { 198, 0x7E_40_40_7E_60_60_60_00 },
            { 199, 0x7E_42_40_6E_62_62_7E_00 },
            { 200, 0x42_42_42_7E_62_62_62_00 },
            { 201, 0x08_08_08_0C_0C_0C_0C_00 },
            { 202, 0x04_04_04_06_06_46_7E_00 },
            { 203, 0x42_44_48_7C_62_62_62_00 },
            { 204, 0x40_40_40_60_60_60_7E_00 },
            { 205, 0x7E_4A_4A_6A_6A_6A_6A_00 },
            { 206, 0x7E_42_42_62_62_62_62_00 },
            { 207, 0x7E_46_42_42_42_42_7E_00 },
            { 208, 0x7E_42_42_7E_60_60_60_00 },
            { 209, 0x7E_42_42_42_4A_4E_7E_00 },
            { 210, 0x7C_44_44_7C_62_62_62_00 },
            { 211, 0x7E_42_40_7E_06_46_7E_00 },
            { 212, 0x3E_10_10_18_18_18_18_00 },
            { 213, 0x42_42_42_62_62_62_7E_00 },
            { 214, 0x62_62_62_66_24_24_3C_00 },
            { 215, 0x4A_4A_4A_6A_6A_6A_7E_00 },
            { 216, 0x42_42_66_3C_66_62_62_00 },
            { 217, 0x22_22_22_3E_18_18_18_00 },
            { 218, 0x7E_42_06_18_60_62_7E_00 },
            { 219, 0x08_08_08_08_FF_08_08_08 },
            { 220, 0xA0_50_A0_50_A0_50_A0_50 },
            { 221, 0x08_08_08_08_08_08_08_08 },
            { 222, 0xCC_CC_33_33_CC_CC_33_33 },
            { 223, 0xCC_66_33_99_CC_66_33_99 },
            { 224, 0x00_00_00_00_00_00_00_00 },
            { 225, 0xF0_F0_F0_F0_F0_F0_F0_F0 },
            { 226, 0x00_00_00_00_FF_FF_FF_FF },
            { 227, 0xFF_00_00_00_00_00_00_00 },
            { 228, 0x00_00_00_00_00_00_00_FF },
            { 229, 0x80_80_80_80_80_80_80_80 },
            { 230, 0xAA_55_AA_55_AA_55_AA_55 },
            { 231, 0x01_01_01_01_01_01_01_01 },
            { 232, 0x00_00_00_00_AA_55_AA_55 },
            { 233, 0x99_33_66_CC_99_33_66_CC },
            { 234, 0x03_03_03_03_03_03_03_03 },
            { 235, 0x08_08_08_08_0F_08_08_08 },
            { 236, 0x00_00_00_00_0F_0F_0F_0F },
            { 237, 0x08_08_08_08_0F_00_00_00 },
            { 238, 0x00_00_00_00_F8_08_08_08 },
            { 239, 0x00_00_00_00_00_00_FF_FF },
            { 240, 0x00_00_00_00_0F_08_08_08 },
            { 241, 0x08_08_08_08_FF_00_00_00 },
            { 242, 0x00_00_00_00_FF_08_08_08 },
            { 243, 0x08_08_08_08_F8_08_08_08 },
            { 244, 0xC0_C0_C0_C0_C0_C0_C0_C0 },
            { 245, 0xE0_E0_E0_E0_E0_E0_E0_E0 },
            { 246, 0x07_07_07_07_07_07_07_07 },
            { 247, 0xFF_FF_00_00_00_00_00_00 },
            { 248, 0xFF_FF_FF_00_00_00_00_00 },
            { 249, 0x00_00_00_00_00_FF_FF_FF },
            { 250, 0x01_02_44_48_50_60_40_00 },
            { 251, 0x00_00_00_00_F0_F0_F0_F0 },
            { 252, 0x0F_0F_0F_0F_00_00_00_00 },
            { 253, 0x08_08_08_08_F8_00_00_00 },
            { 254, 0xF0_F0_F0_F0_00_00_00_00 },
            { 255, 0xF0_F0_F0_F0_0F_0F_0F_0F },
        };
    }
}