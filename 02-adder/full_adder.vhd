library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port (
        d0, d1    : in  std_logic;
        carry_in  : in  std_logic;
        sum       : out std_logic;
        carry_out : out std_logic
    );
end full_adder;

architecture rtl of full_adder is
begin
    add : process( d1, d2, carry_in )
    begin
        sum       <= (d1 xor d2) xor carry_in;
        carry_out <= (d1 and d2) or ((d1 xor d2) and carry_in);
    end process; -- add
end rtl; -- rtl
