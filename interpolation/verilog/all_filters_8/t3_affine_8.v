/*------------------------------------------------------------------------------
 * File: t3_affine_8.v
 * Date generated: 10/02/2023
 * Date modified: 08/05/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM filter for 1/16 precision coefficients - Tap 3
 *------------------------------------------------------------------------------ */

module t3_affine_8 (
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


// ------------------------------------------
// Port mode declarations
// ------------------------------------------
  input  signed  [7:0] X;
  output signed [9:0]	 Y1;
  output signed [10:0]	 Y2;
  output signed [11:0]	 Y3;
  output signed [12:0]	 Y4;
  output signed [12:0]	 Y5;
  output signed [12:0]	 Y6;
  output signed [13:0]	 Y7;
  output signed [13:0]	 Y8;
  output signed [13:0]	 Y9;
  output signed [13:0]	 Y10;
  output signed [13:0]	 Y11;
  output signed [13:0]	 Y12;
  output signed [13:0]	 Y13;
  output signed [13:0]	 Y14;
  output signed [13:0]	 Y15;


// ------------------------------------------
// Wires declarations
// ------------------------------------------
  wire signed [7:0] w1;
  wire signed [9:0] w4;
  wire signed [10:0] w5;
  wire signed [11:0] w16;
  wire signed [11:0] w15;
  wire signed [12:0] w17;
  wire signed [12:0] w32;
  wire signed [12:0] w31;
  wire signed [13:0] w64;
  wire signed [13:0] w63;
  wire signed [10:0] w8;
  wire signed [11:0] w13;
  wire signed [12:0] w30;
  wire signed [12:0] w29;
  wire signed [13:0] w40;
  wire signed [13:0] w45;
  wire signed [13:0] w47;
  wire signed [12:0] w26;
  wire signed [13:0] w34;
  wire signed [13:0] w52;
  wire signed [13:0] w58;
  wire signed [13:0] w60;
  wire signed [13:0] w62;
	 

// ------------------------------------------
// Combinational logic
// ------------------------------------------
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
  
  
// ------------------------------------------
// Outputs
// ------------------------------------------
  assign Y1 = w4;
  assign Y2 = w8;
  assign Y3 = w13;
  assign Y4 = w17;
  assign Y5 = w26;
  assign Y6 = w31;
  assign Y7 = w34;
  assign Y8 = w40;
  assign Y9 = w45;
  assign Y10 = w47;
  assign Y11 = w52;
  assign Y12 = w58;
  assign Y13 = w60;
  assign Y14 = w62;
  assign Y15 = w63;

endmodule //t3_affine_8

