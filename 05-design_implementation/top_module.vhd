library IEEE;
use IEEE.std_logic_1164.all;

entity L05_TopModule is
    port (
        BTN : in  std_logic_vector(1 downto 0);
        SW  : in  std_logic_vector(1 downto 0);
        CAT : out std_logic_vector(7 downto 0);
        ANO : out std_logic_vector(3 downto 0);
        LD  : out std_logic_vector(3 downto 0)
    );
end L05_TopModule;

architecture rtl of L05_TopModule is

    
    component twobit_adder is
        port (
            d0, d1    : in  std_logic_vector(1 downto 0);
            carry_in  : in  std_logic;
            sum       : out std_logic_vector(1 downto 0);
            carry_out : out std_logic
        );
    end component;

    component seven_segment_decoder is
        port (
            s : in  std_logic_vector(3 downto 0);
            c : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Inputs
    signal s_d0, s_d1 : std_logic_vector(1 downto 0);
    signal s_cin      : std_logic := '0';

    -- Intermediate
    signal s_sum      : std_logic_vector(1 downto 0);
    signal s_cout     : std_logic;
    signal s_bin      : std_logic_vector(2 downto 0);
    
    -- Outputs
    signal s_cathode  : std_logic_vector(6 downto 0);
    signal s_anode    : std_logic_vector(3 downto 0);

begin
    s_d0 <= BTN;
    s_d1 <= SW;
    
    LED(3 downto 2) <= s_d0;
    LED(1 downto 0) <= s_d1;

    adder : twobit_adder port map(
        d0        => s_d0,
        d1        => s_d1,
        carry_in  => s_cin,
        sum       => s_sum,
        carry_out => s_cout
    );

    s_bin(1 downto 0) <= s_sum;
    s_bin(2) <= s_cout;

    decoder : seven_segment_decoder port map(
        s => s_bin,
        c => s_cat
    );

    CAT <= s_cat;
    ANO <= o_anode <= "0111";

end rtl ; -- rtl