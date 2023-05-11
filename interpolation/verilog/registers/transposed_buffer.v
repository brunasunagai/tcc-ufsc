/*-----------------------------------------------------------------------------------
* File: transposed_buffer.v
* Date generated: 25/03/2023
* Date modified: 10/05/2023
* Author: Bruna Suemi Nagai
* Description: Transposed buffer that writes lines from top to bottom. And reads columns from left to right. 
*----------------------------------------------------------------------------------- */

module transposed_buffer (
	CLK, 
	RST_ASYNC_N,
	WRITE_EN,
	INPUT_0,
	INPUT_1,
	INPUT_2,
	INPUT_3,
	OUTPUT_0,
	OUTPUT_1,
	OUTPUT_2,
	OUTPUT_3
);


// ------------------------------------------
// Port mode declaration
// ------------------------------------------
  input CLK;								//Clock
  input RST_ASYNC_N;						//Asynchronous reset
  input WRITE_EN;							//Enable writing for all internal registers
  input signed [10:0] INPUT_0;
  input signed [10:0] INPUT_1;
  input signed [10:0] INPUT_2;
  input signed [10:0] INPUT_3;
  output wire signed [98:0] OUTPUT_0;
  output wire signed [98:0] OUTPUT_1;
  output wire signed [98:0] OUTPUT_2;
  output wire signed [98:0] OUTPUT_3;


// ------------------------------------------
// Wires declarations
// ------------------------------------------
  wire WIRE_CLK;
  wire WIRE_RST;
  wire WIRE_EN;

// Outputs from individual registers
  wire signed [10:0] out_reg_0;
  wire signed [10:0] out_reg_1;
  wire signed [10:0] out_reg_2;
  wire signed [10:0] out_reg_3;
  wire signed [10:0] out_reg_4;
  wire signed [10:0] out_reg_5;
  wire signed [10:0] out_reg_6;
  wire signed [10:0] out_reg_7;
  wire signed [10:0] out_reg_8;
  wire signed [10:0] out_reg_9;
  wire signed [10:0] out_reg_10;
  wire signed [10:0] out_reg_11;
  wire signed [10:0] out_reg_12;
  wire signed [10:0] out_reg_13;
  wire signed [10:0] out_reg_14;
  wire signed [10:0] out_reg_15;
  wire signed [10:0] out_reg_16;
  wire signed [10:0] out_reg_17;
  wire signed [10:0] out_reg_18;
  wire signed [10:0] out_reg_19;
  wire signed [10:0] out_reg_20;
  wire signed [10:0] out_reg_21;
  wire signed [10:0] out_reg_22;
  wire signed [10:0] out_reg_23;
  wire signed [10:0] out_reg_24;
  wire signed [10:0] out_reg_25;
  wire signed [10:0] out_reg_26;
  wire signed [10:0] out_reg_27;
  wire signed [10:0] out_reg_28;
  wire signed [10:0] out_reg_29;
  wire signed [10:0] out_reg_30;
  wire signed [10:0] out_reg_31;
  wire signed [10:0] out_reg_32;
  wire signed [10:0] out_reg_33;
  wire signed [10:0] out_reg_34;
  wire signed [10:0] out_reg_35;

// Columns read as the buffer output
  wire signed [98:0] COLUMN_0;
  wire signed [98:0] COLUMN_1;
  wire signed [98:0] COLUMN_2;
  wire signed [98:0] COLUMN_3;


// ------------------------------------------
// Modules instantiation
// ------------------------------------------
reg_internal_buffer R0 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (INPUT_0),
	.DATA_OUT (out_reg_0));

reg_internal_buffer R1 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (INPUT_1),
	.DATA_OUT (out_reg_1));

reg_internal_buffer R2 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (INPUT_2),
	.DATA_OUT (out_reg_2));

reg_internal_buffer R3 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (INPUT_3),
	.DATA_OUT (out_reg_3));

reg_internal_buffer R4 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_0),
	.DATA_OUT (out_reg_4));

reg_internal_buffer R5 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_1),
	.DATA_OUT (out_reg_5));

reg_internal_buffer R6 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_2),
	.DATA_OUT (out_reg_6));

reg_internal_buffer R7 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_3),
	.DATA_OUT (out_reg_7));

reg_internal_buffer R8 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_4),
	.DATA_OUT (out_reg_8));

reg_internal_buffer R9 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_5),
	.DATA_OUT (out_reg_9));

reg_internal_buffer R10 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_6),
	.DATA_OUT (out_reg_10));

reg_internal_buffer R11 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_7),
	.DATA_OUT (out_reg_11));

reg_internal_buffer R12 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_8),
	.DATA_OUT (out_reg_12));

reg_internal_buffer R13 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_9),
	.DATA_OUT (out_reg_13));

reg_internal_buffer R14 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_10),
	.DATA_OUT (out_reg_14));

reg_internal_buffer R15 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_11),
	.DATA_OUT (out_reg_15));

reg_internal_buffer R16 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_12),
	.DATA_OUT (out_reg_16));

reg_internal_buffer R17 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_13),
	.DATA_OUT (out_reg_17));

reg_internal_buffer R18 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_14),
	.DATA_OUT (out_reg_18));

reg_internal_buffer R19 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_15),
	.DATA_OUT (out_reg_19));

reg_internal_buffer R20 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_16),
	.DATA_OUT (out_reg_20));

reg_internal_buffer R21 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_17),
	.DATA_OUT (out_reg_21));

reg_internal_buffer R22 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_18),
	.DATA_OUT (out_reg_22));

reg_internal_buffer R23 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_19),
	.DATA_OUT (out_reg_23));

reg_internal_buffer R24 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_20),
	.DATA_OUT (out_reg_24));

reg_internal_buffer R25 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_21),
	.DATA_OUT (out_reg_25));

reg_internal_buffer R26 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_22),
	.DATA_OUT (out_reg_26));

reg_internal_buffer R27 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_23),
	.DATA_OUT (out_reg_27));

reg_internal_buffer R28 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_24),
	.DATA_OUT (out_reg_28));

reg_internal_buffer R29 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_25),
	.DATA_OUT (out_reg_29));

reg_internal_buffer R30 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_26),
	.DATA_OUT (out_reg_30));

reg_internal_buffer R31 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_27),
	.DATA_OUT (out_reg_31));

reg_internal_buffer R32 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_28),
	.DATA_OUT (out_reg_32));

reg_internal_buffer R33 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_29),
	.DATA_OUT (out_reg_33));

reg_internal_buffer R34 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_30),
	.DATA_OUT (out_reg_34));

reg_internal_buffer R35 (
	.CLK (WIRE_CLK),
	.RST_ASYNC_N (WIRE_RST),
	.WRITE_EN (WIRE_EN),
	.DATA_IN (out_reg_31),
	.DATA_OUT (out_reg_35));



// ------------------------------------------
// Combinational logic
// ------------------------------------------
  assign WIRE_CLK = CLK;
  assign WIRE_RST = RST_ASYNC_N;
  assign WIRE_EN = WRITE_EN;

  // From columns to output
  assign COLUMN_0 = {out_reg_0, out_reg_4, out_reg_8, out_reg_12, out_reg_16, out_reg_20, out_reg_24, out_reg_28, out_reg_32};
  assign COLUMN_1 = {out_reg_1, out_reg_5, out_reg_9, out_reg_13, out_reg_17, out_reg_21, out_reg_25, out_reg_29, out_reg_33};
  assign COLUMN_2 = {out_reg_2, out_reg_6, out_reg_10, out_reg_14, out_reg_18, out_reg_22, out_reg_26, out_reg_30, out_reg_34};
  assign COLUMN_3 = {out_reg_3, out_reg_7, out_reg_11, out_reg_15, out_reg_19, out_reg_23, out_reg_27, out_reg_31, out_reg_35};


// ------------------------------------------
// Outputs
// ------------------------------------------
  assign OUTPUT_0 = COLUMN_0;
  assign OUTPUT_1 = COLUMN_1;
  assign OUTPUT_2 = COLUMN_2;
  assign OUTPUT_3 = COLUMN_3;


endmodule // transposed_buffer
