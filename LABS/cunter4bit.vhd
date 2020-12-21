----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:27:55 12/21/2020 
-- Design Name: 
-- Module Name:    cunter4bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cunter4bit is
    Port ( clk : in  STD_LOGIC;
			  overflow : out  STD_LOGIC;
           cout : inout  STD_LOGIC_VECTOR (3 downto 0));
end cunter4bit;

architecture Behavioral of cunter4bit is
signal cout1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
	process (clk)
		begin
			if rising_edge (clk) then
				cout1 <= std_logic_vector(unsigned (cout1) +1);
			end if;
	end process;
	cout <= cout1;
	overflow <= not (cout1(0) and cout1(1) and cout1(2) and cout1(3));
end Behavioral;

