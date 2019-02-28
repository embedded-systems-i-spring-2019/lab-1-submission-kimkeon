----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 02:23:16 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
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

entity clock_div is
  Port (clk     : in std_logic;
        div     : out std_logic );
end clock_div;

architecture Behavioral of clock_div is
    signal count: integer:=1;
    signal temp: std_logic := '0';
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            temp <= '0';
            if(count = 62500000) then
                count <= 0;
                temp <= '1';
            else
                count <= count+1;
            end if;
        end if;
    div <= temp;
    end process;

end Behavioral;
