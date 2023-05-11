restart -f

force -freeze sim:/mux_sel_dimension/DATA_IN_0 1100
force -freeze sim:/mux_sel_dimension/DATA_IN_1 0101
force -freeze sim:/mux_sel_dimension/SELECT 0 0 ns, 1 10 ns

run 20 ns