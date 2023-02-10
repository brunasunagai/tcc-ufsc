/*------------------------------------------------------------------------------
 * Spiral generated
 * MCM for: -3	-5	-8	-10	-11	-9	-11	-11	-10	-10	-8	-5	-4	-3	-2
 *------------------------------------------------------------------------------ */

// A2:  [12, 12, 12, 12, 12, 11, 11, 10]
module A2_affine (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8
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

  wire [15:0] AX_Y1;
  wire [15:0] AX_Y2;
  wire [15:0] AX_Y3;
  wire [15:0] AX_Y4;
  wire [15:0] AX_Y5;
  wire [15:0] AX_Y6;
  wire [15:0] AX_Y7;
  wire [15:0] AX_Y8;

  assign Y1 = AX_Y1;
  assign Y2 = AX_Y2;
  assign Y3 = AX_Y3;
  assign Y4 = AX_Y4;
  assign Y5 = AX_Y5;
  assign Y6 = AX_Y6;
  assign Y7 = AX_Y7;
  assign Y8 = AX_Y8;

  //Multipliers:

  wire signed [15:0] w1;
  wire signed [15:0] w4;
  wire signed [15:0] w3;
  wire signed [15:0] w5;
  wire signed [15:0] w8;
  wire signed [15:0] w9;
  wire signed [15:0] w11;
  wire signed [15:0] w2;
  wire signed [15:0] w2_;
  wire signed [15:0] w3_;
  wire signed [15:0] w4_;
  wire signed [15:0] w5_;
  wire signed [15:0] w8_;
  wire signed [15:0] w10;
  wire signed [15:0] w10_;
  wire signed [15:0] w11_;
  wire signed [15:0] w9_;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w5 = w1 + w4;
  assign w8 = w1 << 3;
  assign w9 = w1 + w8;
  assign w11 = w3 + w8;
  assign w2 = w1 << 1;
  assign w2_ = -1 * w2;
  assign w3_ = -1 * w3;
  assign w4_ = -1 * w4;
  assign w5_ = -1 * w5;
  assign w8_ = -1 * w8;
  assign w10 = w5 << 1;
  assign w10_ = -1 * w10;
  assign w11_ = -1 * w11;
  assign w9_ = -1 * w9;

  assign AX_Y1 = w11_;
  assign AX_Y2 = w10_;
  assign AX_Y3 = w9_;
  assign AX_Y4 = w8_;
  assign AX_Y5 = w5_;
  assign AX_Y6 = w4_;
  assign AX_Y7 = w3_;
  assign AX_Y8 = w2_;
  

endmodule //A2_affine

