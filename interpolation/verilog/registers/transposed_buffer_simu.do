restart -f 

force -freeze sim:/transposed_buffer/CLK 1 0, 0 {5 ns} -r {10 ns}
force -freeze sim:/transposed_buffer/RST_ASYNC_N 0 0 ns, 1 5 ns
force -freeze sim:/transposed_buffer/WRITE_EN 0 0 ns, 1 28 ns, 0 32 ns, 1 38 ns, 0 42 ns, 1 48 ns, 0 52 ns, 1 58 ns, 0 62 ns
force -freeze sim:/transposed_buffer/WRITE_EN 1 68 ns, 0 72 ns, 1 78 ns, 0 82 ns, 1 88 ns, 0 92 ns, 1 98 ns, 0 102 ns, 1 108 ns, 0 112 ns
force -freeze sim:/transposed_buffer/WRITE_EN 1 118 ns, 0 122 ns, 1 128 ns, 0 132 ns, 1 138 ns, 0 142 ns, 1 148 ns, 0 152 ns

force -freeze sim:/transposed_buffer/INPUT_0 11111111111 0 ns, 00000000001 25 ns, 00000000010 35 ns, 00000000011 45 ns, 00000000100 55 ns, 00000000101 65 ns
force -freeze sim:/transposed_buffer/INPUT_0 00000000110 75 ns, 00000000111 85 ns, 00000001000 95 ns, 00000001001 105 ns
force -freeze sim:/transposed_buffer/INPUT_0 10000000000 115 ns, 10000000001 125 ns, 10000000010 135 ns, 10000000011 145 ns

force -freeze sim:/transposed_buffer/INPUT_1 11111111111 0 ns, 00000001010 25 ns, 00000001011 35 ns, 00000001100 45 ns, 00000001101 55 ns, 00000001110 65 ns
force -freeze sim:/transposed_buffer/INPUT_1 00000001111 75 ns, 00000010000 85 ns, 00000010001 95 ns, 00000010010 105 ns
force -freeze sim:/transposed_buffer/INPUT_1 10000000100 115 ns, 10000000101 125 ns, 10000000110 135 ns, 10000000111 145 ns

force -freeze sim:/transposed_buffer/INPUT_2 11111111111 0 ns, 00000010011 25 ns, 00000010100 35 ns, 00000010101 45 ns, 00000010110 55 ns, 00000010111 65 ns
force -freeze sim:/transposed_buffer/INPUT_2 00000011000 75 ns, 00000011001 85 ns, 00000011010 95 ns, 00000011011 105 ns
force -freeze sim:/transposed_buffer/INPUT_2 10000001000 115 ns, 10000001001 125 ns, 10000001010 135 ns, 10000001011 145 ns

force -freeze sim:/transposed_buffer/INPUT_3 11111111111 0 ns, 00000011100 25 ns, 00000011101 35 ns, 00000011110 45 ns, 00000011111 55 ns, 00000100000 65 ns
force -freeze sim:/transposed_buffer/INPUT_3 00000100001 75 ns, 00000100010 85 ns, 00000100011 95 ns, 00000100100 105 ns
force -freeze sim:/transposed_buffer/INPUT_3 10000001100 115 ns, 10000001101 125 ns, 10000001110 135 ns, 10000001111 145 ns

run 160 ns