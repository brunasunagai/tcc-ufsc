/*------------------------------------------------------------------------------
 * File: t1.v
 * Date generated: 10/02/2023
 * Date modified: 10/02/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM filter for 1/16 precision coefficients - Tap 1
 *------------------------------------------------------------------------------ */

module t1 (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8,
    Y9,
    Y10,
    Y11,
    Y12,
    Y13,
    Y14,
    Y15
);

  // Port mode declarations:
  input  signed  [31:0] X;
  output signed  [31:0]
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8,
    Y9,
    Y10,
    Y11,
    Y12,
    Y13,
    Y14,
    Y15;

  wire [31:0] Y [0:14];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];
  assign Y6 = Y[5];
  assign Y7 = Y[6];
  assign Y8 = Y[7];
  assign Y9 = Y[8];
  assign Y10 = Y[9];
  assign Y11 = Y[10];
  assign Y12 = Y[11];
  assign Y13 = Y[12];
  assign Y14 = Y[13];
  assign Y15 = Y[14];

  //Multipliers:

  wire signed [31:0]
    w1,
    w4,
    w3,
    w5,
    w8,
    w9,
    w11,
    w3_,
    w5_,
    w8_,
    w10,
    w10_,
    w11_,
    w9_,
    w4_,
    w2,
    w2_;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w5 = w1 + w4;
  assign w8 = w1 << 3;
  assign w9 = w1 + w8;
  assign w11 = w3 + w8;
  assign w3_ = -1 * w3;
  assign w5_ = -1 * w5;
  assign w8_ = -1 * w8;
  assign w10 = w5 << 1;
  assign w10_ = -1 * w10;
  assign w11_ = -1 * w11;
  assign w9_ = -1 * w9;
  assign w4_ = -1 * w4;
  assign w2 = w1 << 1;
  assign w2_ = -1 * w2;

  assign Y[0] = w3_;
  assign Y[1] = w5_;
  assign Y[2] = w8_;
  assign Y[3] = w10_;
  assign Y[4] = w11_;
  assign Y[5] = w9_;
  assign Y[6] = w11_;
  assign Y[7] = w11_;
  assign Y[8] = w10_;
  assign Y[9] = w10_;
  assign Y[10] = w8_;
  assign Y[11] = w5_;
  assign Y[12] = w4_;
  assign Y[13] = w3_;
  assign Y[14] = w2_;

endmodule //multiplier_block

