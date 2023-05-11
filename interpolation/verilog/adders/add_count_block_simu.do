restart -f

force -freeze sim:/add_count_block/A 0001 10 ns, 0011 20 ns, 1100 30 ns
force -freeze sim:/add_count_block/B 0010 10 ns, 0011 20 ns, 1100 30 ns

run 40 ns