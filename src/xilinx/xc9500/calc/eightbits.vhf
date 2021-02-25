--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.01i
--  \   \         Application : 
--  /   /         Filename : eightbits.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE4_MXILINX_eightbits
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE4_MXILINX_eightbits is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUFE4_MXILINX_eightbits;

architecture BEHAVIORAL of BUFE4_MXILINX_eightbits is
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
--  /   /         Filename : eightbits.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: IBUF4_MXILINX_eightbits
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity IBUF4_MXILINX_eightbits is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end IBUF4_MXILINX_eightbits;

architecture BEHAVIORAL of IBUF4_MXILINX_eightbits is
   attribute BOX_TYPE   : string ;
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
begin
   I_36_37 : IBUF
      port map (I=>I3,      
                O=>O3);
   
   I_36_38 : IBUF
      port map (I=>I2,      
                O=>O2);
   
   I_36_39 : IBUF
      port map (I=>I1,      
                O=>O1);
   
   I_36_40 : IBUF
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
--  /   /         Filename : eightbits.vhf
-- /___/   /\     Timestamp : 10/08/2004 19:52:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: eightbits
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity eightbits is
   port ( A1     : in    std_logic; 
          A2     : in    std_logic; 
          A3     : in    std_logic; 
          A4     : in    std_logic; 
          A5     : in    std_logic; 
          A6     : in    std_logic; 
          A7     : in    std_logic; 
          A8     : in    std_logic; 
          Enable : in    std_logic; 
          Z0     : out   std_logic; 
          Z1     : out   std_logic; 
          Z2     : out   std_logic; 
          Z3     : out   std_logic; 
          Z4     : out   std_logic; 
          Z5     : out   std_logic; 
          Z6     : out   std_logic; 
          Z7     : out   std_logic);
   attribute LOC : string ;
   attribute LOC of A1 : signal is "p6";
   attribute LOC of A2 : signal is "p7";
   attribute LOC of A3 : signal is "p11";
   attribute LOC of A4 : signal is "p5";
   attribute LOC of A5 : signal is "p72";
   attribute LOC of A6 : signal is "p71";
   attribute LOC of A7 : signal is "p66";
   attribute LOC of A8 : signal is "p70";
end eightbits;

architecture BEHAVIORAL of eightbits is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1 : std_logic;
   signal XLXN_2 : std_logic;
   signal XLXN_3 : std_logic;
   signal XLXN_4 : std_logic;
   signal XLXN_5 : std_logic;
   signal XLXN_6 : std_logic;
   signal XLXN_7 : std_logic;
   signal XLXN_8 : std_logic;
   signal XLXN_9 : std_logic;
   component IBUF4_MXILINX_eightbits
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   component BUFE4_MXILINX_eightbits
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_3 : label is "XLXI_3_0";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_1";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_2";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_3";
begin
   XLXI_3 : IBUF4_MXILINX_eightbits
      port map (I0=>A1,      
                I1=>A2,      
                I2=>A3,      
                I3=>A4,      
                O0=>XLXN_2,      
                O1=>XLXN_3,      
                O2=>XLXN_4,      
                O3=>XLXN_5);
   
   XLXI_4 : IBUF4_MXILINX_eightbits
      port map (I0=>A5,      
                I1=>A6,      
                I2=>A7,      
                I3=>A8,      
                O0=>XLXN_6,      
                O1=>XLXN_7,      
                O2=>XLXN_8,      
                O3=>XLXN_9);
   
   XLXI_6 : BUFE4_MXILINX_eightbits
      port map (E=>XLXN_1,      
                I0=>XLXN_6,      
                I1=>XLXN_7,      
                I2=>XLXN_8,      
                I3=>XLXN_9,      
                O0=>Z4,      
                O1=>Z5,      
                O2=>Z6,      
                O3=>Z7);
   
   XLXI_7 : BUFE4_MXILINX_eightbits
      port map (E=>XLXN_1,      
                I0=>XLXN_2,      
                I1=>XLXN_3,      
                I2=>XLXN_4,      
                I3=>XLXN_5,      
                O0=>Z0,      
                O1=>Z1,      
                O2=>Z2,      
                O3=>Z3);
   
   XLXI_8 : BUF
      port map (I=>Enable,      
                O=>XLXN_1);
   
end BEHAVIORAL;


