--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : div_inp.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:24
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUF4_MXILINX_div_inp
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUF4_MXILINX_div_inp is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUF4_MXILINX_div_inp;

architecture BEHAVIORAL of BUF4_MXILINX_div_inp is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>I0,      
                O=>O0);
   
   XLXI_2 : BUF
      port map (I=>I1,      
                O=>O1);
   
   XLXI_3 : BUF
      port map (I=>I2,      
                O=>O2);
   
   XLXI_4 : BUF
      port map (I=>I3,      
                O=>O3);
   
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
--  /   /         Filename : div_inp.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:24
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: div_inp
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity div_inp is
   port ( A   : in    std_logic_vector (0 to 3); 
          Z   : out   std_logic_vector (0 to 5); 
          Zo0 : out   std_logic; 
          Zo1 : out   std_logic; 
          Zo2 : out   std_logic);
end div_inp;

architecture BEHAVIORAL of div_inp is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_5 : std_logic;
   component BUF4_MXILINX_div_inp
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
begin
   XLXI_1 : BUF4_MXILINX_div_inp
      port map (I0=>A(0),      
                I1=>A(1),      
                I2=>A(2),      
                I3=>A(3),      
                O0=>Zo0,      
                O1=>Zo1,      
                O2=>Zo2,      
                O3=>Z(0));
   
   XLXI_2 : BUF4_MXILINX_div_inp
      port map (I0=>XLXN_5,      
                I1=>XLXN_5,      
                I2=>XLXN_5,      
                I3=>XLXN_5,      
                O0=>Z(1),      
                O1=>Z(2),      
                O2=>Z(3),      
                O3=>Z(4));
   
   XLXI_3 : GND
      port map (G=>XLXN_5);
   
   XLXI_4 : BUF
      port map (I=>XLXN_5,      
                O=>Z(5));
   
end BEHAVIORAL;


