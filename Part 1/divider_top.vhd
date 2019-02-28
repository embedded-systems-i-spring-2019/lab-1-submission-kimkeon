----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 02:37:46 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

entity divider_top is
  Port (clk     : in std_logic;
        led0    : out std_logic );
end divider_top;

architecture Behavioral of divider_top is
    component clock_div is
        port(
            clk     : in std_logic;
            div     : out std_logic
        );
    end component;
    
    
    signal div_out  : std_logic;
    signal temp     : std_logic:='0';
begin
    freqDivider: clock_div port map(
        clk => clk,
        div => div_out
    );
    
    led0 <= temp;
    
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(div_out = '1') then
                temp <= not temp;
            end if;
        end if;
    end process;

end Behavioral;
