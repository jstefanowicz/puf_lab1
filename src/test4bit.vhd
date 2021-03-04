library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity test4bit is
end test4bit;
 
architecture rtl of test4bit is
 

  component adder4bit is
    port (
      i_in1     : in bit_vector(3 downto 0);
      i_in2     : in bit_vector(3 downto 0);
      --
      o_sum   : out bit_vector (3 downto 0);
      o_carry : out bit
    );
  end component;
  
      signal o_sum   : bit_vector (3 downto 0);
      signal o_carry : bit;

      signal counter0       : bit_vector (3 downto 0);
      signal counter1       : bit_vector (3 downto 0);
      signal sum            : bit_vector (3 downto 0);
      signal res            : bit_vector (3 downto 0);
      signal ovf            : bit;
      signal counter0_stdlv : unsigned (3 downto 0) := (others => '0');
      signal counter1_stdlv : unsigned (3 downto 0) := (others => '1');
      signal res_stdlv      : unsigned (3 downto 0);
      signal err_sig        : bit;
begin

  uut : adder4bit
    port map(
      i_in1   => counter0,
      i_in2   => counter1,
      --
      o_sum   => sum,
      o_carry => ovf
    );
  
  err_sig <= '1' when sum /= res else '0';

  counter0 <= to_bitvector(std_logic_vector(counter0_stdlv));
  counter1 <= to_bitvector(std_logic_vector(counter1_stdlv));
  res      <= to_bitvector(std_logic_vector(res_stdlv));
  res_stdlv      <= counter0_stdlv + counter1_stdlv;

  process begin
    counter0_stdlv <= counter0_stdlv + 7;
    counter1_stdlv <= counter1_stdlv + 3;
    wait for 10 ns;
  end process;
end rtl;