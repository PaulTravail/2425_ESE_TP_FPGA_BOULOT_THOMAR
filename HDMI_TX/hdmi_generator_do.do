quit -sim
vcom hdmi_generator.vhd
vcom hdmi_generator_tb.vhd
vsim -c work.hdmi_generator_tb
# INPUTS
add wave -divider Inputs:
add wave -color yellow i_clk
add wave _color red i_reset_n
# OUTPUTS
add wave -divider Outputs:
add wave -color cyan o_hdmi_hs
run -all
