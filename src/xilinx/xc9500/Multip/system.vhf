--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 6.3.02i
--  \   \         Application : 
--  /   /         Filename : system.vhf
-- /___/   /\     Timestamp : 10/24/2004 20:13:50
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: system
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity system is
   port ( A_In  : in    std_logic_vector (0 to 7); 
          M_In  : in    std_logic; 
          Z_Out : out   std_logic_vector (0 to 7));
end system;

architecture BEHAVIORAL of system is
   attribute BOX_TYPE   : string ;
   signal ABus  : std_logic_vector (0 to 7);
   signal Clock : std_logic;
   signal C_Bus : std_logic_vector (0 to 3);
   signal DBus  : std_logic_vector (0 to 7);
   signal En    : std_logic;
   component eightbits
      port ( A  : in    std_logic_vector (0 to 7); 
             En : in    std_logic; 
             Z  : out   std_logic_vector (0 to 7));
   end component;
   
   component eightleds
      port ( A      : in    std_logic_vector (0 to 7); 
             Enable : in    std_logic; 
             Z      : out   std_logic_vector (0 to 7));
   end component;
   
   component calc
      port ( A  : in    std_logic_vector (0 to 3); 
             B  : in    std_logic_vector (0 to 3); 
             Fn : in    std_logic_vector (0 to 3); 
             En : in    std_logic; 
             Z  : out   std_logic_vector (7 downto 0));
   end component;
   
   component counter
      port ( Clk : in    std_logic; 
             En  : in    std_logic; 
             Z   : out   std_logic_vector (0 to 3));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component momentsw
      port ( A1     : in    std_logic; 
             Enable : in    std_logic; 
             Z1     : out   std_logic);
   end component;
   
begin
   Bits_In : eightbits
      port map (A(0 to 7)=>A_In(0 to 7),      
                En=>En,      
                Z(0 to 7)=>ABus(0 to 7));
   
   Bits_Out : eightleds
      port map (A(0 to 7)=>DBus(0 to 7),      
                Enable=>En,      
                Z(0 to 7)=>Z_Out(0 to 7));
   
   Calc_S : calc
      port map (A(0 to 3)=>ABus(0 to 3),      
                B(0 to 3)=>ABus(4 to 7),      
                En=>En,      
                Fn(0 to 3)=>C_Bus(0 to 3),      
                Z(7 downto 0)=>DBus(0 to 7));
   
   Cntr : counter
      port map (Clk=>Clock,      
                En=>En,      
                Z(0 to 3)=>C_Bus(0 to 3));
   
   FixedHigh : VCC
      port map (P=>En);
   
   Sw : momentsw
      port map (A1=>M_In,      
                Enable=>En,      
                Z1=>Clock);
   
end BEHAVIORAL;


