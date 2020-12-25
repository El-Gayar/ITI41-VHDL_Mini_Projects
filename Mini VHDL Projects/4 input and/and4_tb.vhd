
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY and4_tb IS
END and4_tb;
 
ARCHITECTURE behavior OF and4_tb IS 
  
    COMPONENT and4
    PORT(
         x1 : IN  bit;
         x2 : IN  bit;
         x3 : IN  bit;
         x4 : IN  bit;
         y : OUT  bit
        );
    END COMPONENT;
    
   signal x1 : bit ;
   signal x2 : bit ;
   signal x3 : bit ;
   signal x4 : bit ;

   signal y : bit;
 
 
BEGIN
 
   uut: and4 PORT MAP (
          x1 => x1,
          x2 => x2,
          x3 => x3,
          x4 => x4,
          y => y
        );

   
   stim_proc: process
   begin		
		x1 <= '0';
		x2 <= '0';
		x3 <= '0';
		x4 <= '0';
		wait for 20 ns;
		x1 <= '1';
		x2 <= '1';
		x3 <= '1';
		x4 <= '1';
		wait for 20 ns;
		x1 <= '1';
		x2 <= '0';
		x3 <= '0';
		x4 <= '1';
		wait for 20 ns;
		x1 <= '0';
		x2 <= '1';
		x3 <= '1';
		x4 <= '0';
		wait for 20 ns;
		x1 <= '0';
		x2 <= '1';
		x3 <= '0';
		x4 <= '1';
      wait;
   end process;

END;
