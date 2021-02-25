library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port(
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        Sum: out std_logic;
        Cout : out std_logic;
    );
end FullAdder

architecture gate_level of FullAdder is
begin
    S <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B);
end gate_level;