library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity L03_AdderTwoBit is
    -- empty
end L03_AdderTwoBit;

architecture tb of L03_AdderTwoBit is

    -- DUT component
    component adder_two_bit is
        port (
            d1, d2    : in std_logic_vector(1 downto 0);
            carry_in  : in std_logic;
            sum       : out std_logic_vector(1 downto 0);
            carry_out : out std_logic
        );
    end component;

    -- Signals
    signal d1_i, d2_i : std_logic_vector(1 downto 0) := (others => '0');
    signal c_i        : std_logic := '0';
    signal s_o        : std_logic_vector(1 downto 0);
    signal c_o        : std_logic;
    
begin
    -- Link DUT
    DUT : adder_two_bit port map(
        d1        => d1_i,
        d2        => d2_i,
        carry_in  => c_i,
        sum       => s_o,
        carry_out => c_o
    );

    stim_proc : process
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                d2_i <= d2_i + "1";
                wait for 1 ns;
            end loop;
            d1_i <= d1_i + "1";
            wait for 1 ns;
        end loop;
    
        assert false report "Test done" severity note;
        wait;
    end process; -- stim_proc
end tb; -- tb
