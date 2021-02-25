LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY HalfAdder IS
    PORT(
        A : IN std_logic;
        B : IN std_logic;
        Sum: OUT std_logic;
        Cout : OUT std_logic;
    );
END HalfAdder

ARCHITECTURE gate_level OF HalfAdder IS
BEGIN
    S <= A XOR B;
    Cout <= A AND B;
END gate_level;