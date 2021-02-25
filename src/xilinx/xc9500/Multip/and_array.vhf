--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : and_array.vhf
-- /___/   /\     Timestamp : 10/18/2004 23:02:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_and_array
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_and_array is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_and_array;

architecture BEHAVIORAL of BUFE4_MXILINX_and_array is
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
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : and_array.vhf
-- /___/   /\     Timestamp : 10/18/2004 23:02:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: and_array
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity and_array is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          A2 : in    std_logic; 
          A3 : in    std_logic; 
          B0 : in    std_logic; 
          B1 : in    std_logic; 
          B2 : in    std_logic; 
          B3 : in    std_logic; 
          En : in    std_logic; 
          Z0 : out   std_logic; 
          Z1 : out   std_logic; 
          Z2 : out   std_logic; 
          Z3 : out   std_logic);
end and_array;

architecture BEHAVIORAL of and_array is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component BUFE4_MXILINX_and_array
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
   
   attribute HU_SET of XLXI_5 : label is "XLXI_5_0";
begin
   XLXI_1 : AND2
      port map (I0=>B0,      
                I1=>A0,      
                O=>XLXN_14);
   
   XLXI_2 : AND2
      port map (I0=>B1,      
                I1=>A1,      
                O=>XLXN_15);
   
   XLXI_3 : AND2
      port map (I0=>B2,      
                I1=>A2,      
                O=>XLXN_16);
   
   XLXI_4 : AND2
      port map (I0=>B3,      
                I1=>A3,      
                O=>XLXN_17);
   
   XLXI_5 : BUFE4_MXILINX_and_array
      port map (E=>En,      
                I0=>XLXN_14,      
                I1=>XLXN_15,      
                I2=>XLXN_16,      
                I3=>XLXN_17,      
                O0=>Z0,      
                O1=>Z1,      
                O2=>Z2,      
                O3=>Z3);
   
end BEHAVIORAL;


