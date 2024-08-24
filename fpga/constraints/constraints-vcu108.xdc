# The main clocks are all autogenerated by the Xilinx IP
# mmcm_clkout1 is the 22Mhz clock from the DDR4 IP used to drive wally and the AHBLite Bus.
# mmcm_clkout0 is the clock output of the DDR4 memory interface / 4.
# This clock is not used by wally or the AHBLite Bus. However it is used by the AXI BUS on the DD4 IP.

# create_generated_clock -name CLKDiv64_Gen -source [get_pins #wallypipelinedsoc/uncore.uncore/sdc.SDC/sd_top/slow_clk_divider/clkMux/I0] -multiply_by 1 -divide_by 2 [get_pins wallypipelinedsoc/uncore.uncore/sdc.SDC/sd_top/slow_clk_divider/clkMux/O]
#create_generated_clock -name CLKDiv64_Gen -source [get_pins ddr4_c0/addn_ui_clkout1] -multiply_by 1 -divide_by 1 [get_pins axiSDC/clock_posedge_reg/Q]
create_generated_clock -name SPISDCClock -source [get_pins ddr4/addn_ui_clkout1] -multiply_by 1 -divide_by 1 [get_pins wallypipelinedsoc/uncore.uncore/sdc.sdc/SPICLK]

##### GPI ####
set_property PACKAGE_PIN E34 [get_ports {GPI[0]}]
set_property PACKAGE_PIN M22 [get_ports {GPI[1]}]
set_property PACKAGE_PIN AW27 [get_ports {GPI[2]}]
#set_property PACKAGE_PIN A10 [get_ports {GPI[3]}]
#set_property IOSTANDARD LVCMOS12 [get_ports {GPI[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {GPI[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {GPI[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {GPI[0]}]
set_input_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 2.000 [get_ports {GPI[*]}]
set_input_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 2.000 [get_ports {GPI[*]}]
set_max_delay -from [get_ports {GPI[*]}] 10.000

##### GPO #### 
set_property PACKAGE_PIN AT32 [get_ports {GPO[0]}]
set_property PACKAGE_PIN AV34 [get_ports {GPO[1]}]
set_property PACKAGE_PIN AY30 [get_ports {GPO[2]}]
set_property PACKAGE_PIN BF32 [get_ports {GPO[4]}]
set_property PACKAGE_PIN BB32 [get_ports {GPO[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {GPO[4]}]
set_property IOSTANDARD LVCMOS12 [get_ports {GPO[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {GPO[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {GPO[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {GPO[0]}]
set_max_delay -to [get_ports {GPO[*]}] 10.000
set_output_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 0.000 [get_ports {GPO[*]}]
set_output_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 0.000 [get_ports {GPO[*]}]


##### UART #####
set_property PACKAGE_PIN BC24 [get_ports UARTSin]
set_property PACKAGE_PIN BE24 [get_ports UARTSout]
set_max_delay -from [get_ports UARTSin] 10.000
set_max_delay -to [get_ports UARTSout] 10.000
set_property IOSTANDARD LVCMOS18 [get_ports UARTSin]
set_property IOSTANDARD LVCMOS18 [get_ports UARTSout]
# set_property DRIVE 6 [get_ports UARTSout]
set_input_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 2.000 [get_ports UARTSin]
set_input_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 2.000 [get_ports UARTSin]
set_output_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 0.000 [get_ports UARTSout]
set_output_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 0.000 [get_ports UARTSout]


##### reset #####
set_input_delay -clock [get_clocks default_250mhz_clk1_0_p] -min -add_delay 2.000 [get_ports reset]
set_input_delay -clock [get_clocks default_250mhz_clk1_0_p] -max -add_delay 2.000 [get_ports reset]
set_input_delay -clock [get_clocks mmcm_clkout0] -min -add_delay 0.000 [get_ports reset]
set_input_delay -clock [get_clocks mmcm_clkout0] -max -add_delay 0.000 [get_ports reset]
set_input_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 0.000 [get_ports reset]
set_input_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 0.000 [get_ports reset]
set_max_delay -from [get_ports reset] 15.000
set_false_path -from [get_ports reset]
set_property PACKAGE_PIN A10 [get_ports {reset}]
set_property IOSTANDARD LVCMOS12 [get_ports {reset}]



##### cpu_reset #####
set_property PACKAGE_PIN AY35 [get_ports {cpu_reset}]
set_property IOSTANDARD LVCMOS12 [get_ports {cpu_reset}]
set_output_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 0.000 [get_ports {cpu_reset}]
set_output_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 0.000 [get_ports {cpu_reset}]

##### ahblite_resetn #####
set_property PACKAGE_PIN AV36 [get_ports {ahblite_resetn}]
set_property IOSTANDARD LVCMOS12 [get_ports {ahblite_resetn}]
set_output_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 0.000 [get_ports {ahblite_resetn}]
set_output_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 0.000 [get_ports {ahblite_resetn}]


##### south_rst #####
set_property PACKAGE_PIN D9 [get_ports south_rst]
set_property IOSTANDARD LVCMOS12 [get_ports south_rst]
set_input_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 2.000 [get_ports south_rst]
set_input_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 2.000 [get_ports south_rst]


##### SD Card I/O #####

set_output_delay -clock [get_clocks SPISDCClock] -min -add_delay 2.500 [get_ports {SDCCS}]
set_output_delay -clock [get_clocks SPISDCClock] -max -add_delay 10.000 [get_ports {SDCCS}]
set_input_delay -clock [get_clocks SPISDCClock] -min -add_delay 2.500 [get_ports {SDCIn}]
set_input_delay -clock [get_clocks SPISDCClock] -max -add_delay 10.000 [get_ports {SDCIn}]
set_output_delay -clock [get_clocks SPISDCClock] -min -add_delay 2.000 [get_ports {SDCCmd}]
set_output_delay -clock [get_clocks SPISDCClock] -max -add_delay 6.000 [get_ports {SDCCmd}]
set_output_delay -clock [get_clocks SPISDCClock] 0.000 [get_ports SDCCLK]

set_property -dict {PACKAGE_PIN BC14 IOSTANDARD LVCMOS18 PULLUP true} [get_ports {SDCCS}]
set_property -dict {PACKAGE_PIN AW16 IOSTANDARD LVCMOS18 PULLUP true} [get_ports {SDCIn}]
set_property -dict {PACKAGE_PIN BA10 IOSTANDARD LVCMOS18 PULLUP true} [get_ports {SDCCmd}]
set_property -dict {PACKAGE_PIN AW12 IOSTANDARD LVCMOS18 PULLUP true} [get_ports {SDCCD}]
set_property -dict {PACKAGE_PIN BB16 IOSTANDARD LVCMOS18} [get_ports SDCCLK]

set_property PACKAGE_PIN AW12 [get_ports SDCCD]
set_property IOSTANDARD LVCMOS18 [get_ports SDCCD]
set_property PULLTYPE PULLUP [get_ports SDCCD]
set_property PACKAGE_PIN BC16 [get_ports SDCWP]
set_property IOSTANDARD LVCMOS18 [get_ports SDCWP]
set_property PULLTYPE PULLUP [get_ports SDCWP]

#set_input_delay -clock [get_clocks CLKDiv64_Gen] -min -add_delay 2.500 [get_ports {SDCDat[*]}]
#set_input_delay -clock [get_clocks CLKDiv64_Gen] -max -add_delay 21.000 [get_ports {SDCDat[*]}]
#set_input_delay -clock [get_clocks CLKDiv64_Gen] -min -add_delay 2.500 [get_ports {SDCCmd}]
#set_input_delay -clock [get_clocks CLKDiv64_Gen] -max -add_delay 14.000 [get_ports {SDCCmd}]
#set_output_delay -clock [get_clocks CLKDiv64_Gen] -min -add_delay 2.000 [get_ports {SDCCmd}]
#set_output_delay -clock [get_clocks CLKDiv64_Gen] -max -add_delay 6.000 [get_ports {SDCCmd}]
#set_output_delay -clock [get_clocks CLKDiv64_Gen] 0.000 [get_ports SDCCLK]



set_property DCI_CASCADE {64} [get_iobanks 65]
set_property INTERNAL_VREF 0.9 [get_iobanks 65]


set_property PACKAGE_PIN E33 [get_ports c0_ddr4_act_n]
set_property PACKAGE_PIN C30 [get_ports {c0_ddr4_adr[0]}]
set_property PACKAGE_PIN A31 [get_ports {c0_ddr4_adr[10]}]
set_property PACKAGE_PIN A33 [get_ports {c0_ddr4_adr[11]}]
set_property PACKAGE_PIN F29 [get_ports {c0_ddr4_adr[12]}]
set_property PACKAGE_PIN B32 [get_ports {c0_ddr4_adr[13]}]
set_property PACKAGE_PIN D29 [get_ports {c0_ddr4_adr[14]}]
set_property PACKAGE_PIN B31 [get_ports {c0_ddr4_adr[15]}]
set_property PACKAGE_PIN B33 [get_ports {c0_ddr4_adr[16]}]
set_property PACKAGE_PIN D32 [get_ports {c0_ddr4_adr[1]}]
set_property PACKAGE_PIN B30 [get_ports {c0_ddr4_adr[2]}]
set_property PACKAGE_PIN C33 [get_ports {c0_ddr4_adr[3]}]
set_property PACKAGE_PIN E32 [get_ports {c0_ddr4_adr[4]}]
set_property PACKAGE_PIN A29 [get_ports {c0_ddr4_adr[5]}]
set_property PACKAGE_PIN C29 [get_ports {c0_ddr4_adr[6]}]
set_property PACKAGE_PIN E29 [get_ports {c0_ddr4_adr[7]}]
set_property PACKAGE_PIN A30 [get_ports {c0_ddr4_adr[8]}]
set_property PACKAGE_PIN C32 [get_ports {c0_ddr4_adr[9]}]
set_property PACKAGE_PIN G30 [get_ports {c0_ddr4_ba[0]}]
set_property PACKAGE_PIN F30 [get_ports {c0_ddr4_ba[1]}]
set_property PACKAGE_PIN F33 [get_ports {c0_ddr4_bg[0]}]
set_property PACKAGE_PIN E31 [get_ports {c0_ddr4_ck_t[0]}]
set_property PACKAGE_PIN D31 [get_ports {c0_ddr4_ck_c[0]}]
set_property PACKAGE_PIN K29 [get_ports {c0_ddr4_cke[0]}]
set_property PACKAGE_PIN D30 [get_ports {c0_ddr4_cs_n[0]}]
set_property PACKAGE_PIN J37 [get_ports {c0_ddr4_dq[0]}]
set_property PACKAGE_PIN F35 [get_ports {c0_ddr4_dq[10]}]
set_property PACKAGE_PIN J35 [get_ports {c0_ddr4_dq[11]}]
set_property PACKAGE_PIN G37 [get_ports {c0_ddr4_dq[12]}]
set_property PACKAGE_PIN H35 [get_ports {c0_ddr4_dq[13]}]
set_property PACKAGE_PIN G36 [get_ports {c0_ddr4_dq[14]}]
set_property PACKAGE_PIN H37 [get_ports {c0_ddr4_dq[15]}]
set_property PACKAGE_PIN C39 [get_ports {c0_ddr4_dq[16]}]
set_property PACKAGE_PIN A38 [get_ports {c0_ddr4_dq[17]}]
set_property PACKAGE_PIN B40 [get_ports {c0_ddr4_dq[18]}]
set_property PACKAGE_PIN D40 [get_ports {c0_ddr4_dq[19]}]
set_property PACKAGE_PIN H40 [get_ports {c0_ddr4_dq[1]}]
set_property PACKAGE_PIN E38 [get_ports {c0_ddr4_dq[20]}]
set_property PACKAGE_PIN B38 [get_ports {c0_ddr4_dq[21]}]
set_property PACKAGE_PIN E37 [get_ports {c0_ddr4_dq[22]}]
set_property PACKAGE_PIN C40 [get_ports {c0_ddr4_dq[23]}]
set_property PACKAGE_PIN C34 [get_ports {c0_ddr4_dq[24]}]
set_property PACKAGE_PIN A34 [get_ports {c0_ddr4_dq[25]}]
set_property PACKAGE_PIN D34 [get_ports {c0_ddr4_dq[26]}]
set_property PACKAGE_PIN A35 [get_ports {c0_ddr4_dq[27]}]
set_property PACKAGE_PIN A36 [get_ports {c0_ddr4_dq[28]}]
set_property PACKAGE_PIN C35 [get_ports {c0_ddr4_dq[29]}]
set_property PACKAGE_PIN F38 [get_ports {c0_ddr4_dq[2]}]
set_property PACKAGE_PIN B35 [get_ports {c0_ddr4_dq[30]}]
set_property PACKAGE_PIN D35 [get_ports {c0_ddr4_dq[31]}]
set_property PACKAGE_PIN N27 [get_ports {c0_ddr4_dq[32]}]
set_property PACKAGE_PIN R27 [get_ports {c0_ddr4_dq[33]}]
set_property PACKAGE_PIN N24 [get_ports {c0_ddr4_dq[34]}]
set_property PACKAGE_PIN R24 [get_ports {c0_ddr4_dq[35]}]
set_property PACKAGE_PIN P24 [get_ports {c0_ddr4_dq[36]}]
set_property PACKAGE_PIN P26 [get_ports {c0_ddr4_dq[37]}]
set_property PACKAGE_PIN P27 [get_ports {c0_ddr4_dq[38]}]
set_property PACKAGE_PIN T24 [get_ports {c0_ddr4_dq[39]}]
set_property PACKAGE_PIN H39 [get_ports {c0_ddr4_dq[3]}]
set_property PACKAGE_PIN K27 [get_ports {c0_ddr4_dq[40]}]
set_property PACKAGE_PIN L26 [get_ports {c0_ddr4_dq[41]}]
set_property PACKAGE_PIN J27 [get_ports {c0_ddr4_dq[42]}]
set_property PACKAGE_PIN K28 [get_ports {c0_ddr4_dq[43]}]
set_property PACKAGE_PIN K26 [get_ports {c0_ddr4_dq[44]}]
set_property PACKAGE_PIN M25 [get_ports {c0_ddr4_dq[45]}]
set_property PACKAGE_PIN J26 [get_ports {c0_ddr4_dq[46]}]
set_property PACKAGE_PIN L28 [get_ports {c0_ddr4_dq[47]}]
set_property PACKAGE_PIN E27 [get_ports {c0_ddr4_dq[48]}]
set_property PACKAGE_PIN E28 [get_ports {c0_ddr4_dq[49]}]
set_property PACKAGE_PIN K37 [get_ports {c0_ddr4_dq[4]}]
set_property PACKAGE_PIN E26 [get_ports {c0_ddr4_dq[50]}]
set_property PACKAGE_PIN H27 [get_ports {c0_ddr4_dq[51]}]
set_property PACKAGE_PIN F25 [get_ports {c0_ddr4_dq[52]}]
set_property PACKAGE_PIN F28 [get_ports {c0_ddr4_dq[53]}]
set_property PACKAGE_PIN G25 [get_ports {c0_ddr4_dq[54]}]
set_property PACKAGE_PIN G27 [get_ports {c0_ddr4_dq[55]}]
set_property PACKAGE_PIN B28 [get_ports {c0_ddr4_dq[56]}]
set_property PACKAGE_PIN A28 [get_ports {c0_ddr4_dq[57]}]
set_property PACKAGE_PIN B25 [get_ports {c0_ddr4_dq[58]}]
set_property PACKAGE_PIN B27 [get_ports {c0_ddr4_dq[59]}]
set_property PACKAGE_PIN G40 [get_ports {c0_ddr4_dq[5]}]
set_property PACKAGE_PIN D25 [get_ports {c0_ddr4_dq[60]}]
set_property PACKAGE_PIN C27 [get_ports {c0_ddr4_dq[61]}]
set_property PACKAGE_PIN C25 [get_ports {c0_ddr4_dq[62]}]
set_property PACKAGE_PIN D26 [get_ports {c0_ddr4_dq[63]}]
set_property PACKAGE_PIN F39 [get_ports {c0_ddr4_dq[6]}]
set_property PACKAGE_PIN F40 [get_ports {c0_ddr4_dq[7]}]
set_property PACKAGE_PIN F36 [get_ports {c0_ddr4_dq[8]}]
set_property PACKAGE_PIN J36 [get_ports {c0_ddr4_dq[9]}]
set_property PACKAGE_PIN H38 [get_ports {c0_ddr4_dqs_t[0]}]
set_property PACKAGE_PIN G38 [get_ports {c0_ddr4_dqs_c[0]}]
set_property PACKAGE_PIN H34 [get_ports {c0_ddr4_dqs_t[1]}]
set_property PACKAGE_PIN G35 [get_ports {c0_ddr4_dqs_c[1]}]
set_property PACKAGE_PIN A39 [get_ports {c0_ddr4_dqs_t[2]}]
set_property PACKAGE_PIN A40 [get_ports {c0_ddr4_dqs_c[2]}]
set_property PACKAGE_PIN B36 [get_ports {c0_ddr4_dqs_t[3]}]
set_property PACKAGE_PIN B37 [get_ports {c0_ddr4_dqs_c[3]}]
set_property PACKAGE_PIN P25 [get_ports {c0_ddr4_dqs_t[4]}]
set_property PACKAGE_PIN N25 [get_ports {c0_ddr4_dqs_c[4]}]
set_property PACKAGE_PIN L24 [get_ports {c0_ddr4_dqs_t[5]}]
set_property PACKAGE_PIN L25 [get_ports {c0_ddr4_dqs_c[5]}]
set_property PACKAGE_PIN H28 [get_ports {c0_ddr4_dqs_t[6]}]
set_property PACKAGE_PIN G28 [get_ports {c0_ddr4_dqs_c[6]}]
set_property PACKAGE_PIN B26 [get_ports {c0_ddr4_dqs_t[7]}]
set_property PACKAGE_PIN A26 [get_ports {c0_ddr4_dqs_c[7]}]
set_property PACKAGE_PIN J31 [get_ports {c0_ddr4_odt[0]}]
set_property PACKAGE_PIN M28 [get_ports c0_ddr4_reset_n]


set_property PACKAGE_PIN J39 [get_ports {c0_ddr4_dm_dbi_n[0]}]
set_property PACKAGE_PIN F34 [get_ports {c0_ddr4_dm_dbi_n[1]}]
set_property PACKAGE_PIN E39 [get_ports {c0_ddr4_dm_dbi_n[2]}]
set_property PACKAGE_PIN D37 [get_ports {c0_ddr4_dm_dbi_n[3]}]
set_property PACKAGE_PIN T26 [get_ports {c0_ddr4_dm_dbi_n[4]}]
set_property PACKAGE_PIN M27 [get_ports {c0_ddr4_dm_dbi_n[5]}]
set_property PACKAGE_PIN G26 [get_ports {c0_ddr4_dm_dbi_n[6]}]
set_property PACKAGE_PIN D27 [get_ports {c0_ddr4_dm_dbi_n[7]}]





set_max_delay -datapath_only -from [get_pins xlnx_ddr4_c0/inst/u_ddr4_mem_intfc/u_ddr_cal_top/calDone_gated_reg/C] -to [get_pins xlnx_proc_sys_reset_0/U0/EXT_LPF/lpf_int_reg/D] 10.000


#set_output_delay -clock [get_clocks mmcm_clkout1] -min -add_delay 0.000 [get_ports c0_ddr4_reset_n]
#set_output_delay -clock [get_clocks mmcm_clkout1] -max -add_delay 20.000 [get_ports c0_ddr4_reset_n]



set_max_delay -from [get_pins {xlnx_ddr4_c0/inst/u_ddr4_mem_intfc/u_ddr_cal_top/cal_RESET_n_reg[0]/C}] -to [get_ports c0_ddr4_reset_n] 50.000

