/*-----------------------------------------------------------------------------------
* File: mux_sel_buffer_column.v
* Date generated: 25/03/2023
* Date modified: 23/05/2023
* Author: Bruna Suemi Nagai
* Description: Selects the column to be read from the transposed buffer.
*----------------------------------------------------------------------------------- */

module mux_sel_buffer_column (
  input unsigned [98:0] DATA_IN_2,
  input unsigned [98:0] DATA_IN_3,
  input unsigned [98:0] DATA_IN_4,
  input unsigned [98:0] DATA_IN_5,
  input [1:0] SELECT,
  output reg unsigned [98:0] DATA_OUT
);
    

// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @ (SELECT or DATA_IN_2 or DATA_IN_3 or DATA_IN_4 or DATA_IN_5)
  case (SELECT)
   2'b00: DATA_OUT = DATA_IN_2;
	2'b01: DATA_OUT = DATA_IN_3;
	2'b10: DATA_OUT = DATA_IN_4;
	2'b11: DATA_OUT = DATA_IN_5;
  endcase

endmodule // mux_sel_buffer_column
    