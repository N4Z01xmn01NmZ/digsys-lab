library IEEE;
use IEEE.std_logic_1164.all;

entity seven_segment_decoder is
    port (
        s : in  std_logic_vector(3 downto 0);
        c : out std_logic_vector(6 downto 0)
    );
end seven_segment_decoder ;

architecture rtl of seven_segment_decoder is
begin
-- Decodes a 4 bit value into its hexadecimal counterpart
-- and sends the correct signal pattern to the cathodes
    C <= "1000000" when (S = "0000") else   --0
         "1111001" when (S = "0001") else   --1
         "0100100" when (S = "0010") else   --2
         "0110000" when (S = "0011") else   --3
         "0011001" when (S = "0100") else   --4
         "0010010" when (S = "0101") else   --5
         "0000010" when (S = "0110") else   --6
         "1111000" when (S = "0111") else   --7
         "0000000" when (S = "1000") else   --8
         "0011000" when (S = "1001") else   --9
         "0001000" when (S = "1010") else   --A
         "0000011" when (S = "1011") else   --B
         "1000110" when (S = "1100") else   --C
         "0100001" when (S = "1101") else   --D
         "0000110" when (S = "1110") else   --E
         "0001110";                         --F
end architecture ; -- rtl