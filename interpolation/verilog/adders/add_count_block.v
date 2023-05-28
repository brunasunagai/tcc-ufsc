/*-----------------------------------------------------------------------------------
* File: add_count_block.v
* Date generated: 25/03/2023
* Date modified: 27/05/2023
* Author: Bruna Suemi Nagai
* Description: Adder to control which sample will be processed.
*----------------------------------------------------------------------------------- */

module add_count_block (
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
endmodule // add_count_block
    