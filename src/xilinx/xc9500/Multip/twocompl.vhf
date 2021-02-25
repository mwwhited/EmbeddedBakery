--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : twocompl.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:19
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_twocompl
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_twocompl is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_twocompl;

architecture BEHAVIORAL of BUFE4_MXILINX_twocompl is
   attribute BOX_TYPE   : string ;
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
begin
   I_36_37 : BUFE
      port map (E=>E,      
                I=>I3,      
                O=>O3);
   
   I_36_38 : BUFE
      port map (E=>E,      
                I=>I2,      
                O=>O2);
   
   I_36_39 : BUFE
      port map (E=>E,      
                I=>I1,      
                O=>O1);
   
   I_36_40 : BUFE
      port map (E=>E,      
                I=>I0,      
                O=>O0);
   
end BEHAVIORAL;


--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : twocompl.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:19
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: twocompl
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity twocompl is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          A2 : in    std_logic; 
          A3 : in    std_logic; 
          A4 : in    std_logic; 
          En : in    std_logic; 
          Z0 : out   std_logic; 
          Z1 : out   std_logic; 
          Z2 : out   std_logic; 
          Z3 : out   std_logic; 
          Z4 : out   std_logic);
end twocompl;

architecture BEHAVIORAL of twocompl is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component BUFE4_MXILINX_twocompl
      port ( E  : in    std_logic; 
             I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_43 : label is "XLXI_43_0";
begin
   XLXI_1 : AND2
      port map (I0=>XLXN_26,      
                I1=>XLXN_2,      
                O=>XLXN_5);
   
   XLXI_2 : AND2
      port map (I0=>XLXN_5,      
                I1=>XLXN_3,      
                O=>XLXN_12);
   
   XLXI_3 : AND2
      port map (I0=>XLXN_13,      
                I1=>XLXN_14,      
                O=>XLXN_15);
   
   XLXI_4 : AND2
      port map (I0=>XLXN_12,      
                I1=>XLXN_10,      
                O=>XLXN_13);
   
   XLXI_10 : INV
      port map (I=>A0,      
                O=>XLXN_2);
   
   XLXI_11 : INV
      port map (I=>A1,      
                O=>XLXN_3);
   
   XLXI_12 : INV
      port map (I=>A2,      
                O=>XLXN_10);
   
   XLXI_13 : INV
      port map (I=>A3,      
                O=>XLXN_14);
   
   XLXI_14 : VCC
      port map (P=>XLXN_26);
   
   XLXI_36 : XOR2
      port map (I0=>XLXN_26,      
                I1=>XLXN_2,      
                O=>XLXN_21);
   
   XLXI_37 : XOR2
      port map (I0=>XLXN_5,      
                I1=>XLXN_3,      
                O=>XLXN_22);
   
   XLXI_38 : XOR2
      port map (I0=>XLXN_13,      
                I1=>XLXN_14,      
                O=>XLXN_24);
   
   XLXI_39 : XOR2
      port map (I0=>XLXN_12,      
                I1=>XLXN_10,      
                O=>XLXN_23);
   
   XLXI_40 : XOR2
      port map (I0=>XLXN_15,      
                I1=>XLXN_27,      
                O=>XLXN_25);
   
   XLXI_43 : BUFE4_MXILINX_twocompl
      port map (E=>En,      
                I0=>XLXN_21,      
                I1=>XLXN_22,      
                I2=>XLXN_23,      
                I3=>XLXN_24,      
                O0=>Z0,      
                O1=>Z1,      
                O2=>Z2,      
                O3=>Z3);
   
   XLXI_45 : BUFE
      port map (E=>En,      
                I=>XLXN_25,      
                O=>Z4);
   
   XLXI_47 : INV
      port map (I=>A4,      
                O=>XLXN_27);
   
end BEHAVIORAL;


