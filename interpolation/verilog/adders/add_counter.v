/*-----------------------------------------------------------------------------------
* File: add_counter.v
* Date generated: 25/03/2023
* Date modified: 27/05/2023
* Author: Bruna Suemi Nagai
* Description: Adder to control the loops. It must count until 13. And its result also selects the buffer column to be read.
*----------------------------------------------------------------------------------- */

module add_counter (
  input unsigned [3:0] A,
  input unsigned [3:0] B,
  output reg unsigned [3:0] C
);
    

// ------------------------------------------
// Combinational logic
// ------------------------------------------
always @ (A or B) begin
  C = A + B;
end
endmodule // add_counter
    