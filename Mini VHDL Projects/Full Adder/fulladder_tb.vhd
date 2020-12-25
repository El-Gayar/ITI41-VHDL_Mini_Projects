LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY fulladder_tb IS
END fulladder_tb;
 
ARCHITECTURE behavior OF fulladder_tb IS 
  
    COMPONENT full_adder
    PORT(
         a : IN  bit;
         b : IN  bit;
         c_in : IN  bit;
         s : OUT  bit;
         c_out : OUT  bit
        );
    END COMPONENT;
    
   signal a : bit := '0';
   signal b : bit := '0';
   signal c_in : bit := '0';
   signal s : bit;
   signal c_out : bit;
 
BEGIN
 
   uut: full_adder PORT MAP (
          a => a,
          b => b,
          c_in => c_in,
          s => s,
          c_out => c_out
        );

   stim_proc: process
   begin		
	
		a<= '0'; b<= '0'; c_in<= '0';
		wait for 20 ns;	
		assert c_out & s="00" 
		report "one of inputs stuck in one"
		severity error;
		wait for 20 ns;	

		a<= '0'; b<= '1'; c_in<= '0';
		wait for 20 ns;
		assert c_out & s="01" 
		report "problem in output signal connection"
		severity error;
		wait for 20 ns;	

		a<= '1'; b<= '0'; c_in<= '1';
		wait for 20 ns;
		assert c_out & s="10" 
		report "problem in output signal connection"
		severity error;
		wait for 20 ns;	

		a<= '1'; b<= '1'; c_in<= '1';
		wait for 20 ns;
		assert c_out & s="11" 
		report "one of inputs stuck in zero"
		severity error;
		wait for 20 ns;	

		wait;
   end process;

END;
