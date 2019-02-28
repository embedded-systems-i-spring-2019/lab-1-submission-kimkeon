library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;
 
entity counter_top is
    Port ( btn  : in std_logic_vector(3 downto 0);
           sw   : in std_logic_vector(3 downto 0);
           clk  : in std_logic;
           led : out std_logic_vector(3 downto 0)
    );
 
end counter_top;
 
architecture Behavioral of counter_top is
 
component clock_div
  port (
         clk  : in std_logic;
         div : out std_logic
       );
end component;

component debounce
  port (
         btn  : in std_logic;
         clk  : in std_logic;
         deb_out : out std_logic
       );
end component;
 
component fancy_counter
  port (
         en, clk_en, clk, dir, ld, rst, updn        : in std_logic;
         val  : in std_logic_vector(3 downto 0);
         cnt : out std_logic_vector(3 downto 0)
 
       );
end component;
 
signal deb_out_1, deb_out_2, deb_out_3, deb_out_4, div_to_clocken : std_logic;
 
begin
 
 
u1: debounce port map (btn => btn(0), clk => clk, deb_out => deb_out_1);
 
u2: debounce port map (btn => btn(1), clk => clk, deb_out => deb_out_2);
 
u3: debounce port map (btn => btn(2), clk => clk, deb_out => deb_out_3);

u4: debounce port map (btn => btn(3), clk => clk, deb_out => deb_out_4);
 
u5: clock_div port map(clk => clk, div => div_to_clocken);
 
u6: fancy_counter port map (clk => clk, 
                            clk_en => div_to_clocken,
                            cnt => led,
                            val => sw,
                            dir => sw(0),
                            rst => deb_out_1,
                            en => deb_out_2,
                            updn => deb_out_3,
                            ld => deb_out_4);
  
 
 
end Behavioral;
