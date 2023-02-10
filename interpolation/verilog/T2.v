/*------------------------------------------------------------------------------
 * File: T2.v
 * Date generated: 09/02/2023
 * Date modified: 09/02/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM for tap-2 coefficients of Affine interpolation
 *------------------------------------------------------------------------------ */

module multiplier_block (
    X,            // input
    Y1,           // 60
    Y2,           // 45 
    Y3            // 26
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
    w15,
    w2,
    w13,
    w60,
    w45,
    w26;

  assign w1 = X;
  assign w16 = w1 << 4;
  assign w15 = w16 - w1;
  assign w2 = w1 << 1;
  assign w13 = w15 - w2;
  assign w60 = w15 << 2;
  assign w45 = w60 - w15;
  assign w26 = w13 << 1;

  assign Y[0] = w60;
  assign Y[1] = w45;
  assign Y[2] = w26;

endmodule //multiplier_block

