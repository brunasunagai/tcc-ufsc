restart -f

force -freeze sim:/top_level/TOP_CLK 1 0, 0 {25 ns} -r {50 ns}
force -freeze sim:/top_level/TOP_RESET 0 0 ns, 1 40 ns
force -freeze sim:/top_level/TOP_START 0 0 ns, 1 90 ns, 0 110 ns

force -freeze sim:/top_level/TOP_COORD_X 00111001 50 ns
force -freeze sim:/top_level/TOP_COORD_Y 01110011 50 ns
force -freeze sim:/top_level/TOP_CPMV_0 1111000011000010 50 ns
force -freeze sim:/top_level/TOP_CPMV_1 0110111010000010 50 ns

force -freeze sim:/top_level/TOP_INTEGER_SAMPLES 000000010000001000000100000010100000110001111000011111010000000101100100 50 ns

run 2000 ns 