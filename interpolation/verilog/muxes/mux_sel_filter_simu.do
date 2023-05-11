restart -f

force -freeze sim:/mux_sel_filter/DATA_IN_0 00000000000000
force -freeze sim:/mux_sel_filter/DATA_IN_1 00000000000001
force -freeze sim:/mux_sel_filter/DATA_IN_2 00000000000010
force -freeze sim:/mux_sel_filter/DATA_IN_3 00000000000011
force -freeze sim:/mux_sel_filter/DATA_IN_4 00000000000100
force -freeze sim:/mux_sel_filter/DATA_IN_5 00000000000101
force -freeze sim:/mux_sel_filter/DATA_IN_6 00000000000110
force -freeze sim:/mux_sel_filter/DATA_IN_7 00000000000111
force -freeze sim:/mux_sel_filter/DATA_IN_8 00000000001000
force -freeze sim:/mux_sel_filter/DATA_IN_9 00000000001001
force -freeze sim:/mux_sel_filter/DATA_IN_10 00000000001010
force -freeze sim:/mux_sel_filter/DATA_IN_11 00000000001011
force -freeze sim:/mux_sel_filter/DATA_IN_12 00000000001100
force -freeze sim:/mux_sel_filter/DATA_IN_13 00000000001101
force -freeze sim:/mux_sel_filter/DATA_IN_14 00000000001110
force -freeze sim:/mux_sel_filter/SELECT 0000 0 ns, 0001 10 ns, 0010 20 ns, 0011 30 ns, 0100 40 ns, 0101 50 ns, 0110 60 ns, 0111 70 ns
force -freeze sim:/mux_sel_filter/SELECT 1000 80 ns, 1001 90 ns, 1010 100 ns, 1011 110 ns, 1100 120 ns, 1101 130 ns, 1110 140 ns, 1111 150 ns

run 160 ns