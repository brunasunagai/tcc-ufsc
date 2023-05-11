restart -f

force -freeze sim:/add_counter/A 0001 10 ns, 0011 20 ns, 1000 30 ns
force -freeze sim:/add_counter/B 0010 10 ns, 0011 20 ns, 0111 30 ns

run 40 ns