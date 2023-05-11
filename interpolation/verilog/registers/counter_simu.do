restart -f

force -freeze sim:/reg_counter/CLK 1 0, 0 {5 ns} -r {10 ns}
force -freeze sim:/reg_counter/RST_ASYNC_N 0 0 ns, 1 5 ns
force -freeze sim:/reg_counter/WRITE_EN 0 0 ns, 1 28 ns, 0 32 ns, 1 38 ns, 0 42 ns, 1 48 ns, 0 52 ns
force -freeze sim:/reg_counter/DATA_IN 0000 15 ns 
force -freeze sim:/reg_counter/DATA_IN 0001 25 ns
force -freeze sim:/reg_counter/DATA_IN 0111 35 ns
force -freeze sim:/reg_counter/DATA_IN 1000 45 ns

run 60 ns 