/*------------------------------------------------------------------------------
 * File: interpolation_datapath.v
 * Date generated: 13/03/2023
 * Date modified: 15/05/2023
 * Author: Bruna Suemi Nagai
 * Description: Interpolation datapath to process 
 *------------------------------------------------------------------------------ */

module interpolation_datapath (
  input CLK,
  input RST_ASYNC_INTERP,			// Async reset for regs INPUT_LINE, INT_OUT and BUFFER.
  input RST_ASYNC_REG_COUNTER,
  input WRITE_REG_INPUT_LINE,
  input WRITE_REG_COUNTER,
  input WRITE_REG_INT_OUT,
  input WRITE_BUFFER,
  input SEL_BUFFER_IN,			// 0: 1st pass output; 1: OUT_REG_INPUT_LINE
  input SEL_INTERP_IN,			// 0: buffer; 1: OUT_REG_INPUT_LINE
  input SEL_DIMENSION,			// 0: Y; 1: X
  input [71:0] INTEGER_SAMPLES,
  input [3:0] FRAC_MV_X,			// Fractional part of MV_X from MV Generator.
  input [3:0] FRAC_MV_Y,			// Fractional part of MV_Y from MV Generator.
  output wire LOOP_3,
  output wire LOOP_4,
  output wire LOOP_9,
  output wire LOOP_13,
  output wire [13:0] INTERP_OUT_0,
  output wire [13:0] INTERP_OUT_1,
  output wire [13:0] INTERP_OUT_2,
  output wire [13:0] INTERP_OUT_3
);


// ------------------------------------------
// Signals declarations
// ------------------------------------------
  wire [71:0] OUT_REG_INPUT_LINE;
  wire [3:0] OUT_REG_COUNTER;
  wire signed [98:0] OUT_BUFFER_0;
  wire signed [98:0] OUT_BUFFER_1;
  wire signed [98:0] OUT_BUFFER_2;
  wire signed [98:0] OUT_BUFFER_3;
  wire [13:0] OUT_MUX_SEL_BUF_IN_0;
  wire [13:0] OUT_MUX_SEL_BUF_IN_1;
  wire [13:0] OUT_MUX_SEL_BUF_IN_2;
  wire [13:0] OUT_MUX_SEL_BUF_IN_3;
  wire [98:0] OUT_MUX_SEL_BUFFER_COLUMN;
  wire [98:0] OUT_MUX_SEL_INTERP_LINE_IN;
  wire [3:0] OUT_MUX_SEL_DIMENSION;
  wire signed [13:0] OUT_MUX_SEL_FILTER_0;
  wire signed [13:0] OUT_MUX_SEL_FILTER_1;
  wire signed [13:0] OUT_MUX_SEL_FILTER_2;
  wire signed [13:0] OUT_MUX_SEL_FILTER_3;
  wire [3:0] OUT_ADD_COUNTER;
  wire [26:0] MSB_REG_INPUT_LINE;
  wire [98:0] EXT_OUT_REG_INPUT_LINE;		// Sign extension for OUT_REG_INPUT_LINE (72 -> 99 bits)
  wire signed [13:0] EXT_OUT_REG_INPUT_LINE_0;
  wire signed [13:0] EXT_OUT_REG_INPUT_LINE_1;
  wire signed [13:0] EXT_OUT_REG_INPUT_LINE_2;
  wire signed [13:0] EXT_OUT_REG_INPUT_LINE_3;
  wire signed [13:0] OUT_INTERP_0_0;
  wire signed [13:0] OUT_INTERP_0_1;
  wire signed [13:0] OUT_INTERP_0_2;
  wire signed [13:0] OUT_INTERP_0_3;
  wire signed [13:0] OUT_INTERP_0_4;
  wire signed [13:0] OUT_INTERP_0_5;
  wire signed [13:0] OUT_INTERP_0_6;
  wire signed [13:0] OUT_INTERP_0_7;
  wire signed [13:0] OUT_INTERP_0_8;
  wire signed [13:0] OUT_INTERP_0_9;
  wire signed [13:0] OUT_INTERP_0_10;
  wire signed [13:0] OUT_INTERP_0_11;
  wire signed [13:0] OUT_INTERP_0_12;
  wire signed [13:0] OUT_INTERP_0_13;
  wire signed [13:0] OUT_INTERP_0_14;
  wire signed [13:0] OUT_INTERP_1_0;
  wire signed [13:0] OUT_INTERP_1_1;
  wire signed [13:0] OUT_INTERP_1_2;
  wire signed [13:0] OUT_INTERP_1_3;
  wire signed [13:0] OUT_INTERP_1_4;
  wire signed [13:0] OUT_INTERP_1_5;
  wire signed [13:0] OUT_INTERP_1_6;
  wire signed [13:0] OUT_INTERP_1_7;
  wire signed [13:0] OUT_INTERP_1_8;
  wire signed [13:0] OUT_INTERP_1_9;
  wire signed [13:0] OUT_INTERP_1_10;
  wire signed [13:0] OUT_INTERP_1_11;
  wire signed [13:0] OUT_INTERP_1_12;
  wire signed [13:0] OUT_INTERP_1_13;
  wire signed [13:0] OUT_INTERP_1_14;
  wire signed [13:0] OUT_INTERP_2_0;
  wire signed [13:0] OUT_INTERP_2_1;
  wire signed [13:0] OUT_INTERP_2_2;
  wire signed [13:0] OUT_INTERP_2_3;
  wire signed [13:0] OUT_INTERP_2_4;
  wire signed [13:0] OUT_INTERP_2_5;
  wire signed [13:0] OUT_INTERP_2_6;
  wire signed [13:0] OUT_INTERP_2_7;
  wire signed [13:0] OUT_INTERP_2_8;
  wire signed [13:0] OUT_INTERP_2_9;
  wire signed [13:0] OUT_INTERP_2_10;
  wire signed [13:0] OUT_INTERP_2_11;
  wire signed [13:0] OUT_INTERP_2_12;
  wire signed [13:0] OUT_INTERP_2_13;
  wire signed [13:0] OUT_INTERP_2_14;
  wire signed [13:0] OUT_INTERP_3_0;
  wire signed [13:0] OUT_INTERP_3_1;
  wire signed [13:0] OUT_INTERP_3_2;
  wire signed [13:0] OUT_INTERP_3_3;
  wire signed [13:0] OUT_INTERP_3_4;
  wire signed [13:0] OUT_INTERP_3_5;
  wire signed [13:0] OUT_INTERP_3_6;
  wire signed [13:0] OUT_INTERP_3_7;
  wire signed [13:0] OUT_INTERP_3_8;
  wire signed [13:0] OUT_INTERP_3_9;
  wire signed [13:0] OUT_INTERP_3_10;
  wire signed [13:0] OUT_INTERP_3_11;
  wire signed [13:0] OUT_INTERP_3_12;
  wire signed [13:0] OUT_INTERP_3_13;
  wire signed [13:0] OUT_INTERP_3_14;

// ------------------------------------------
// Modules instantiation
// ------------------------------------------
  reg_input_line REG_INPUT_LINE (					// Stores the external input samples
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_INTERP),
	.WRITE_EN (WRITE_REG_INPUT_LINE),
	.DATA_IN (INTEGER_SAMPLES),
	.DATA_OUT (OUT_REG_INPUT_LINE));

  reg_counter REG_COUNTER (					// Controls the counter increment that controls the loops for FSM
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_REG_COUNTER),
	.WRITE_EN (WRITE_REG_COUNTER),
	.DATA_IN (OUT_ADD_COUNTER),
	.DATA_OUT (OUT_REG_COUNTER));

  transposed_buffer TRANSPOSED_BUFFER (		
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_INTERP),
	.WRITE_EN (WRITE_BUFFER),
	.INPUT_0 (OUT_MUX_SEL_BUF_IN_0[10:0]),
	.INPUT_1 (OUT_MUX_SEL_BUF_IN_1[10:0]),
	.INPUT_2 (OUT_MUX_SEL_BUF_IN_2[10:0]),
	.INPUT_3 (OUT_MUX_SEL_BUF_IN_3[10:0]),
	.OUTPUT_0 (OUT_BUFFER_0),
	.OUTPUT_1 (OUT_BUFFER_1),
	.OUTPUT_2 (OUT_BUFFER_2),
	.OUTPUT_3 (OUT_BUFFER_3));

  reg_int_out REG_INT_OUT_0 (					// Output from interpolator 0
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_INTERP),
	.WRITE_EN (WRITE_REG_INT_OUT),
	.DATA_IN (OUT_MUX_SEL_BUF_IN_0),
	.DATA_OUT (INTERP_OUT_0));

  reg_int_out REG_INT_OUT_1 (					// Output from interpolator 1
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_INTERP),
	.WRITE_EN (WRITE_REG_INT_OUT),
	.DATA_IN (OUT_MUX_SEL_BUF_IN_1),
	.DATA_OUT (INTERP_OUT_1));

  reg_int_out REG_INT_OUT_2 (					// Output from interpolator 2
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_INTERP),
	.WRITE_EN (WRITE_REG_INT_OUT),
	.DATA_IN (OUT_MUX_SEL_BUF_IN_2),
	.DATA_OUT (INTERP_OUT_2));

  reg_int_out REG_INT_OUT_3 (					// Output from interpolator 3
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_INTERP),
	.WRITE_EN (WRITE_REG_INT_OUT),
	.DATA_IN (OUT_MUX_SEL_BUF_IN_3),
	.DATA_OUT (INTERP_OUT_3));

  add_counter ADD_COUNTER (		
	.A (4'b1),
	.B (OUT_REG_COUNTER),
	.C (OUT_ADD_COUNTER));

  mux_sel_buffer_in MUX_SEL_BUF_IN_0 (		
	.DATA_IN_0 (OUT_MUX_SEL_FILTER_0),
	.DATA_IN_1 (EXT_OUT_REG_INPUT_LINE_0),
	.SELECT (SEL_BUFFER_IN),
	.DATA_OUT (OUT_MUX_SEL_BUF_IN_0));

  mux_sel_buffer_in MUX_SEL_BUF_IN_1 (		
	.DATA_IN_0 (OUT_MUX_SEL_FILTER_1),
	.DATA_IN_1 (EXT_OUT_REG_INPUT_LINE_1),
	.SELECT (SEL_BUFFER_IN),
	.DATA_OUT (OUT_MUX_SEL_BUF_IN_1));

  mux_sel_buffer_in MUX_SEL_BUF_IN_2 (		
	.DATA_IN_0 (OUT_MUX_SEL_FILTER_2),
	.DATA_IN_1 (EXT_OUT_REG_INPUT_LINE_2),
	.SELECT (SEL_BUFFER_IN),
	.DATA_OUT (OUT_MUX_SEL_BUF_IN_2));

  mux_sel_buffer_in MUX_SEL_BUF_IN_3 (		
	.DATA_IN_0 (OUT_MUX_SEL_FILTER_3),
	.DATA_IN_1 (EXT_OUT_REG_INPUT_LINE_3),
	.SELECT (SEL_BUFFER_IN),
	.DATA_OUT (OUT_MUX_SEL_BUF_IN_3));

  mux_sel_buffer_column MUX_SEL_BUFFER_COLUMN (		
	.DATA_IN_1 (OUT_BUFFER_0),
	.DATA_IN_2 (OUT_BUFFER_1),
	.DATA_IN_3 (OUT_BUFFER_2),
	.DATA_IN_4 (OUT_BUFFER_3),
	.SELECT (OUT_REG_COUNTER[2:0]),
	.DATA_OUT (OUT_MUX_SEL_BUFFER_COLUMN));

  mux_sel_interp_line_in MUX_SEL_INTERP_LINE_IN (		
	.DATA_IN_0 (OUT_MUX_SEL_BUFFER_COLUMN),
	.DATA_IN_1 (EXT_OUT_REG_INPUT_LINE),
	.SELECT (SEL_INTERP_IN),
	.DATA_OUT (OUT_MUX_SEL_INTERP_LINE_IN));

  mux_sel_dimension MUX_SEL_DIMENSION (				// The output selects the filter
	.DATA_IN_0 (FRAC_MV_Y),
	.DATA_IN_1 (FRAC_MV_X),
	.SELECT (SEL_DIMENSION),
	.DATA_OUT (OUT_MUX_SEL_DIMENSION));

  mux_sel_filter MUX_SEL_FILTER_0 (		
	.DATA_IN_0 (OUT_INTERP_0_0),
	.DATA_IN_1 (OUT_INTERP_0_1),
	.DATA_IN_2 (OUT_INTERP_0_2),
	.DATA_IN_3 (OUT_INTERP_0_3),
	.DATA_IN_4 (OUT_INTERP_0_4),
	.DATA_IN_5 (OUT_INTERP_0_5),
	.DATA_IN_6 (OUT_INTERP_0_6),
	.DATA_IN_7 (OUT_INTERP_0_7),
	.DATA_IN_8 (OUT_INTERP_0_8),
	.DATA_IN_9 (OUT_INTERP_0_9),
	.DATA_IN_10 (OUT_INTERP_0_10),
	.DATA_IN_11 (OUT_INTERP_0_11),
	.DATA_IN_12 (OUT_INTERP_0_12),
	.DATA_IN_13 (OUT_INTERP_0_13),
	.DATA_IN_14 (OUT_INTERP_0_14),
	.SELECT (OUT_MUX_SEL_DIMENSION),
	.DATA_OUT (OUT_MUX_SEL_FILTER_0));

  mux_sel_filter MUX_SEL_FILTER_1 (		
	.DATA_IN_0 (OUT_INTERP_1_0),
	.DATA_IN_1 (OUT_INTERP_1_1),
	.DATA_IN_2 (OUT_INTERP_1_2),
	.DATA_IN_3 (OUT_INTERP_1_3),
	.DATA_IN_4 (OUT_INTERP_1_4),
	.DATA_IN_5 (OUT_INTERP_1_5),
	.DATA_IN_6 (OUT_INTERP_1_6),
	.DATA_IN_7 (OUT_INTERP_1_7),
	.DATA_IN_8 (OUT_INTERP_1_8),
	.DATA_IN_9 (OUT_INTERP_1_9),
	.DATA_IN_10 (OUT_INTERP_1_10),
	.DATA_IN_11 (OUT_INTERP_1_11),
	.DATA_IN_12 (OUT_INTERP_1_12),
	.DATA_IN_13 (OUT_INTERP_1_13),
	.DATA_IN_14 (OUT_INTERP_1_14),
	.SELECT (OUT_MUX_SEL_DIMENSION),
	.DATA_OUT (OUT_MUX_SEL_FILTER_1));

  mux_sel_filter MUX_SEL_FILTER_2 (		
	.DATA_IN_0 (OUT_INTERP_2_0),
	.DATA_IN_1 (OUT_INTERP_2_1),
	.DATA_IN_2 (OUT_INTERP_2_2),
	.DATA_IN_3 (OUT_INTERP_2_3),
	.DATA_IN_4 (OUT_INTERP_2_4),
	.DATA_IN_5 (OUT_INTERP_2_5),
	.DATA_IN_6 (OUT_INTERP_2_6),
	.DATA_IN_7 (OUT_INTERP_2_7),
	.DATA_IN_8 (OUT_INTERP_2_8),
	.DATA_IN_9 (OUT_INTERP_2_9),
	.DATA_IN_10 (OUT_INTERP_2_10),
	.DATA_IN_11 (OUT_INTERP_2_11),
	.DATA_IN_12 (OUT_INTERP_2_12),
	.DATA_IN_13 (OUT_INTERP_2_13),
	.DATA_IN_14 (OUT_INTERP_2_14),
	.SELECT (OUT_MUX_SEL_DIMENSION),
	.DATA_OUT (OUT_MUX_SEL_FILTER_2));

  mux_sel_filter MUX_SEL_FILTER_3 (		
	.DATA_IN_0 (OUT_INTERP_3_0),
	.DATA_IN_1 (OUT_INTERP_3_1),
	.DATA_IN_2 (OUT_INTERP_3_2),
	.DATA_IN_3 (OUT_INTERP_3_3),
	.DATA_IN_4 (OUT_INTERP_3_4),
	.DATA_IN_5 (OUT_INTERP_3_5),
	.DATA_IN_6 (OUT_INTERP_3_6),
	.DATA_IN_7 (OUT_INTERP_3_7),
	.DATA_IN_8 (OUT_INTERP_3_8),
	.DATA_IN_9 (OUT_INTERP_3_9),
	.DATA_IN_10 (OUT_INTERP_3_10),
	.DATA_IN_11 (OUT_INTERP_3_11),
	.DATA_IN_12 (OUT_INTERP_3_12),
	.DATA_IN_13 (OUT_INTERP_3_13),
	.DATA_IN_14 (OUT_INTERP_3_14),
	.SELECT (OUT_MUX_SEL_DIMENSION),
	.DATA_OUT (OUT_MUX_SEL_FILTER_3));

  all_filters_11 INTERP_0 (		
	.X (OUT_MUX_SEL_INTERP_LINE_IN[98:33]),
	.Y1 (OUT_INTERP_0_0),
	.Y2 (OUT_INTERP_0_1),
	.Y3 (OUT_INTERP_0_2),
	.Y4 (OUT_INTERP_0_3),
	.Y5 (OUT_INTERP_0_4),
	.Y6 (OUT_INTERP_0_5),
	.Y7 (OUT_INTERP_0_6),
	.Y8 (OUT_INTERP_0_7),
	.Y9 (OUT_INTERP_0_8),
	.Y10 (OUT_INTERP_0_9),
	.Y11 (OUT_INTERP_0_10),
	.Y12 (OUT_INTERP_0_11),
	.Y13 (OUT_INTERP_0_12),
	.Y14 (OUT_INTERP_0_13),
	.Y15 (OUT_INTERP_0_14));

  all_filters_11 INTERP_1 (		
	.X (OUT_MUX_SEL_INTERP_LINE_IN[87:22]),
	.Y1 (OUT_INTERP_1_0),
	.Y2 (OUT_INTERP_1_1),
	.Y3 (OUT_INTERP_1_2),
	.Y4 (OUT_INTERP_1_3),
	.Y5 (OUT_INTERP_1_4),
	.Y6 (OUT_INTERP_1_5),
	.Y7 (OUT_INTERP_1_6),
	.Y8 (OUT_INTERP_1_7),
	.Y9 (OUT_INTERP_1_8),
	.Y10 (OUT_INTERP_1_9),
	.Y11 (OUT_INTERP_1_10),
	.Y12 (OUT_INTERP_1_11),
	.Y13 (OUT_INTERP_1_12),
	.Y14 (OUT_INTERP_1_13),
	.Y15 (OUT_INTERP_1_14));

  all_filters_11 INTERP_2 (		
	.X (OUT_MUX_SEL_INTERP_LINE_IN[76:11]),
	.Y1 (OUT_INTERP_2_0),
	.Y2 (OUT_INTERP_2_1),
	.Y3 (OUT_INTERP_2_2),
	.Y4 (OUT_INTERP_2_3),
	.Y5 (OUT_INTERP_2_4),
	.Y6 (OUT_INTERP_2_5),
	.Y7 (OUT_INTERP_2_6),
	.Y8 (OUT_INTERP_2_7),
	.Y9 (OUT_INTERP_2_8),
	.Y10 (OUT_INTERP_2_9),
	.Y11 (OUT_INTERP_2_10),
	.Y12 (OUT_INTERP_2_11),
	.Y13 (OUT_INTERP_2_12),
	.Y14 (OUT_INTERP_2_13),
	.Y15 (OUT_INTERP_2_14));

  all_filters_11 INTERP_3 (		
	.X (OUT_MUX_SEL_INTERP_LINE_IN[65:0]),
	.Y1 (OUT_INTERP_3_0),
	.Y2 (OUT_INTERP_3_1),
	.Y3 (OUT_INTERP_3_2),
	.Y4 (OUT_INTERP_3_3),
	.Y5 (OUT_INTERP_3_4),
	.Y6 (OUT_INTERP_3_5),
	.Y7 (OUT_INTERP_3_6),
	.Y8 (OUT_INTERP_3_7),
	.Y9 (OUT_INTERP_3_8),
	.Y10 (OUT_INTERP_3_9),
	.Y11 (OUT_INTERP_3_10),
	.Y12 (OUT_INTERP_3_11),
	.Y13 (OUT_INTERP_3_12),
	.Y14 (OUT_INTERP_3_13),
	.Y15 (OUT_INTERP_3_14));

    

// ------------------------------------------
// Combinational logic
// ------------------------------------------
// Size matching:
  assign MSB_REG_INPUT_LINE = {27{OUT_REG_INPUT_LINE[71]}};
  assign EXT_OUT_REG_INPUT_LINE = {MSB_REG_INPUT_LINE, OUT_REG_INPUT_LINE};
  assign EXT_OUT_REG_INPUT_LINE_0 = {OUT_REG_INPUT_LINE[55], OUT_REG_INPUT_LINE[55], OUT_REG_INPUT_LINE[55], OUT_REG_INPUT_LINE[55], OUT_REG_INPUT_LINE[55], OUT_REG_INPUT_LINE[55], OUT_REG_INPUT_LINE[55:48]};
  assign EXT_OUT_REG_INPUT_LINE_1 = {OUT_REG_INPUT_LINE[47], OUT_REG_INPUT_LINE[47], OUT_REG_INPUT_LINE[47], OUT_REG_INPUT_LINE[47], OUT_REG_INPUT_LINE[47], OUT_REG_INPUT_LINE[47], OUT_REG_INPUT_LINE[47:40]};
  assign EXT_OUT_REG_INPUT_LINE_2 = {OUT_REG_INPUT_LINE[39], OUT_REG_INPUT_LINE[39], OUT_REG_INPUT_LINE[39], OUT_REG_INPUT_LINE[39], OUT_REG_INPUT_LINE[39], OUT_REG_INPUT_LINE[39], OUT_REG_INPUT_LINE[39:32]};
  assign EXT_OUT_REG_INPUT_LINE_3 = {OUT_REG_INPUT_LINE[31], OUT_REG_INPUT_LINE[31], OUT_REG_INPUT_LINE[31], OUT_REG_INPUT_LINE[31], OUT_REG_INPUT_LINE[31], OUT_REG_INPUT_LINE[31], OUT_REG_INPUT_LINE[31:24]};

// Output loops for FSM 

  assign LOOP_3 = OUT_REG_COUNTER[3] ^ 1'b0 | OUT_REG_COUNTER[2] ^ 1'b0 | OUT_REG_COUNTER[1] ^ 1'b1 | OUT_REG_COUNTER[0] ^ 1'b1;
  assign LOOP_4 = OUT_REG_COUNTER[3] ^ 1'b0 | OUT_REG_COUNTER[2] ^ 1'b1 | OUT_REG_COUNTER[1] ^ 1'b0 | OUT_REG_COUNTER[0] ^ 1'b0;
  assign LOOP_9 = OUT_REG_COUNTER[3] ^ 1'b1 | OUT_REG_COUNTER[2] ^ 1'b0 | OUT_REG_COUNTER[1] ^ 1'b0 | OUT_REG_COUNTER[0] ^ 1'b1;
  assign LOOP_13 = OUT_REG_COUNTER[3] ^ 1'b1 | OUT_REG_COUNTER[2] ^ 1'b1 | OUT_REG_COUNTER[1] ^ 1'b0 | OUT_REG_COUNTER[0] ^ 1'b1;


endmodule // interpolation_datapath    
