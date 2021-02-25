--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : divider.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUFE8_MXILINX_divider
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUFE8_MXILINX_divider is
   port ( E : in    std_logic; 
          I : in    std_logic_vector (7 downto 0); 
          O : out   std_logic_vector (7 downto 0));
end BUFE8_MXILINX_divider;

architecture BEHAVIORAL of BUFE8_MXILINX_divider is
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
--  /   /         Filename : divider.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: BUF4_MXILINX_divider
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity BUF4_MXILINX_divider is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end BUF4_MXILINX_divider;

architecture BEHAVIORAL of BUF4_MXILINX_divider is
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
--  /   /         Filename : divider.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: divider
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity divider is
   port ( A  : in    std_logic_vector (0 to 3); 
          B  : in    std_logic_vector (0 to 3); 
          En : in    std_logic; 
          Z  : out   std_logic_vector (7 downto 0));
end divider;

architecture BEHAVIORAL of divider is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal Divisor : std_logic_vector (0 to 5);
   signal IR4     : std_logic_vector (0 to 5);
   signal IR7     : std_logic_vector (0 to 5);
   signal Modulas : std_logic_vector (0 to 5);
   signal OR3     : std_logic_vector (0 to 5);
   signal OR6     : std_logic_vector (0 to 5);
   signal OR9     : std_logic_vector (0 to 5);
   signal OR12    : std_logic_vector (0 to 5);
   signal OR13    : std_logic_vector (0 to 7);
   signal XLXN_6  : std_logic_vector (0 to 5);
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_14 : std_logic_vector (0 to 5);
   signal XLXN_15 : std_logic;
   component div_buff
      port ( Cin : in    std_logic; 
             A   : in    std_logic_vector (0 to 5); 
             B   : in    std_logic_vector (0 to 5); 
             Z   : out   std_logic_vector (0 to 5));
   end component;
   
   component f_adder
      port ( B : in    std_logic_vector (0 to 5); 
             A : in    std_logic_vector (0 to 5); 
             Z : out   std_logic_vector (0 to 5));
   end component;
   
   component twocompl_2
      port ( A : in    std_logic_vector (0 to 3); 
             Z : out   std_logic_vector (0 to 5));
   end component;
   
   component div_inp
      port ( A   : in    std_logic_vector (0 to 3); 
             Zo0 : out   std_logic; 
             Zo1 : out   std_logic; 
             Zo2 : out   std_logic; 
             Z   : out   std_logic_vector (0 to 5));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF4_MXILINX_divider
      port ( I0 : in    std_logic; 
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
   
   component BUFE8_MXILINX_divider
      port ( E : in    std_logic; 
             I : in    std_logic_vector (7 downto 0); 
             O : out   std_logic_vector (7 downto 0));
   end component;
   
   attribute HU_SET of XLXI_21 : label is "XLXI_21_0";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_1";
begin
   XLXI_5 : div_buff
      port map (A(0 to 5)=>XLXN_6(0 to 5),      
                B(0 to 5)=>OR3(0 to 5),      
                Cin=>XLXN_8,      
                Z(0 to 5)=>IR4(0 to 5));
   
   XLXI_6 : div_buff
      port map (A(0 to 5)=>IR4(0 to 5),      
                B(0 to 5)=>OR6(0 to 5),      
                Cin=>XLXN_9,      
                Z(0 to 5)=>IR7(0 to 5));
   
   XLXI_7 : div_buff
      port map (A(0 to 5)=>XLXN_14(0 to 5),      
                B(0 to 5)=>OR12(0 to 5),      
                Cin=>XLXN_15,      
                Z(0 to 5)=>Modulas(0 to 5));
   
   XLXI_8 : div_buff
      port map (A(0 to 5)=>IR7(0 to 5),      
                B(0 to 5)=>OR9(0 to 5),      
                Cin=>XLXN_10,      
                Z(0 to 5)=>XLXN_14(0 to 5));
   
   XLXI_12 : f_adder
      port map (A(0 to 5)=>Divisor(0 to 5),      
                B(0 to 5)=>XLXN_6(0 to 5),      
                Z(0 to 5)=>OR3(0 to 5));
   
   XLXI_13 : f_adder
      port map (A(0 to 5)=>Divisor(0 to 5),      
                B(0 to 5)=>IR4(0 to 5),      
                Z(0 to 5)=>OR6(0 to 5));
   
   XLXI_14 : f_adder
      port map (A(0 to 5)=>Divisor(0 to 5),      
                B(0 to 5)=>IR7(0 to 5),      
                Z(0 to 5)=>OR9(0 to 5));
   
   XLXI_15 : f_adder
      port map (A(0 to 5)=>Divisor(0 to 5),      
                B(0 to 5)=>XLXN_14(0 to 5),      
                Z(0 to 5)=>OR12(0 to 5));
   
   XLXI_16 : twocompl_2
      port map (A(0 to 3)=>B(0 to 3),      
                Z(0 to 5)=>Divisor(0 to 5));
   
   XLXI_17 : div_inp
      port map (A(0 to 3)=>A(0 to 3),      
                Z(0 to 5)=>XLXN_6(0 to 5),      
                Zo0=>XLXN_10,      
                Zo1=>XLXN_9,      
                Zo2=>XLXN_8);
   
   XLXI_18 : GND
      port map (G=>XLXN_15);
   
   XLXI_21 : BUF4_MXILINX_divider
      port map (I0=>Modulas(4),      
                I1=>Modulas(3),      
                I2=>Modulas(2),      
                I3=>Modulas(1),      
                O0=>OR13(3),      
                O1=>OR13(2),      
                O2=>OR13(1),      
                O3=>OR13(0));
   
   XLXI_22 : BUF
      port map (I=>OR12(5),      
                O=>OR13(4));
   
   XLXI_23 : BUF
      port map (I=>OR6(5),      
                O=>OR13(6));
   
   XLXI_24 : BUF
      port map (I=>OR9(5),      
                O=>OR13(5));
   
   XLXI_25 : BUF
      port map (I=>OR3(5),      
                O=>OR13(7));
   
   XLXI_26 : BUFE8_MXILINX_divider
      port map (E=>En,      
                I(7 downto 0)=>OR13(0 to 7),      
                O(7 downto 0)=>Z(7 downto 0));
   
end BEHAVIORAL;


