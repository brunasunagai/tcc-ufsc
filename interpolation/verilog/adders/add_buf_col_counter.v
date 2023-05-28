/*-----------------------------------------------------------------------------------
* File: add_buf_col_counter.v
* Date generated: 25/03/2023
* Date modified: 27/05/2023
* Author: Bruna Suemi Nagai
* Description: Adder to select the buffer columnn
*----------------------------------------------------------------------------------- */

module add_buf_col_counter (
  input  [1:0] A,
  input  [1:0] B,
  output reg  [1:0] C
);
    

// ------------------------------------------
// Combinational logic
// ------------------------------------------
always @ (A or B) begin
  C = A + B;
end
endmodule // add_buf_col_counter
    