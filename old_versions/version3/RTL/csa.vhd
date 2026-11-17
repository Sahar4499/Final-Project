library ieee;
use ieee.std_logic_1164.all;

entity csa_layer_32bit is
    port (
        row_a, row_b, row_c : in  std_logic_vector(31 downto 0);
        sum_out             : out std_logic_vector(31 downto 0);
        carry_out           : out std_logic_vector(31 downto 0)
    );
end entity;

architecture structural of csa_layer_32bit is
begin
    -- בווירטואזו: Instance של FA<0:31>
    GEN_FA: for i in 0 to 31 generate
        FA_INST: entity work.full_adder
            port map (
                a    => row_a(i),
                b    => row_b(i),
                cin  => row_c(i),
                sum  => sum_out(i),
                cout => carry_out(i) -- ה-Carry יועבר בהסטה שמאלה בשכבה הבאה
            );
    end generate;
end architecture;