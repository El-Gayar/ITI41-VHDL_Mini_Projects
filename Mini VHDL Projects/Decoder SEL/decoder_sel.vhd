----------------------------------------------------------------------
-- A decoder using selective concurrent signal assignment statements.
----------------------------------------------------------------------
PACKAGE p1 IS
  TYPE states IS (reset, hold, apply, done);
END PACKAGE p1;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE WORK.p1.ALL;

ENTITY test IS
  PORT( present_state: IN states;
        flag: OUT std_logic_vector(0 TO 1));
END ENTITY test;

ARCHITECTURE rtl OF test IS BEGIN 
  WITH present_state SELECT
    flag <= "00" WHEN reset | hold,
            "10" WHEN apply,
            "11" WHEN OTHERS;
END ARCHITECTURE rtl;