-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Fri Dec  5 20:38:27 2025
-- Host        : AGIMUS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/repo/a7100/ArtyMicroBlazeTutorial/ArtyMicroBlazeTutorial.gen/sources_1/bd/MicroBlazeIPBlock/ip/MicroBlazeIPBlock_reset_inv_0_0/MicroBlazeIPBlock_reset_inv_0_0_sim_netlist.vhdl
-- Design      : MicroBlazeIPBlock_reset_inv_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MicroBlazeIPBlock_reset_inv_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MicroBlazeIPBlock_reset_inv_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MicroBlazeIPBlock_reset_inv_0_0 : entity is "MicroBlazeIPBlock_reset_inv_0_0,util_vector_logic_v2_0_5_util_vector_logic,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of MicroBlazeIPBlock_reset_inv_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of MicroBlazeIPBlock_reset_inv_0_0 : entity is "util_vector_logic_v2_0_5_util_vector_logic,Vivado 2025.2";
end MicroBlazeIPBlock_reset_inv_0_0;

architecture STRUCTURE of MicroBlazeIPBlock_reset_inv_0_0 is
begin
\Res[0]_INST_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Op1(0),
      O => Res(0)
    );
end STRUCTURE;
