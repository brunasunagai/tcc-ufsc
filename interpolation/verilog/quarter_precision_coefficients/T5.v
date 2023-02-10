/*------------------------------------------------------------------------------
 * File: T5.v
 * Date generated: 09/02/2023
 * Date modified: 09/02/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM for tap-5 coefficients of Affine interpolation
 *------------------------------------------------------------------------------ */

module multiplier_block (
    X,            // input
    Y1,           // 1 
    Y2,           // 3
    Y3            // 3
);

  // Port mode declarations:
  input  signed  [31:0] X;
  output signed  [31:0]
    Y1,
    Y2,
    Y3;

  wire [31:0] Y [0:2];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];

  //Multipliers:

  wire signed [31:0]
    w1,
    w4,
    w3;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;

  assign Y[0] = w1;
  assign Y[1] = w3;
  assign Y[2] = w3;

endmodule //multiplier_block

