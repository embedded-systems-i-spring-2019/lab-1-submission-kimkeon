library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
 
 
entity debounce is
    Port ( clk: in std_logic;
           btn: in std_logic;
           deb_out: out std_logic   
                  );
end debounce;
 
architecture Behavioral of debounce is
 
signal shift: std_logic_vector(1 downto 0) := "00";
signal count: integer := 1;
signal temp: std_logic := '0';
 
begin
    process(clk)
    begin
    if(rising_edge(clk)) then
        shift(0) <= btn;
        shift(1) <= shift(0);
        if(shift(1) = '1') then
            if count = 2500000 then
                temp <= '1';
            else
                count <= count + 1;
                temp <= '0';
            end if;
        else
            count <= 1;
            temp <= '0';
        end if;
    end if;
    
 
    end process;
    deb_out <= temp;

end Behavioral;
