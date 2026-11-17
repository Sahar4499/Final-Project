library ieee;
use ieee.std_logic_1164.all;

entity ripple_adder_32bit is
    port (
        a    : in  std_logic_vector(31 downto 0);
        b    : in  std_logic_vector(31 downto 0);
        cin  : in  std_logic;
        sum  : out std_logic_vector(31 downto 0);
        cout : out std_logic
    );
end entity;

architecture structural of ripple_adder_32bit is

    component full_adder is
        port (
            a    : in  std_logic;
            b    : in  std_logic;
            cin  : in  std_logic;
            sum  : out std_logic;
            cout : out std_logic
        );
    end component;

    signal c : std_logic_vector(32 downto 0);

begin

    c(0) <= cin;

    GEN_FA: for i in 0 to 31 generate
    begin
        FA_INST: full_adder
            port map (
                a    => a(i),
                b    => b(i),
                cin  => c(i),
                sum  => sum(i),
                cout => c(i + 1)
            );
    end generate;

    cout <= c(32);

end architecture;