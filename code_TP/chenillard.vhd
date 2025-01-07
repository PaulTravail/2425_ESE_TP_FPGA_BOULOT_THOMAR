library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity chenillard is
    Port (
        i_clk     : in  std_logic; -- Horloge d'entrée
        i_rst_n   : in  std_logic; -- Réinitialisation active bas
        o_leds    : out unsigned(7 downto 0) -- LEDs du chenillard
    );
end chenillard;

architecture rtl of chenillard is
    signal r_leds      : unsigned(7 downto 0) := "00000000"; -- État interne des LEDs
begin

    -- Division de fréquence pour ralentir l'horloge
    process(i_clk, i_rst_n)
		variable counter : natural range 0 to 5000000 := 0;
    begin
        if (i_rst_n = '0') then
            counter := 0;
            r_leds <= "00000000";
        elsif rising_edge(i_clk) then
				if (r_leds = "00000000") then
					r_leds <= "00000001";
				end if;
				if (counter = 5000000) then
					counter := 0;
					r_leds <= shift_left(r_leds, 1);
				else
					counter := counter + 1;
				end if;			       
        end if;
   end process;
	o_leds <= r_leds;
end rtl;