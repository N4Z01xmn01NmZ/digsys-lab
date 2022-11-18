library IEEE;
use IEEE.std_logic_1164.all;


entity register is
    port (
        D   : in  std_logic_vector(3 downto 0);
        CE  : in  std_logic;
        clk : in  std_logic;
        Q   : out std_logic_vector(3 downto 0)
    );
end register;

architecture rtl of register is
begin
    MEM_PROC : process( D, CE, clk )
    begin
        if( rising_edge(clock) ) then
            if( CE = '1' ) then
                Q <= (others => '0');
            else
                Q <= D;
            end if;
        end if;
    end process; --MEM_PROC 
end rtl; -- rtl