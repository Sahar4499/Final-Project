library ieee;
use ieee.std_logic_1164.all;

entity booth_encoder is
    port (
        b_triplet : in  std_logic_vector(2 downto 0); -- {b(i+1), b(i), b(i-1)}
        sel_1x    : out std_logic; -- Select A
        sel_2x    : out std_logic; -- Select 2A
        neg       : out std_logic  -- Sign bit (Invert for negative)
    );
end entity;

architecture gate_level of booth_encoder is
begin

    sel_1x <= b_triplet(1) xor b_triplet(0);
    sel_2x <= (not b_triplet(2) and b_triplet(1) and b_triplet(0)) or 
              (b_triplet(2) and not b_triplet(1) and not b_triplet(0));
    neg    <= b_triplet(2);
end architecture;