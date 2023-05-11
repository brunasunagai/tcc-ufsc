/*-----------------------------------------------------------------------------------
* File: add_coords.v
* Date generated: 25/03/2023
* Date modified: 09/05/2023
* Author: Bruna Suemi Nagai
* Description: Adds the original coord value plus 1. Works for X and Y coords.
*----------------------------------------------------------------------------------- */

module add_coords (
  input [7:0] A,
  input [7:0] B,
  output reg [7:0] C
);
    

// ------------------------------------------
// Combinational logic
// ------------------------------------------
always @ (A or B) begin
  C = A + B;
end
endmodule // add_coords
    