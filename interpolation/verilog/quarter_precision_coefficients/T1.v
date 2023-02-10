/*------------------------------------------------------------------------------
 * File: T0.v
 * Date generated: 09/02/2023
 * Date modified: 09/02/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM for tap-0 coefficients of Affine interpolation
 *------------------------------------------------------------------------------ */

module multiplier_block (
    X,            // input
    Y1,           // -8
    Y2,           // -11
    Y3            // -8
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
    w3,
    w8,
    w11,
    w8_,
    w11_;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w8 = w1 << 3;
  assign w11 = w3 + w8;
  assign w8_ = -1 * w8;
  assign w11_ = -1 * w11;

  assign Y[0] = w8_;
  assign Y[1] = w11_;
  assign Y[2] = w8_;

endmodule //multiplier_block

