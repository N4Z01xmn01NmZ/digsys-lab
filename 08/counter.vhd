library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
    port (
        D       : in  std_logic_vector(3 downto 0);
        CE      : in  std_logic;
        cnt_en  : in  std_logic;
        clr_en  : in  std_logic;
        clk     : in  std_logic;
        T       : out std_logic_vector(3 downto 0);
    );
end counter;

architecture rtl of counter is
begin
    COUNT_PROC : process( D, CE, cnt_en, clr_en, clk )
    begin
        if( rising_edge(clk) ) then
            if( CE = '1' ) then
                if( clr_en = '1' ) then
                    T <= (others <= '0');
                elsif( cnt_en = '1' ) then
                    T <= D + 1;
                else
                    T <= D;
                end if;
            else
                T <= (D + 1) when (cnt_en = '1') else D;
            end if;
        end if;
    end process ; -- identifier
end rtl; -- rtl