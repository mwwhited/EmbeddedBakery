-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Sat Mar 13 14:00:29 2021
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
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Value : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ChangedValue : out STD_LOGIC;
    ScanClock : in STD_LOGIC;
    RowPins : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of RowColumnDecoder_0_RowColumnDecoder : entity is "RowColumnDecoder";
end RowColumnDecoder_0_RowColumnDecoder;

architecture STRUCTURE of RowColumnDecoder_0_RowColumnDecoder is
  signal ChangedValue_i_1_n_0 : STD_LOGIC;
  signal ChangedValue_i_2_n_0 : STD_LOGIC;
  signal ChangedValue_i_3_n_0 : STD_LOGIC;
  signal ChangedValue_i_4_n_0 : STD_LOGIC;
  signal ChangedValue_i_5_n_0 : STD_LOGIC;
  signal ChangedValue_i_6_n_0 : STD_LOGIC;
  signal ChangedValue_i_7_n_0 : STD_LOGIC;
  signal ChangedValue_i_8_n_0 : STD_LOGIC;
  signal \ColumnPins[0]_i_1_n_0\ : STD_LOGIC;
  signal \ColumnPins[1]_i_1_n_0\ : STD_LOGIC;
  signal \ColumnPins[2]_i_1_n_0\ : STD_LOGIC;
  signal \ColumnPins[3]_i_1_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^value\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \Value[0]_i_1_n_0\ : STD_LOGIC;
  signal \Value[0]_i_2_n_0\ : STD_LOGIC;
  signal \Value[1]_i_1_n_0\ : STD_LOGIC;
  signal \Value[2]_i_1_n_0\ : STD_LOGIC;
  signal \Value[3]_i_1_n_0\ : STD_LOGIC;
  signal \Value[3]_i_2_n_0\ : STD_LOGIC;
  signal \Value[3]_i_3_n_0\ : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ChangedValue_i_4 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of ChangedValue_i_5 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of ChangedValue_i_7 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of ChangedValue_i_8 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ColumnPins[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ColumnPins[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ColumnPins[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ColumnPins[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \Value[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \Value[0]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Value[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \Value[3]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair6";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
  Value(3 downto 0) <= \^value\(3 downto 0);
ChangedValue_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => ChangedValue_i_2_n_0,
      I1 => ChangedValue_i_3_n_0,
      I2 => ChangedValue_i_4_n_0,
      I3 => ChangedValue_i_5_n_0,
      I4 => ChangedValue_i_6_n_0,
      O => ChangedValue_i_1_n_0
    );
ChangedValue_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08080808FF080808"
    )
        port map (
      I0 => \Value[0]_i_2_n_0\,
      I1 => ChangedValue_i_7_n_0,
      I2 => \^value\(1),
      I3 => \Value[3]_i_3_n_0\,
      I4 => ChangedValue_i_8_n_0,
      I5 => \^value\(3),
      O => ChangedValue_i_2_n_0
    );
ChangedValue_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040C0C040F0F0F0"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^value\(3),
      I2 => \Value[3]_i_3_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(1),
      I5 => \^value\(2),
      O => ChangedValue_i_3_n_0
    );
ChangedValue_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => \^value\(2),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \Value[3]_i_3_n_0\,
      O => ChangedValue_i_4_n_0
    );
ChangedValue_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => \^value\(0),
      I1 => RowPins(0),
      I2 => RowPins(2),
      I3 => \Value[0]_i_2_n_0\,
      O => ChangedValue_i_5_n_0
    );
ChangedValue_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040C0C040F0F0F0"
    )
        port map (
      I0 => RowPins(0),
      I1 => \^value\(1),
      I2 => \Value[0]_i_2_n_0\,
      I3 => RowPins(3),
      I4 => RowPins(1),
      I5 => \^value\(0),
      O => ChangedValue_i_6_n_0
    );
ChangedValue_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => RowPins(2),
      I1 => RowPins(3),
      O => ChangedValue_i_7_n_0
    );
ChangedValue_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      O => ChangedValue_i_8_n_0
    );
ChangedValue_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => ChangedValue_i_1_n_0,
      Q => ChangedValue,
      R => '0'
    );
\ColumnPins[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter(1),
      I1 => counter(0),
      O => \ColumnPins[0]_i_1_n_0\
    );
\ColumnPins[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => counter(1),
      I1 => counter(0),
      O => \ColumnPins[1]_i_1_n_0\
    );
\ColumnPins[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => counter(0),
      I1 => counter(1),
      O => \ColumnPins[2]_i_1_n_0\
    );
\ColumnPins[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => counter(1),
      I1 => counter(0),
      O => \ColumnPins[3]_i_1_n_0\
    );
\ColumnPins_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => \ColumnPins[0]_i_1_n_0\,
      Q => \^q\(0),
      R => '0'
    );
\ColumnPins_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => \ColumnPins[1]_i_1_n_0\,
      Q => \^q\(1),
      R => '0'
    );
\ColumnPins_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => \ColumnPins[2]_i_1_n_0\,
      Q => \^q\(2),
      R => '0'
    );
\ColumnPins_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => \ColumnPins[3]_i_1_n_0\,
      Q => \^q\(3),
      R => '0'
    );
\Value[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F00"
    )
        port map (
      I0 => RowPins(2),
      I1 => RowPins(1),
      I2 => RowPins(3),
      I3 => \Value[0]_i_2_n_0\,
      O => \Value[0]_i_1_n_0\
    );
\Value[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(3),
      I3 => \^q\(2),
      O => \Value[0]_i_2_n_0\
    );
\Value[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00007FFF7FFF7FFF"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => RowPins(3),
      I5 => RowPins(2),
      O => \Value[1]_i_1_n_0\
    );
\Value[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2F"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(3),
      O => \Value[2]_i_1_n_0\
    );
\Value[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF0000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \Value[3]_i_3_n_0\,
      O => \Value[3]_i_1_n_0\
    );
\Value[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0777777777777777"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => RowPins(2),
      I3 => RowPins(3),
      I4 => RowPins(0),
      I5 => RowPins(1),
      O => \Value[3]_i_2_n_0\
    );
\Value[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => RowPins(1),
      I1 => RowPins(0),
      I2 => RowPins(3),
      I3 => RowPins(2),
      O => \Value[3]_i_3_n_0\
    );
\Value_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => \Value[3]_i_1_n_0\,
      D => \Value[0]_i_1_n_0\,
      Q => \^value\(0),
      R => '0'
    );
\Value_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => \Value[3]_i_1_n_0\,
      D => \Value[1]_i_1_n_0\,
      Q => \^value\(1),
      R => '0'
    );
\Value_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => \Value[3]_i_1_n_0\,
      D => \Value[2]_i_1_n_0\,
      Q => \^value\(2),
      R => '0'
    );
\Value_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ScanClock,
      CE => \Value[3]_i_1_n_0\,
      D => \Value[3]_i_2_n_0\,
      Q => \^value\(3),
      R => '0'
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter(0),
      O => p_0_in(0)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter(0),
      I1 => counter(1),
      O => p_0_in(1)
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => p_0_in(0),
      Q => counter(0),
      R => '0'
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ScanClock,
      CE => '1',
      D => p_0_in(1),
      Q => counter(1),
      R => '0'
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
    ChangedValue : out STD_LOGIC
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
begin
inst: entity work.RowColumnDecoder_0_RowColumnDecoder
     port map (
      ChangedValue => ChangedValue,
      Q(3 downto 0) => ColumnPins(3 downto 0),
      RowPins(3 downto 0) => RowPins(3 downto 0),
      ScanClock => ScanClock,
      Value(3 downto 0) => Value(3 downto 0)
    );
end STRUCTURE;
