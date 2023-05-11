restart -f

force -freeze sim:/mux_sel_buffer_in/DATA_IN_0 00001111000
force -freeze sim:/mux_sel_buffer_in/DATA_IN_1 11110000111
force -freeze sim:/mux_sel_buffer_in/SELECT 0 0 ns, 1 10 ns

run 20 ns