library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
    port (
        d1, d2         : in  std_logic;
        carry_in       : in  std_logic;
        sum, carry_out : out std_logic
    );
end half_adder;

architecture rtl of half_adder is
begin
    add : process( d1, d2, carry_in )
    begin
        sum       <= (d1 xor d2) xor carry_in;
        carry_out <= (d1 and d2) or ((d1 xor d2) and carry_in);
    end process; -- add
end rtl; -- rtl
