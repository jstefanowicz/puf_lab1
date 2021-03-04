entity test is
end test;
 
architecture rtl of test is
 
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

  signal i_bit1  : bit;
  signal i_bit2  : bit;
  signal i_carry : bit;
  signal o_sum   : bit;
  signal o_carry : bit; 
  signal cout    : bit; 
  signal sum     : bit; 
  signal err_sig : bit; 

begin

  uut: full_adder
  port map (
    i_bit1   => i_bit1  ,
    i_bit2   => i_bit2  ,
    i_carry  => i_carry ,
    o_sum    => o_sum   ,
    o_carry  => o_carry
  );

  err_sig <= '1' when cout /= o_carry or sum /= o_sum else '0';

  
  process begin
    i_bit1 <= '0';
    i_bit2 <= '0' ;
    i_carry <= '0';
    cout <= '0';
    sum  <= '0';
    wait for 10 ns;
    i_bit1 <= '1';
    i_bit2 <= '0' ;
    i_carry <= '0';
    cout <= '0';
    sum  <= '1';
    wait for 10 ns;
    i_bit1 <= '0';
    i_bit2 <= '1' ;
    i_carry <= '0';
    cout <= '0';
    sum  <= '1';
    wait for 10 ns;
    i_bit1 <= '1';
    i_bit2 <= '1' ;
    i_carry <= '0';
    cout <= '1';
    sum  <= '0';
    wait for 10 ns;
    i_bit1 <= '0';
    i_bit2 <= '0' ;
    i_carry <= '1';
    cout <= '0';
    sum  <= '1';
    wait for 10 ns;
    i_bit1 <= '1';
    i_bit2 <= '0' ;
    i_carry <= '1';
    cout <= '1';
    sum  <= '0';
    wait for 10 ns;
    i_bit1 <= '0';
    i_bit2 <= '1' ;
    i_carry <= '1';
    cout <= '1';
    sum  <= '0';
    wait for 10 ns;
    i_bit1 <= '1';
    i_bit2 <= '1' ;
    i_carry <= '1';
    cout <= '1';
    sum  <= '1';
    wait for 10 ns;

  end process;
end rtl;