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

architecture Pipeline of hPE is

    -- Stage 1: Input registers
    signal A_reg  : std_logic_vector(15 downto 0) := (others => '0');
    signal B_reg  : std_logic_vector(15 downto 0) := (others => '0');

    -- Multiplier result (combinational) and registered output
    signal mult_comb : std_logic_vector(31 downto 0);
    signal mult_reg  : std_logic_vector(31 downto 0) := (others => '0');

    -- Accumulator register
    signal ACC : std_logic_vector(31 downto 0) := (others => '0');

begin

    -- Combinational 16x16 multiplier
    U_MULT : entity work.mult16x16
      port map(
        a => A_reg,
        b => B_reg,
        p => mult_comb
      );

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                A_reg    <= (others => '0');
                B_reg    <= (others => '0');
                mult_reg <= (others => '0');
                ACC      <= (others => '0');
            elsif EN = '1' then
                -- Stage 1: Capture inputs
                A_reg <= A;
                B_reg <= B;

                -- Stage 2: Register multiplier result
                mult_reg <= mult_comb;

                -- Stage 3: Accumulation
                ACC <= std_logic_vector(unsigned(ACC) + unsigned(mult_reg));
            end if;
        end if;
    end process;

    -- Outputs (A_out and B_out are forwarded after one clock cycle,
    -- similar to the non-pipelined version)
    A_out <= A_reg;
    B_out <= B_reg;
    C     <= ACC;

end architecture Pipeline;
