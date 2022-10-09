library IEEE;
use IEEE.std_logic_1164.all;

entity adder_two_bit is
    port (
        d1, d2    : in std_logic_vector(1 downto 0);
        carry_in  : in std_logic;
        sum       : out std_logic_vector(1 downto 0);
        carry_out : out std_logic
    );
end adder_two_bit;

architecture rtl of adder_two_bit is
    -- Subcircuit component
    component full_adder is
        port (
        d1, d2         : in  std_logic;
        carry_in       : in  std_logic;
        sum, carry_out : out std_logic
        );
    end component;
    
    -- Signals
    signal c0, c1 : std_logic;
    
begin
    -- Link subcircuit
    U0 : full_adder port map(
        d1        => d1(0),
        d2        => d2(0),
        carry_in  => c_i,
        sum       => sum(0),
        carry_out => c0
        
    );
    U1 : full_adder port map(
        d1        => d1(1),
        d2        => d2(1),
        carry_in  => c0,
        sum       => sum(1),
        carry_out => c1
    );
    
    carry_out <= c1;
end rtl; -- rtl
