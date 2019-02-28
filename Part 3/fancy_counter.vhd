library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
 
entity fancy_counter is
    Port ( en, clk_en, clk, ld, rst, dir, updn : in std_logic;
           val    : in  std_logic_vector(3 downto 0);
           cnt    : out std_logic_vector(3 downto 0) 
         ); 
 
end fancy_counter;
 
 
architecture Behavioral of fancy_counter is
    signal value : std_logic_vector(3 downto 0) := "0000";
    signal count : std_logic_vector(3 downto 0) := "0000";
 
begin
    process(en, clk, clk_en, ld, rst, dir, updn)
    begin
        if (en = '1' and rising_edge(clk)) then
            if (rst = '1') then
                cnt <= (others=>'0');
                count <= "0000";
            else
                if (clk_en = '0') then
                    count <= count;
                else
                    if (ld = '1') then
                        value <= val;
                    end if;
                    if (dir = '1' and updn = '1') then
                        if (count < value) then
                            count <= std_logic_vector(unsigned(count) + 1);
                            cnt <= count;
                        else
                            count <= "0000";
                            cnt <= count;
                        end if;
                    elsif (dir = '0' and updn = '1') then
                        if (count > 0) then
                            count <= std_logic_vector(unsigned(count) - 1);
                            cnt <= count;
                        else
                            count <= value;
                            cnt <= count;
                        end if;
                    else
                        cnt<=(others => '0');
                    end if; 
                end if;
            end if;
        end if;
    end process;
end Behavioral; 
