library IEEE;
use IEEE.std_logic_1164.all;

entity combi_fuse is
    port (
        d   : in  std_logic_vector(2 downto 0);
        led : out std_logic_vector(3 downto 0)
    );
end combi_fuse;

architecture rtl of combi_fuse is

    combi : process( d )
    begin
        case( d ) is
            when "100"  => led <= "100";
            when "010"  => led <= "010";
            when "001"  => led <= "001";
            when "011"  => led <= "011";
            when "101"  => led <= "101";
            when "110"  => led <= "110";
            when others => led <= "000";
        end case ;
    end process ; -- combi

begin

end rtl ; -- rtl