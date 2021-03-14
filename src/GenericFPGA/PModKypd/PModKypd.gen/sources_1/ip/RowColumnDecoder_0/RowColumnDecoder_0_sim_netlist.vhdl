-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Sun Mar 14 09:57:10 2021
-- Host        : EvengerBook running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Repos/mwwhited/EmbeddedBakery/src/GenericFPGA/PModKypd/PModKypd.gen/sources_1/ip/RowColumnDecoder_0/RowColumnDecoder_0_sim_netlist.vhdl
-- Design      : RowColumnDecoder_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity RowColumnDecoder_0_RowColumnDecoder is
  port (
    ChangedValue : out STD_LOGIC;
    DetectedValue : out STD_LOGIC;
    ReleasedKey : out STD_LOGIC;
    PressedKey : out STD_LOGIC;
    Value : out STD_LOGIC_VECTOR ( 3 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ColumnPins_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ReleasedKey_reg_0 : in STD_LOGIC;
    RowPins : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ScanClock : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of RowColumnDecoder_0_RowColumnDecoder : entity is "RowColumnDecoder";
end RowColumnDecoder_0_RowColumnDecoder;

architecture STRUCTURE of RowColumnDecoder_0_RowColumnDecoder is
  signal \^changedvalue\ : STD_LOGIC;
  signal ChangedValue1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ChangedValue_i_1_n_0 : STD_LOGIC;
  signal ChangedValue_i_2_n_0 : STD_LOGIC;
  signal \^columnpins_reg[3]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal DetectedValue_i_1_n_0 : STD_LOGIC;
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal LSB : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^releasedkey\ : STD_LOGIC;
  signal ReleasedKey_i_1_n_0 : STD_LOGIC;
  signal ReleasedKey_i_2_n_0 : STD_LOGIC;
  signal \Value_tristate_oe[0]_i_1_n_0\ : STD_LOGIC;
  signal \Value_tristate_oe[1]_i_1_n_0\ : STD_LOGIC;
  signal \Value_tristate_oe_reg_n_0_[0]\ : STD_LOGIC;
  signal \Value_tristate_oe_reg_n_0_[1]\ : STD_LOGIC;
  signal \Value_tristate_oe_reg_n_0_[2]\ : STD_LOGIC;
  signal \Value_tristate_oe_reg_n_0_[3]\ : STD_LOGIC;
  signal \_lastScan_reg_0_1_0_0_i_2_n_0\ : STD_LOGIC;
  signal \_lastScan_reg_0_1_0_0_i_3_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ChangedValue_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of DetectedValue_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of ReleasedKey_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of ReleasedKey_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Value[0]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \Value[1]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \Value[2]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \Value[3]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \Value[3]_INST_0_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Value_tristate_oe[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Value_tristate_oe[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Value_tristate_oe[2]_i_1\ : label is "soft_lutpair3";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \_lastScan_reg_0_1_0_0\ : label is "MLO";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \_lastScan_reg_0_1_0_0\ : label is 8;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \_lastScan_reg_0_1_0_0\ : label is "inst/_lastScan";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \_lastScan_reg_0_1_0_0\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \_lastScan_reg_0_1_0_0\ : label is "RAM16X1S";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \_lastScan_reg_0_1_0_0\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \_lastScan_reg_0_1_0_0\ : label is 1;
  attribute ram_offset : integer;
  attribute ram_offset of \_lastScan_reg_0_1_0_0\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \_lastScan_reg_0_1_0_0\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \_lastScan_reg_0_1_0_0\ : label is 0;
  attribute OPT_MODIFIED of \_lastScan_reg_0_1_1_1\ : label is "MLO";
  attribute RTL_RAM_BITS of \_lastScan_reg_0_1_1_1\ : label is 8;
  attribute RTL_RAM_NAME of \_lastScan_reg_0_1_1_1\ : label is "inst/_lastScan";
  attribute RTL_RAM_TYPE of \_lastScan_reg_0_1_1_1\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \_lastScan_reg_0_1_1_1\ : label is "RAM16X1S";
  attribute ram_addr_begin of \_lastScan_reg_0_1_1_1\ : label is 0;
  attribute ram_addr_end of \_lastScan_reg_0_1_1_1\ : label is 1;
  attribute ram_offset of \_lastScan_reg_0_1_1_1\ : label is 0;
  attribute ram_slice_begin of \_lastScan_reg_0_1_1_1\ : label is 1;
  attribute ram_slice_end of \_lastScan_reg_0_1_1_1\ : label is 1;
  attribute OPT_MODIFIED of \_lastScan_reg_0_1_2_2\ : label is "MLO";
  attribute RTL_RAM_BITS of \_lastScan_reg_0_1_2_2\ : label is 8;
  attribute RTL_RAM_NAME of \_lastScan_reg_0_1_2_2\ : label is "inst/_lastScan";
  attribute RTL_RAM_TYPE of \_lastScan_reg_0_1_2_2\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \_lastScan_reg_0_1_2_2\ : label is "RAM16X1S";
  attribute ram_addr_begin of \_lastScan_reg_0_1_2_2\ : label is 0;
  attribute ram_addr_end of \_lastScan_reg_0_1_2_2\ : label is 1;
  attribute ram_offset of \_lastScan_reg_0_1_2_2\ : label is 0;
  attribute ram_slice_begin of \_lastScan_reg_0_1_2_2\ : label is 2;
  attribute ram_slice_end of \_lastScan_reg_0_1_2_2\ : label is 2;
  attribute OPT_MODIFIED of \_lastScan_reg_0_1_3_3\ : label is "MLO";
  attribute RTL_RAM_BITS of \_lastScan_reg_0_1_3_3\ : label is 8;
  attribute RTL_RAM_NAME of \_lastScan_reg_0_1_3_3\ : label is "inst/_lastScan";
  attribute RTL_RAM_TYPE of \_lastScan_reg_0_1_3_3\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \_lastScan_reg_0_1_3_3\ : label is "RAM16X1S";
  attribute ram_addr_begin of \_lastScan_reg_0_1_3_3\ : label is 0;
  attribute ram_addr_end of \_lastScan_reg_0_1_3_3\ : label is 1;
  attribute ram_offset of \_lastScan_reg_0_1_3_3\ : label is 0;
  attribute ram_slice_begin of \_lastScan_reg_0_1_3_3\ : label is 3;
  attribute ram_slice_end of \_lastScan_reg_0_1_3_3\ : label is 3;
begin
  ChangedValue <= \^changedvalue\;
  \ColumnPins_reg[3]_0\(3 downto 0) <= \^columnpins_reg[3]_0\(3 downto 0);
  D(0) <= \^d\(0);
  E(0) <= \^e\(0);
  ReleasedKey <= \^releasedkey\;
ChangedValue_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BE00"
    )
        port map (
      I0 => ChangedValue_i_2_n_0,
      I1 => RowPins(3),
      I2 => ChangedValue1(3),
      I3 => \_lastScan_reg_0_1_0_0_i_2_n_0\,
      O => ChangedValue_i_1_n_0
    );
ChangedValue_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => ChangedValue1(0),
      I1 => RowPins(0),
      I2 => RowPins(2),
      I3 => ChangedValue1(2),
      I4 => RowPins(1),
      I5 => ChangedValue1(1),
      O => ChangedValue_i_2_n_0
    );
ChangedValue_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => ChangedValue_i_1_n_0,
      Q => \^changedvalue\,
      R => '0'
    );
\ColumnPins_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => \^columnpins_reg[3]_0\(3),
      Q => \^columnpins_reg[3]_0\(0),
      R => '0'
    );
\ColumnPins_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => \^columnpins_reg[3]_0\(0),
      Q => \^columnpins_reg[3]_0\(1),
      R => '0'
    );
\ColumnPins_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => \^columnpins_reg[3]_0\(1),
      Q => \^columnpins_reg[3]_0\(2),
      R => '0'
    );
\ColumnPins_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => \^columnpins_reg[3]_0\(2),
      Q => \^columnpins_reg[3]_0\(3),
      R => '0'
    );
DetectedValue_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF0000"
    )
        port map (
      I0 => RowPins(2),
      I1 => RowPins(3),
      I2 => RowPins(0),
      I3 => RowPins(1),
      I4 => \_lastScan_reg_0_1_0_0_i_2_n_0\,
      O => DetectedValue_i_1_n_0
    );
DetectedValue_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => DetectedValue_i_1_n_0,
      Q => DetectedValue,
      R => '0'
    );
PressedKey_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^changedvalue\,
      I1 => \^releasedkey\,
      O => PressedKey
    );
ReleasedKey_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F600"
    )
        port map (
      I0 => ChangedValue1(3),
      I1 => RowPins(3),
      I2 => ChangedValue_i_2_n_0,
      I3 => \_lastScan_reg_0_1_0_0_i_2_n_0\,
      I4 => ReleasedKey_i_2_n_0,
      O => ReleasedKey_i_1_n_0
    );
ReleasedKey_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => RowPins(1),
      I1 => RowPins(0),
      I2 => RowPins(3),
      I3 => RowPins(2),
      O => ReleasedKey_i_2_n_0
    );
ReleasedKey_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => ReleasedKey_i_1_n_0,
      Q => \^releasedkey\,
      R => '0'
    );
\Value[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \Value_tristate_oe_reg_n_0_[0]\,
      I1 => Q(0),
      O => Value(0)
    );
\Value[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \Value_tristate_oe_reg_n_0_[1]\,
      I1 => Q(0),
      O => Value(1)
    );
\Value[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \Value_tristate_oe_reg_n_0_[2]\,
      I1 => Q(1),
      O => Value(2)
    );
\Value[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \Value_tristate_oe_reg_n_0_[3]\,
      I1 => Q(1),
      O => Value(3)
    );
\Value[3]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^columnpins_reg[3]_0\(3),
      I1 => \^columnpins_reg[3]_0\(0),
      I2 => \^columnpins_reg[3]_0\(1),
      I3 => \^columnpins_reg[3]_0\(2),
      O => \^d\(0)
    );
\Value_tristate_oe[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22A2"
    )
        port map (
      I0 => RowPins(0),
      I1 => RowPins(1),
      I2 => RowPins(2),
      I3 => RowPins(3),
      O => \Value_tristate_oe[0]_i_1_n_0\
    );
\Value_tristate_oe[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => RowPins(0),
      I1 => RowPins(2),
      I2 => RowPins(3),
      I3 => RowPins(1),
      O => \Value_tristate_oe[1]_i_1_n_0\
    );
\Value_tristate_oe[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22A2"
    )
        port map (
      I0 => \^columnpins_reg[3]_0\(0),
      I1 => \^columnpins_reg[3]_0\(1),
      I2 => \^columnpins_reg[3]_0\(2),
      I3 => \^columnpins_reg[3]_0\(3),
      O => LSB(0)
    );
\Value_tristate_oe[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => \_lastScan_reg_0_1_0_0_i_2_n_0\,
      I1 => RowPins(2),
      I2 => RowPins(3),
      I3 => RowPins(0),
      I4 => RowPins(1),
      O => \^e\(0)
    );
\Value_tristate_oe[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => \^columnpins_reg[3]_0\(0),
      I1 => \^columnpins_reg[3]_0\(2),
      I2 => \^columnpins_reg[3]_0\(3),
      I3 => \^columnpins_reg[3]_0\(1),
      O => LSB(1)
    );
\Value_tristate_oe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => \^e\(0),
      D => \Value_tristate_oe[0]_i_1_n_0\,
      Q => \Value_tristate_oe_reg_n_0_[0]\,
      R => '0'
    );
\Value_tristate_oe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => \^e\(0),
      D => \Value_tristate_oe[1]_i_1_n_0\,
      Q => \Value_tristate_oe_reg_n_0_[1]\,
      R => '0'
    );
\Value_tristate_oe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => \^e\(0),
      D => LSB(0),
      Q => \Value_tristate_oe_reg_n_0_[2]\,
      R => '0'
    );
\Value_tristate_oe_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => \^e\(0),
      D => LSB(1),
      Q => \Value_tristate_oe_reg_n_0_[3]\,
      R => '0'
    );
\_lastScan_reg_0_1_0_0\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000003",
      IS_WCLK_INVERTED => '1'
    )
        port map (
      A0 => \_lastScan_reg_0_1_0_0_i_3_n_0\,
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => '0',
      D => RowPins(0),
      O => ChangedValue1(0),
      WCLK => ReleasedKey_reg_0,
      WE => \_lastScan_reg_0_1_0_0_i_2_n_0\
    );
\_lastScan_reg_0_1_0_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^columnpins_reg[3]_0\(1),
      I1 => \^columnpins_reg[3]_0\(0),
      I2 => \^columnpins_reg[3]_0\(3),
      I3 => \^columnpins_reg[3]_0\(2),
      O => \_lastScan_reg_0_1_0_0_i_2_n_0\
    );
\_lastScan_reg_0_1_0_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => LSB(0),
      I1 => \^d\(0),
      O => \_lastScan_reg_0_1_0_0_i_3_n_0\
    );
\_lastScan_reg_0_1_1_1\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000003",
      IS_WCLK_INVERTED => '1'
    )
        port map (
      A0 => \_lastScan_reg_0_1_0_0_i_3_n_0\,
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => '0',
      D => RowPins(1),
      O => ChangedValue1(1),
      WCLK => ReleasedKey_reg_0,
      WE => \_lastScan_reg_0_1_0_0_i_2_n_0\
    );
\_lastScan_reg_0_1_2_2\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000003",
      IS_WCLK_INVERTED => '1'
    )
        port map (
      A0 => \_lastScan_reg_0_1_0_0_i_3_n_0\,
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => '0',
      D => RowPins(2),
      O => ChangedValue1(2),
      WCLK => ReleasedKey_reg_0,
      WE => \_lastScan_reg_0_1_0_0_i_2_n_0\
    );
\_lastScan_reg_0_1_3_3\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000003",
      IS_WCLK_INVERTED => '1'
    )
        port map (
      A0 => \_lastScan_reg_0_1_0_0_i_3_n_0\,
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => '0',
      D => RowPins(3),
      O => ChangedValue1(3),
      WCLK => ReleasedKey_reg_0,
      WE => \_lastScan_reg_0_1_0_0_i_2_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity RowColumnDecoder_0 is
  port (
    ScanClock : in STD_LOGIC;
    ColumnPins : out STD_LOGIC_VECTOR ( 3 downto 0 );
    RowPins : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Value : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ChangedValue : out STD_LOGIC;
    DetectedValue : out STD_LOGIC;
    ReleasedKey : out STD_LOGIC;
    PressedKey : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of RowColumnDecoder_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of RowColumnDecoder_0 : entity is "RowColumnDecoder_0,RowColumnDecoder,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of RowColumnDecoder_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of RowColumnDecoder_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of RowColumnDecoder_0 : entity is "RowColumnDecoder,Vivado 2020.2";
end RowColumnDecoder_0;

architecture STRUCTURE of RowColumnDecoder_0 is
  signal \Value[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \Value[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \Value[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal inst_n_8 : STD_LOGIC;
  signal inst_n_9 : STD_LOGIC;
begin
\Value[1]_INST_0_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => inst_n_9,
      D => \Value[1]_INST_0_i_2_n_0\,
      Q => \Value[1]_INST_0_i_1_n_0\,
      R => '0'
    );
\Value[1]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => RowPins(3),
      I1 => RowPins(0),
      I2 => RowPins(1),
      I3 => RowPins(2),
      O => \Value[1]_INST_0_i_2_n_0\
    );
\Value[3]_INST_0_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => inst_n_9,
      D => inst_n_8,
      Q => \Value[3]_INST_0_i_1_n_0\,
      R => '0'
    );
inst: entity work.RowColumnDecoder_0_RowColumnDecoder
     port map (
      ChangedValue => ChangedValue,
      \ColumnPins_reg[3]_0\(3 downto 0) => ColumnPins(3 downto 0),
      D(0) => inst_n_8,
      DetectedValue => DetectedValue,
      E(0) => inst_n_9,
      PressedKey => PressedKey,
      Q(1) => \Value[3]_INST_0_i_1_n_0\,
      Q(0) => \Value[1]_INST_0_i_1_n_0\,
      ReleasedKey => ReleasedKey,
      ReleasedKey_reg_0 => ScanClock,
      RowPins(3 downto 0) => RowPins(3 downto 0),
      ScanClock => ScanClock,
      Value(3 downto 0) => Value(3 downto 0)
    );
end STRUCTURE;
