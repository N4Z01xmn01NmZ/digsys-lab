library IEEE;
use IEEE.std_logic_1164.all;

entity decoder is
    port (
        sw : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end decoder;

architecture rtl of decoder is
begin
    decode : process( sw )
    begin
        case( sw ) is
            when "00" => y <= "0001";
            when "01" => y <= "0010";
            when "10" => y <= "0100";
            when "11" => y <= "1000";
        end case ;
    end process ; -- decode
end rtl; -- rtl