--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : not_array.vhf
-- /___/   /\     Timestamp : 10/18/2004 23:02:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_not_array
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_not_array is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_not_array;

architecture BEHAVIORAL of BUFE4_MXILINX_not_array is
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
--  /   /         Filename : not_array.vhf
-- /___/   /\     Timestamp : 10/18/2004 23:02:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: INV4_MXILINX_not_array
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity INV4_MXILINX_not_array is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end INV4_MXILINX_not_array;

architecture BEHAVIORAL of INV4_MXILINX_not_array is
   attribute BOX_TYPE   : string ;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   I_36_37 : INV
      port map (I=>I3,      
                O=>O3);
   
   I_36_38 : INV
      port map (I=>I2,      
                O=>O2);
   
   I_36_39 : INV
      port map (I=>I1,      
                O=>O1);
   
   I_36_40 : INV
      port map (I=>I0,      
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
--  /   /         Filename : not_array.vhf
-- /___/   /\     Timestamp : 10/18/2004 23:02:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: not_array
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity not_array is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          A2 : in    std_logic; 
          A3 : in    std_logic; 
          En : in    std_logic; 
          Z0 : out   std_logic; 
          Z1 : out   std_logic; 
          Z2 : out   std_logic; 
          Z3 : out   std_logic);
end not_array;

architecture BEHAVIORAL of not_array is
   attribute HU_SET     : string ;
   signal XLXN_27 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_29 : std_logic;
   signal XLXN_30 : std_logic;
   component INV4_MXILINX_not_array
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   component BUFE4_MXILINX_not_array
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
   
   attribute HU_SET of XLXI_10 : label is "XLXI_10_0";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_1";
begin
   XLXI_10 : INV4_MXILINX_not_array
      port map (I0=>A3,      
                I1=>A2,      
                I2=>A1,      
                I3=>A0,      
                O0=>XLXN_30,      
                O1=>XLXN_29,      
                O2=>XLXN_28,      
                O3=>XLXN_27);
   
   XLXI_11 : BUFE4_MXILINX_not_array
      port map (E=>En,      
                I0=>XLXN_27,      
                I1=>XLXN_28,      
                I2=>XLXN_29,      
                I3=>XLXN_30,      
                O0=>Z0,      
                O1=>Z1,      
                O2=>Z2,      
                O3=>Z3);
   
end BEHAVIORAL;


