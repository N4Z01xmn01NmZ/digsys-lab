library IEEE;
use IEEE.std_logic_1164.all;

entity L02_FullAdderTb is
-- empty
end L02_FullAdderTb;

architecture tb of L02_FullAdderTb is
    -- Device Under Test (DUT) Component Declaration
    component full_adder is
        port (
            d0, d1    : in  std_logic;
            carry_in  : in  std_logic;
            sum       : out std_logic;
            carry_out : out std_logic
        ) ;
    end component;

    -- Signals
     signal d0_i, d1_i, c_i, s_o, c_o : std_logic;
begin
    -- Link DUT
    dut : half_adder port map(d0_i, d1_i, c_i, s_o, c_o);

    -- Stimulus process
    stim_proc : process
     begin
        c_i  <= '0';
  
        d0_i <= '0';
        d1_i <= '0';
        wait for 1 ns;
        assert(s_o = '0') report "Fail s_o 0/0" severity error;
        assert(c_o = '0') report "Fail c_o 0/0" severity error;
    
        d0_i <= '1';
        d1_i <= '0';
        wait for 1 ns;
        assert(s_o = '1') report "Fail s_o 1/0" severity error;
        assert(c_o = '0') report "Fail c_o 1/0" severity error;
    
        d0_i <= '0';
        d1_i <= '1';
        wait for 1 ns;
        assert(s_o = '1') report "Fail s_o 0/1" severity error;
        assert(c_o = '0') report "Fail c_o 0/1" severity error;
    
        d0_i <= '1';
        d1_i <= '1';
        wait for 1 ns;
        assert(s_o = '0') report "Fail s_o 1/1" severity error;
        assert(c_o = '1') report "Fail c_o 1/1" severity error;
    
        -- Clear inputs
        d0_i <= '0';
        d1_i <= '0';
    
        wait;
        assert false report "Test done" severity note;
     end process; -- stim_proc
end tb; -- tb
