library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce_tb is
end debounce_tb;
 
architecture testbench of debounce_tb is
 
    signal clk_tb: std_logic := '0';
    signal btn_tb: std_logic := '0';
    signal deb_out_tb: std_logic := '0';
 
    component debounce is
        port(
            clk: in std_logic;
            btn : in std_logic;
            deb_out: out std_logic
        );
     end component; 
 
begin
    uut : debounce
        port map (
            clk => clk_tb,
            btn => btn_tb,
            deb_out => deb_out_tb
        );
 
    process
        begin 
        btn_tb <= '0';
        wait for 30 ms;
        btn_tb <= '1';
        wait for 30 ms;
    end process;
 
    process
        begin
            clk_tb <= '1';
            wait for 4 ns;
            clk_tb <= '0';
            wait for 4 ns;
    end process;
 
end testbench;
