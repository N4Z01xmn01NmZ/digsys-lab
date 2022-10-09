library IEEE;
use IEEE.std_logic_1164.all;

entity and_gate is
    port (
        d1, d2 : in  std_logic;
        o      : out std_logic
    );
end and_gate;

architecture rtl of and_gate is
begin
    process( d1, d2 )
    begin
        o <= d1 and d2;
    end process; 
end rtl; -- rtl