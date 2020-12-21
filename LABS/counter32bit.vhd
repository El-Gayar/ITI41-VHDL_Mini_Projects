----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:08:39 12/21/2020 
-- Design Name: 
-- Module Name:    counter32bit - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter32bit is
    Port ( clk : in  STD_LOGIC;
           cout : out  STD_LOGIC_VECTOR (31 downto 0);
           overflow : out  STD_LOGIC);
end counter32bit;



architecture Behavioral of counter32bit is
	component cunter4bit is
		Port ( clk : in  STD_LOGIC;
		       overflow : out  STD_LOGIC;
	          cout : inout  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	signal cout1 : STD_LOGIC_VECTOR (3 downto 0);
	signal cout2 : STD_LOGIC_VECTOR (3 downto 0);
	signal cout3 : STD_LOGIC_VECTOR (3 downto 0);
	signal cout4 : STD_LOGIC_VECTOR (3 downto 0);
	signal cout5 : STD_LOGIC_VECTOR (3 downto 0);
	signal cout6 : STD_LOGIC_VECTOR (3 downto 0);
	signal cout7 : STD_LOGIC_VECTOR (3 downto 0);
	signal cout8 : STD_LOGIC_VECTOR (3 downto 0);
	
	signal overflow1 :   STD_LOGIC;
	signal overflow2 :   STD_LOGIC;
	signal overflow3 :   STD_LOGIC;
	signal overflow4 :   STD_LOGIC;
	signal overflow5 :   STD_LOGIC;
	signal overflow6 :   STD_LOGIC;
	signal overflow7 :   STD_LOGIC;
	signal overflow8 :   STD_LOGIC;
	
begin
	counter1 : cunter4bit port map (clk, overflow1 , cout1);
	counter2 : cunter4bit port map (overflow1, overflow2 , cout2);
	counter3 : cunter4bit port map (overflow2, overflow3 , cout3);
	counter4 : cunter4bit port map (overflow3, overflow4 , cout4);
	counter5 : cunter4bit port map (overflow4, overflow5 , cout5);
	counter6 : cunter4bit port map (overflow5, overflow6 , cout6);
	counter7 : cunter4bit port map (overflow6, overflow7 , cout7);
	counter8 : cunter4bit port map (overflow7, overflow8 , cout8);
	
	cout <= cout8 & cout7 & cout6 & cout5 & cout4 & cout3 & cout2 & cout1 ;
	overflow <= not overflow8;
end Behavioral;

