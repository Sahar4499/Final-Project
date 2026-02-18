library ieee;
use ieee.std_logic_1164.all;

entity booth_bit_cell is
    port (
        a_j      : in  std_logic; -- Current bit A[j]
        a_prev   : in  std_logic; -- Previous bit A[j-1]
        sel_1x   : in  std_logic; -- From Encoder
        sel_2x   : in  std_logic; -- From Encoder
        neg      : in  std_logic; -- From Encoder
        pp_bit   : out std_logic  -- Partial Product output bit
    );
end entity;

architecture gate_level of booth_bit_cell is
    signal mux_out : std_logic;
begin
    -- בחירת הערך (MUX 3-to-1 מופשט)
    mux_out <= (a_j and sel_1x) or (a_prev and sel_2x);
    
    -- היפוך סימן (XOR)
    pp_bit <= mux_out xor neg;
end architecture;