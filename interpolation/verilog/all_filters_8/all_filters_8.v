/*------------------------------------------------------------------------------
 * File: all_filters_8.v
 * Date generated: 05/12/2022
 * Date modified: 08/05/2023
 * Author: Bruna Suemi Nagai
 * Description: Concatenating all 15 filters in a sum tree
 *------------------------------------------------------------------------------ */

module all_filters_8 (
    X,
	Y1,
	Y2,
	Y3,
	Y4,
	Y5,
	Y6,
	Y7,
	Y8,
	Y9,
	Y10,
	Y11,
	Y12,
	Y13,
	Y14,
	Y15
);


// ------------------------------------------
// Port mode declarations
// ------------------------------------------

	input signed [47:0] X;
	output signed [10:0] Y1;
	output signed [10:0] Y2;
	output signed [10:0] Y3;
	output signed [10:0] Y4;
	output signed [10:0] Y5;
	output signed [10:0] Y6;
	output signed [10:0] Y7;
	output signed [10:0] Y8;
	output signed [10:0] Y9;
	output signed [10:0] Y10;
	output signed [10:0] Y11;
	output signed [10:0] Y12;
	output signed [10:0] Y13;
	output signed [10:0] Y14;
	output signed [10:0] Y15;

// ------------------------------------------
// Wires declarations
// ------------------------------------------
	
	// Spliting the input into parts of 8 bits each
	wire signed [7:0] X0, X1, X2, X3, X4, X5;
	
	// Regs for filter's outputs 
	
	// TAP 0
	wire signed [7:0]	r_t0_f1_1;
	wire signed [7:0]	r_t0_f2_1;
	wire signed [8:0]	r_t0_f3_2;
	wire signed [9:0]	r_t0_f4_3;
	wire signed [9:0]	r_t0_f5_3;
	wire signed [8:0]	r_t0_f6_2;
	wire signed [9:0]	r_t0_f7_3;
	wire signed [9:0]	r_t0_f8_3;
	wire signed [9:0]	r_t0_f9_3;
	wire signed [9:0]	r_t0_f10_3;
	wire signed [8:0]	r_t0_f11_2;
	wire signed [7:0]	r_t0_f12_1;
	wire signed [7:0]	r_t0_f13_1;
	wire signed [7:0]	r_t0_f14_1;
	wire signed [7:0]	r_t0_f15_1;

	// TAP 1
	wire signed [9:0]	r_t1_f1_3neg;
	wire signed [10:0]	r_t1_f2_5neg;
	wire signed [11:0]	r_t1_f3_8neg;
	wire signed [11:0]	r_t1_f4_10neg;
	wire signed [11:0]	r_t1_f5_11neg;
	wire signed [11:0]	r_t1_f6_9neg;
	wire signed [11:0]	r_t1_f7_11neg;
	wire signed [11:0]	r_t1_f8_11neg;
	wire signed [11:0]	r_t1_f9_10neg;
	wire signed [11:0]	r_t1_f10_10neg;
	wire signed [11:0]	r_t1_f11_8neg;
	wire signed [10:0]	r_t1_f12_5neg;
	wire signed [10:0]	r_t1_f13_4neg;
	wire signed [9:0]	r_t1_f14_3neg;
	wire signed [9:0]	r_t1_f15_2neg;

	// TAP 2
	wire signed [13:0]	r_t2_f1_63;
	wire signed [13:0]	r_t2_f2_62;
	wire signed [13:0]	r_t2_f3_60;
	wire signed [13:0]	r_t2_f4_58;
	wire signed [13:0]	r_t2_f5_52;
	wire signed [13:0]	r_t2_f6_47;
	wire signed [13:0]	r_t2_f7_45;
	wire signed [13:0]	r_t2_f8_40;
	wire signed [13:0]	r_t2_f9_34;
	wire signed [12:0]	r_t2_f10_31;
	wire signed [12:0]	r_t2_f11_26;
	wire signed [12:0]	r_t2_f12_17;
	wire signed [11:0]	r_t2_f13_13;
	wire signed [10:0]	r_t2_f14_8;
	wire signed [9:0]	r_t2_f15_4;

	// TAP 3
	wire signed [9:0]	r_t3_f1_4;
	wire signed [10:0]	r_t3_f2_8;
	wire signed [11:0]	r_t3_f3_13;
	wire signed [12:0]	r_t3_f4_17;
	wire signed [12:0]	r_t3_f5_26;
	wire signed [12:0]	r_t3_f6_31;
	wire signed [13:0]	r_t3_f7_34;
	wire signed [13:0]	r_t3_f8_40;
	wire signed [13:0]	r_t3_f9_45;
	wire signed [13:0]	r_t3_f10_47;
	wire signed [13:0]	r_t3_f11_52;
	wire signed [13:0]	r_t3_f12_58;
	wire signed [13:0]	r_t3_f13_60;
	wire signed [13:0]	r_t3_f14_62;
	wire signed [13:0]	r_t3_f15_63;

	// TAP 4
	wire signed [9:0]	r_t4_f1_2neg;
	wire signed [9:0]	r_t4_f2_3neg;
	wire signed [10:0]	r_t4_f3_4neg;
	wire signed [10:0]	r_t4_f4_5neg;
	wire signed [11:0]	r_t4_f5_8neg;
	wire signed [11:0]	r_t4_f6_10neg;
	wire signed [11:0]	r_t4_f7_10neg;
	wire signed [11:0]	r_t4_f8_11neg;
	wire signed [11:0]	r_t4_f9_11neg;
	wire signed [11:0]	r_t4_f10_9neg;
	wire signed [11:0]	r_t4_f11_11neg;
	wire signed [11:0]	r_t4_f12_10neg;
	wire signed [11:0]	r_t4_f13_8neg;
	wire signed [10:0]	r_t4_f14_5neg;
	wire signed [9:0]	r_t4_f15_3neg;

	// TAP 5
	wire signed [7:0]	r_t5_f1_1;
	wire signed [7:0]	r_t5_f2_1;
	wire signed [7:0]	r_t5_f3_1;
	wire signed [7:0]	r_t5_f4_1;
	wire signed [8:0]	r_t5_f5_2;
	wire signed [9:0]	r_t5_f6_3;
	wire signed [9:0]	r_t5_f7_3;
	wire signed [9:0]	r_t5_f8_3;
	wire signed [9:0]	r_t5_f9_3;
	wire signed [8:0]	r_t5_f10_2;
	wire signed [9:0]	r_t5_f11_3;
	wire signed [9:0]	r_t5_f12_3;
	wire signed [8:0]	r_t5_f13_2;
	wire signed [7:0]	r_t5_f14_1;
	wire signed [7:0]	r_t5_f15_1;
	
	// First sums
	wire signed [10:0]	s_f1_t0_t1;	// 11 bits
	wire signed [14:0]	s_f1_t2_t3;	// 15 bits
	wire signed [10:0]	s_f1_t4_t5;	// 11 bits
	wire signed [11:0]	s_f2_t0_t1;	// 12 bits
	wire signed [14:0]	s_f2_t2_t3;	// 15 bits
	wire signed [10:0]	s_f2_t4_t5;	// 11 bits
	wire signed [12:0]	s_f3_t0_t1;	// 13 bits
	wire signed [14:0]	s_f3_t2_t3;	// 15 bits
	wire signed [11:0]	s_f3_t4_t5;	// 12 bits
	wire signed [12:0]	s_f4_t0_t1;	// 13 bits
	wire signed [14:0]	s_f4_t2_t3;	// 15 bits
	wire signed [11:0]	s_f4_t4_t5;	// 12 bits
	wire signed [12:0]	s_f5_t0_t1;	// 13 bits
	wire signed [14:0]	s_f5_t2_t3;	// 15 bits
	wire signed [12:0]	s_f5_t4_t5;	// 13 bits
	wire signed [12:0]	s_f6_t0_t1;	// 13 bits
	wire signed [14:0]	s_f6_t2_t3;	// 15 bits
	wire signed [12:0]	s_f6_t4_t5;	// 13 bits
	wire signed [12:0]	s_f7_t0_t1;	// 13 bits
	wire signed [14:0]	s_f7_t2_t3;	// 15 bits
	wire signed [12:0]	s_f7_t4_t5;	// 13 bits
	wire signed [12:0]	s_f8_t0_t1;	// 13 bits
	wire signed [14:0]	s_f8_t2_t3;	// 15 bits
	wire signed [12:0]	s_f8_t4_t5;	// 13 bits
	wire signed [12:0]	s_f9_t0_t1;	// 13 bits
	wire signed [14:0]	s_f9_t2_t3;	// 15 bits
	wire signed [12:0]	s_f9_t4_t5;	// 13 bits
	wire signed [12:0]	s_f10_t0_t1;	// 13 bits
	wire signed [14:0]	s_f10_t2_t3;	// 15 bits
	wire signed [12:0]	s_f10_t4_t5;	// 13 bits
	wire signed [12:0]	s_f11_t0_t1;	// 13 bits
	wire signed [14:0]	s_f11_t2_t3;	// 15 bits
	wire signed [12:0]	s_f11_t4_t5;	// 13 bits
	wire signed [11:0]	s_f12_t0_t1;	// 12 bits
	wire signed [14:0]	s_f12_t2_t3;	// 15 bits
	wire signed [12:0]	s_f12_t4_t5;	// 13 bits
	wire signed [11:0]	s_f13_t0_t1;	// 12 bits
	wire signed [14:0]	s_f13_t2_t3;	// 15 bits
	wire signed [12:0]	s_f13_t4_t5;	// 13 bits
	wire signed [10:0]	s_f14_t0_t1;	// 11 bits
	wire signed [14:0]	s_f14_t2_t3;	// 15 bits
	wire signed [11:0]	s_f14_t4_t5;	// 12 bits
	wire signed [10:0]	s_f15_t0_t1;	// 11 bits
	wire signed [14:0]	s_f15_t2_t3;	// 15 bits
	wire signed [10:0]	s_f15_t4_t5;	// 11 bits
		
	// Second sums
	wire signed [15:0]	s_f1_0;	// 16 bits
	wire signed [16:0]	s_f1_1;	// 17 bits
	wire signed [15:0]	s_f2_0;	// 16 bits
	wire signed [16:0]	s_f2_1;	// 17 bits
	wire signed [15:0]	s_f3_0;	// 16 bits
	wire signed [16:0]	s_f3_1;	// 17 bits
	wire signed [15:0]	s_f4_0;	// 16 bits
	wire signed [16:0]	s_f4_1;	// 17 bits
	wire signed [15:0]	s_f5_0;	// 16 bits
	wire signed [16:0]	s_f5_1;	// 17 bits
	wire signed [15:0]	s_f6_0;	// 16 bits
	wire signed [16:0]	s_f6_1;	// 17 bits
	wire signed [15:0]	s_f7_0;	// 16 bits
	wire signed [16:0]	s_f7_1;	// 17 bits
	wire signed [15:0]	s_f8_0;	// 16 bits
	wire signed [16:0]	s_f8_1;	// 17 bits
	wire signed [15:0]	s_f9_0;	// 16 bits
	wire signed [16:0]	s_f9_1;	// 17 bits
	wire signed [15:0]	s_f10_0;	// 16 bits
	wire signed [16:0]	s_f10_1;	// 17 bits
	wire signed [15:0]	s_f11_0;	// 16 bits
	wire signed [16:0]	s_f11_1;	// 17 bits
	wire signed [15:0]	s_f12_0;	// 16 bits
	wire signed [16:0]	s_f12_1;	// 17 bits
	wire signed [15:0]	s_f13_0;	// 16 bits
	wire signed [16:0]	s_f13_1;	// 17 bits
	wire signed [15:0]	s_f14_0;	// 16 bits
	wire signed [16:0]	s_f14_1;	// 17 bits
	wire signed [15:0]	s_f15_0;	// 16 bits
	wire signed [16:0]	s_f15_1;	// 17 bits
	
	// Final sums shifted right
	wire signed [10:0]	s_f1_shr;	 // 11 bits
	wire signed [10:0]	s_f2_shr;	 // 11 bits
	wire signed [10:0]	s_f3_shr;	 // 11 bits
	wire signed [10:0]	s_f4_shr;	 // 11 bits
	wire signed [10:0]	s_f5_shr;	 // 11 bits
	wire signed [10:0]	s_f6_shr;	 // 11 bits
	wire signed [10:0]	s_f7_shr;	 // 11 bits
	wire signed [10:0]	s_f8_shr;	 // 11 bits
	wire signed [10:0]	s_f9_shr;	 // 11 bits
	wire signed [10:0]	s_f10_shr;	 // 11 bits
	wire signed [10:0]	s_f11_shr;	 // 11 bits
	wire signed [10:0]	s_f12_shr;	 // 11 bits
	wire signed [10:0]	s_f13_shr;	 // 11 bits
	wire signed [10:0]	s_f14_shr;	 // 11 bits
	wire signed [10:0]	s_f15_shr;	 // 11 bits
 
	 
// ------------------------------------------
// Modules instantiation
// ------------------------------------------

	 t0_affine_8 T0(
		.X  (X0),
		.Y1	(r_t0_f1_1),
		.Y2	(r_t0_f2_1),
		.Y3	(r_t0_f3_2),
		.Y4	(r_t0_f4_3),
		.Y5	(r_t0_f5_3),
		.Y6	(r_t0_f6_2),
		.Y7	(r_t0_f7_3),
		.Y8	(r_t0_f8_3),
		.Y9	(r_t0_f9_3),
		.Y10	(r_t0_f10_3),
		.Y11	(r_t0_f11_2),
		.Y12	(r_t0_f12_1),
		.Y13	(r_t0_f13_1),
		.Y14	(r_t0_f14_1),
		.Y15	(r_t0_f15_1)
	);


	 t1_affine_8 T1(
		.X  (X1),
		.Y1	(r_t1_f1_3neg),
		.Y2	(r_t1_f2_5neg),
		.Y3	(r_t1_f3_8neg),
		.Y4	(r_t1_f4_10neg),
		.Y5	(r_t1_f5_11neg),
		.Y6	(r_t1_f6_9neg),
		.Y7	(r_t1_f7_11neg),
		.Y8	(r_t1_f8_11neg),
		.Y9	(r_t1_f9_10neg),
		.Y10	(r_t1_f10_10neg),
		.Y11	(r_t1_f11_8neg),
		.Y12	(r_t1_f12_5neg),
		.Y13	(r_t1_f13_4neg),
		.Y14	(r_t1_f14_3neg),
		.Y15	(r_t1_f15_2neg)
	);


	 t2_affine_8 T2(
		.X  (X2),
		.Y1	(r_t2_f1_63),
		.Y2	(r_t2_f2_62),
		.Y3	(r_t2_f3_60),
		.Y4	(r_t2_f4_58),
		.Y5	(r_t2_f5_52),
		.Y6	(r_t2_f6_47),
		.Y7	(r_t2_f7_45),
		.Y8	(r_t2_f8_40),
		.Y9	(r_t2_f9_34),
		.Y10	(r_t2_f10_31),
		.Y11	(r_t2_f11_26),
		.Y12	(r_t2_f12_17),
		.Y13	(r_t2_f13_13),
		.Y14	(r_t2_f14_8),
		.Y15	(r_t2_f15_4)
	);


	 t3_affine_8 T3(
		.X  (X3),
		.Y1	(r_t3_f1_4),
		.Y2	(r_t3_f2_8),
		.Y3	(r_t3_f3_13),
		.Y4	(r_t3_f4_17),
		.Y5	(r_t3_f5_26),
		.Y6	(r_t3_f6_31),
		.Y7	(r_t3_f7_34),
		.Y8	(r_t3_f8_40),
		.Y9	(r_t3_f9_45),
		.Y10	(r_t3_f10_47),
		.Y11	(r_t3_f11_52),
		.Y12	(r_t3_f12_58),
		.Y13	(r_t3_f13_60),
		.Y14	(r_t3_f14_62),
		.Y15	(r_t3_f15_63)
	);


	 t4_affine_8 T4(
		.X  (X4),
		.Y1	(r_t4_f1_2neg),
		.Y2	(r_t4_f2_3neg),
		.Y3	(r_t4_f3_4neg),
		.Y4	(r_t4_f4_5neg),
		.Y5	(r_t4_f5_8neg),
		.Y6	(r_t4_f6_10neg),
		.Y7	(r_t4_f7_10neg),
		.Y8	(r_t4_f8_11neg),
		.Y9	(r_t4_f9_11neg),
		.Y10	(r_t4_f10_9neg),
		.Y11	(r_t4_f11_11neg),
		.Y12	(r_t4_f12_10neg),
		.Y13	(r_t4_f13_8neg),
		.Y14	(r_t4_f14_5neg),
		.Y15	(r_t4_f15_3neg)
	);


	 t5_affine_8 T5(
		.X  (X5),
		.Y1	(r_t5_f1_1),
		.Y2	(r_t5_f2_1),
		.Y3	(r_t5_f3_1),
		.Y4	(r_t5_f4_1),
		.Y5	(r_t5_f5_2),
		.Y6	(r_t5_f6_3),
		.Y7	(r_t5_f7_3),
		.Y8	(r_t5_f8_3),
		.Y9	(r_t5_f9_3),
		.Y10	(r_t5_f10_2),
		.Y11	(r_t5_f11_3),
		.Y12	(r_t5_f12_3),
		.Y13	(r_t5_f13_2),
		.Y14	(r_t5_f14_1),
		.Y15	(r_t5_f15_1)
	);


// ------------------------------------------
// Combinational logic
// ------------------------------------------

	// Splitting input into smaller parts
	assign X0 = X[7:0];
	assign X1 = X[15:8];
	assign X2 = X[23:16];
	assign X3 = X[31:24];
	assign X4 = X[39:32];
	assign X5 = X[47:40];
  
	// Procedure for sums	
		// First sums
		assign s_f1_t0_t1 = 	{r_t0_f1_1[7], r_t0_f1_1[7], r_t0_f1_1[7], r_t0_f1_1} + {r_t1_f1_3neg[9], r_t1_f1_3neg}; 		// 8 + 10 = 11 bits
		assign s_f1_t2_t3 = 	{r_t2_f1_63[13], r_t2_f1_63} + {r_t3_f1_4[9], r_t3_f1_4[9], r_t3_f1_4[9], r_t3_f1_4[9], r_t3_f1_4[9], r_t3_f1_4}; 		// 14 + 10 = 15 bits
		assign s_f1_t4_t5 = 	{r_t4_f1_2neg[9], r_t4_f1_2neg} + {r_t5_f1_1[7], r_t5_f1_1[7], r_t5_f1_1[7], r_t5_f1_1}; 		// 10 + 8 = 11 bits
		assign s_f2_t0_t1 = 	{r_t0_f2_1[7], r_t0_f2_1[7], r_t0_f2_1[7], r_t0_f2_1[7], r_t0_f2_1} + {r_t1_f2_5neg[10], r_t1_f2_5neg}; 		// 8 + 11 = 12 bits
		assign s_f2_t2_t3 = 	{r_t2_f2_62[13], r_t2_f2_62} + {r_t3_f2_8[10], r_t3_f2_8[10], r_t3_f2_8[10], r_t3_f2_8[10], r_t3_f2_8}; 		// 14 + 11 = 15 bits
		assign s_f2_t4_t5 = 	{r_t4_f2_3neg[9], r_t4_f2_3neg} + {r_t5_f2_1[7], r_t5_f2_1[7], r_t5_f2_1[7], r_t5_f2_1}; 		// 10 + 8 = 11 bits
		assign s_f3_t0_t1 = 	{r_t0_f3_2[8], r_t0_f3_2[8], r_t0_f3_2[8], r_t0_f3_2[8], r_t0_f3_2} + {r_t1_f3_8neg[11], r_t1_f3_8neg}; 		// 9 + 12 = 13 bits
		assign s_f3_t2_t3 = 	{r_t2_f3_60[13], r_t2_f3_60} + {r_t3_f3_13[11], r_t3_f3_13[11], r_t3_f3_13[11], r_t3_f3_13}; 		// 14 + 12 = 15 bits
		assign s_f3_t4_t5 = 	{r_t4_f3_4neg[10], r_t4_f3_4neg} + {r_t5_f3_1[7], r_t5_f3_1[7], r_t5_f3_1[7], r_t5_f3_1[7], r_t5_f3_1}; 		// 11 + 8 = 12 bits
		assign s_f4_t0_t1 = 	{r_t0_f4_3[9], r_t0_f4_3[9], r_t0_f4_3[9], r_t0_f4_3} + {r_t1_f4_10neg[11], r_t1_f4_10neg}; 		// 10 + 12 = 13 bits
		assign s_f4_t2_t3 = 	{r_t2_f4_58[13], r_t2_f4_58} + {r_t3_f4_17[12], r_t3_f4_17[12], r_t3_f4_17}; 		// 14 + 13 = 15 bits
		assign s_f4_t4_t5 = 	{r_t4_f4_5neg[10], r_t4_f4_5neg} + {r_t5_f4_1[7], r_t5_f4_1[7], r_t5_f4_1[7], r_t5_f4_1[7], r_t5_f4_1}; 		// 11 + 8 = 12 bits
		assign s_f5_t0_t1 = 	{r_t0_f5_3[9], r_t0_f5_3[9], r_t0_f5_3[9], r_t0_f5_3} + {r_t1_f5_11neg[11], r_t1_f5_11neg}; 		// 10 + 12 = 13 bits
		assign s_f5_t2_t3 = 	{r_t2_f5_52[13], r_t2_f5_52} + {r_t3_f5_26[12], r_t3_f5_26[12], r_t3_f5_26}; 		// 14 + 13 = 15 bits
		assign s_f5_t4_t5 = 	{r_t4_f5_8neg[11], r_t4_f5_8neg} + {r_t5_f5_2[8], r_t5_f5_2[8], r_t5_f5_2[8], r_t5_f5_2[8], r_t5_f5_2}; 		// 12 + 9 = 13 bits
		assign s_f6_t0_t1 = 	{r_t0_f6_2[8], r_t0_f6_2[8], r_t0_f6_2[8], r_t0_f6_2[8], r_t0_f6_2} + {r_t1_f6_9neg[11], r_t1_f6_9neg}; 		// 9 + 12 = 13 bits
		assign s_f6_t2_t3 = 	{r_t2_f6_47[13], r_t2_f6_47} + {r_t3_f6_31[12], r_t3_f6_31[12], r_t3_f6_31}; 		// 14 + 13 = 15 bits
		assign s_f6_t4_t5 = 	{r_t4_f6_10neg[11], r_t4_f6_10neg} + {r_t5_f6_3[9], r_t5_f6_3[9], r_t5_f6_3[9], r_t5_f6_3}; 		// 12 + 10 = 13 bits
		assign s_f7_t0_t1 = 	{r_t0_f7_3[9], r_t0_f7_3[9], r_t0_f7_3[9], r_t0_f7_3} + {r_t1_f7_11neg[11], r_t1_f7_11neg}; 		// 10 + 12 = 13 bits
		assign s_f7_t2_t3 = 	{r_t2_f7_45[13], r_t2_f7_45} + {r_t3_f7_34[13], r_t3_f7_34}; 		// 14 + 14 = 15 bits
		assign s_f7_t4_t5 = 	{r_t4_f7_10neg[11], r_t4_f7_10neg} + {r_t5_f7_3[9], r_t5_f7_3[9], r_t5_f7_3[9], r_t5_f7_3}; 		// 12 + 10 = 13 bits
		assign s_f8_t0_t1 = 	{r_t0_f8_3[9], r_t0_f8_3[9], r_t0_f8_3[9], r_t0_f8_3} + {r_t1_f8_11neg[11], r_t1_f8_11neg}; 		// 10 + 12 = 13 bits
		assign s_f8_t2_t3 = 	{r_t2_f8_40[13], r_t2_f8_40} + {r_t3_f8_40[13], r_t3_f8_40}; 		// 14 + 14 = 15 bits
		assign s_f8_t4_t5 = 	{r_t4_f8_11neg[11], r_t4_f8_11neg} + {r_t5_f8_3[9], r_t5_f8_3[9], r_t5_f8_3[9], r_t5_f8_3}; 		// 12 + 10 = 13 bits
		assign s_f9_t0_t1 = 	{r_t0_f9_3[9], r_t0_f9_3[9], r_t0_f9_3[9], r_t0_f9_3} + {r_t1_f9_10neg[11], r_t1_f9_10neg}; 		// 10 + 12 = 13 bits
		assign s_f9_t2_t3 = 	{r_t2_f9_34[13], r_t2_f9_34} + {r_t3_f9_45[13], r_t3_f9_45}; 		// 14 + 14 = 15 bits
		assign s_f9_t4_t5 = 	{r_t4_f9_11neg[11], r_t4_f9_11neg} + {r_t5_f9_3[9], r_t5_f9_3[9], r_t5_f9_3[9], r_t5_f9_3}; 		// 12 + 10 = 13 bits
		assign s_f10_t0_t1 = 	{r_t0_f10_3[9], r_t0_f10_3[9], r_t0_f10_3[9], r_t0_f10_3} + {r_t1_f10_10neg[11], r_t1_f10_10neg}; 		// 10 + 12 = 13 bits
		assign s_f10_t2_t3 = 	{r_t2_f10_31[12], r_t2_f10_31[12], r_t2_f10_31} + {r_t3_f10_47[13], r_t3_f10_47}; 		// 13 + 14 = 15 bits
		assign s_f10_t4_t5 = 	{r_t4_f10_9neg[11], r_t4_f10_9neg} + {r_t5_f10_2[8], r_t5_f10_2[8], r_t5_f10_2[8], r_t5_f10_2[8], r_t5_f10_2}; 		// 12 + 9 = 13 bits
		assign s_f11_t0_t1 = 	{r_t0_f11_2[8], r_t0_f11_2[8], r_t0_f11_2[8], r_t0_f11_2[8], r_t0_f11_2} + {r_t1_f11_8neg[11], r_t1_f11_8neg}; 		// 9 + 12 = 13 bits
		assign s_f11_t2_t3 = 	{r_t2_f11_26[12], r_t2_f11_26[12], r_t2_f11_26} + {r_t3_f11_52[13], r_t3_f11_52}; 		// 13 + 14 = 15 bits
		assign s_f11_t4_t5 = 	{r_t4_f11_11neg[11], r_t4_f11_11neg} + {r_t5_f11_3[9], r_t5_f11_3[9], r_t5_f11_3[9], r_t5_f11_3}; 		// 12 + 10 = 13 bits
		assign s_f12_t0_t1 = 	{r_t0_f12_1[7], r_t0_f12_1[7], r_t0_f12_1[7], r_t0_f12_1[7], r_t0_f12_1} + {r_t1_f12_5neg[10], r_t1_f12_5neg}; 		// 8 + 11 = 12 bits
		assign s_f12_t2_t3 = 	{r_t2_f12_17[12], r_t2_f12_17[12], r_t2_f12_17} + {r_t3_f12_58[13], r_t3_f12_58}; 		// 13 + 14 = 15 bits
		assign s_f12_t4_t5 = 	{r_t4_f12_10neg[11], r_t4_f12_10neg} + {r_t5_f12_3[9], r_t5_f12_3[9], r_t5_f12_3[9], r_t5_f12_3}; 		// 12 + 10 = 13 bits
		assign s_f13_t0_t1 = 	{r_t0_f13_1[7], r_t0_f13_1[7], r_t0_f13_1[7], r_t0_f13_1[7], r_t0_f13_1} + {r_t1_f13_4neg[10], r_t1_f13_4neg}; 		// 8 + 11 = 12 bits
		assign s_f13_t2_t3 = 	{r_t2_f13_13[11], r_t2_f13_13[11], r_t2_f13_13[11], r_t2_f13_13} + {r_t3_f13_60[13], r_t3_f13_60}; 		// 12 + 14 = 15 bits
		assign s_f13_t4_t5 = 	{r_t4_f13_8neg[11], r_t4_f13_8neg} + {r_t5_f13_2[8], r_t5_f13_2[8], r_t5_f13_2[8], r_t5_f13_2[8], r_t5_f13_2}; 		// 12 + 9 = 13 bits
		assign s_f14_t0_t1 = 	{r_t0_f14_1[7], r_t0_f14_1[7], r_t0_f14_1[7], r_t0_f14_1} + {r_t1_f14_3neg[9], r_t1_f14_3neg}; 		// 8 + 10 = 11 bits
		assign s_f14_t2_t3 = 	{r_t2_f14_8[10], r_t2_f14_8[10], r_t2_f14_8[10], r_t2_f14_8[10], r_t2_f14_8} + {r_t3_f14_62[13], r_t3_f14_62}; 		// 11 + 14 = 15 bits
		assign s_f14_t4_t5 = 	{r_t4_f14_5neg[10], r_t4_f14_5neg} + {r_t5_f14_1[7], r_t5_f14_1[7], r_t5_f14_1[7], r_t5_f14_1[7], r_t5_f14_1}; 		// 11 + 8 = 12 bits
		assign s_f15_t0_t1 = 	{r_t0_f15_1[7], r_t0_f15_1[7], r_t0_f15_1[7], r_t0_f15_1} + {r_t1_f15_2neg[9], r_t1_f15_2neg}; 		// 8 + 10 = 11 bits
		assign s_f15_t2_t3 = 	{r_t2_f15_4[9], r_t2_f15_4[9], r_t2_f15_4[9], r_t2_f15_4[9], r_t2_f15_4[9], r_t2_f15_4} + {r_t3_f15_63[13], r_t3_f15_63}; 		// 10 + 14 = 15 bits
		assign s_f15_t4_t5 = 	{r_t4_f15_3neg[9], r_t4_f15_3neg} + {r_t5_f15_1[7], r_t5_f15_1[7], r_t5_f15_1[7], r_t5_f15_1}; 		// 10 + 8 = 11 bits
		
		// Second sums
		assign s_f1_0 = 	{s_f1_t0_t1[10],  s_f1_t0_t1[10],  s_f1_t0_t1[10],  s_f1_t0_t1[10],  s_f1_t0_t1[10],  s_f1_t0_t1} + {s_f1_t2_t3[14], s_f1_t2_t3}; 		// 11 + 15 = 16 bits
		assign s_f1_1 = 	{s_f1_t4_t5[10],  s_f1_t4_t5[10],  s_f1_t4_t5[10],  s_f1_t4_t5[10],  s_f1_t4_t5[10],  s_f1_t4_t5[10],  s_f1_t4_t5} + {s_f1_0[15], s_f1_0}; 		// 11 + 16 = 17 bits
		assign s_f2_0 = 	{s_f2_t0_t1[11],  s_f2_t0_t1[11],  s_f2_t0_t1[11],  s_f2_t0_t1[11],  s_f2_t0_t1} + {s_f2_t2_t3[14], s_f2_t2_t3}; 		// 12 + 15 = 16 bits
		assign s_f2_1 = 	{s_f2_t4_t5[10],  s_f2_t4_t5[10],  s_f2_t4_t5[10],  s_f2_t4_t5[10],  s_f2_t4_t5[10],  s_f2_t4_t5[10],  s_f2_t4_t5} + {s_f2_0[15], s_f2_0}; 		// 11 + 16 = 17 bits
		assign s_f3_0 = 	{s_f3_t0_t1[12],  s_f3_t0_t1[12],  s_f3_t0_t1[12],  s_f3_t0_t1} + {s_f3_t2_t3[14], s_f3_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f3_1 = 	{s_f3_t4_t5[11],  s_f3_t4_t5[11],  s_f3_t4_t5[11],  s_f3_t4_t5[11],  s_f3_t4_t5[11],  s_f3_t4_t5} + {s_f3_0[15], s_f3_0}; 		// 12 + 16 = 17 bits
		assign s_f4_0 = 	{s_f4_t0_t1[12],  s_f4_t0_t1[12],  s_f4_t0_t1[12],  s_f4_t0_t1} + {s_f4_t2_t3[14], s_f4_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f4_1 = 	{s_f4_t4_t5[11],  s_f4_t4_t5[11],  s_f4_t4_t5[11],  s_f4_t4_t5[11],  s_f4_t4_t5[11],  s_f4_t4_t5} + {s_f4_0[15], s_f4_0}; 		// 12 + 16 = 17 bits
		assign s_f5_0 = 	{s_f5_t0_t1[12],  s_f5_t0_t1[12],  s_f5_t0_t1[12],  s_f5_t0_t1} + {s_f5_t2_t3[14], s_f5_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f5_1 = 	{s_f5_t4_t5[12],  s_f5_t4_t5[12],  s_f5_t4_t5[12],  s_f5_t4_t5[12],  s_f5_t4_t5} + {s_f5_0[15], s_f5_0}; 		// 13 + 16 = 17 bits
		assign s_f6_0 = 	{s_f6_t0_t1[12],  s_f6_t0_t1[12],  s_f6_t0_t1[12],  s_f6_t0_t1} + {s_f6_t2_t3[14], s_f6_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f6_1 = 	{s_f6_t4_t5[12],  s_f6_t4_t5[12],  s_f6_t4_t5[12],  s_f6_t4_t5[12],  s_f6_t4_t5} + {s_f6_0[15], s_f6_0}; 		// 13 + 16 = 17 bits
		assign s_f7_0 = 	{s_f7_t0_t1[12],  s_f7_t0_t1[12],  s_f7_t0_t1[12],  s_f7_t0_t1} + {s_f7_t2_t3[14], s_f7_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f7_1 = 	{s_f7_t4_t5[12],  s_f7_t4_t5[12],  s_f7_t4_t5[12],  s_f7_t4_t5[12],  s_f7_t4_t5} + {s_f7_0[15], s_f7_0}; 		// 13 + 16 = 17 bits
		assign s_f8_0 = 	{s_f8_t0_t1[12],  s_f8_t0_t1[12],  s_f8_t0_t1[12],  s_f8_t0_t1} + {s_f8_t2_t3[14], s_f8_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f8_1 = 	{s_f8_t4_t5[12],  s_f8_t4_t5[12],  s_f8_t4_t5[12],  s_f8_t4_t5[12],  s_f8_t4_t5} + {s_f8_0[15], s_f8_0}; 		// 13 + 16 = 17 bits
		assign s_f9_0 = 	{s_f9_t0_t1[12],  s_f9_t0_t1[12],  s_f9_t0_t1[12],  s_f9_t0_t1} + {s_f9_t2_t3[14], s_f9_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f9_1 = 	{s_f9_t4_t5[12],  s_f9_t4_t5[12],  s_f9_t4_t5[12],  s_f9_t4_t5[12],  s_f9_t4_t5} + {s_f9_0[15], s_f9_0}; 		// 13 + 16 = 17 bits
		assign s_f10_0 = 	{s_f10_t0_t1[12],  s_f10_t0_t1[12],  s_f10_t0_t1[12],  s_f10_t0_t1} + {s_f10_t2_t3[14], s_f10_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f10_1 = 	{s_f10_t4_t5[12],  s_f10_t4_t5[12],  s_f10_t4_t5[12],  s_f10_t4_t5[12],  s_f10_t4_t5} + {s_f10_0[15], s_f10_0}; 		// 13 + 16 = 17 bits
		assign s_f11_0 = 	{s_f11_t0_t1[12],  s_f11_t0_t1[12],  s_f11_t0_t1[12],  s_f11_t0_t1} + {s_f11_t2_t3[14], s_f11_t2_t3}; 		// 13 + 15 = 16 bits
		assign s_f11_1 = 	{s_f11_t4_t5[12],  s_f11_t4_t5[12],  s_f11_t4_t5[12],  s_f11_t4_t5[12],  s_f11_t4_t5} + {s_f11_0[15], s_f11_0}; 		// 13 + 16 = 17 bits
		assign s_f12_0 = 	{s_f12_t0_t1[11],  s_f12_t0_t1[11],  s_f12_t0_t1[11],  s_f12_t0_t1[11],  s_f12_t0_t1} + {s_f12_t2_t3[14], s_f12_t2_t3}; 		// 12 + 15 = 16 bits
		assign s_f12_1 = 	{s_f12_t4_t5[12],  s_f12_t4_t5[12],  s_f12_t4_t5[12],  s_f12_t4_t5[12],  s_f12_t4_t5} + {s_f12_0[15], s_f12_0}; 		// 13 + 16 = 17 bits
		assign s_f13_0 = 	{s_f13_t0_t1[11],  s_f13_t0_t1[11],  s_f13_t0_t1[11],  s_f13_t0_t1[11],  s_f13_t0_t1} + {s_f13_t2_t3[14], s_f13_t2_t3}; 		// 12 + 15 = 16 bits
		assign s_f13_1 = 	{s_f13_t4_t5[12],  s_f13_t4_t5[12],  s_f13_t4_t5[12],  s_f13_t4_t5[12],  s_f13_t4_t5} + {s_f13_0[15], s_f13_0}; 		// 13 + 16 = 17 bits
		assign s_f14_0 = 	{s_f14_t0_t1[10],  s_f14_t0_t1[10],  s_f14_t0_t1[10],  s_f14_t0_t1[10],  s_f14_t0_t1[10],  s_f14_t0_t1} + {s_f14_t2_t3[14], s_f14_t2_t3}; 		// 11 + 15 = 16 bits
		assign s_f14_1 = 	{s_f14_t4_t5[11],  s_f14_t4_t5[11],  s_f14_t4_t5[11],  s_f14_t4_t5[11],  s_f14_t4_t5[11],  s_f14_t4_t5} + {s_f14_0[15], s_f14_0}; 		// 12 + 16 = 17 bits
		assign s_f15_0 = 	{s_f15_t0_t1[10],  s_f15_t0_t1[10],  s_f15_t0_t1[10],  s_f15_t0_t1[10],  s_f15_t0_t1[10],  s_f15_t0_t1} + {s_f15_t2_t3[14], s_f15_t2_t3}; 		// 11 + 15 = 16 bits
		assign s_f15_1 = 	{s_f15_t4_t5[10],  s_f15_t4_t5[10],  s_f15_t4_t5[10],  s_f15_t4_t5[10],  s_f15_t4_t5[10],  s_f15_t4_t5[10],  s_f15_t4_t5} + {s_f15_0[15], s_f15_0}; 		// 11 + 16 = 17 bits

		// Shifting for division by 64
		assign s_f1_shr = s_f1_1 >> 6;
		assign s_f2_shr = s_f2_1 >> 6;
		assign s_f3_shr = s_f3_1 >> 6;
		assign s_f4_shr = s_f4_1 >> 6;
		assign s_f5_shr = s_f5_1 >> 6;
		assign s_f6_shr = s_f6_1 >> 6;
		assign s_f7_shr = s_f7_1 >> 6;
		assign s_f8_shr = s_f8_1 >> 6;
		assign s_f9_shr = s_f9_1 >> 6;
		assign s_f10_shr = s_f10_1 >> 6;
		assign s_f11_shr = s_f11_1 >> 6;
		assign s_f12_shr = s_f12_1 >> 6;
		assign s_f13_shr = s_f13_1 >> 6;
		assign s_f14_shr = s_f14_1 >> 6;
		assign s_f15_shr = s_f15_1 >> 6;

// ------------------------------------------
// Outputs
// ------------------------------------------

	assign Y1 = s_f1_shr;	// 11 bits
	assign Y2 = s_f2_shr;	// 11 bits
	assign Y3 = s_f3_shr;	// 11 bits
	assign Y4 = s_f4_shr;	// 11 bits
	assign Y5 = s_f5_shr;	// 11 bits
	assign Y6 = s_f6_shr;	// 11 bits
	assign Y7 = s_f7_shr;	// 11 bits
	assign Y8 = s_f8_shr;	// 11 bits
	assign Y9 = s_f9_shr;	// 11 bits
	assign Y10 = s_f10_shr;	// 11 bits
	assign Y11 = s_f11_shr;	// 11 bits
	assign Y12 = s_f12_shr;	// 11 bits
	assign Y13 = s_f13_shr;	// 11 bits
	assign Y14 = s_f14_shr;	// 11 bits
	assign Y15 = s_f15_shr;	// 11 bits


endmodule // all_filters_8


