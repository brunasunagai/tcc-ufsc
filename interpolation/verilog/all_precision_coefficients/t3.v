/*------------------------------------------------------------------------------
 * File: t3.v
 * Date generated: 10/02/2023
 * Date modified: 10/02/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM filter for 1/16 precision coefficients - Tap 3
 *------------------------------------------------------------------------------ */

module t3 (
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
    w5,
    w16,
    w15,
    w17,
    w32,
    w31,
    w64,
    w63,
    w8,
    w13,
    w30,
    w29,
    w40,
    w45,
    w47,
    w26,
    w34,
    w52,
    w58,
    w60,
    w62;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w5 = w1 + w4;
  assign w16 = w1 << 4;
  assign w15 = w16 - w1;
  assign w17 = w1 + w16;
  assign w32 = w1 << 5;
  assign w31 = w32 - w1;
  assign w64 = w1 << 6;
  assign w63 = w64 - w1;
  assign w8 = w1 << 3;
  assign w13 = w5 + w8;
  assign w30 = w15 << 1;
  assign w29 = w30 - w1;
  assign w40 = w5 << 3;
  assign w45 = w5 + w40;
  assign w47 = w15 + w32;
  assign w26 = w13 << 1;
  assign w34 = w17 << 1;
  assign w52 = w13 << 2;
  assign w58 = w29 << 1;
  assign w60 = w15 << 2;
  assign w62 = w31 << 1;

  assign Y[0] = w4;
  assign Y[1] = w8;
  assign Y[2] = w13;
  assign Y[3] = w17;
  assign Y[4] = w26;
  assign Y[5] = w31;
  assign Y[6] = w34;
  assign Y[7] = w40;
  assign Y[8] = w45;
  assign Y[9] = w47;
  assign Y[10] = w52;
  assign Y[11] = w58;
  assign Y[12] = w60;
  assign Y[13] = w62;
  assign Y[14] = w63;

endmodule //multiplier_block

