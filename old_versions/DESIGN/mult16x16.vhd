library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult16x16 is
  port(
    a : in  std_logic_vector(15 downto 0);
    b : in  std_logic_vector(15 downto 0);
    p : out std_logic_vector(31 downto 0)
  );
end entity mult16x16;

architecture rtl of mult16x16 is
begin
  process(a, b)
    variable a_u : unsigned(15 downto 0);
    variable b_u : unsigned(15 downto 0);
    variable tmp : unsigned(31 downto 0);
  begin
    a_u := unsigned(a);
    b_u := unsigned(b);
    tmp := (others => '0');

    for i in 0 to 15 loop
      if b_u(i) = '1' then
        tmp := tmp + shift_left(resize(a_u, 32), i);
      end if;
    end loop;

    p <= std_logic_vector(tmp);
  end process;
end architecture rtl;