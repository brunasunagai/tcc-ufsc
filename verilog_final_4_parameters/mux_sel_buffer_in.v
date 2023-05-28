/*-----------------------------------------------------------------------------------
* File: mux_sel_buffer_in.v
* Date generated: 25/03/2023
* Date modified: 15/05/2023
* Author: Bruna Suemi Nagai
* Description: Selects between interpolation output (0) or external integer samples (1).
*----------------------------------------------------------------------------------- */

module mux_sel_buffer_in (
  input signed [13:0] DATA_IN_0,
  input signed [13:0] DATA_IN_1,
  input [0:0] SELECT,
  output reg signed [13:0] DATA_OUT
);
    

// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @ (SELECT or DATA_IN_0 or DATA_IN_1)
  case (SELECT)
	1'b0: DATA_OUT = DATA_IN_0;
	1'b1: DATA_OUT = DATA_IN_1;
  endcase

endmodule // mux_sel_buffer_in
    