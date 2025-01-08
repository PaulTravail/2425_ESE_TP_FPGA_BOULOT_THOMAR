library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdmi_generator is
    generic (
        -- Resolution
        h_res  : natural := 720;
        v_res  : natural := 480;

        -- Timings magic values (480p)
        h_sync : natural := 61;
        h_fp   : natural := 58;
        h_bp   : natural := 18;

        v_sync : natural := 5;
        v_fp   : natural := 30;
        v_bp   : natural := 9
    );
    port (
        i_clk          : in std_logic;
        i_reset_n      : in std_logic;
        o_hdmi_hs      : out std_logic;
        o_hdmi_vs      : out std_logic;
        o_hdmi_de      : out std_logic;

        o_pixel_en     : out std_logic;
        o_pixel_address : out natural range 0 to (h_res * v_res - 1);
        o_x_counter    : out natural range 0 to (h_res - 1);
        o_y_counter    : out natural range 0 to (v_res - 1);
        o_new_frame    : out std_logic
    );
end hdmi_generator;

architecture rtl of hdmi_generator is
    -- Taille horizontale totale
    constant h_total : natural := h_sync + h_res + h_fp + h_bp;

    -- Compteur horizontal
    signal h_count : natural range 0 to h_total-1 := 0;
begin

    process(i_clk, i_reset_n)
    begin 
        if (i_reset_n = '0') then
            h_count <= 0;
            o_hdmi_hs <= '1'; -- Valeur par défaut
        elsif rising_edge(i_clk) then 
            if (h_count = h_total-1) then
                h_count <= 0;
            else
                h_count <= h_count + 1;
            end if;

            -- Génération de la synchronisation horizontale
            if (h_count < h_sync) then 
                o_hdmi_hs <= '0';
            else
                o_hdmi_hs <= '1';
            end if;
        end if;
    end process;

end architecture rtl;
