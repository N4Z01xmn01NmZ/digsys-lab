library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate is
    port (
        d1, d2 : in  std_logic;
        o      : out std_logic
    );
end or_gate;


architecture rtl of or_gate is
begin
    process( d1, d2 )
    begin
        o <= d1 or d2;
    end process; 
end rtl; -- rtl
