/*-----------------------------------------------------------------------------------
* File: mux_sel_filter.v
* Date generated: 25/03/2023
* Date modified: 25/05/2023
* Author: Bruna Suemi Nagai
* Description: Selects between the 15 outputs from interpolation.
*----------------------------------------------------------------------------------- */

module mux_sel_filter (
  input signed [13:0] DATA_IN_1,
  input signed [13:0] DATA_IN_2,
  input signed [13:0] DATA_IN_3,
  input signed [13:0] DATA_IN_4,
  input signed [13:0] DATA_IN_5,
  input signed [13:0] DATA_IN_6,
  input signed [13:0] DATA_IN_7,
  input signed [13:0] DATA_IN_8,
  input signed [13:0] DATA_IN_9,
  input signed [13:0] DATA_IN_10,
  input signed [13:0] DATA_IN_11,
  input signed [13:0] DATA_IN_12,
  input signed [13:0] DATA_IN_13,
  input signed [13:0] DATA_IN_14,
  input signed [13:0] DATA_IN_15,
  input [3:0] SELECT,
  output reg signed [13:0] DATA_OUT
);
    

// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @ (SELECT or DATA_IN_1 or DATA_IN_2 or DATA_IN_3 or DATA_IN_4 or DATA_IN_5 or DATA_IN_6 or DATA_IN_7 or DATA_IN_8 or DATA_IN_9 or DATA_IN_10 or DATA_IN_11 or DATA_IN_12 or DATA_IN_13 or DATA_IN_14 or DATA_IN_15)
  case (SELECT)
	default: DATA_OUT = 14'b0;
	4'b0001: DATA_OUT = DATA_IN_1;
	4'b0010: DATA_OUT = DATA_IN_2;
	4'b0011: DATA_OUT = DATA_IN_3;
	4'b0100: DATA_OUT = DATA_IN_4;
	4'b0101: DATA_OUT = DATA_IN_5;
	4'b0110: DATA_OUT = DATA_IN_6;
	4'b0111: DATA_OUT = DATA_IN_7;
	4'b1000: DATA_OUT = DATA_IN_8;
	4'b1001: DATA_OUT = DATA_IN_9;
	4'b1010: DATA_OUT = DATA_IN_10;
	4'b1011: DATA_OUT = DATA_IN_11;
	4'b1100: DATA_OUT = DATA_IN_12;
	4'b1101: DATA_OUT = DATA_IN_13;
	4'b1110: DATA_OUT = DATA_IN_14;
	4'b1111: DATA_OUT = DATA_IN_15;
  endcase

endmodule // mux_sel_filter
    