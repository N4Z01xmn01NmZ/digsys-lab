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
    add : process( d0, d1, carry_in )
    begin
        sum       <= (d0 xor d1) xor carry_in;
        carry_out <= (d0 and d1) or ((d0 xor d1) and carry_in);
    end process; -- add
end rtl; -- rtl
