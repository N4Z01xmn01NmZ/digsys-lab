library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
    port (
        D0, D1, D2, D3 : in  std_logic_vector(3 downto 0);
        sel            : in  std_logic_vector(1 downto 0);
        Q              : out std_logic
    );
end mux;

architecture rtl of mux is
begin
    MUX_PROC : process( D0, D1, D2, D3, sel )
    begin
        case( sel ) is
            when "00" => Q <= D0;
            when "01" => Q <= D1;
            when "10" => Q <= D2;
            when "11" => Q <= D3;
        end case ;
    end process ; -- MUX_PROC
end rtl; -- rtl