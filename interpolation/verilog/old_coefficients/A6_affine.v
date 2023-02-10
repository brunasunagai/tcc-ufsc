 /*------------------------------------------------------------------------------
 * Spiral generated
 * MCM for: 1	1	1	1	3	4	4	4	4	3	4	4	3	2	1
 *------------------------------------------------------------------------------ */

module A6_affine (
    X,
    Y1,
    Y2,
    Y3,
    Y4
);

  // Port mode declarations:
  input  signed  [7:0] X;
  output signed  [15:0] Y1;
  output signed  [15:0] Y2;
  output signed  [15:0] Y3;
  output signed  [15:0] Y4;

  wire [15:0] AX_Y1;
  wire [15:0] AX_Y2;
  wire [15:0] AX_Y3;
  wire [15:0] AX_Y4;

  assign Y1 = AX_Y1;
  assign Y2 = AX_Y2;
  assign Y3 = AX_Y3;
  assign Y4 = AX_Y4;

  //Multipliers:

  wire signed [15:0] w1;
  wire signed [15:0] w4;
  wire signed [15:0] w3;
  wire signed [15:0] w2;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w2 = w1 << 1;

  assign AX_Y1 = w1;
  assign AX_Y2 = w2;
  assign AX_Y3 = w3;
  assign AX_Y4 = w4;

endmodule // A6_affine
