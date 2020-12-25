LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter_tb IS
END counter_tb;
 
ARCHITECTURE behavior OF counter_tb IS 
 
    COMPONENT counter
    PORT(
         clk : IN bit;
         count : OUT  natural RANGE 0 TO 15
        );
    END COMPONENT;
    
   signal clk : bit := '0';
   signal count : natural RANGE 0 TO 15;
 
BEGIN
 
   uut: counter PORT MAP (
          clk => clk,
          count => count
        );

   clk_process :process
   begin
		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
   end process;
 
   stim_proc: process
   begin		
      wait for 100 ns;	
      wait;
   end process;

END;
