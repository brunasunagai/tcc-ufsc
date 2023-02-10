 /*------------------------------------------------------------------------------
 * Combinational Toplevel
 * 
 *------------------------------------------------------------------------------ */
 
module combinational_top (
	X0, X1, X2, X3, X4, X5, X6, X7,	
	Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14
);
 
// Declaracao dos in e out
input signed [7:0] X0, X1, X2, X3 ,X4, X5, X6, X7;
output signed [15:0] Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14;


/* Legenda dos wires de saida dos modulos A's
	Ex: A0_1m = output de A0, valor 1*X0, negativo	*/
	
// Wires para A0
wire signed [15:0] A0_1m;

// Wires para A1
wire signed [15:0] A1_1, A1_2, A1_3, A1_4; 

// Wires para A2
wire signed [15:0] A2_11m, A2_10m, A2_9m, A2_8m, A2_5m, A2_4m, A2_3m, A2_2m;

// Wires para A3
wire signed [15:0] A3_63, A3_62, A3_60, A3_58, A3_52, A3_47, A3_45, 
						 A3_40, A3_34, A3_31, A3_26, A3_17, A3_13, A3_8, A3_4;
				
// Wires para A4
wire signed [15:0] A4_63, A4_62, A4_60, A4_58, A4_52, A4_47, A4_45, 
						 A4_40, A4_34, A4_31, A4_26, A4_17, A4_13, A4_8, A4_4;

// Wires para A5
wire signed [15:0] A5_11m, A5_10m, A5_9m, A5_8m, A5_5m, A5_4m, A5_3m, A5_2m;

// Wires para A6
wire signed [15:0] A6_1, A6_2, A6_3, A6_4;

// Wires para A7
wire signed [15:0] A7_1m;

// Declaracao dos modulos externos (filtros transpostos) 
A0_affine A0(
	.X (X0),
	.Y (A0_1m)
);

A1_affine A1(
	.X (X1),
	.Y1 (A1_1),
	.Y2 (A1_2),
	.Y3 (A1_3),
	.Y4 (A1_4)
);

A2_affine A2(
	.X (X2),
   .Y1 (A2_11m),
   .Y2 (A2_10m),
   .Y3 (A2_9m),
   .Y4 (A2_8m),
   .Y5 (A2_5m),
   .Y6 (A2_4m),
   .Y7 (A2_3m),
   .Y8 (A2_2m)
);

A3_affine A3(
	.X (X3),
	.Y1 (A3_63),
	.Y2 (A3_62),
	.Y3 (A3_60),
	.Y4 (A3_58),
	.Y5 (A3_52),
	.Y6 (A3_47),
	.Y7 (A3_45),
	.Y8 (A3_40),
	.Y9 (A3_34),
	.Y10 (A3_31),
	.Y11 (A3_26),
	.Y12 (A3_17),
	.Y13 (A3_13),
	.Y14 (A3_8),
	.Y15 (A3_4)
);

A4_affine A4(
	.X (X4),
	.Y1 (A4_4),
	.Y2 (A4_8),
	.Y3 (A4_13),
	.Y4 (A4_17),
	.Y5 (A4_26),
	.Y6 (A4_31),
	.Y7 (A4_34),
	.Y8 (A4_40),
	.Y9 (A4_45),
	.Y10 (A4_47),
	.Y11 (A4_52),
	.Y12 (A4_58),
	.Y13 (A4_60),
	.Y14 (A4_62),
	.Y15 (A4_63)
);

A5_affine A5(
	.X (X5),
   .Y1 (A5_11m),
   .Y2 (A5_10m),
   .Y3 (A5_9m),
   .Y4 (A5_8m),
   .Y5 (A5_5m),
   .Y6 (A5_4m),
   .Y7 (A5_3m),
   .Y8 (A5_2m)
);

A6_affine A6(
	.X (X6),
	.Y1 (A6_1),
	.Y2 (A6_2),
	.Y3 (A6_3),
	.Y4 (A6_4)
);

A7_affine A7(
	.X (X7),
	.Y (A7_1m)
);

 
assign Y0 =            A1_1  +  A2_3m   +  A3_63  +  A4_4   +  A5_2m  +  A6_1;
assign Y1 =  A0_1m  +  A1_2  +  A2_5m   +  A3_62  +  A4_8   +  A5_3m  +  A6_1;
assign Y2 =  A0_1m  +  A1_3  +  A2_8m   +  A3_60  +  A4_13  +  A5_4m  +  A6_1;
assign Y3 =  A0_1m  +  A1_4  +  A2_10m  +  A3_58  +  A4_17  +  A5_5m  +  A6_1;
assign Y4 =  A0_1m  +  A1_4  +  A2_11m  +  A3_52  +  A4_26  +  A5_8m  +  A6_3  +  A7_1m;
assign Y5 =  A0_1m  +  A1_3  +  A2_9m   +  A3_47  +  A4_31  +  A5_10m +  A6_4  +  A7_1m;
assign Y6 =  A0_1m  +  A1_4  +  A2_11m  +  A3_45  +  A4_34  +  A5_10m +  A6_4  +  A7_1m;
assign Y7 =  A0_1m  +  A1_4  +  A2_11m  +  A3_40  +  A4_40  +  A5_11m +  A6_4  +  A7_1m;
assign Y8 =  A0_1m  +  A1_4  +  A2_10m  +  A3_34  +  A4_45  +  A5_11m +  A6_4  +  A7_1m;
assign Y9 =  A0_1m  +  A1_4  +  A2_10m  +  A3_31  +  A4_47  +  A5_9m  +  A6_3  +  A7_1m;
assign Y10 = A0_1m  +  A1_3  +  A2_8m  +  A3_26  +  A4_52  +  A5_11m  +  A6_4  +  A7_1m;
assign Y11 =           A1_1  +  A2_5m  +  A3_17  +  A4_58  +  A5_10m  +  A6_4  +  A7_1m;
assign Y12 =           A1_1  +  A2_4m  +  A3_13  +  A4_60  +  A5_8m   +  A6_3  +  A7_1m;
assign Y13 =           A1_1  +  A2_3m  +  A3_8   +  A4_62  +  A5_5m   +  A6_2  +  A7_1m;
assign Y14 =           A1_1  +  A2_2m  +  A3_4   +  A4_63  +  A5_3m   +  A6_1;

endmodule
 
 