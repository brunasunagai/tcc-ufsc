/*-----------------------------------------------------------------------------------
* File: mux_sel_buffer_column.v
* Date generated: 25/03/2023
* Date modified: 11/05/2023
* Author: Bruna Suemi Nagai
* Description: Selects the column to be read from the transposed buffer.
*----------------------------------------------------------------------------------- */

module mux_sel_buffer_column (
  input unsigned [98:0] DATA_IN_1,
  input unsigned [98:0] DATA_IN_2,
  input unsigned [98:0] DATA_IN_3,
  input unsigned [98:0] DATA_IN_4,
  input [2:0] SELECT,
  output reg unsigned [98:0] DATA_OUT
);
    

// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @ (SELECT or DATA_IN_1 or DATA_IN_2 or DATA_IN_3 or DATA_IN_4)
  case (SELECT)
	default: DATA_OUT = 99'b0;
	3'b001: DATA_OUT = DATA_IN_1;
	3'b010: DATA_OUT = DATA_IN_2;
	3'b011: DATA_OUT = DATA_IN_3;
	3'b100: DATA_OUT = DATA_IN_4;
  endcase

endmodule // mux_sel_buffer_column
    