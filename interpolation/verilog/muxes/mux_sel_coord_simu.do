restart -f

force -freeze sim:/mux_sel_coord/DATA_IN_0 00101010
force -freeze sim:/mux_sel_coord/DATA_IN_1 11111110
force -freeze sim:/mux_sel_coord/SELECT 0 0 ns, 1 10 ns

run 20 ns