/*------------------------------------------------------------------------------
 * File: T3.v
 * Date generated: 09/02/2023
 * Date modified: 09/02/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM for tap-3 coefficients of Affine interpolation
 *------------------------------------------------------------------------------ */

module multiplier_block (
    X,            // input
    Y1,           // 13 
    Y2,           // 34 
    Y3            // 52
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
    w16,
    w17,
    w4,
    w13,
    w34,
    w52;

  assign w1 = X;
  assign w16 = w1 << 4;
  assign w17 = w1 + w16;
  assign w4 = w1 << 2;
  assign w13 = w17 - w4;
  assign w34 = w17 << 1;
  assign w52 = w13 << 2;

  assign Y[0] = w13;
  assign Y[1] = w34;
  assign Y[2] = w52;

endmodule //multiplier_block

