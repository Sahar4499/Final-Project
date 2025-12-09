library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_hPE is
end TB_hPE;

architecture Behavioral of TB_hPE is

    signal CLK   : std_logic := '0';
    signal RST   : std_logic := '0';
    signal EN    : std_logic := '0';
    signal A     : std_logic_vector(15 downto 0) := (others => '0');
    signal B     : std_logic_vector(15 downto 0) := (others => '0');
    signal C     : std_logic_vector(31 downto 0);
    signal A_out : std_logic_vector(15 downto 0);
    signal B_out : std_logic_vector(15 downto 0);

begin

    UUT : entity work.hPE
      port map(
        RST   => RST,
        CLK   => CLK,
        EN    => EN,
        A     => A,
        B     => B,
        C     => C,
        A_out => A_out,
        B_out => B_out
      );

    -- שעון
    CLK_process : process
    begin
        CLK <= '0'; wait for 5 ns;
        CLK <= '1'; wait for 5 ns;
    end process;

    -- גירוי
    Stim : process
    begin
        -- reset
        RST <= '1';
        EN  <= '0';
        A   <= (others => '0');
        B   <= (others => '0');
        wait for 20 ns;

        RST <= '0';
        EN  <= '1';

        -- מחזור 1: 2*3
        A <= x"0002";
        B <= x"0003";
        wait for 10 ns;

        -- מחזור 2: 4*5
        A <= x"0004";
        B <= x"0005";
        wait for 10 ns;

        -- מחזור 3: 1*7
        A <= x"0001";
        B <= x"0007";
        wait for 10 ns;

        -- עצירה
        EN <= '0';
        wait for 20 ns;

        -- reset נוסף
        RST <= '1';
        wait for 10 ns;
        RST <= '0';

        wait;
    end process;

end architecture Behavioral;
