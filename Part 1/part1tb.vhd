----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 04:25:10 PM
-- Design Name: 
-- Module Name: part1tb - Behavioral
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

entity part1tb is
end part1tb;

architecture testbench of part1tb is
    signal clk_tb : std_logic := '0';
    signal div_tb : std_logic := '0';
    
    component clock_div is
        port(
            clk : in std_logic;
            div: out std_logic
        );
    end component;

begin
    process
    begin
        wait for 4 ns;
        clk_tb <= '1';
        wait for 4 ns;
        clk_tb <= '0';
    end process;
    
    uut: clock_div
        port map(
            clk => clk_tb,
            div => div_tb
        );

end testbench;
