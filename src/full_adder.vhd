-------------------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
-------------------------------------------------------------------------------

entity full_adder is
  port (
    i_bit1  : in bit;
    i_bit2  : in bit;
    i_carry : in bit;
    --
    o_sum   : out bit;
    o_carry : out bit
  );
end full_adder;


architecture rtl of full_adder is

  signal w_WIRE_1 : bit;
  signal w_WIRE_2 : bit;
  signal w_WIRE_3 : bit;

begin

  w_WIRE_1 <= i_bit1 xor i_bit2;
  w_WIRE_2 <= w_WIRE_1 and i_carry;
  w_WIRE_3 <= i_bit1 and i_bit2;
  
  o_sum   <= w_WIRE_1 xor i_carry;
  o_carry <= w_WIRE_2 or w_WIRE_3;
  -- FYI: Code above using wires will produce the same results as:
  -- o_sum   <= i_bit1 xor i_bit2 xor i_carry;
  -- o_carry <= (i_bit1 xor i_bit2) and i_carry) or (i_bit1 and i_bit2);
  -- Wires are just used to be explicit. 
end rtl;