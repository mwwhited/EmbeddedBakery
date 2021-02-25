--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : twocompl_2.vhf
-- /___/   /\     Timestamp : 10/23/2004 22:25:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: twocompl_2
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity twocompl_2 is
   port ( A : in    std_logic_vector (0 to 3); 
          Z : out   std_logic_vector (0 to 5));
end twocompl_2;

architecture BEHAVIORAL of twocompl_2 is
   attribute BOX_TYPE   : string ;
   signal XLXN_3  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_68 : std_logic;
   signal XLXN_69 : std_logic;
   signal XLXN_70 : std_logic;
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>XLXN_69,      
                I1=>XLXN_68,      
                O=>XLXN_5);
   
   XLXI_2 : AND2
      port map (I0=>XLXN_5,      
                I1=>XLXN_3,      
                O=>XLXN_12);
   
   XLXI_3 : AND2
      port map (I0=>XLXN_13,      
                I1=>XLXN_14,      
                O=>Z(4));
   
   XLXI_4 : AND2
      port map (I0=>XLXN_12,      
                I1=>XLXN_10,      
                O=>XLXN_13);
   
   XLXI_10 : INV
      port map (I=>A(0),      
                O=>XLXN_68);
   
   XLXI_11 : INV
      port map (I=>A(1),      
                O=>XLXN_3);
   
   XLXI_12 : INV
      port map (I=>A(2),      
                O=>XLXN_10);
   
   XLXI_13 : INV
      port map (I=>A(3),      
                O=>XLXN_14);
   
   XLXI_14 : VCC
      port map (P=>XLXN_69);
   
   XLXI_36 : XOR2
      port map (I0=>XLXN_68,      
                I1=>XLXN_69,      
                O=>Z(0));
   
   XLXI_37 : XOR2
      port map (I0=>XLXN_5,      
                I1=>XLXN_3,      
                O=>Z(1));
   
   XLXI_38 : XOR2
      port map (I0=>XLXN_13,      
                I1=>XLXN_14,      
                O=>Z(3));
   
   XLXI_39 : XOR2
      port map (I0=>XLXN_12,      
                I1=>XLXN_10,      
                O=>Z(2));
   
   XLXI_65 : BUF
      port map (I=>XLXN_70,      
                O=>Z(5));
   
   XLXI_66 : GND
      port map (G=>XLXN_70);
   
end BEHAVIORAL;


