/*-----------------------------------------------------------------------------------
* File: affine_tcc.v
* Date generated: 25/03/2023
* Date modified: 15/05/2023
* Author: Bruna Suemi Nagai
* Description: Connect: MV Gen + Interpolator + Control.
*----------------------------------------------------------------------------------- */

module affine_tcc (
	input TOP_CLK, 
	input TOP_RESET,
	input TOP_START,
	
	// Inputs for MV Generator
	input [7:0] TOP_COORD_X, 
	input [7:0] TOP_COORD_Y,
	input [15:0] TOP_CPMV_0,
	input [15:0] TOP_CPMV_1,
	input [15:0] TOP_CPMV_2,
	
	// Inputs for Interpolator
	input [71:0] TOP_INTEGER_SAMPLES,
	
	// Outputs from MV Generator
	output wire signed [14:0] TOP_OUT_GEN_MV_X_INTEGER,
	output wire signed [14:0] TOP_OUT_GEN_MV_Y_INTEGER,
	
	// Outputs from Interpolator
	output wire [13:0] TOP_INTERP_OUT_0,
	output wire [13:0] TOP_INTERP_OUT_1,
	output wire [13:0] TOP_INTERP_OUT_2,
	output wire [13:0] TOP_INTERP_OUT_3,
	
	// Output from control 
	output wire TOP_FLAG_INT_OUT,
	output wire TOP_DONE_ALL,
	
	output wire [71:0] TB_TOP_OUT_REG_INPUT_LINE,
	output wire [3:0] TB_TOP_STATE_NUM,
	output wire [13:0] TB_TOP_MUX_SEL_FILTER_0,
	output wire [13:0] TB_TOP_MUX_SEL_FILTER_1,
	output wire [13:0] TB_TOP_MUX_SEL_FILTER_2,
	output wire [13:0] TB_TOP_MUX_SEL_FILTER_3,
	output wire [18:0] TB_TOP_OUT_MV_GEN_X,
	output wire [18:0] TB_TOP_OUT_MV_GEN_Y,
	output wire [98:0] TB_TOP_BUF_COL_0,
	output wire [98:0] TB_TOP_BUF_COL_1,
	output wire [98:0] TB_TOP_BUF_COL_2,
	output wire [98:0] TB_TOP_BUF_COL_3,
	output wire [7:0] TB_TOP_OUT_REG_COORD_X,
	output wire [7:0] TB_TOP_OUT_REG_COORD_Y,
	output wire [7:0] TB_TOP_OUT_REG_X,
	output wire [7:0] TB_TOP_OUT_REG_Y,
	output wire [15:0] TB_TOP_OUT_REG_CPMV_0,
	output wire [15:0] TB_TOP_OUT_REG_CPMV_1,
	output wire [98:0] TB_TOP_OUT_MUX_SEL_INTERP_LINE_IN,
	output wire [65:0] TB_TOP_IN_ALL_FILTERS_0,
	output wire [65:0] TB_TOP_IN_ALL_FILTERS_1,
	output wire [65:0] TB_TOP_IN_ALL_FILTERS_2,
	output wire [65:0] TB_TOP_IN_ALL_FILTERS_3,
	output wire [1:0] TB_TOP_OUT_ADD_BUF_COL_COUNTER,
	output wire [1:0] TB_TOP_OUT_REG_BUF_COL_COUNTER
);



// ------------------------------------------
// Signals declarations
// ------------------------------------------
	// From Interpolator
	wire wi_rst_interp;
	wire wi_rst_reg_counter;
	wire wi_rst_reg_buf_col_counter;
	
	wire wi_wr_reg_input_line;
	wire wi_wr_reg_counter;
	wire wi_wr_reg_buf_col_counter;
	wire wi_wr_reg_int_out;
	wire wi_wr_buffer;
	
	wire wi_sel_buffer_in;
	wire wi_sel_interp_in;
	wire wi_sel_dimension;
	
	wire [3:0] wi_frac_MV_X;
	wire [3:0] wi_frac_MV_Y;
	
	wire wi_loop_3;
	wire wi_loop_4;
	wire wi_loop_9;
	wire wi_loop_13;
	wire wi_loop_14;
	

	// From MV Generator
	wire wm_rst_mv_gen; 
	
	wire wm_wr_regs_coords;
	wire wm_wr_regs_cpmvs;
	wire wm_wr_regs_gen_mvs;
	wire wm_wr_reg_x;
	wire wm_wr_reg_y;
	wire wm_wr_reg_count_block;
	
	wire wm_sel_x;
	wire wm_sel_y;
	
	wire wm_interp_x;
	wire wm_interp_y;
	wire wm_ctrl_x;
	wire wm_ctrl_y;
	

// ------------------------------------------
// Modules instantiation
// ------------------------------------------
	interpolation_datapath INTERP (					
		.CLK (TOP_CLK),
		.RST_ASYNC_INTERP (wi_rst_interp),
		.RST_ASYNC_REG_COUNTER (wi_rst_reg_counter),
		.RST_ASYNC_REG_BUF_COL_COUNTER (wi_rst_reg_buf_col_counter),
		.WRITE_REG_INPUT_LINE (wi_wr_reg_input_line),
		.WRITE_REG_COUNTER (wi_wr_reg_counter),
		.WRITE_REG_INT_OUT (wi_wr_reg_int_out),
		.WRITE_BUFFER (wi_wr_buffer),
		.WRITE_REG_BUF_COL_COUNTER (wi_wr_reg_buf_col_counter),
		.SEL_BUFFER_IN (wi_sel_buffer_in),
		.SEL_INTERP_IN (wi_sel_interp_in),
		.SEL_DIMENSION (wi_sel_dimension),
		.INTEGER_SAMPLES (TOP_INTEGER_SAMPLES),
		.FRAC_MV_X (wi_frac_MV_X),
		.FRAC_MV_Y (wi_frac_MV_Y),
		.LOOP_3 (wi_loop_3),
		.LOOP_4 (wi_loop_4),
		.LOOP_9 (wi_loop_9),
		.LOOP_13 (wi_loop_13),
		.LOOP_14 (wi_loop_14),
		.INTERP_OUT_0 (TOP_INTERP_OUT_0),
		.INTERP_OUT_1 (TOP_INTERP_OUT_1),
		.INTERP_OUT_2 (TOP_INTERP_OUT_2),
		.INTERP_OUT_3 (TOP_INTERP_OUT_3),
		
		.TB_OUT_REG_INPUT_LINE (TB_TOP_OUT_REG_INPUT_LINE),
		.TB_OUT_MUX_SEL_FILTER_0 (TB_TOP_MUX_SEL_FILTER_0),
		.TB_OUT_MUX_SEL_FILTER_1 (TB_TOP_MUX_SEL_FILTER_1),
		.TB_OUT_MUX_SEL_FILTER_2 (TB_TOP_MUX_SEL_FILTER_2),
		.TB_OUT_MUX_SEL_FILTER_3 (TB_TOP_MUX_SEL_FILTER_3),
		.TB_BUF_COL_0 (TB_TOP_BUF_COL_0),
		.TB_BUF_COL_1 (TB_TOP_BUF_COL_1),
		.TB_BUF_COL_2 (TB_TOP_BUF_COL_2),
		.TB_BUF_COL_3 (TB_TOP_BUF_COL_3),
		.TB_OUT_MUX_SEL_INTERP_LINE_IN (TB_TOP_OUT_MUX_SEL_INTERP_LINE_IN),
		.TB_IN_ALL_FILTERS_0 (TB_TOP_IN_ALL_FILTERS_0),
		.TB_IN_ALL_FILTERS_1 (TB_TOP_IN_ALL_FILTERS_1),
		.TB_IN_ALL_FILTERS_2 (TB_TOP_IN_ALL_FILTERS_2),
		.TB_IN_ALL_FILTERS_3 (TB_TOP_IN_ALL_FILTERS_3),
		.TB_OUT_ADD_BUF_COL_COUNTER (TB_TOP_OUT_ADD_BUF_COL_COUNTER),
		.TB_OUT_REG_BUF_COL_COUNTER (TB_TOP_OUT_REG_BUF_COL_COUNTER)
	);
	
	
	MV_gen_datapath MVGEN (
		.CLK (TOP_CLK),
		.RST_ASYNC_MV_GEN (wm_rst_mv_gen),
		.WRITE_REGS_COORDS (wm_wr_regs_coords),
		.WRITE_REGS_CPMVS (wm_wr_regs_cpmvs),
		.WRITE_REGS_GEN_MVS (wm_wr_regs_gen_mvs),
		.WRITE_REG_X (wm_wr_reg_x),
		.WRITE_REG_Y (wm_wr_reg_y),
		.WRITE_REG_COUNT_BLOCK (wm_wr_reg_count_block),
 		.SEL_X (wm_sel_x),
		.SEL_Y (wm_sel_y),
		.COORD_X (TOP_COORD_X),
		.COORD_Y (TOP_COORD_Y),
		.CPMV_0 (TOP_CPMV_0),
		.CPMV_1 (TOP_CPMV_1),
		.CPMV_2 (TOP_CPMV_2),
		.INTERP_X (wm_interp_x),
		.INTERP_Y (wm_interp_y),
		.CTRL_X (wm_ctrl_x),
		.CTRL_Y (wm_ctrl_y),
		.OUT_GEN_MV_X_INTEGER (TOP_OUT_GEN_MV_X_INTEGER),
		.OUT_GEN_MV_Y_INTEGER (TOP_OUT_GEN_MV_Y_INTEGER),
		.OUT_GEN_MV_X_FRAC (wi_frac_MV_X),
		.OUT_GEN_MV_Y_FRAC (wi_frac_MV_Y),
		
		.TB_OUT_MV_GEN_X (TB_TOP_OUT_MV_GEN_X),
		.TB_OUT_MV_GEN_Y (TB_TOP_OUT_MV_GEN_Y),
		.TB_OUT_REG_COORD_X (TB_TOP_OUT_REG_COORD_X),
		.TB_OUT_REG_COORD_Y (TB_TOP_OUT_REG_COORD_Y),
		.TB_OUT_REG_X (TB_TOP_OUT_REG_X),
		.TB_OUT_REG_Y (TB_TOP_OUT_REG_Y),
		.TB_OUT_REG_CPMV_0 (TB_TOP_OUT_REG_CPMV_0),
		.TB_OUT_REG_CPMV_1 (TB_TOP_OUT_REG_CPMV_1)
	);
	
	
	control FSM (
		.CLK_CTRL (TOP_CLK),
		.RESET_ALL (TOP_RESET),
		.START (TOP_START),
		.INTERP_X (wm_interp_x), 
		.INTERP_Y (wm_interp_y),
		.CTRL_X (wm_ctrl_x), 
		.CTRL_Y (wm_ctrl_y),
		.LOOP_3 (wi_loop_3),
		.LOOP_4 (wi_loop_4),
		.LOOP_9 (wi_loop_9),
		.LOOP_13 (wi_loop_13),
		.LOOP_14 (wi_loop_14),
		.RST_ASYNC_MV_GEN (wm_rst_mv_gen),
		.WRITE_REGS_COORDS (wm_wr_regs_coords),
		.WRITE_REGS_CPMVS (wm_wr_regs_cpmvs),
		.WRITE_REGS_GEN_MVS (wm_wr_regs_gen_mvs),
		.WRITE_REG_X (wm_wr_reg_x),
		.WRITE_REG_Y (wm_wr_reg_y),
		.WRITE_REG_COUNT_BLOCK (wm_wr_reg_count_block),
		.SEL_X (wm_sel_x),
		.SEL_Y (wm_sel_y),
		.RST_ASYNC_INTERP (wi_rst_interp),
		.RST_ASYNC_REG_COUNTER (wi_rst_reg_counter),
		.RST_ASYNC_REG_BUF_COL_COUNTER (wi_rst_reg_buf_col_counter),
		.WRITE_REG_INPUT_LINE (wi_wr_reg_input_line),
		.WRITE_REG_COUNTER (wi_wr_reg_counter),
		.WRITE_REG_BUF_COL_COUNTER (wi_wr_reg_buf_col_counter),
		.WRITE_REG_INT_OUT (wi_wr_reg_int_out),
		.WRITE_BUFFER (wi_wr_buffer),
		.SEL_BUFFER_IN (wi_sel_buffer_in),
		.SEL_INTERP_LINE_IN (wi_sel_interp_in),
		.SEL_DIMENSION (wi_sel_dimension),
		.FLAG_INT_OUT (TOP_FLAG_INT_OUT),
		.DONE_ALL (TOP_DONE_ALL),
		
		.TB_STATE_NUM (TB_TOP_STATE_NUM)
	);
	
	
endmodule // affine_tcc




