library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity systolic_2x2 is
    port(
        CLK   : in  std_logic;
        RST   : in  std_logic;
        EN    : in  std_logic;

        A0_in : in  std_logic_vector(15 downto 0);
        A1_in : in  std_logic_vector(15 downto 0);

        B0_in : in  std_logic_vector(15 downto 0);
        B1_in : in  std_logic_vector(15 downto 0);

        C00   : out std_logic_vector(31 downto 0);
        C01   : out std_logic_vector(31 downto 0);
        C10   : out std_logic_vector(31 downto 0);
        C11   : out std_logic_vector(31 downto 0)
    );
end entity systolic_2x2;

architecture Structural of systolic_2x2 is

    signal A01, A11 : std_logic_vector(15 downto 0);
    signal B10, B11 : std_logic_vector(15 downto 0);

begin

    -- שורה 0, עמודה 0
    PE00 : entity work.hPE
      port map(
        RST   => RST,
        CLK   => CLK,
        EN    => EN,
        A     => A0_in,
        B     => B0_in,
        C     => C00,
        A_out => A01,
        B_out => B10
      );

    -- שורה 0, עמודה 1
    PE01 : entity work.hPE
      port map(
        RST   => RST,
        CLK   => CLK,
        EN    => EN,
        A     => A01,
        B     => B1_in,
        C     => C01,
        A_out => open,
        B_out => B11
      );

    -- שורה 1, עמודה 0
    PE10 : entity work.hPE
      port map(
        RST   => RST,
        CLK   => CLK,
        EN    => EN,
        A     => A1_in,
        B     => B10,
        C     => C10,
        A_out => A11,
        B_out => open
      );

    -- שורה 1, עמודה 1
    PE11 : entity work.hPE
      port map(
        RST   => RST,
        CLK   => CLK,
        EN    => EN,
        A     => A11,
        B     => B11,
        C     => C11,
        A_out => open,
        B_out => open
      );

end architecture Structural;
