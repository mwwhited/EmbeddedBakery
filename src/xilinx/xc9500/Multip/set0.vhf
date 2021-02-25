--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : set0.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE8_MXILINX_set0
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE8_MXILINX_set0 is
   port ( E : in    std_logic; 
          I : in    std_logic_vector (7 downto 0); 
          O : out   std_logic_vector (7 downto 0));
end BUFE8_MXILINX_set0;

architecture BEHAVIORAL of BUFE8_MXILINX_set0 is
   attribute BOX_TYPE   : string ;
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
begin
   I_36_30 : BUFE
      port map (E=>E,      
                I=>I(0),      
                O=>O(0));
   
   I_36_31 : BUFE
      port map (E=>E,      
                I=>I(1),      
                O=>O(1));
   
   I_36_32 : BUFE
      port map (E=>E,      
                I=>I(2),      
                O=>O(2));
   
   I_36_33 : BUFE
      port map (E=>E,      
                I=>I(3),      
                O=>O(3));
   
   I_36_34 : BUFE
      port map (E=>E,      
                I=>I(7),      
                O=>O(7));
   
   I_36_35 : BUFE
      port map (E=>E,      
                I=>I(6),      
                O=>O(6));
   
   I_36_36 : BUFE
      port map (E=>E,      
                I=>I(5),      
                O=>O(5));
   
   I_36_37 : BUFE
      port map (E=>E,      
                I=>I(4),      
                O=>O(4));
   
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
--  /   /         Filename : set0.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: D2_4E_MXILINX_set0
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity D2_4E_MXILINX_set0 is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          E  : in    std_logic; 
          D0 : out   std_logic; 
          D1 : out   std_logic; 
          D2 : out   std_logic; 
          D3 : out   std_logic);
end D2_4E_MXILINX_set0;

architecture BEHAVIORAL of D2_4E_MXILINX_set0 is
   attribute BOX_TYPE   : string ;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
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
   
begin
   I_36_30 : AND3
      port map (I0=>A1,      
                I1=>A0,      
                I2=>E,      
                O=>D3);
   
   I_36_31 : AND3B1
      port map (I0=>A0,      
                I1=>A1,      
                I2=>E,      
                O=>D2);
   
   I_36_32 : AND3B1
      port map (I0=>A1,      
                I1=>A0,      
                I2=>E,      
                O=>D1);
   
   I_36_33 : AND3B2
      port map (I0=>A0,      
                I1=>A1,      
                I2=>E,      
                O=>D0);
   
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
--  /   /         Filename : set0.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:06:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: set0
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity set0 is
   port ( A  : in    std_logic_vector (0 to 3); 
          B  : in    std_logic_vector (0 to 3); 
          En : in    std_logic; 
          Fn : in    std_logic_vector (0 to 1); 
          Z  : out   std_logic_vector (7 downto 0));
end set0;

architecture BEHAVIORAL of set0 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal FnZ     : std_logic_vector (0 to 4);
   signal XLXN_37 : std_logic;
   signal XLXN_41 : std_logic;
   signal Zn      : std_logic_vector (7 downto 0);
   component D2_4E_MXILINX_set0
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component multip
      port ( A  : in    std_logic_vector (0 to 3); 
             B  : in    std_logic_vector (0 to 3); 
             En : in    std_logic; 
             Z  : out   std_logic_vector (0 to 7));
   end component;
   
   component divider
      port ( A  : in    std_logic_vector (0 to 3); 
             B  : in    std_logic_vector (0 to 3); 
             En : in    std_logic; 
             Z  : out   std_logic_vector (7 downto 0));
   end component;
   
   component BUFE
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFE : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component BUFE8_MXILINX_set0
      port ( E : in    std_logic; 
             I : in    std_logic_vector (7 downto 0); 
             O : out   std_logic_vector (7 downto 0));
   end component;
   
   component adder
      port ( A  : in    std_logic_vector (0 to 3); 
             B  : in    std_logic_vector (0 to 3); 
             En : in    std_logic; 
             Z  : out   std_logic_vector (0 to 4));
   end component;
   
   component subtract
      port ( A  : in    std_logic_vector (0 to 3); 
             B  : in    std_logic_vector (0 to 3); 
             En : in    std_logic; 
             Z  : out   std_logic_vector (0 to 4));
   end component;
   
   attribute HU_SET of XLXI_3 : label is "XLXI_3_0";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_1";
begin
   XLXI_3 : D2_4E_MXILINX_set0
      port map (A0=>Fn(0),      
                A1=>Fn(1),      
                E=>En,      
                D0=>FnZ(0),      
                D1=>FnZ(1),      
                D2=>FnZ(2),      
                D3=>FnZ(3));
   
   XLXI_4 : multip
      port map (A(0 to 3)=>A(0 to 3),      
                B(0 to 3)=>B(0 to 3),      
                En=>FnZ(2),      
                Z(0 to 7)=>Zn(7 downto 0));
   
   XLXI_5 : divider
      port map (A(0 to 3)=>A(0 to 3),      
                B(0 to 3)=>B(0 to 3),      
                En=>FnZ(3),      
                Z(7 downto 0)=>Zn(7 downto 0));
   
   XLXI_6 : BUFE
      port map (E=>XLXN_37,      
                I=>XLXN_41,      
                O=>Zn(5));
   
   XLXI_7 : BUFE
      port map (E=>XLXN_37,      
                I=>XLXN_41,      
                O=>Zn(6));
   
   XLXI_8 : BUFE
      port map (E=>XLXN_37,      
                I=>XLXN_41,      
                O=>Zn(7));
   
   XLXI_9 : OR2
      port map (I0=>FnZ(0),      
                I1=>FnZ(1),      
                O=>XLXN_37);
   
   XLXI_10 : GND
      port map (G=>XLXN_41);
   
   XLXI_11 : BUF
      port map (I=>En,      
                O=>FnZ(4));
   
   XLXI_12 : BUFE8_MXILINX_set0
      port map (E=>FnZ(4),      
                I(7 downto 0)=>Zn(7 downto 0),      
                O(7 downto 0)=>Z(7 downto 0));
   
   XLXI_13 : adder
      port map (A(0 to 3)=>A(0 to 3),      
                B(0 to 3)=>B(0 to 3),      
                En=>FnZ(0),      
                Z(0)=>Zn(0),      
                Z(1)=>Zn(1),      
                Z(2)=>Zn(2),      
                Z(3)=>Zn(3),      
                Z(4)=>Zn(4));
   
   XLXI_14 : subtract
      port map (A(0 to 3)=>A(0 to 3),      
                B(0 to 3)=>B(0 to 3),      
                En=>FnZ(1),      
                Z(0)=>Zn(0),      
                Z(1)=>Zn(1),      
                Z(2)=>Zn(2),      
                Z(3)=>Zn(3),      
                Z(4)=>Zn(4));
   
end BEHAVIORAL;


