restart -f

force -freeze sim:/add_coords/A 00000001 10 ns, 00111111 20 ns, 11000000 30 ns
force -freeze sim:/add_coords/B 00000010 10 ns, 00111111 20 ns, 11000000 30 ns

run 40 ns