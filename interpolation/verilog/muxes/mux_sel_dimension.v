/*-----------------------------------------------------------------------------------
* File: mux_sel_dimension.v
* Date generated: 25/03/2023
* Date modified: 11/05/2023
* Author: Bruna Suemi Nagai
* Description: Selects between the MV_Y LSB (0) or the MV_X LSB (1).
*----------------------------------------------------------------------------------- */

module mux_sel_dimension (
  input unsigned [3:0] DATA_IN_0,
  input unsigned [3:0] DATA_IN_1,
  input [0:0] SELECT,
  output reg unsigned [3:0] DATA_OUT
);
    

// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @ (SELECT or DATA_IN_0 or DATA_IN_1)
  case (SELECT)
	1'b0: DATA_OUT = DATA_IN_0;
	1'b1: DATA_OUT = DATA_IN_1;
  endcase

endmodule // mux_sel_dimension
    