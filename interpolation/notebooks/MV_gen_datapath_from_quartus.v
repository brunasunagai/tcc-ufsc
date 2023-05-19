/*-----------------------------------------------------------------------------------
* File: MV_gen_datapath.v
* Date generated: 25/03/2023
* Date modified: 19/05/2023
* Author: Bruna Suemi Nagai
* Description: Motion Vector Generator datapath.
*----------------------------------------------------------------------------------- */

module MV_gen_datapath (
  input CLK,
  input RST_ASYNC_MV_GEN,					// Set of reg resets: coord_X, coord_Y, X, Y, MV_0, MV_1, gen_MV_X, gen_MV_Y and count_block.
  input WRITE_REGS_COORDS,				// Enable writing to registers coord_X and coord_Y.
  input WRITE_REGS_CPMVS,					// Enable writing to registers MV_0 and MV_1.
  input WRITE_REGS_GEN_MVS,			// Enable writing to registers gen_MV_X and gen_MV_Y.
  input WRITE_REG_X,					// Enable writing for reg_X.
  input WRITE_REG_Y,					// Enable writing for reg_Y.
  input WRITE_REG_COUNT_BLOCK,			// Enable writing for reg_count_block.
  input SEL_X,					// Select: 0 - original X coord; 1: incremented X coord.
  input SEL_Y,					// Select: 0 - original Y coord; 1: incremented Y coord.
  input signed [7:0] COORD_X,			// First X coordenate.
  input signed [7:0] COORD_Y,			// First Y coordenate.
  input signed [15:0] CPMV_0,			// Motion vector 0. MSB = x component, LSB = y component.
  input signed [15:0] CPMV_1,			// Motion vector 1. MSB = x component, LSB = y component.
  output wire INTERP_X,				// Interpolate horizontally? 0: No. 1: Yes.
  output wire INTERP_Y,				// Interpolate vertically? 0: No. 1: Yes.
  output wire CTRL_X,				// {ctrl_X, ctrl_Y}? 00: Done all. 01: Next column. 10: Next line. 11: Next column.
  output wire CTRL_Y,				// {ctrl_X, ctrl_Y}? 00: Done all. 01: Next column. 10: Next line. 11: Next column.
  output wire [14:0] OUT_GEN_MV_X_INTEGER,
  output wire [14:0] OUT_GEN_MV_Y_INTEGER,
  output wire [3:0] OUT_GEN_MV_X_FRAC,
  output wire [3:0] OUT_GEN_MV_Y_FRAC,
  
  output wire [18:0] TB_OUT_GEN_MV_X,
  output wire [18:0] TB_OUT_GEN_MV_Y
);


// ------------------------------------------
// Signals declarations
// ------------------------------------------
  wire signed [7:0] OUT_REG_COORD_X;			// Max = 0111 1111 = 127
  wire signed [7:0] OUT_REG_COORD_Y;			// Max = 0111 1111 = 127
  wire signed [7:0] OUT_REG_X;					// Max = 0111 1111 = 127
  wire signed [7:0] OUT_REG_Y;					// Max = 0111 1111 = 127
  wire signed [15:0] OUT_REG_CPMV_0;			// MSB: horizontal, LSB: vertical
  wire signed [15:0] OUT_REG_CPMV_1;			// MSB: horizontal, LSB: vertical
  wire signed [18:0] OUT_REG_GEN_MV_X;
  wire signed [18:0] OUT_REG_GEN_MV_Y;
  wire [3:0] OUT_REG_COUNT_BLOCK;
  wire signed [7:0] OUT_ADD_X;
  wire signed [7:0] OUT_ADD_Y;
  wire [3:0] OUT_ADD_COUNT_BLOCK;
  wire signed [7:0] OUT_MUX_X;
  wire signed [7:0] OUT_MUX_Y;
  wire signed [18:0] OUT_MV_GEN_X;
  wire signed [18:0] OUT_MV_GEN_Y;


// ------------------------------------------
// Modules instantiation
// ------------------------------------------
  reg_coord REG_COORD_X (		//Reg to store the X coord
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REGS_COORDS),
	.DATA_IN (COORD_X),
	.DATA_OUT (OUT_REG_COORD_X));

  reg_coord REG_COORD_Y (		//Reg to store the Y coord
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REGS_COORDS),
	.DATA_IN (COORD_Y),
	.DATA_OUT (OUT_REG_COORD_Y));

  reg_coord REG_X (		//Reg to store incremented X coord
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REG_X),
	.DATA_IN (OUT_MUX_X),
	.DATA_OUT (OUT_REG_X));

  reg_coord REG_Y (		//Reg to store incremented Y coord
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REG_Y),
	.DATA_IN (OUT_MUX_Y),
	.DATA_OUT (OUT_REG_Y));

  reg_MV REG_CPMV_0 (		//Reg to store original CPMV_0
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REGS_CPMVS),
	.DATA_IN (CPMV_0),
	.DATA_OUT (OUT_REG_CPMV_0));

  reg_MV REG_CPMV_1 (		//Reg to store original CPMV_1
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REGS_CPMVS),
	.DATA_IN (CPMV_1),
	.DATA_OUT (OUT_REG_CPMV_1));

  reg_gen_MV REG_GEN_MV_X (		//
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REGS_GEN_MVS),
	.DATA_IN (OUT_MV_GEN_X),
	.DATA_OUT (OUT_REG_GEN_MV_X));

  reg_gen_MV REG_GEN_MV_Y (		//
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REGS_GEN_MVS),
	.DATA_IN (OUT_MV_GEN_Y),
	.DATA_OUT (OUT_REG_GEN_MV_Y));

  reg_count_block REG_COUNT_BLOCK (		//Reg to storE block-to-be-processed position
	.CLK (CLK),
	.RST_ASYNC_N (RST_ASYNC_MV_GEN),
	.WRITE_EN (WRITE_REG_COUNT_BLOCK),
	.DATA_IN (OUT_ADD_COUNT_BLOCK),
	.DATA_OUT (OUT_REG_COUNT_BLOCK));

  add_coords ADD_X (		//Adder to increment the X coord
	.A (8'b1),
	.B (OUT_REG_X),
	.C (OUT_ADD_X));

  add_coords ADD_Y (		//Adder to increment the Y coord
	.A (8'b1),
	.B (OUT_REG_Y),
	.C (OUT_ADD_Y));

  add_count_block ADD_COUNT_BLOCK (		//Adder to set the block to be processed
	.A (4'b1),
	.B (OUT_REG_COUNT_BLOCK),
	.C (OUT_ADD_COUNT_BLOCK));

  mux_sel_coord MUX_X (		//
	.DATA_IN_0 (OUT_REG_COORD_X),
	.DATA_IN_1 (OUT_ADD_X),
	.SELECT (SEL_X),
	.DATA_OUT (OUT_MUX_X));

  mux_sel_coord MUX_Y (		//
	.DATA_IN_0 (OUT_REG_COORD_Y),
	.DATA_IN_1 (OUT_ADD_Y),
	.SELECT (SEL_Y),
	.DATA_OUT (OUT_MUX_Y));

  MV_generator_4 MVGEN4 (		//Motion Vector generator of 4 parameters
	.X_COORD (OUT_REG_X),
	.Y_COORD (OUT_REG_Y),
	.MV_0_H (OUT_REG_CPMV_0[15:8]),
	.MV_1_H (OUT_REG_CPMV_1[15:8]),
	.MV_0_V (OUT_REG_CPMV_0[7:0]),
	.MV_1_V (OUT_REG_CPMV_1[7:0]),
	.MV_H_OUT (OUT_MV_GEN_X),
	.MV_V_OUT (OUT_MV_GEN_Y));


// ------------------------------------------
// Outputs
// ------------------------------------------
  assign OUT_GEN_MV_X_INTEGER = OUT_REG_GEN_MV_X[18:4];
  assign OUT_GEN_MV_Y_INTEGER = OUT_REG_GEN_MV_Y[18:4];
  assign OUT_GEN_MV_X_FRAC = OUT_REG_GEN_MV_X[3:0];
  assign OUT_GEN_MV_Y_FRAC = OUT_REG_GEN_MV_Y[3:0];
  assign INTERP_X = OUT_MV_GEN_X[0] | OUT_MV_GEN_X[1] | OUT_MV_GEN_X[2] | OUT_MV_GEN_X[3];
  assign INTERP_Y = OUT_MV_GEN_X[0] | OUT_MV_GEN_X[1] | OUT_MV_GEN_X[2] | OUT_MV_GEN_X[3];
  assign CTRL_X = OUT_REG_COUNT_BLOCK[2] ^ 1'b1 | OUT_REG_COUNT_BLOCK[3] ^ 1'b1;
  assign CTRL_Y = OUT_REG_COUNT_BLOCK[0] ^ 1'b1 | OUT_REG_COUNT_BLOCK[1] ^ 1'b1;

  assign TB_OUT_GEN_MV_X = OUT_MV_GEN_X;
  assign TB_OUT_GEN_MV_Y = OUT_MV_GEN_Y;

endmodule // MV_gen_datapath
