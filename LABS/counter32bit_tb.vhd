--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:55:23 12/21/2020
-- Design Name:   
-- Module Name:   E:/ITI intake 41/LABS/VHDL/conuter4saad/counter32bit_tb.vhd
-- Project Name:  conuter4saad
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter32bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter32bit_tb IS
END counter32bit_tb;
 
ARCHITECTURE behavior OF counter32bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter32bit
    PORT(
         clk : IN  std_logic;
         cout : OUT  std_logic_vector(31 downto 0);
         overflow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal cout : std_logic_vector(31 downto 0);
   signal overflow : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter32bit PORT MAP (
          clk => clk,
          cout => cout,
          overflow => overflow
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
END;
