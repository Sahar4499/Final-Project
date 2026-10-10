library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hPE is
    port(
        RST   : in  std_logic;
        CLK   : in  std_logic;
        EN    : in  std_logic;

        A     : in  std_logic_vector(15 downto 0);
        B     : in  std_logic_vector(15 downto 0);

        C     : out std_logic_vector(31 downto 0);
        A_out : out std_logic_vector(15 downto 0);
        B_out : out std_logic_vector(15 downto 0)
    );
end entity hPE;

architecture Behavioral of hPE is

    signal A_data : std_logic_vector(15 downto 0) := (others => '0');
    signal B_data : std_logic_vector(15 downto 0) := (others => '0');
    signal ACC    : std_logic_vector(31 downto 0) := (others => '0');
    signal mult_p : std_logic_vector(31 downto 0);

    component mult16x16 is
      port(
        a : in  std_logic_vector(15 downto 0);
        b : in  std_logic_vector(15 downto 0);
        p : out std_logic_vector(31 downto 0)
      );
    end component;

begin

    U_MULT : mult16x16
      port map(
        a => A_data,
        b => B_data,
        p => mult_p
      );

    process(CLK)
    begin
        if rising_edge(CLK) then
            if (EN = '1' and RST = '0') then
                ACC    <= std_logic_vector(unsigned(ACC) + unsigned(mult_p));
                A_data <= A;
                B_data <= B;
            end if;

            if (EN = '0' and RST = '1') then
                ACC <= (others => '0');
            end if;
        end if;
    end process;

    A_out <= A_data;
    B_out <= B_data;
    C     <= ACC;

end architecture Behavioral;
