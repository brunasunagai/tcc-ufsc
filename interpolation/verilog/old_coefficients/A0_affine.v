/*------------------------------------------------------------------------------
 * Spiral generated
 * MCM for: 0 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0 0
 *------------------------------------------------------------------------------ */

module A0_affine (
    X,
    Y
);

  // Port mode declarations:
  input  signed  [7:0] X;
  output signed  [15:0] Y;

  //Multipliers:

  wire signed [15:0]
    w1,
    w1_;

  assign w1 = X;
  assign w1_ = -1 * w1;

  assign Y = w1_;

endmodule //A0_affine