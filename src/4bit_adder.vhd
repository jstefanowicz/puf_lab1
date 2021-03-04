-------------------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
-------------------------------------------------------------------------------

entity adder4bit is
  port (
    i_in1     : in bit_vector(3 downto 0);
    i_in2     : in bit_vector(3 downto 0);
    --
    o_sum   : out bit_vector (3 downto 0);
    o_carry : out bit
  );
end adder4bit;


architecture rtl of adder4bit is

  component full_adder is
  port (
    i_bit1  : in bit;
    i_bit2  : in bit;
    i_carry : in bit;
    --
    o_sum   : out bit;
    o_carry : out bit
  );
  end component;
  signal carry_sig : bit_vector(2 downto 0);
begin
  
  ad0 : full_adder
  port map(
    i_bit1  => i_in1(0),
    i_bit2  => i_in2(0),
    i_carry => '0',
    o_sum   => o_sum(0),
    o_carry => carry_sig(0)
  );

  ad1 : full_adder
  port map(
    i_bit1  => i_in1(1),
    i_bit2  => i_in2(1),
    i_carry => carry_sig(0),
    o_sum   => o_sum(1),
    o_carry => carry_sig(1)
  );

  ad2 : full_adder
  port map(
    i_bit1  => i_in1(2),
    i_bit2  => i_in2(2),
    i_carry => carry_sig(1),
    o_sum   => o_sum(2),
    o_carry => carry_sig(2)
  );

  ad3 : full_adder
  port map(
    i_bit1  => i_in1(3),
    i_bit2  => i_in2(3),
    i_carry => carry_sig(2),
    o_sum   => o_sum(3),
    o_carry => o_carry
  );

  
end rtl;