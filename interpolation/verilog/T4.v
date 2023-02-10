/*------------------------------------------------------------------------------
 * File: T4.v
 * Date generated: 09/02/2023
 * Date modified: 09/02/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM for tap-4 coefficients of Affine interpolation
 *------------------------------------------------------------------------------ */

module multiplier_block (
    X,            // input 
    Y1,           // -4
    Y2,           // -10
    Y3            // -11
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
    w5,
    w16,
    w11,
    w4_,
    w10,
    w10_,
    w11_;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w5 = w1 + w4;
  assign w16 = w1 << 4;
  assign w11 = w16 - w5;
  assign w4_ = -1 * w4;
  assign w10 = w5 << 1;
  assign w10_ = -1 * w10;
  assign w11_ = -1 * w11;

  assign Y[0] = w4_;
  assign Y[1] = w10_;
  assign Y[2] = w11_;

endmodule //multiplier_block

