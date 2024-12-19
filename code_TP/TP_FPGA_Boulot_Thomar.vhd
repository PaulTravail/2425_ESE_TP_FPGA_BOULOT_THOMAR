library ieee;
use ieee.std_logic_1164.all;
entity TP_FPGA_Boulot_Thomar is
port (
	sw : in std_logic_vector(3 downto 0);
	led : out std_logic_vector(3 downto 0)
);
end entity TP_FPGA_Boulot_Thomar;
architecture rtl of TP_FPGA_Boulot_Thomar is
begin
	led <= sw;
end architecture rtl;