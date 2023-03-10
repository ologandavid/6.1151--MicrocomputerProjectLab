# THIS FILE IS AUTOMATICALLY GENERATED
# Project: C:\Users\ologa\Documents\MIT\Senior S22\6.1151\Final Project\Controller\Controller.cydsn\Controller.cyprj
# Date: Mon, 09 May 2022 00:30:34 GMT
#set_units -time ns
create_clock -name {ADC_SAR_1_theACLK(routed)} -period 625 -waveform {0 312.5} [list [get_pins {ClockBlock/dclk_0}]]
create_clock -name {ADC_SAR_2_theACLK(routed)} -period 625 -waveform {0 312.5} [list [get_pins {ClockBlock/dclk_1}]]
create_clock -name {CyILO} -period 1000000 -waveform {0 500000} [list [get_pins {ClockBlock/ilo}] [get_pins {ClockBlock/clk_100k}] [get_pins {ClockBlock/clk_1k}] [get_pins {ClockBlock/clk_32k}]]
create_clock -name {CyIMO} -period 333.33333333333331 -waveform {0 166.666666666667} [list [get_pins {ClockBlock/imo}]]
create_clock -name {CyPLL_OUT} -period 41.666666666666664 -waveform {0 20.8333333333333} [list [get_pins {ClockBlock/pllout}]]
create_clock -name {CyMASTER_CLK} -period 41.666666666666664 -waveform {0 20.8333333333333} [list [get_pins {ClockBlock/clk_sync}]]
create_generated_clock -name {CyBUS_CLK} -source [get_pins {ClockBlock/clk_sync}] -edges {1 2 3} [list [get_pins {ClockBlock/clk_bus_glb}]]
create_generated_clock -name {ADC_SAR_1_theACLK} -source [get_pins {ClockBlock/clk_sync}] -edges {1 15 31} [list [get_pins {ClockBlock/dclk_glb_0}]]
create_generated_clock -name {ADC_SAR_2_theACLK} -source [get_pins {ClockBlock/clk_sync}] -edges {1 15 31} [list [get_pins {ClockBlock/dclk_glb_1}]]
create_generated_clock -name {UART_2_IntClock} -source [get_pins {ClockBlock/clk_sync}] -edges {1 313 627} [list [get_pins {ClockBlock/dclk_glb_2}]]
create_generated_clock -name {UART_1_IntClock} -source [get_pins {ClockBlock/clk_sync}] -edges {1 313 627} [list [get_pins {ClockBlock/dclk_glb_3}]]


# Component constraints for C:\Users\ologa\Documents\MIT\Senior S22\6.1151\Final Project\Controller\Controller.cydsn\TopDesign\TopDesign.cysch
# Project: C:\Users\ologa\Documents\MIT\Senior S22\6.1151\Final Project\Controller\Controller.cydsn\Controller.cyprj
# Date: Mon, 09 May 2022 00:30:29 GMT
