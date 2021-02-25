--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : div_buff.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_div_buff
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_div_buff is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_div_buff;

architecture BEHAVIORAL of BUFE4_MXILINX_div_buff is
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
--  /   /         Filename : div_buff.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: div_buff
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity div_buff is
   port ( A   : in    std_logic_vector (0 to 5); 
          B   : in    std_logic_vector (0 to 5); 
          Cin : in    std_logic; 
          Z   : out   std_logic_vector (0 to 5));
end div_buff;

architecture BEHAVIORAL of div_buff is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_11 : std_logic;
   signal XLXN_30 : std_logic;
   signal Z_DUMMY : std_logic_vector (0 to 5);
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component BUFE4_MXILINX_div_buff
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
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_0";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_1";
begin
   Z(0 to 5) <= Z_DUMMY(0 to 5);
   XLXI_1 : BUF
      port map (I=>Cin,      
                O=>Z_DUMMY(0));
   
   XLXI_2 : BUFE4_MXILINX_div_buff
      port map (E=>B(5),      
                I0=>A(0),      
                I1=>A(1),      
                I2=>A(2),      
                I3=>A(3),      
                O0=>Z_DUMMY(1),      
                O1=>Z_DUMMY(2),      
                O2=>Z_DUMMY(3),      
                O3=>Z_DUMMY(4));
   
   XLXI_3 : BUFE4_MXILINX_div_buff
      port map (E=>XLXN_11,      
                I0=>B(0),      
                I1=>B(1),      
                I2=>B(2),      
                I3=>B(3),      
                O0=>Z_DUMMY(1),      
                O1=>Z_DUMMY(2),      
                O2=>Z_DUMMY(3),      
                O3=>Z_DUMMY(4));
   
   XLXI_4 : INV
      port map (I=>B(5),      
                O=>XLXN_11);
   
   XLXI_5 : BUF
      port map (I=>XLXN_30,      
                O=>Z_DUMMY(5));
   
   XLXI_6 : GND
      port map (G=>XLXN_30);
   
end BEHAVIORAL;


