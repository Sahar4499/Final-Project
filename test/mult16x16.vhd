library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult16x16 is
  port(
    a : in  std_logic_vector(15 downto 0);
    b : in  std_logic_vector(15 downto 0);
    p : out std_logic_vector(31 downto 0)
  );
end entity;

architecture rtl of mult16x16 is
  type u32_array is array (0 to 7) of unsigned(31 downto 0);
begin

  process(a, b)
    variable a_u   : unsigned(15 downto 0);
    variable b_u   : unsigned(15 downto 0);

    variable a32   : unsigned(31 downto 0);
    variable a_s   : signed(31 downto 0);

    variable b_ext : std_logic_vector(16 downto 0); -- unsigned: y(-1)=0, y(16)=0
    variable code  : std_logic_vector(2 downto 0);
    variable fac   : integer;

    variable t     : signed(31 downto 0);
    variable pp    : u32_array;

    -- CSA tree vars
    variable x, y, z : unsigned(31 downto 0);
    variable s1, c1  : unsigned(31 downto 0);
    variable s2, c2  : unsigned(31 downto 0);
    variable s3, c3  : unsigned(31 downto 0);
    variable s4, c4  : unsigned(31 downto 0);
    variable sum_v, car_v : unsigned(31 downto 0);

    variable prod : unsigned(31 downto 0);
  begin
    a_u := unsigned(a);
    b_u := unsigned(b);

    a32 := resize(a_u, 32);
    a_s := signed(a32);

    --------------------------------------------------------------------------
    -- Build b_ext for Booth Radix-4:
    -- b_ext(0)=y(-1)=0, b_ext(1)=b(0), ..., b_ext(16)=y(16)=0 for unsigned
    --------------------------------------------------------------------------
    b_ext(0)  := '0';
    b_ext(16) := '0';
    for i in 0 to 15 loop
      b_ext(i+1) := b(i);
    end loop;

    --------------------------------------------------------------------------
    -- Stage: Booth recode + generate 8 partial products (combinational)
    --------------------------------------------------------------------------
    for k in 0 to 7 loop
      code := b_ext(2*k+2) & b_ext(2*k+1) & b_ext(2*k);

      -- Booth table -> fac in {-2,-1,0,+1,+2}
      case code is
        when "000" | "111" => fac := 0;
        when "001" | "010" => fac := 1;
        when "011"         => fac := 2;
        when "100"         => fac := -2;
        when "101" | "110" => fac := -1;
        when others        => fac := 0;
      end case;

      -- t = fac * A
      case fac is
        when 0  => t := (others => '0');
        when 1  => t := a_s;
        when 2  => t := shift_left(a_s, 1);
        when -1 => t := -a_s;
        when -2 => t := -shift_left(a_s, 1);
        when others => t := (others => '0');
      end case;

      -- shift by 2*k
      t := shift_left(t, 2*k);

      -- store as bit-pattern (two's complement) in unsigned
      pp(k) := unsigned(t);
    end loop;

    --------------------------------------------------------------------------
    -- CSA reduction tree: sum = x xor y xor z
    --                     carry = ((x&y)|(x&z)|(y&z)) << 1
    --------------------------------------------------------------------------
    -- level 1: (0,1,2)
    x := pp(0); y := pp(1); z := pp(2);
    s1 := x xor y xor z;
    c1 := shift_left(((x and y) or (x and z) or (y and z)), 1);

    -- level 1: (3,4,5)
    x := pp(3); y := pp(4); z := pp(5);
    s2 := x xor y xor z;
    c2 := shift_left(((x and y) or (x and z) or (y and z)), 1);

    -- level 2: (s1,c1,6)
    x := s1; y := c1; z := pp(6);
    s3 := x xor y xor z;
    c3 := shift_left(((x and y) or (x and z) or (y and z)), 1);

    -- level 2: (s2,c2,7)
    x := s2; y := c2; z := pp(7);
    s4 := x xor y xor z;
    c4 := shift_left(((x and y) or (x and z) or (y and z)), 1);

    -- level 3: (s3,c3,s4)  -> two vectors (sum_v, car_v)
    x := s3; y := c3; z := s4;
    sum_v := x xor y xor z;
    car_v := shift_left(((x and y) or (x and z) or (y and z)), 1);

    --------------------------------------------------------------------------
    -- Final carry-propagate add
    --------------------------------------------------------------------------
    prod := sum_v + car_v + c4;

    p <= std_logic_vector(prod);
  end process;

end architecture;