/*------------------------------------------------------------------------------
 * File: all_filters_11.v
 * Date generated: 05/12/2022
 * Date modified: 08/05/2023
 * Author: Bruna Suemi Nagai
 * Description: Concatenating all 15 filters in a sum tree
 *------------------------------------------------------------------------------ */

module all_filters_11 (
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

	input signed [65:0] X;
	output signed [13:0] Y1;
	output signed [13:0] Y2;
	output signed [13:0] Y3;
	output signed [13:0] Y4;
	output signed [13:0] Y5;
	output signed [13:0] Y6;
	output signed [13:0] Y7;
	output signed [13:0] Y8;
	output signed [13:0] Y9;
	output signed [13:0] Y10;
	output signed [13:0] Y11;
	output signed [13:0] Y12;
	output signed [13:0] Y13;
	output signed [13:0] Y14;
	output signed [13:0] Y15;

// ------------------------------------------
// Wires declarations
// ------------------------------------------
	
	// Spliting the input into parts of 11 bits each
	wire signed [10:0] X0, X1, X2, X3, X4, X5;
	
	// Regs for filter's outputs 
	
	// TAP 0
	wire signed [10:0]	r_t0_f1_1;
	wire signed [10:0]	r_t0_f2_1;
	wire signed [11:0]	r_t0_f3_2;
	wire signed [12:0]	r_t0_f4_3;
	wire signed [12:0]	r_t0_f5_3;
	wire signed [11:0]	r_t0_f6_2;
	wire signed [12:0]	r_t0_f7_3;
	wire signed [12:0]	r_t0_f8_3;
	wire signed [12:0]	r_t0_f9_3;
	wire signed [12:0]	r_t0_f10_3;
	wire signed [11:0]	r_t0_f11_2;
	wire signed [10:0]	r_t0_f12_1;
	wire signed [10:0]	r_t0_f13_1;
	wire signed [10:0]	r_t0_f14_1;
	wire signed [10:0]	r_t0_f15_1;

	// TAP 1
	wire signed [12:0]	r_t1_f1_3neg;
	wire signed [13:0]	r_t1_f2_5neg;
	wire signed [14:0]	r_t1_f3_8neg;
	wire signed [14:0]	r_t1_f4_10neg;
	wire signed [14:0]	r_t1_f5_11neg;
	wire signed [14:0]	r_t1_f6_9neg;
	wire signed [14:0]	r_t1_f7_11neg;
	wire signed [14:0]	r_t1_f8_11neg;
	wire signed [14:0]	r_t1_f9_10neg;
	wire signed [14:0]	r_t1_f10_10neg;
	wire signed [14:0]	r_t1_f11_8neg;
	wire signed [13:0]	r_t1_f12_5neg;
	wire signed [13:0]	r_t1_f13_4neg;
	wire signed [12:0]	r_t1_f14_3neg;
	wire signed [12:0]	r_t1_f15_2neg;

	// TAP 2
	wire signed [16:0]	r_t2_f1_63;
	wire signed [16:0]	r_t2_f2_62;
	wire signed [16:0]	r_t2_f3_60;
	wire signed [16:0]	r_t2_f4_58;
	wire signed [16:0]	r_t2_f5_52;
	wire signed [16:0]	r_t2_f6_47;
	wire signed [16:0]	r_t2_f7_45;
	wire signed [16:0]	r_t2_f8_40;
	wire signed [16:0]	r_t2_f9_34;
	wire signed [15:0]	r_t2_f10_31;
	wire signed [15:0]	r_t2_f11_26;
	wire signed [15:0]	r_t2_f12_17;
	wire signed [14:0]	r_t2_f13_13;
	wire signed [13:0]	r_t2_f14_8;
	wire signed [12:0]	r_t2_f15_4;

	// TAP 3
	wire signed [12:0]	r_t3_f1_4;
	wire signed [13:0]	r_t3_f2_8;
	wire signed [14:0]	r_t3_f3_13;
	wire signed [15:0]	r_t3_f4_17;
	wire signed [15:0]	r_t3_f5_26;
	wire signed [15:0]	r_t3_f6_31;
	wire signed [16:0]	r_t3_f7_34;
	wire signed [16:0]	r_t3_f8_40;
	wire signed [16:0]	r_t3_f9_45;
	wire signed [16:0]	r_t3_f10_47;
	wire signed [16:0]	r_t3_f11_52;
	wire signed [16:0]	r_t3_f12_58;
	wire signed [16:0]	r_t3_f13_60;
	wire signed [16:0]	r_t3_f14_62;
	wire signed [16:0]	r_t3_f15_63;

	// TAP 4
	wire signed [12:0]	r_t4_f1_2neg;
	wire signed [12:0]	r_t4_f2_3neg;
	wire signed [13:0]	r_t4_f3_4neg;
	wire signed [13:0]	r_t4_f4_5neg;
	wire signed [14:0]	r_t4_f5_8neg;
	wire signed [14:0]	r_t4_f6_10neg;
	wire signed [14:0]	r_t4_f7_10neg;
	wire signed [14:0]	r_t4_f8_11neg;
	wire signed [14:0]	r_t4_f9_11neg;
	wire signed [14:0]	r_t4_f10_9neg;
	wire signed [14:0]	r_t4_f11_11neg;
	wire signed [14:0]	r_t4_f12_10neg;
	wire signed [14:0]	r_t4_f13_8neg;
	wire signed [13:0]	r_t4_f14_5neg;
	wire signed [12:0]	r_t4_f15_3neg;

	// TAP 5
	wire signed [10:0]	r_t5_f1_1;
	wire signed [10:0]	r_t5_f2_1;
	wire signed [10:0]	r_t5_f3_1;
	wire signed [10:0]	r_t5_f4_1;
	wire signed [11:0]	r_t5_f5_2;
	wire signed [12:0]	r_t5_f6_3;
	wire signed [12:0]	r_t5_f7_3;
	wire signed [12:0]	r_t5_f8_3;
	wire signed [12:0]	r_t5_f9_3;
	wire signed [11:0]	r_t5_f10_2;
	wire signed [12:0]	r_t5_f11_3;
	wire signed [12:0]	r_t5_f12_3;
	wire signed [11:0]	r_t5_f13_2;
	wire signed [10:0]	r_t5_f14_1;
	wire signed [10:0]	r_t5_f15_1;
	
	// First sums
	wire signed [13:0]	s_f1_t0_t1;	// 14 bits
	wire signed [17:0]	s_f1_t2_t3;	// 18 bits
	wire signed [13:0]	s_f1_t4_t5;	// 14 bits
	wire signed [14:0]	s_f2_t0_t1;	// 15 bits
	wire signed [17:0]	s_f2_t2_t3;	// 18 bits
	wire signed [13:0]	s_f2_t4_t5;	// 14 bits
	wire signed [15:0]	s_f3_t0_t1;	// 16 bits
	wire signed [17:0]	s_f3_t2_t3;	// 18 bits
	wire signed [14:0]	s_f3_t4_t5;	// 15 bits
	wire signed [15:0]	s_f4_t0_t1;	// 16 bits
	wire signed [17:0]	s_f4_t2_t3;	// 18 bits
	wire signed [14:0]	s_f4_t4_t5;	// 15 bits
	wire signed [15:0]	s_f5_t0_t1;	// 16 bits
	wire signed [17:0]	s_f5_t2_t3;	// 18 bits
	wire signed [15:0]	s_f5_t4_t5;	// 16 bits
	wire signed [15:0]	s_f6_t0_t1;	// 16 bits
	wire signed [17:0]	s_f6_t2_t3;	// 18 bits
	wire signed [15:0]	s_f6_t4_t5;	// 16 bits
	wire signed [15:0]	s_f7_t0_t1;	// 16 bits
	wire signed [17:0]	s_f7_t2_t3;	// 18 bits
	wire signed [15:0]	s_f7_t4_t5;	// 16 bits
	wire signed [15:0]	s_f8_t0_t1;	// 16 bits
	wire signed [17:0]	s_f8_t2_t3;	// 18 bits
	wire signed [15:0]	s_f8_t4_t5;	// 16 bits
	wire signed [15:0]	s_f9_t0_t1;	// 16 bits
	wire signed [17:0]	s_f9_t2_t3;	// 18 bits
	wire signed [15:0]	s_f9_t4_t5;	// 16 bits
	wire signed [15:0]	s_f10_t0_t1;	// 16 bits
	wire signed [17:0]	s_f10_t2_t3;	// 18 bits
	wire signed [15:0]	s_f10_t4_t5;	// 16 bits
	wire signed [15:0]	s_f11_t0_t1;	// 16 bits
	wire signed [17:0]	s_f11_t2_t3;	// 18 bits
	wire signed [15:0]	s_f11_t4_t5;	// 16 bits
	wire signed [14:0]	s_f12_t0_t1;	// 15 bits
	wire signed [17:0]	s_f12_t2_t3;	// 18 bits
	wire signed [15:0]	s_f12_t4_t5;	// 16 bits
	wire signed [14:0]	s_f13_t0_t1;	// 15 bits
	wire signed [17:0]	s_f13_t2_t3;	// 18 bits
	wire signed [15:0]	s_f13_t4_t5;	// 16 bits
	wire signed [13:0]	s_f14_t0_t1;	// 14 bits
	wire signed [17:0]	s_f14_t2_t3;	// 18 bits
	wire signed [14:0]	s_f14_t4_t5;	// 15 bits
	wire signed [13:0]	s_f15_t0_t1;	// 14 bits
	wire signed [17:0]	s_f15_t2_t3;	// 18 bits
	wire signed [13:0]	s_f15_t4_t5;	// 14 bits
		
	// Second sums
	wire signed [18:0]	s_f1_0;	// 19 bits
	wire signed [19:0]	s_f1_1;	// 20 bits
	wire signed [18:0]	s_f2_0;	// 19 bits
	wire signed [19:0]	s_f2_1;	// 20 bits
	wire signed [18:0]	s_f3_0;	// 19 bits
	wire signed [19:0]	s_f3_1;	// 20 bits
	wire signed [18:0]	s_f4_0;	// 19 bits
	wire signed [19:0]	s_f4_1;	// 20 bits
	wire signed [18:0]	s_f5_0;	// 19 bits
	wire signed [19:0]	s_f5_1;	// 20 bits
	wire signed [18:0]	s_f6_0;	// 19 bits
	wire signed [19:0]	s_f6_1;	// 20 bits
	wire signed [18:0]	s_f7_0;	// 19 bits
	wire signed [19:0]	s_f7_1;	// 20 bits
	wire signed [18:0]	s_f8_0;	// 19 bits
	wire signed [19:0]	s_f8_1;	// 20 bits
	wire signed [18:0]	s_f9_0;	// 19 bits
	wire signed [19:0]	s_f9_1;	// 20 bits
	wire signed [18:0]	s_f10_0;	// 19 bits
	wire signed [19:0]	s_f10_1;	// 20 bits
	wire signed [18:0]	s_f11_0;	// 19 bits
	wire signed [19:0]	s_f11_1;	// 20 bits
	wire signed [18:0]	s_f12_0;	// 19 bits
	wire signed [19:0]	s_f12_1;	// 20 bits
	wire signed [18:0]	s_f13_0;	// 19 bits
	wire signed [19:0]	s_f13_1;	// 20 bits
	wire signed [18:0]	s_f14_0;	// 19 bits
	wire signed [19:0]	s_f14_1;	// 20 bits
	wire signed [18:0]	s_f15_0;	// 19 bits
	wire signed [19:0]	s_f15_1;	// 20 bits
	
	// Final sums shifted right
	wire signed [13:0]	s_f1_shr;	 // 14 bits
	wire signed [13:0]	s_f2_shr;	 // 14 bits
	wire signed [13:0]	s_f3_shr;	 // 14 bits
	wire signed [13:0]	s_f4_shr;	 // 14 bits
	wire signed [13:0]	s_f5_shr;	 // 14 bits
	wire signed [13:0]	s_f6_shr;	 // 14 bits
	wire signed [13:0]	s_f7_shr;	 // 14 bits
	wire signed [13:0]	s_f8_shr;	 // 14 bits
	wire signed [13:0]	s_f9_shr;	 // 14 bits
	wire signed [13:0]	s_f10_shr;	 // 14 bits
	wire signed [13:0]	s_f11_shr;	 // 14 bits
	wire signed [13:0]	s_f12_shr;	 // 14 bits
	wire signed [13:0]	s_f13_shr;	 // 14 bits
	wire signed [13:0]	s_f14_shr;	 // 14 bits
	wire signed [13:0]	s_f15_shr;	 // 14 bits
 
	 
// ------------------------------------------
// Modules instantiation
// ------------------------------------------

	 t0_affine_11 T0(
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


	 t1_affine_11 T1(
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


	 t2_affine_11 T2(
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


	 t3_affine_11 T3(
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


	 t4_affine_11 T4(
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


	 t5_affine_11 T5(
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
	assign X0 = X[10:0];
	assign X1 = X[21:11];
	assign X2 = X[32:22];
	assign X3 = X[43:33];
	assign X4 = X[54:44];
	assign X5 = X[65:55];
  
	// Procedure for sums	
		// First sums
		assign s_f1_t0_t1 = 	{r_t0_f1_1[10], r_t0_f1_1[10], r_t0_f1_1[10], r_t0_f1_1} + {r_t1_f1_3neg[12], r_t1_f1_3neg}; 		// 11 + 13 = 14 bits
		assign s_f1_t2_t3 = 	{r_t2_f1_63[16], r_t2_f1_63} + {r_t3_f1_4[12], r_t3_f1_4[12], r_t3_f1_4[12], r_t3_f1_4[12], r_t3_f1_4[12], r_t3_f1_4}; 		// 17 + 13 = 18 bits
		assign s_f1_t4_t5 = 	{r_t4_f1_2neg[12], r_t4_f1_2neg} + {r_t5_f1_1[10], r_t5_f1_1[10], r_t5_f1_1[10], r_t5_f1_1}; 		// 13 + 11 = 14 bits
		assign s_f2_t0_t1 = 	{r_t0_f2_1[10], r_t0_f2_1[10], r_t0_f2_1[10], r_t0_f2_1[10], r_t0_f2_1} + {r_t1_f2_5neg[13], r_t1_f2_5neg}; 		// 11 + 14 = 15 bits
		assign s_f2_t2_t3 = 	{r_t2_f2_62[16], r_t2_f2_62} + {r_t3_f2_8[13], r_t3_f2_8[13], r_t3_f2_8[13], r_t3_f2_8[13], r_t3_f2_8}; 		// 17 + 14 = 18 bits
		assign s_f2_t4_t5 = 	{r_t4_f2_3neg[12], r_t4_f2_3neg} + {r_t5_f2_1[10], r_t5_f2_1[10], r_t5_f2_1[10], r_t5_f2_1}; 		// 13 + 11 = 14 bits
		assign s_f3_t0_t1 = 	{r_t0_f3_2[11], r_t0_f3_2[11], r_t0_f3_2[11], r_t0_f3_2[11], r_t0_f3_2} + {r_t1_f3_8neg[14], r_t1_f3_8neg}; 		// 12 + 15 = 16 bits
		assign s_f3_t2_t3 = 	{r_t2_f3_60[16], r_t2_f3_60} + {r_t3_f3_13[14], r_t3_f3_13[14], r_t3_f3_13[14], r_t3_f3_13}; 		// 17 + 15 = 18 bits
		assign s_f3_t4_t5 = 	{r_t4_f3_4neg[13], r_t4_f3_4neg} + {r_t5_f3_1[10], r_t5_f3_1[10], r_t5_f3_1[10], r_t5_f3_1[10], r_t5_f3_1}; 		// 14 + 11 = 15 bits
		assign s_f4_t0_t1 = 	{r_t0_f4_3[12], r_t0_f4_3[12], r_t0_f4_3[12], r_t0_f4_3} + {r_t1_f4_10neg[14], r_t1_f4_10neg}; 		// 13 + 15 = 16 bits
		assign s_f4_t2_t3 = 	{r_t2_f4_58[16], r_t2_f4_58} + {r_t3_f4_17[15], r_t3_f4_17[15], r_t3_f4_17}; 		// 17 + 16 = 18 bits
		assign s_f4_t4_t5 = 	{r_t4_f4_5neg[13], r_t4_f4_5neg} + {r_t5_f4_1[10], r_t5_f4_1[10], r_t5_f4_1[10], r_t5_f4_1[10], r_t5_f4_1}; 		// 14 + 11 = 15 bits
		assign s_f5_t0_t1 = 	{r_t0_f5_3[12], r_t0_f5_3[12], r_t0_f5_3[12], r_t0_f5_3} + {r_t1_f5_11neg[14], r_t1_f5_11neg}; 		// 13 + 15 = 16 bits
		assign s_f5_t2_t3 = 	{r_t2_f5_52[16], r_t2_f5_52} + {r_t3_f5_26[15], r_t3_f5_26[15], r_t3_f5_26}; 		// 17 + 16 = 18 bits
		assign s_f5_t4_t5 = 	{r_t4_f5_8neg[14], r_t4_f5_8neg} + {r_t5_f5_2[11], r_t5_f5_2[11], r_t5_f5_2[11], r_t5_f5_2[11], r_t5_f5_2}; 		// 15 + 12 = 16 bits
		assign s_f6_t0_t1 = 	{r_t0_f6_2[11], r_t0_f6_2[11], r_t0_f6_2[11], r_t0_f6_2[11], r_t0_f6_2} + {r_t1_f6_9neg[14], r_t1_f6_9neg}; 		// 12 + 15 = 16 bits
		assign s_f6_t2_t3 = 	{r_t2_f6_47[16], r_t2_f6_47} + {r_t3_f6_31[15], r_t3_f6_31[15], r_t3_f6_31}; 		// 17 + 16 = 18 bits
		assign s_f6_t4_t5 = 	{r_t4_f6_10neg[14], r_t4_f6_10neg} + {r_t5_f6_3[12], r_t5_f6_3[12], r_t5_f6_3[12], r_t5_f6_3}; 		// 15 + 13 = 16 bits
		assign s_f7_t0_t1 = 	{r_t0_f7_3[12], r_t0_f7_3[12], r_t0_f7_3[12], r_t0_f7_3} + {r_t1_f7_11neg[14], r_t1_f7_11neg}; 		// 13 + 15 = 16 bits
		assign s_f7_t2_t3 = 	{r_t2_f7_45[16], r_t2_f7_45} + {r_t3_f7_34[16], r_t3_f7_34}; 		// 17 + 17 = 18 bits
		assign s_f7_t4_t5 = 	{r_t4_f7_10neg[14], r_t4_f7_10neg} + {r_t5_f7_3[12], r_t5_f7_3[12], r_t5_f7_3[12], r_t5_f7_3}; 		// 15 + 13 = 16 bits
		assign s_f8_t0_t1 = 	{r_t0_f8_3[12], r_t0_f8_3[12], r_t0_f8_3[12], r_t0_f8_3} + {r_t1_f8_11neg[14], r_t1_f8_11neg}; 		// 13 + 15 = 16 bits
		assign s_f8_t2_t3 = 	{r_t2_f8_40[16], r_t2_f8_40} + {r_t3_f8_40[16], r_t3_f8_40}; 		// 17 + 17 = 18 bits
		assign s_f8_t4_t5 = 	{r_t4_f8_11neg[14], r_t4_f8_11neg} + {r_t5_f8_3[12], r_t5_f8_3[12], r_t5_f8_3[12], r_t5_f8_3}; 		// 15 + 13 = 16 bits
		assign s_f9_t0_t1 = 	{r_t0_f9_3[12], r_t0_f9_3[12], r_t0_f9_3[12], r_t0_f9_3} + {r_t1_f9_10neg[14], r_t1_f9_10neg}; 		// 13 + 15 = 16 bits
		assign s_f9_t2_t3 = 	{r_t2_f9_34[16], r_t2_f9_34} + {r_t3_f9_45[16], r_t3_f9_45}; 		// 17 + 17 = 18 bits
		assign s_f9_t4_t5 = 	{r_t4_f9_11neg[14], r_t4_f9_11neg} + {r_t5_f9_3[12], r_t5_f9_3[12], r_t5_f9_3[12], r_t5_f9_3}; 		// 15 + 13 = 16 bits
		assign s_f10_t0_t1 = 	{r_t0_f10_3[12], r_t0_f10_3[12], r_t0_f10_3[12], r_t0_f10_3} + {r_t1_f10_10neg[14], r_t1_f10_10neg}; 		// 13 + 15 = 16 bits
		assign s_f10_t2_t3 = 	{r_t2_f10_31[15], r_t2_f10_31[15], r_t2_f10_31} + {r_t3_f10_47[16], r_t3_f10_47}; 		// 16 + 17 = 18 bits
		assign s_f10_t4_t5 = 	{r_t4_f10_9neg[14], r_t4_f10_9neg} + {r_t5_f10_2[11], r_t5_f10_2[11], r_t5_f10_2[11], r_t5_f10_2[11], r_t5_f10_2}; 		// 15 + 12 = 16 bits
		assign s_f11_t0_t1 = 	{r_t0_f11_2[11], r_t0_f11_2[11], r_t0_f11_2[11], r_t0_f11_2[11], r_t0_f11_2} + {r_t1_f11_8neg[14], r_t1_f11_8neg}; 		// 12 + 15 = 16 bits
		assign s_f11_t2_t3 = 	{r_t2_f11_26[15], r_t2_f11_26[15], r_t2_f11_26} + {r_t3_f11_52[16], r_t3_f11_52}; 		// 16 + 17 = 18 bits
		assign s_f11_t4_t5 = 	{r_t4_f11_11neg[14], r_t4_f11_11neg} + {r_t5_f11_3[12], r_t5_f11_3[12], r_t5_f11_3[12], r_t5_f11_3}; 		// 15 + 13 = 16 bits
		assign s_f12_t0_t1 = 	{r_t0_f12_1[10], r_t0_f12_1[10], r_t0_f12_1[10], r_t0_f12_1[10], r_t0_f12_1} + {r_t1_f12_5neg[13], r_t1_f12_5neg}; 		// 11 + 14 = 15 bits
		assign s_f12_t2_t3 = 	{r_t2_f12_17[15], r_t2_f12_17[15], r_t2_f12_17} + {r_t3_f12_58[16], r_t3_f12_58}; 		// 16 + 17 = 18 bits
		assign s_f12_t4_t5 = 	{r_t4_f12_10neg[14], r_t4_f12_10neg} + {r_t5_f12_3[12], r_t5_f12_3[12], r_t5_f12_3[12], r_t5_f12_3}; 		// 15 + 13 = 16 bits
		assign s_f13_t0_t1 = 	{r_t0_f13_1[10], r_t0_f13_1[10], r_t0_f13_1[10], r_t0_f13_1[10], r_t0_f13_1} + {r_t1_f13_4neg[13], r_t1_f13_4neg}; 		// 11 + 14 = 15 bits
		assign s_f13_t2_t3 = 	{r_t2_f13_13[14], r_t2_f13_13[14], r_t2_f13_13[14], r_t2_f13_13} + {r_t3_f13_60[16], r_t3_f13_60}; 		// 15 + 17 = 18 bits
		assign s_f13_t4_t5 = 	{r_t4_f13_8neg[14], r_t4_f13_8neg} + {r_t5_f13_2[11], r_t5_f13_2[11], r_t5_f13_2[11], r_t5_f13_2[11], r_t5_f13_2}; 		// 15 + 12 = 16 bits
		assign s_f14_t0_t1 = 	{r_t0_f14_1[10], r_t0_f14_1[10], r_t0_f14_1[10], r_t0_f14_1} + {r_t1_f14_3neg[12], r_t1_f14_3neg}; 		// 11 + 13 = 14 bits
		assign s_f14_t2_t3 = 	{r_t2_f14_8[13], r_t2_f14_8[13], r_t2_f14_8[13], r_t2_f14_8[13], r_t2_f14_8} + {r_t3_f14_62[16], r_t3_f14_62}; 		// 14 + 17 = 18 bits
		assign s_f14_t4_t5 = 	{r_t4_f14_5neg[13], r_t4_f14_5neg} + {r_t5_f14_1[10], r_t5_f14_1[10], r_t5_f14_1[10], r_t5_f14_1[10], r_t5_f14_1}; 		// 14 + 11 = 15 bits
		assign s_f15_t0_t1 = 	{r_t0_f15_1[10], r_t0_f15_1[10], r_t0_f15_1[10], r_t0_f15_1} + {r_t1_f15_2neg[12], r_t1_f15_2neg}; 		// 11 + 13 = 14 bits
		assign s_f15_t2_t3 = 	{r_t2_f15_4[12], r_t2_f15_4[12], r_t2_f15_4[12], r_t2_f15_4[12], r_t2_f15_4[12], r_t2_f15_4} + {r_t3_f15_63[16], r_t3_f15_63}; 		// 13 + 17 = 18 bits
		assign s_f15_t4_t5 = 	{r_t4_f15_3neg[12], r_t4_f15_3neg} + {r_t5_f15_1[10], r_t5_f15_1[10], r_t5_f15_1[10], r_t5_f15_1}; 		// 13 + 11 = 14 bits
		
		// Second sums
		assign s_f1_0 = 	{s_f1_t0_t1[13],  s_f1_t0_t1[13],  s_f1_t0_t1[13],  s_f1_t0_t1[13],  s_f1_t0_t1[13],  s_f1_t0_t1} + {s_f1_t2_t3[17], s_f1_t2_t3}; 		// 14 + 18 = 19 bits
		assign s_f1_1 = 	{s_f1_t4_t5[13],  s_f1_t4_t5[13],  s_f1_t4_t5[13],  s_f1_t4_t5[13],  s_f1_t4_t5[13],  s_f1_t4_t5[13],  s_f1_t4_t5} + {s_f1_0[18], s_f1_0}; 		// 14 + 19 = 20 bits
		assign s_f2_0 = 	{s_f2_t0_t1[14],  s_f2_t0_t1[14],  s_f2_t0_t1[14],  s_f2_t0_t1[14],  s_f2_t0_t1} + {s_f2_t2_t3[17], s_f2_t2_t3}; 		// 15 + 18 = 19 bits
		assign s_f2_1 = 	{s_f2_t4_t5[13],  s_f2_t4_t5[13],  s_f2_t4_t5[13],  s_f2_t4_t5[13],  s_f2_t4_t5[13],  s_f2_t4_t5[13],  s_f2_t4_t5} + {s_f2_0[18], s_f2_0}; 		// 14 + 19 = 20 bits
		assign s_f3_0 = 	{s_f3_t0_t1[15],  s_f3_t0_t1[15],  s_f3_t0_t1[15],  s_f3_t0_t1} + {s_f3_t2_t3[17], s_f3_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f3_1 = 	{s_f3_t4_t5[14],  s_f3_t4_t5[14],  s_f3_t4_t5[14],  s_f3_t4_t5[14],  s_f3_t4_t5[14],  s_f3_t4_t5} + {s_f3_0[18], s_f3_0}; 		// 15 + 19 = 20 bits
		assign s_f4_0 = 	{s_f4_t0_t1[15],  s_f4_t0_t1[15],  s_f4_t0_t1[15],  s_f4_t0_t1} + {s_f4_t2_t3[17], s_f4_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f4_1 = 	{s_f4_t4_t5[14],  s_f4_t4_t5[14],  s_f4_t4_t5[14],  s_f4_t4_t5[14],  s_f4_t4_t5[14],  s_f4_t4_t5} + {s_f4_0[18], s_f4_0}; 		// 15 + 19 = 20 bits
		assign s_f5_0 = 	{s_f5_t0_t1[15],  s_f5_t0_t1[15],  s_f5_t0_t1[15],  s_f5_t0_t1} + {s_f5_t2_t3[17], s_f5_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f5_1 = 	{s_f5_t4_t5[15],  s_f5_t4_t5[15],  s_f5_t4_t5[15],  s_f5_t4_t5[15],  s_f5_t4_t5} + {s_f5_0[18], s_f5_0}; 		// 16 + 19 = 20 bits
		assign s_f6_0 = 	{s_f6_t0_t1[15],  s_f6_t0_t1[15],  s_f6_t0_t1[15],  s_f6_t0_t1} + {s_f6_t2_t3[17], s_f6_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f6_1 = 	{s_f6_t4_t5[15],  s_f6_t4_t5[15],  s_f6_t4_t5[15],  s_f6_t4_t5[15],  s_f6_t4_t5} + {s_f6_0[18], s_f6_0}; 		// 16 + 19 = 20 bits
		assign s_f7_0 = 	{s_f7_t0_t1[15],  s_f7_t0_t1[15],  s_f7_t0_t1[15],  s_f7_t0_t1} + {s_f7_t2_t3[17], s_f7_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f7_1 = 	{s_f7_t4_t5[15],  s_f7_t4_t5[15],  s_f7_t4_t5[15],  s_f7_t4_t5[15],  s_f7_t4_t5} + {s_f7_0[18], s_f7_0}; 		// 16 + 19 = 20 bits
		assign s_f8_0 = 	{s_f8_t0_t1[15],  s_f8_t0_t1[15],  s_f8_t0_t1[15],  s_f8_t0_t1} + {s_f8_t2_t3[17], s_f8_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f8_1 = 	{s_f8_t4_t5[15],  s_f8_t4_t5[15],  s_f8_t4_t5[15],  s_f8_t4_t5[15],  s_f8_t4_t5} + {s_f8_0[18], s_f8_0}; 		// 16 + 19 = 20 bits
		assign s_f9_0 = 	{s_f9_t0_t1[15],  s_f9_t0_t1[15],  s_f9_t0_t1[15],  s_f9_t0_t1} + {s_f9_t2_t3[17], s_f9_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f9_1 = 	{s_f9_t4_t5[15],  s_f9_t4_t5[15],  s_f9_t4_t5[15],  s_f9_t4_t5[15],  s_f9_t4_t5} + {s_f9_0[18], s_f9_0}; 		// 16 + 19 = 20 bits
		assign s_f10_0 = 	{s_f10_t0_t1[15],  s_f10_t0_t1[15],  s_f10_t0_t1[15],  s_f10_t0_t1} + {s_f10_t2_t3[17], s_f10_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f10_1 = 	{s_f10_t4_t5[15],  s_f10_t4_t5[15],  s_f10_t4_t5[15],  s_f10_t4_t5[15],  s_f10_t4_t5} + {s_f10_0[18], s_f10_0}; 		// 16 + 19 = 20 bits
		assign s_f11_0 = 	{s_f11_t0_t1[15],  s_f11_t0_t1[15],  s_f11_t0_t1[15],  s_f11_t0_t1} + {s_f11_t2_t3[17], s_f11_t2_t3}; 		// 16 + 18 = 19 bits
		assign s_f11_1 = 	{s_f11_t4_t5[15],  s_f11_t4_t5[15],  s_f11_t4_t5[15],  s_f11_t4_t5[15],  s_f11_t4_t5} + {s_f11_0[18], s_f11_0}; 		// 16 + 19 = 20 bits
		assign s_f12_0 = 	{s_f12_t0_t1[14],  s_f12_t0_t1[14],  s_f12_t0_t1[14],  s_f12_t0_t1[14],  s_f12_t0_t1} + {s_f12_t2_t3[17], s_f12_t2_t3}; 		// 15 + 18 = 19 bits
		assign s_f12_1 = 	{s_f12_t4_t5[15],  s_f12_t4_t5[15],  s_f12_t4_t5[15],  s_f12_t4_t5[15],  s_f12_t4_t5} + {s_f12_0[18], s_f12_0}; 		// 16 + 19 = 20 bits
		assign s_f13_0 = 	{s_f13_t0_t1[14],  s_f13_t0_t1[14],  s_f13_t0_t1[14],  s_f13_t0_t1[14],  s_f13_t0_t1} + {s_f13_t2_t3[17], s_f13_t2_t3}; 		// 15 + 18 = 19 bits
		assign s_f13_1 = 	{s_f13_t4_t5[15],  s_f13_t4_t5[15],  s_f13_t4_t5[15],  s_f13_t4_t5[15],  s_f13_t4_t5} + {s_f13_0[18], s_f13_0}; 		// 16 + 19 = 20 bits
		assign s_f14_0 = 	{s_f14_t0_t1[13],  s_f14_t0_t1[13],  s_f14_t0_t1[13],  s_f14_t0_t1[13],  s_f14_t0_t1[13],  s_f14_t0_t1} + {s_f14_t2_t3[17], s_f14_t2_t3}; 		// 14 + 18 = 19 bits
		assign s_f14_1 = 	{s_f14_t4_t5[14],  s_f14_t4_t5[14],  s_f14_t4_t5[14],  s_f14_t4_t5[14],  s_f14_t4_t5[14],  s_f14_t4_t5} + {s_f14_0[18], s_f14_0}; 		// 15 + 19 = 20 bits
		assign s_f15_0 = 	{s_f15_t0_t1[13],  s_f15_t0_t1[13],  s_f15_t0_t1[13],  s_f15_t0_t1[13],  s_f15_t0_t1[13],  s_f15_t0_t1} + {s_f15_t2_t3[17], s_f15_t2_t3}; 		// 14 + 18 = 19 bits
		assign s_f15_1 = 	{s_f15_t4_t5[13],  s_f15_t4_t5[13],  s_f15_t4_t5[13],  s_f15_t4_t5[13],  s_f15_t4_t5[13],  s_f15_t4_t5[13],  s_f15_t4_t5} + {s_f15_0[18], s_f15_0}; 		// 14 + 19 = 20 bits

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

	assign Y1 = s_f1_shr;	// 14 bits
	assign Y2 = s_f2_shr;	// 14 bits
	assign Y3 = s_f3_shr;	// 14 bits
	assign Y4 = s_f4_shr;	// 14 bits
	assign Y5 = s_f5_shr;	// 14 bits
	assign Y6 = s_f6_shr;	// 14 bits
	assign Y7 = s_f7_shr;	// 14 bits
	assign Y8 = s_f8_shr;	// 14 bits
	assign Y9 = s_f9_shr;	// 14 bits
	assign Y10 = s_f10_shr;	// 14 bits
	assign Y11 = s_f11_shr;	// 14 bits
	assign Y12 = s_f12_shr;	// 14 bits
	assign Y13 = s_f13_shr;	// 14 bits
	assign Y14 = s_f14_shr;	// 14 bits
	assign Y15 = s_f15_shr;	// 14 bits


endmodule // all_filters_11


