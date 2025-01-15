----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2021 22:01:07
-- Design Name: 
-- Module Name: counter_4 - beh_count_4
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_4 is
  Port ( clk,reset : in std_logic;
          input    : in std_logic_vector(3 downto 0);
          count    : out std_logic_vector(5 downto 0)
        );
end counter_4;

architecture beh_count_4 of counter_4 is

signal counter : unsigned(5 downto 0):= "0000";

begin


--implemented with SYNCHRONOUS RESET

count<=std_logic_vector(counter);

process (clk)
begin
  if clk'event and clk='1' then
     if reset='1' then
        counter<=(others=>'0');
     else
       if input="0110" then
         counter<= counter+1;
       end if;
       if counter=63 then
         counter<=(others=>'0');
       end if;
     end if;
 end if;
end process;

end beh_count_4;
