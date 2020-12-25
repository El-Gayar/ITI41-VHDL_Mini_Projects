library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity case_syn1 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           c : in  STD_LOGIC_VECTOR (3 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           x : out  STD_LOGIC_VECTOR (3 downto 0));
end case_syn1;

ARCHITECTURE rtl OF case_syn1 IS BEGIN 
  sl: PROCESS (a, b, c, d, s) IS
  BEGIN 
    CASE s IS
      WHEN "00" => x <= a;
      WHEN "01" => x <= b;
      WHEN "10" => x <= c;
      WHEN others => x <= d;
    END CASE;
  END PROCESS sl;
END ARCHITECTURE rtl;


