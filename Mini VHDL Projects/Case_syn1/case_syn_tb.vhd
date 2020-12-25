LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;
 
ENTITY case_syn_tb IS
END case_syn_tb;
 
ARCHITECTURE behavior OF case_syn_tb IS 
	 
    COMPONENT case_syn1
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         c : IN  std_logic_vector(3 downto 0);
         d : IN  std_logic_vector(3 downto 0);
         s : IN  std_logic_vector(1 downto 0);
         x : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal c : std_logic_vector(3 downto 0) := (others => '0');
   signal d : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic_vector(1 downto 0) := (others => '0');
   signal x : std_logic_vector(3 downto 0);
	
BEGIN
 	
   uut: case_syn1 PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          s => s,
          x => x
			 );
 
	
   --stim_proc: process
   --begin		
     a <= "0000"; b <= "1111"; c <= "1001"; d <= "0110";
		--s <= "00";
		--wait for 20 ns;
		--s <= "01";
		--wait for 20 ns;
		--s <= "10";
		--wait for 20 ns;
		--s <= "11";
		--wait for 20 ns;
   --end process;
	
	stim_proc: process
   		
	FILE test: text OPEN READ_MODE IS "test.txt";
	FILE result: text OPEN WRITE_MODE IS "test_r.txt";   
	variable sel : std_logic_vector(1 downto 0) := (others => '0');
	variable res : std_logic_vector(3 downto 0);
	variable testline : line;
	variable outline : line;
	
	begin
	while not endfile (test)
		loop
			readline (test , testline);
			read (testline , sel);
			read (testline , res);
			s <= sel;
			wait for 20 ns;
			
			write (outline , sel);
			write (outline , string'(", Expected value of X = "));
			write (outline , res);
			write (outline , string'(", Acutal value of X = "));
			write (outline , x);
			if res = x then
				write (outline , string'(", Right value"));
			else
				write (outline , string'(", wrong value"));
			end if;
			
			writeline (result , outline);
		end loop;
	
	end process;

END;
