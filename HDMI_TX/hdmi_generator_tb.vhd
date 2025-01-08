library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdmi_generator_tb is 
end entity hdmi_generator_tb;

architecture tb of hdmi_generator_tb is
    -- Resolution
    constant h_res  : natural := 50;
    constant v_res  : natural := 30;

    -- Timings magic values (480p)
    constant h_sync : natural := 11;
    constant h_fp   : natural := 8;
    constant h_bp   : natural := 3;

    constant v_sync : natural := 5;
    constant v_fp   : natural := 30;
    constant v_bp   : natural := 9;

    signal i_clk         : std_logic;
    signal i_reset_n     : std_logic;
    signal o_hdmi_hs     : std_logic;
    signal o_hdmi_vs     : std_logic;
    signal o_hdmi_de     : std_logic;

    signal o_pixel_en    : std_logic;
    signal o_pixel_address : natural range 0 to (h_res * v_res - 1);
    signal o_x_counter   : natural range 0 to (h_res - 1);
    signal o_y_counter   : natural range 0 to (v_res - 1);
    signal o_new_frame   : std_logic;

    signal finished      : std_logic := '0';
begin 

    uut : entity work.hdmi_generator
        generic map (
            h_res  => h_res, 
            v_res  => v_res,
            h_sync => h_sync,
            h_fp   => h_fp,
            h_bp   => h_bp,
            v_sync => v_sync,
            v_fp   => v_fp,
            v_bp   => v_bp
        )
        port map (
            i_clk          => i_clk, 
            i_reset_n      => i_reset_n, 
            o_hdmi_hs      => o_hdmi_hs,
            o_hdmi_vs      => o_hdmi_vs,
            o_hdmi_de      => o_hdmi_de,
            o_pixel_en     => o_pixel_en,
            o_pixel_address => o_pixel_address,
            o_x_counter    => o_x_counter,
            o_y_counter    => o_y_counter,
            o_new_frame    => o_new_frame
        );

    -- Clock generation
    process
    begin
        while (finished = '0') loop
            i_clk <= '0'; wait for 5 ns;
            i_clk <= '1'; wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Reset and simulation control
    process
    begin
        i_reset_n <= '0'; wait for 25 us;
        i_reset_n <= '1'; wait for 100 us;
        finished <= '1';
        wait; 
    end process;

end architecture tb;