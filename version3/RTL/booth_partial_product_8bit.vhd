library ieee;
use ieee.std_logic_1164.all;

entity booth_partial_product_8bit is
    port (
        a      : in  std_logic_vector(7 downto 0);
        sel_1x : in  std_logic;
        sel_2x : in  std_logic;
        neg    : in  std_logic;
        pp     : out std_logic_vector(15 downto 0)
    );
end entity;

architecture structural of booth_partial_product_8bit is

    component booth_bit_cell is
        port (
            a_j      : in  std_logic;
            a_prev   : in  std_logic;
            sel_1x   : in  std_logic;
            sel_2x   : in  std_logic;
            neg      : in  std_logic;
            pp_bit   : out std_logic
        );
    end component;

    signal pp_raw : std_logic_vector(8 downto 0);

begin

    BIT0: booth_bit_cell
        port map (
            a_j    => a(0),
            a_prev => '0',
            sel_1x => sel_1x,
            sel_2x => sel_2x,
            neg    => neg,
            pp_bit => pp_raw(0)
        );

    GEN_BITS: for i in 1 to 7 generate
    begin
        BC: booth_bit_cell
            port map (
                a_j    => a(i),
                a_prev => a(i - 1),
                sel_1x => sel_1x,
                sel_2x => sel_2x,
                neg    => neg,
                pp_bit => pp_raw(i)
            );
    end generate;

    BIT8: booth_bit_cell
        port map (
            a_j    => a(7),
            a_prev => a(7),
            sel_1x => sel_1x,
            sel_2x => sel_2x,
            neg    => neg,
            pp_bit => pp_raw(8)
        );

    pp(8 downto 0)  <= pp_raw;
    pp(15 downto 9) <= (others => pp_raw(8));

end architecture;