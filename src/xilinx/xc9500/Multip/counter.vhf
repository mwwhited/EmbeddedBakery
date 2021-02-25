--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : counter.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FD_MXILINX_counter
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity FD_MXILINX_counter is
   port ( C : in    std_logic; 
          D : in    std_logic; 
          Q : out   std_logic);
end FD_MXILINX_counter;

architecture BEHAVIORAL of FD_MXILINX_counter is
   attribute BOX_TYPE   : string ;
   signal XLXN_4 : std_logic;
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component FDCP
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             PRE : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCP : component is "BLACK_BOX";
   
begin
   I_36_43 : GND
      port map (G=>XLXN_4);
   
   U0 : FDCP
      port map (C=>C,      
                CLR=>XLXN_4,      
                D=>D,      
                PRE=>XLXN_4,      
                Q=>Q);
   
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
--  /   /         Filename : counter.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FDRE_MXILINX_counter
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity FDRE_MXILINX_counter is
   port ( C  : in    std_logic; 
          CE : in    std_logic; 
          D  : in    std_logic; 
          R  : in    std_logic; 
          Q  : out   std_logic);
end FDRE_MXILINX_counter;

architecture BEHAVIORAL of FDRE_MXILINX_counter is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   attribute RLOC       : string ;
   signal A0      : std_logic;
   signal A1      : std_logic;
   signal QD      : std_logic;
   signal Q_DUMMY : std_logic;
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component FD_MXILINX_counter
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   
   attribute HU_SET of I_36_42 : label is "I_36_42_0";
   attribute RLOC of I_36_42 : label is "R0C0";
begin
   Q <= Q_DUMMY;
   I_36_32 : AND3B1
      port map (I0=>R,      
                I1=>D,      
                I2=>CE,      
                O=>A1);
   
   I_36_33 : AND3B2
      port map (I0=>CE,      
                I1=>R,      
                I2=>Q_DUMMY,      
                O=>A0);
   
   I_36_34 : OR2
      port map (I0=>A1,      
                I1=>A0,      
                O=>QD);
   
   I_36_42 : FD_MXILINX_counter
      port map (C=>C,      
                D=>QD,      
                Q=>Q_DUMMY);
   
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
--  /   /         Filename : counter.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FTRSE_MXILINX_counter
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity FTRSE_MXILINX_counter is
   port ( C  : in    std_logic; 
          CE : in    std_logic; 
          R  : in    std_logic; 
          S  : in    std_logic; 
          T  : in    std_logic; 
          Q  : out   std_logic);
end FTRSE_MXILINX_counter;

architecture BEHAVIORAL of FTRSE_MXILINX_counter is
   attribute BOX_TYPE       : string ;
   attribute HU_SET         : string ;
   signal CE_S    : std_logic;
   signal D_S     : std_logic;
   signal TQ      : std_logic;
   signal Q_DUMMY : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component FDRE_MXILINX_counter
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             R  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   attribute HU_SET of I_36_35 : label is "I_36_35_1";
begin
   Q <= Q_DUMMY;
   I_36_32 : XOR2
      port map (I0=>T,      
                I1=>Q_DUMMY,      
                O=>TQ);
   
   I_36_35 : FDRE_MXILINX_counter
      port map (C=>C,      
                CE=>CE_S,      
                D=>D_S,      
                R=>R,      
                Q=>Q_DUMMY);
   
   I_36_73 : OR2
      port map (I0=>S,      
                I1=>TQ,      
                O=>D_S);
   
   I_36_77 : OR2
      port map (I0=>CE,      
                I1=>S,      
                O=>CE_S);
   
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
--  /   /         Filename : counter.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: CB4RE_MXILINX_counter
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity CB4RE_MXILINX_counter is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          R   : in    std_logic; 
          CEO : out   std_logic; 
          Q0  : out   std_logic; 
          Q1  : out   std_logic; 
          Q2  : out   std_logic; 
          Q3  : out   std_logic; 
          TC  : out   std_logic);
end CB4RE_MXILINX_counter;

architecture BEHAVIORAL of CB4RE_MXILINX_counter is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal T2       : std_logic;
   signal T3       : std_logic;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal Q0_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal Q2_DUMMY : std_logic;
   signal Q3_DUMMY : std_logic;
   signal TC_DUMMY : std_logic;
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component FTRSE_MXILINX_counter
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             R  : in    std_logic; 
             S  : in    std_logic; 
             T  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   
   attribute HU_SET of U0 : label is "U0_2";
   attribute HU_SET of U1 : label is "U1_3";
   attribute HU_SET of U2 : label is "U2_4";
   attribute HU_SET of U3 : label is "U3_5";
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   Q3 <= Q3_DUMMY;
   TC <= TC_DUMMY;
   I_36_31 : AND4
      port map (I0=>Q3_DUMMY,      
                I1=>Q2_DUMMY,      
                I2=>Q1_DUMMY,      
                I3=>Q0_DUMMY,      
                O=>TC_DUMMY);
   
   I_36_32 : AND3
      port map (I0=>Q2_DUMMY,      
                I1=>Q1_DUMMY,      
                I2=>Q0_DUMMY,      
                O=>T3);
   
   I_36_33 : AND2
      port map (I0=>Q1_DUMMY,      
                I1=>Q0_DUMMY,      
                O=>T2);
   
   I_36_58 : VCC
      port map (P=>XLXN_1);
   
   I_36_64 : GND
      port map (G=>XLXN_2);
   
   I_36_69 : AND2
      port map (I0=>CE,      
                I1=>TC_DUMMY,      
                O=>CEO);
   
   U0 : FTRSE_MXILINX_counter
      port map (C=>C,      
                CE=>CE,      
                R=>R,      
                S=>XLXN_2,      
                T=>XLXN_1,      
                Q=>Q0_DUMMY);
   
   U1 : FTRSE_MXILINX_counter
      port map (C=>C,      
                CE=>CE,      
                R=>R,      
                S=>XLXN_2,      
                T=>Q0_DUMMY,      
                Q=>Q1_DUMMY);
   
   U2 : FTRSE_MXILINX_counter
      port map (C=>C,      
                CE=>CE,      
                R=>R,      
                S=>XLXN_2,      
                T=>T2,      
                Q=>Q2_DUMMY);
   
   U3 : FTRSE_MXILINX_counter
      port map (C=>C,      
                CE=>CE,      
                R=>R,      
                S=>XLXN_2,      
                T=>T3,      
                Q=>Q3_DUMMY);
   
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
--  /   /         Filename : counter.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: counter
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity counter is
   port ( Clk : in    std_logic; 
          En  : in    std_logic; 
          Z   : out   std_logic_vector (0 to 3));
end counter;

architecture BEHAVIORAL of counter is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal holdlow : std_logic;
   component CB4RE_MXILINX_counter
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             R   : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of Cntr : label is "Cntr_6";
begin
   Cntr : CB4RE_MXILINX_counter
      port map (C=>Clk,      
                CE=>En,      
                R=>holdlow,      
                CEO=>open,      
                Q0=>Z(0),      
                Q1=>Z(1),      
                Q2=>Z(2),      
                Q3=>Z(3),      
                TC=>open);
   
   XLXI_8 : GND
      port map (G=>holdlow);
   
end BEHAVIORAL;


