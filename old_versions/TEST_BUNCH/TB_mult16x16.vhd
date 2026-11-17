library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_mult16x16 is
end TB_mult16x16;

architecture Behavioral of TB_mult16x16 is

    signal a : std_logic_vector(15 downto 0);
    signal b : std_logic_vector(15 downto 0);
    signal p : std_logic_vector(31 downto 0);

begin

    UUT : entity work.mult16x16
      port map(
        a => a,
        b => b,
        p => p
      );

    process
    begin
        a <= x"0003"; b <= x"0004"; wait for 20 ns; -- 3*4=12
        a <= x"0005"; b <= x"0007"; wait for 20 ns; -- 5*7=35
        a <= x"00FF"; b <= x"0002"; wait for 20 ns; -- 255*2
        a <= x"1234"; b <= x"0001"; wait for 20 ns; -- check pass-through
        a <= (others => '0'); b <= (others => '0'); wait for 20 ns;
        wait;
    end process;

end architecture Behavioral;
