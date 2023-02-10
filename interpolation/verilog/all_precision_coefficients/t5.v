/*------------------------------------------------------------------------------
 * File: t5.v
 * Date generated: 10/02/2023
 * Date modified: 10/02/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM filter for 1/16 precision coefficients - Tap 5
 *------------------------------------------------------------------------------ */

module t5 (
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
    w2;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w2 = w1 << 1;

  assign Y[0] = w1;
  assign Y[1] = w1;
  assign Y[2] = w1;
  assign Y[3] = w1;
  assign Y[4] = w2;
  assign Y[5] = w3;
  assign Y[6] = w3;
  assign Y[7] = w3;
  assign Y[8] = w3;
  assign Y[9] = w2;
  assign Y[10] = w3;
  assign Y[11] = w3;
  assign Y[12] = w2;
  assign Y[13] = w1;
  assign Y[14] = w1;

endmodule //multiplier_block

