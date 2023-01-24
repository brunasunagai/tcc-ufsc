 /*------------------------------------------------------------------------------
 * Spiral generated
 * MCM for: 63	62	60	58	52	47	45	40	34	31	26	17	13	8	4
 *------------------------------------------------------------------------------ */

module A3_affine (
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
  input  signed  [7:0] X;
  output signed  [15:0] Y1;
  output signed  [15:0] Y2;
  output signed  [15:0] Y3;
  output signed  [15:0] Y4;
  output signed  [15:0] Y5;
  output signed  [15:0] Y6;
  output signed  [15:0] Y7;
  output signed  [15:0] Y8;
  output signed  [15:0] Y9;
  output signed  [15:0] Y10;
  output signed  [15:0] Y11;
  output signed  [15:0] Y12;
  output signed  [15:0] Y13;
  output signed  [15:0] Y14;
  output signed  [15:0] Y15;

  wire [15:0] AX_Y1;
  wire [15:0] AX_Y2;
  wire [15:0] AX_Y3;
  wire [15:0] AX_Y4;
  wire [15:0] AX_Y5;
  wire [15:0] AX_Y6;
  wire [15:0] AX_Y7;
  wire [15:0] AX_Y8;
  wire [15:0] AX_Y9;
  wire [15:0] AX_Y10;
  wire [15:0] AX_Y11;
  wire [15:0] AX_Y12;
  wire [15:0] AX_Y13;
  wire [15:0] AX_Y14;
  wire [15:0] AX_Y15;

  assign Y1 = AX_Y1;
  assign Y2 = AX_Y2;
  assign Y3 = AX_Y3;
  assign Y4 = AX_Y4;
  assign Y5 = AX_Y5;
  assign Y6 = AX_Y6;
  assign Y7 = AX_Y7;
  assign Y8 = AX_Y8;
  assign Y9 = AX_Y9;
  assign Y10 = AX_Y10;
  assign Y11 = AX_Y11;
  assign Y12 = AX_Y12;
  assign Y13 = AX_Y13;
  assign Y14 = AX_Y14;
  assign Y15 = AX_Y15;

  //Multipliers:

  wire signed [15:0] w1;
  wire signed [15:0] w4;
  wire signed [15:0] w5;
  wire signed [15:0] w16;
  wire signed [15:0] w15;
  wire signed [15:0] w17;
  wire signed [15:0] w32;
  wire signed [15:0] w31;
  wire signed [15:0] w64;
  wire signed [15:0] w63;
  wire signed [15:0] w8;
  wire signed [15:0] w13;
  wire signed [15:0] w30;
  wire signed [15:0] w29;
  wire signed [15:0] w40;
  wire signed [15:0] w45;
  wire signed [15:0] w47;
  wire signed [15:0] w62;
  wire signed [15:0] w60;
  wire signed [15:0] w58;
  wire signed [15:0] w52;
  wire signed [15:0] w34;
  wire signed [15:0] w26;

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
  assign w62 = w31 << 1;
  assign w60 = w15 << 2;
  assign w58 = w29 << 1;
  assign w52 = w13 << 2;
  assign w34 = w17 << 1;
  assign w26 = w13 << 1;

  assign AX_Y1 = w63;
  assign AX_Y2 = w62;
  assign AX_Y3 = w60;
  assign AX_Y4 = w58;
  assign AX_Y5 = w52;
  assign AX_Y6 = w47;
  assign AX_Y7 = w45;
  assign AX_Y8 = w40;
  assign AX_Y9 = w34;
  assign AX_Y10 = w31;
  assign AX_Y11 = w26;
  assign AX_Y12 = w17;
  assign AX_Y13 = w13;
  assign AX_Y14 = w8;
  assign AX_Y15 = w4;

endmodule //A3_affine

