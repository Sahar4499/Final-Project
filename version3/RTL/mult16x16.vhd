library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult16x16_hierarchical is
    port(
        a : in  std_logic_vector(15 downto 0);
        b : in  std_logic_vector(15 downto 0);
        p : out std_logic_vector(31 downto 0)
    );
end entity;

architecture arch of mult16x16_hierarchical is
    signal p_ll, p_lh, p_hl, p_hh : std_logic_vector(15 downto 0);
    signal term1, term2, term3, term4 : unsigned(31 downto 0);
begin
    -- 4 Instances of the 8x8 multiplier
    MULT_LL: entity work.mult8x8 port map(a(7 downto 0),  b(7 downto 0),  p_ll);
    MULT_LH: entity work.mult8x8 port map(a(15 downto 8), b(7 downto 0),  p_lh);
    MULT_HL: entity work.mult8x8 port map(a(7 downto 0),  b(15 downto 8), p_hl);
    MULT_HH: entity work.mult8x8 port map(a(15 downto 8), b(15 downto 8), p_hh);

    -- Alignment and Summation (The 16x16 logic)
    term1 <= resize(unsigned(p_ll), 32);
    term2 <= resize(unsigned(p_lh), 32) sll 8;
    term3 <= resize(unsigned(p_hl), 32) sll 8;
    term4 <= resize(unsigned(p_hh), 32) sll 16;

    p <= std_logic_vector(term1 + term2 + term3 + term4);
end architecture;