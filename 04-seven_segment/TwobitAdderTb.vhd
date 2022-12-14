library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity L04_TwobitAdderTb is
    -- empty
end L04_TwobitAdderTb;

architecture tb of L04_TwobitAdderTb is

    -- Unit Under Test (UUT) Component Declaration
    component twobit_adder is
        port (
            d0, d1    : in  std_logic_vector(1 downto 0);
            carry_in  : in  std_logic;
            sum       : out std_logic_vector(1 downto 0);
            carry_out : out std_logic
        );
    end component;

    -- Inputs
    signal d0_i, d1_i : std_logic_vector(1 downto 0) := (others => '0');
    signal c_i        : std_logic := '0';
    
    -- Outputs
    signal s_o        : std_logic_vector(1 downto 0);
    signal c_o        : std_logic;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut : twobit_adder port map(
        d0        => d0_i,
        d1        => d1_i,
        carry_in  => c_i,
        sum       => s_o,
        carry_out => c_o
    );

    -- Stimulus process
    stim_proc : process
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                d1_i <= d1_i + '1';
                wait for 1 ns;
            end loop;
            d0_i <= d0_i + '1';
            wait for 1 ns;
        end loop;
    
        assert false report "Test done" severity note;
        wait;
    end process; -- stim_proc
end tb; -- tb
