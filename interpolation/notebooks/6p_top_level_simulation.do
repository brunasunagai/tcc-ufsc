restart -f

force -freeze sim:/affine_6p/clock 1 0, 0 {25 ns} -r {50 ns}
force -freeze sim:/affine_6p/TOP_RESET 0 0 ns, 1 40 ns, 0 22110 ns, 1 22130 ns
force -freeze sim:/affine_6p/TOP_START 0 0 ns, 1 90 ns, 0 110 ns

force -freeze sim:/affine_6p/TOP_COORD_X 01111010 50 ns
force -freeze sim:/affine_6p/TOP_COORD_Y 01010110 50 ns
force -freeze sim:/affine_6p/TOP_CPMV_0 0010011011010011 50 ns
force -freeze sim:/affine_6p/TOP_CPMV_1 1000011101011011 50 ns
force -freeze sim:/affine_6p/TOP_CPMV_2 0011100110110001 50 ns

############## INTERP X ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111001001000100110010111111011000011110100011000011000010101001101001110 220 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100001000011100001010011101100001110111000001111111101111101000011100001 320 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100101001101011000110111100111000110000000110000100001011011100101001110 420 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101101001110111011010110000001101111111000111011101110001100000111011000 520 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011101110001101011101011101110111111000110111101001101110101011001111001 770 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010111011100111001100001001111111110110101110110011111000000000100100011 870 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000111011100111100111100100010111111100101101000100110001110111001100001 970 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001100111100000011110001110001010001100110000100010110010110111111111101 1070 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011011111000101100001100101111000001001000001001001000001011100001101011 1170 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100110011110111011000000101101101011000011110111010010010010101000000010 1270 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111011000000100111001110011001001011010100001110101100111000100001001000 1370 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000010011110010111100001101001100000010111001001001011000101110010001000 1470 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110111100111010001100011000110011101011100000110010001001000001010110110 1570 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010010000000101001111011010011110100000010100101011011011100100000110010 2220 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101100011001110110111011100101011010011111100000011111000001001011110110 2320 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000111101000110010111100110011110100000001111101111100011001111010000011 2420 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010110010110000011101011101100000011110010111101011100111111111001010110 2520 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110001111101011000101011000001110000110001110100010000110001110100000000 2620 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101001010001110000010001111011010000001011111110010001110101100001111011 2720 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101001000101110111110111010110111100001010110001110111010101100001000110 2820 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101010010101010110001000100100100011010110110010011100110010101010001110 2920 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100001010110111110000111101001101101100100110111111111000110101100010100 3020 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000111110101011000101000110111011001011001111011100101110010001100100111 3670 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100000111100100001001111111001011000011100001110110000010111100010110110 3770 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101000010011001100101011001011001000011110000010101101010000011100010010 3870 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000110000110101111101011110100100110100001100011011001100001010011111101 3970 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010011100011001101111101111001000110100110110111001111011100001000110110 4070 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101110011000011100001000111011001010110100101100000000110111110101010110 4170 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111101011000001001111110011001101011110110011110000000100000010011110011 4270 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010100110101010100001111010011110001001100001100110100011110111010101011 4370 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000110011010101100110100110111110000101100011110000101010011100100111000 4470 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100011110101110101010110001011001011001110110000110110101011101111011110 5120 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101111011111111011110000001000101010111001000110010010100110011100110000 5220 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101101001011011101100111011101101110111011110010001111100111011101001111 5320 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011100110111011101000010101100011000101101101000001100010100000110011011 5420 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101000101100101101100001100111001011001010101011111001000011000010001100 5520 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101100000000100101110110000010001110010111100100000000001010100110011000 5620 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110110100100011000111011100010110000110100010001001010110010110010011100 5720 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000000010011011000001111110000100111011000010011001100010111010111011110 5820 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101011100100011101111001000101001001001000001110100000111010100111110001 5920 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100001000111110011001001101100110010101010001101001110011001011111001100 6570 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101110100001110101110100111101110111000001111110110111000001100100000111 6670 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100100011110110100011100010011110101011111110111100111001001101011000111 6770 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110011101010110100001100110001100111001100111001010100100100100111010010 6870 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011001100100000100101110111101010100111101100011010010001001001101010011 6970 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001110111010001111101100001000000110000110110110100010101110101110011101 7070 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110111011110101111111111111110100000010011111101001100010000110101001111 7170 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000100100111000100111001000000111001100001111101101001001100111011011000 7270 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010000011011000000011101000001111101001101011100100011011110000101010000 7370 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101001010100100000100101111011101001010100101111001001100001110111001011 8020 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110000010100101010100101110001111011101101101110101000000100001000011110 8120 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110110000100101100011011001011010001111100111011010001011110001000110011 8220 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110110101110011110000100001001010001110111011001100100111111001011001101 8320 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110100100101010101011111111011100101101010100101000001010011001110000111 8420 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100100110011000011111011111011001100011010010111100111010100100000010000 8520 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001101100000001100101110000100010101100000010111101000010101001100111010 8620 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001101100101000101100000010011110100011010110000101111010111110010000101 8720 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110110000110100011010000010000111110000000110101011011100011000000100001 8820 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101001010101000001011000110011011111001000010000110101101011010011100100 9470 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001011111001101110101101011100011011010111000101101111110000100000000100 9570 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011101000111000010011111101110010000000010101010000111010000110010000101 9670 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101101111011001001001001010001001000001000110111110111101100010110010110 9770 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101011000001010100101000000111100110111101010100100000001000111010111000 9870 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010100001101110111001011010001001101001001000110010000011101010001101100 9970 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110101100010110101011100111101100111101000110110101011011101110001111001 10070 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001111101010000011101100111101001010001001011010111011110101000111111110 10170 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111001110101100111111111000001000111100010110010101111000110000001010001 10270 ns

############## INTERP X ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001001110011001001011110001111111111101000101101111100010011100111000001 10920 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010001000100100100010100100100100111001000000100100011110110000000001111 11020 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110010000101111110011110001000111100111100010001001011101001110100110111 11120 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101000101100101011111100111111010000010111111111001111100001110100110001 11220 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011001111101101110100100101011100000111001111001011011001000010110011101 11470 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001001111000101011100110110101111111011110110000110111011100101100100010 11570 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011110111100111100111110110101110100010110100101111100000110001101100101 11670 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110110111011010101011011101011001100101111111101001101001011111100110010 11770 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011000100000100100101000010010001000000011111001101011110100000011110011 11870 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110100010000101100111011000011001110011010100000110111110101100101011101 11970 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101011010110100111000001110011000111010011000010100000110101011111110101 12070 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011100011000011100010011000010101001011000110101001110110110100000011001 12170 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111111010101100000111000111011011100110110001010011000001011101111110101 12270 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001001101100010101001011000111101010011000010001101101001101100011000000 12920 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010111011111101111011110100010101101110000010101000010001000001101000010 13020 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110111001000001010001110001010000000000000001010011100111010010001000101 13120 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000010010100011010010001001001111101111011001101101010101000010110001110 13220 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001101001000011101001111111110001010000111100011111100001110110010100010 13320 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100100101010111100110111110101011010110000001111111110111001010011111000 13420 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101100000001100110010011110000110010100110111111011111011001101110010100 13520 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100101111000010010110110111100100101111000110111000101111100011100110011 13620 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010101001110001011010001111000010010110110011011101000101001110010101100 13720 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100010111011011101100000111101101001111011000000001101100000100110110110 14370 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010011111101100111010000100001010110101110111000001010010001001110110100 14470 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010001110010100011100100001001101110101110100100011001001011110100010101 14570 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100010100010000001101001100100110100111100011000011011111000110110100001 14670 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100100000000100011100001110000001011101010110111110010111000110111110001 14770 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101101111100110010011110000001111100110111011001001100001011010110010010 14870 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111000000100010001111001100001000100111100110100001010001100111011100011 14970 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111001100111111011101100100110010000000000111010000100010100011111010100 15070 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100100001010101011111001000110101001000101001001001011101101001000110001 15170 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101010010101010011101101010101101110110000101001010111001100101110100011 15820 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101001110110111111011110001000111101101011100100001011011111100111000011 15920 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111101000111111010111110011000110100000001111100100011100001011011100101 16020 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000001110111010000010010010010110101010101111101110110010011000010111000 16120 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100000001110100000000100000001111000001111011101111000100010011011111100 16220 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100110000011111000000100101110101111101100111011111111001110110101001001 16320 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110100011110111001000001100111011000010000010100000100110011101101100001 16420 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110110111110111001001011100100000101010111100000010100001001100001110010 16520 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000110011010110111001010111000010100101110001011110101000111101101010111 16620 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001011110010011010001010110010100011110001101011101000110011011110111011 17270 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001010100110010111111001110101010010011110100011001001001011110000110111 17370 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 001010111000101010101100000111100000000101000110111100001000111100010001 17470 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011111010010011011110000101000000001001010011101100000000011001000111101 17570 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010001110000101101001101001000111010100011001010110110011000000010101010 17670 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101000110000101010000100100011111111011010001000110111110101011010100001 17770 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000101100111011010101100111100110001001101001101000100011101010101000100 17870 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100000000001101011110011010000101001010111011100011110100101110111101011 17970 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111101001100010100001100110011111000110011110110001001101001010010000000 18070 ns

############## INTERP XY ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111110101000010111101101001101000111111001101000100101010100011101100110 18720 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101010001100011001000101110100001000100111011110001101110010010101101011 18820 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000110110110011010011000101110100001011000111110111011001100011110101001 18920 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101101110001101101101001011100110110000111011011101101101110001110001011 19020 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010000110100100010110110111100001011010100101100011101001010110010011101 19120 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 011100100101000111000111111001010011101100011110110011010010011101111101 19220 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100101010111110010001010000011011010010001010100111110110000011101010011 19320 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101101110101011100101100110111011111000000110100110011010011100110111001 19420 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 101101001100010000000000100100000111101100100101111110101111010011000001 19520 ns

############## INTERP Y ##############
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 100001000101111010111111010110111110110110100101111000110000001011001111 20270 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111001100000100100000001000111101010110001100111001010100001001111101111 20320 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110001001110100000110010001110110100000010011111010101110111110010011011 20370 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 010101010111010101111100100100110100000000011101111000001100010000110010 20420 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111110001010011011101000101110010110100100011101111000001010001100111100 20470 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 110111111100100010010000000011001001111110011010011101011110110011010111 20520 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000100011001100110001011001001111001000101000101101111011001001000100101 20570 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 000100111011000010000000110101000000010000100011011110101111110000001111 20620 ns
force -freeze sim:/affine_6p/TOP_INTEGER_SAMPLES 111111011011101101100110110100010010101011111111010010001110010010001011 20670 ns                                            

run 22220 ns 
