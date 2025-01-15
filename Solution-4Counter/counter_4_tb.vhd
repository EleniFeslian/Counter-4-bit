----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2021 22:11:24
-- Design Name: 
-- Module Name: counter_4_tb - beh_counter_4_tb
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

entity counter_4_tb is
--  Port ( );
end counter_4_tb;

architecture beh_counter_4_tb of counter_4_tb is

component counter_4 is
 Port (  clk,reset : in std_logic;
          input    : in std_logic_vector(3 downto 0);
          count     : out std_logic_vector(5 downto 0)
          );
end component counter_4;

constant clk_period: time := 10.000 ns;

signal clk   :  std_logic;
signal reset :  std_logic;
signal input :  std_logic_vector(3 downto 0);
signal count :  std_logic_vector(5 downto 0);


begin

uut: counter_4 port map (clk,reset,input,count);

clk_process : process
    begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
end process clk_process;


test: process is

begin

--SYNCHRONOUS RESET declaration
reset <= '1';
wait for 100 ns;
wait until (clk = '0' and clk'event);
reset <= '0';
		
for j in 0 to 2 loop
    for i in 0 to 3 loop
        input<=std_logic_vector(to_unsigned(i,input'length)); wait for clk_period;
    end loop;
end loop;

end process test;	

end beh_counter_4_tb;
