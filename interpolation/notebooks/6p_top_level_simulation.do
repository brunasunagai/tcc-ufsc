restart -f

force -freeze sim:/affine_tcc/TOP_CLK 1 0, 0 {25 ns} -r {50 ns}
force -freeze sim:/affine_tcc/TOP_RESET 0 0 ns, 1 40 ns, 0 23410 ns, 1 23430 ns
force -freeze sim:/affine_tcc/TOP_START 0 0 ns, 1 90 ns, 0 110 ns

force -freeze sim:/affine_tcc/TOP_COORD_X 01111100 50 ns
force -freeze sim:/affine_tcc/TOP_COORD_Y 00011110 50 ns
force -freeze sim:/affine_tcc/TOP_CPMV_0 0011001010010111 50 ns
force -freeze sim:/affine_tcc/TOP_CPMV_1 1110001010111001 50 ns
force -freeze sim:/affine_tcc/TOP_CPMV_2 0000000100001100 50 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100000001110010001111010001100101111000110100011100110001110011101101110 220 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100111010010111000110111110100011111111111110011111000001110110011100100 320 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100101111000001011010000000100100010101001000010111111101111010110000000 420 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110101101110100111110001111111000111111001111010101001011110001011100011 520 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001100110101100000100000011000001011000011010000001110101001001101011011 620 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101101110100001000011110010110000100011101110101101010000010111100111111 720 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010001101011000001101000110110100000110100110010000101011110011001101011 820 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010001110011101111011110010001010100111100000011110111110101010010011000 920 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101010100000000001000100111111111001001010010101101101001111111010101111 1020 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111010000100010111110001010101110111100111100111111001001100111110100111 1670 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100110110011010011000110110011101101011011100010101010001011110111101001 1770 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110111011101111111011010001001011011011010001011001110000000010000110000 1870 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100010000100101001000100101010110000110001100100110010001011000000110000 1970 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011001100010100111011011111010100100010011000111001010000001111011010010 2070 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011110110100111010101001001100000111110110001110011010010111010110110000 2170 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010101101001011100001110011001011011001111110011011010111001110001011101 2270 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011101000100110001000101000011001101011100111101000101010100110111110110 2370 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000100110111010000001010101001000000101111100000110111000110000100100100 2470 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111110010100110001000110011010011110010000001100100010000101101101110000 3120 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000000111011000010110110100010000001010101101110010001000010111110100111 3220 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001100000101101111001110100101110001011000010100010101111011110100001111 3320 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001111010000001111011101011101011101110001010011000111111101100100010110 3420 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011100100001100001110110100010111011110110111010000001010001110010101011 3520 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100101111110010100111010001011010100011101111101111000110101111111001000 3620 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111101110100001001011101001001000101100011011111101011000110001101110110 3720 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110000101010010010101101011100001101110011011011010101011110001110000010 3820 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110000000010010001011000101000010110011001001001011011101111111101001110 3920 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110000101111001011101011101010110001101100101000000111011110010011100110 4570 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011001001111110010000100100101111000000101011011001011111011111100110000 4670 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100000000100101000101100101100001101101011111100001111101100000000011000 4770 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010000010001010001110101011100101010001000111011111010010010011100000110 4870 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000100000101001010110101111000100000000011000000010010000111010101110111 4970 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010011010010100001010010111101000111100111101011011010011000101110110100 5070 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000001100111100111111001110000111100000011011111101011100001100001101101 5170 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000011011000010110011110011011111111101011001011111011000111110101100100 5270 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000101110000011110011110100010000011001100100110111000110011101110011100 5370 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100101001101011101100000110111000000100101111001100001100010101111001011 6020 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110010100111101000111101101110011101000101010110010101000010111000110000 6120 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101100000100001101110110001011000011101100000011110011110101000101011111 6220 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010111001110000011011111101101010001100001100000111110101010111000110011 6320 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001000011101011010100110011111101100110101000011000010111001000111110110 6420 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111110001000010011010011111000001011001110011010101111100101100111110011 6520 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000001110000101101010101101101110000111111110001010000011011011001101000 6620 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111000010100001011101100001001100001100000010011100110001110101101101111 6720 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010100100111101101101111000101001010101100110111101111111101010011111110 6820 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000100110110110010001100010010110000100000010010110000001101100101011110 7470 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100000000011011110101101011100101010001110111111100001000011110100101101 7570 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000011001111011001110100010010010001100110110110101001100101011101100100 7670 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000000011101101000101100000010111100100001001111110000100001010110101010 7770 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100011101111001000011110111010000110100000001001100110110010000010011000 7870 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011000101011101001011111001010100011010000100110001011001011001000101001 7970 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100001100100101101000001100111101110101000011110101000101110111011010111 8070 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011101000000010110111100111010001010110000001010111010111001110000100100 8170 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011100100001011111001110100110100001001111110000000110001011011000110001 8270 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111001101001000011101000110110101010100001111100110100110011011111110100 8920 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011110101011001000011111011001111001100011111111011011100000001010010010 9020 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010110110111100101000111101000000001010110011101010001001110011001011001 9120 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000000110101000001110011100100010100100010100010001000001010111111110001 9220 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100110111001100010010000100010101011101011000001001111001000101111001011 9320 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101110001100100001111001000010100000001110000100011101111100000011110110 9420 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001010101110010101110000111000110101000011110010011001011001111101110111 9520 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100110100001011100100100001110111000110001011111101001000110001101010100 9620 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111101001101100000101101100010011000000011001100010110111001110011100110 9720 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001111000010000110010100100100001111100001010000110110110001011001110101 10370 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011101101010010100001000101101001001111111111010110010001110001011100101 10470 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011111100101001100111110010001010100000111110100001001001101011110101000 10570 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110111011100001101010011101100010010110111001000111001110100000110010010 10670 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011100010000110110101001111110101111001010100011100110001101111001101000 10770 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001101101110100010101100101001011010010000111000001001110100001000000010 10870 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000100001100011111100001000101111011000000101101001010111100111110100001 10970 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100000110111110101010101111010011111101010011111001101000110100111011110 11070 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111111000011000110011001111001110110011000101111111100101100000110110101 11170 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010100001011000010001001010110010001101011100010010001110100111100001001 11820 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111110101000100101100111011101110100001010010000011110100101111001010001 11920 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001011011000110001111000100000000111100100010110110011011000111111111111 12020 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011110000011000010000111111100111000101100001101000010100101110100011011 12120 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111010111010101100100110001101110010100010001011000010101010100010111001 12220 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011001011011000001110111000100111110010110010011100001011010110000010010 12320 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110011000010010001010000111101100000000101100011111111111001011111001111 12420 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111000110101110101110001110000100011000010001110001010100001001011100001 12520 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101110111011110110101001000000100001101010001100010111001101100001110110 12620 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000111011010101100000100111100101111011111100010101000010011100100100100 13270 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001110001010100100110100111000111000010010111011110000111001000100100110 13370 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001101111000100001011001110111001011100111000000101101101010110001101001 13470 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011010110011101001110001101110011011011010001110101100110010001010010001 13570 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000010111000110000001010110110001000010100001100110111010011011010111000 13670 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101011100100010110101010011101010100100000100100100110001111100100010011 13770 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110101001111010110111010101101001101011101100100001101110111011011100011 13870 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100110000000011111010000101001110001110111010100011000111111110101001001 13970 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011011111101110000011001111010101010111100011100111110110000101111010000 14070 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011100001110011010000011100101000101100100100101101100101010100011111011 14720 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101010000101111100010100001110101101010100010110011001010010101000001100 14820 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000111101100100111101110111110100100100101111000100001011001011101110010 14920 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100001011011001110111110011010010100011001111010100010110111010010010101 15020 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101101100011000110000110111100110010011001100001000010001000111111101100 15120 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010000110111010011110000101101000101001001000010010000011001100110010101 15220 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100001111100001111001101000100110010101000111111010110101100110010110111 15320 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000001110110110100100010100111100110011011101100010101000100011001001101 15420 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001000001110100010011001101101001101011101101101110110010001011111100100 15520 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001100101111111011111000100011000011101111010011100010101110101001010101 16170 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110100001010010101100001101011100001010110110111001000001000101000011011 16270 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001100111010010101000001001000101111101100000100111101100011010010010100 16370 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111111010011001110101010001000110001111110000010011011000000101100000010 16470 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110100111011101010010011111110101100000100011011111010100001010010001010 16570 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101101111011100001000000010111111111011111000010110111111000001010111001 16670 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000100010100000010001100101110001100000110100101100000000001110111011001 16770 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101010101011101001100111011011100001101111101000111100011101100101000100 16870 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110111101001011100101111101100101000110101010010100000110011000100001010 16970 ns

############## INTERP X ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010011101011010000001100110101000110101100111101001000000101011100001111 17620 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101010101101101001010101111100101111110110110011001010001000100010111111 17720 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110100100001000010110110011100111110011000000100000010000111110111100111 17820 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011100111010000000100100000000101011010111001010010001000101111111010010 17920 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110100110000100011000001111010110000101011011100101110100100100101100111 18170 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011100101010100001101111000111001100010110110100111111001010000001001100 18270 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110110101111011111010110100001011111110001110011001000000000100010111100 18370 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110100100101011110111111000101011111110010010110101001010110011000000011 18470 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100111010100110001100010011100011011111001101010000100000100101111111110 18570 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000111100010110100011001101111110100000011010111101011010000110011111111 18670 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101101001101110001101010011001011101000010100000111100111111000111011110 18770 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000011000101011110011011100010011011010011010011001101111100001011100111 18870 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000011110101010011101000000111111100010101111011011011001010000101011010 18970 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000000110010000001101110110100101110000001000110000111010011110001110100 19620 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111010101000111111111110010001000000101101010000101000010011101111011010 19720 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101111100011110011011110001010001111011111001000111010100101110111110001 19820 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110010010010111010111011010011001111100010101101001110001001101010110001 19920 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100011100001101110111011011100000011100101111011100101110001010010011011 20020 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011101000101000001010100110110101110000001001001101110110010001100110101 20120 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100010111111101111111001110110010010011000101000011010100110000110011011 20220 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010001001100100001011010001101010001100110001100001110100101110111000101 20320 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001100111010110110001100110010100110111000010100111100011101101110101001 20420 ns

############## INTERP XY ##############
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111111011010100001011011101101001111011111011111110011011011101001000110 21070 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 100111111101010100110111110111010011100011001011101011000100010110110011 21170 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 001100010110110001001010111001011001011000000110100100011010110101001110 21270 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 101001111110111111010010111111111101000000100110000100011110000100011000 21370 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 111110011101011110010000000000110011000011000000110000011101101010111000 21470 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 010110101010010000001101110011110100011111111110000011110000111000011000 21570 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 011000110100010100011000100110001100000100010100110000001101000001011001 21670 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 000011000011100000110100010101101001111111101011010011001010111011010011 21770 ns
force -freeze sim:/affine_tcc/TOP_INTEGER_SAMPLES 110100000011111111100100111100000111110100110111011100001101001011100110 21870 ns                                            

run 23520 ns 
