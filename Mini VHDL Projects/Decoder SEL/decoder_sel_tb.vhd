LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE WORK.p1.ALL;

ENTITY decoder_sel_tb IS
END decoder_sel_tb;
 
ARCHITECTURE behavior OF decoder_sel_tb IS 
 
    COMPONENT test
    PORT(
         present_state : IN  states;
         flag : OUT  std_logic_vector(0 to 1)
        );
    END COMPONENT;
	 
   signal present_state : states;
   signal flag : std_logic_vector(0 to 1);
 
BEGIN
 
 uut: test PORT MAP (
          present_state => present_state,
          flag => flag
        );

   stim_proc: process
   begin		
	present_state <= hold;
	wait for 20 ns;
	present_state <= apply;
	wait for 20 ns;
	present_state <= done;
	wait for 20 ns;
	present_state <= reset;
   wait for 20 ns;
   end process;

END;
