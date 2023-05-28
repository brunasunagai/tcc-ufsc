/*------------------------------------------------------------------------------
 * File: t4_affine_11.v
 * Date generated: 10/02/2023
 * Date modified: 08/05/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM filter for 1/16 precision coefficients - Tap 4
 *------------------------------------------------------------------------------ */

module t4_affine_11 (
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
  input  signed [10:0] X;
  output signed [12:0]	 Y1;
  output signed [12:0]	 Y2;
  output signed [13:0]	 Y3;
  output signed [13:0]	 Y4;
  output signed [14:0]	 Y5;
  output signed [14:0]	 Y6;
  output signed [14:0]	 Y7;
  output signed [14:0]	 Y8;
  output signed [14:0]	 Y9;
  output signed [14:0]	 Y10;
  output signed [14:0]	 Y11;
  output signed [14:0]	 Y12;
  output signed [14:0]	 Y13;
  output signed [13:0]	 Y14;
  output signed [12:0]	 Y15;


// ------------------------------------------
// Wires declarations
// ------------------------------------------
  wire signed [10:0] w1;
  wire signed [12:0] w4;
  wire signed [12:0] w3;
  wire signed [13:0] w5;
  wire signed [13:0] w8;
  wire signed [14:0] w9;
  wire signed [14:0] w11;
  wire signed [11:0] w2;
  wire signed [12:0] w2_;
  wire signed [12:0] w3_;
  wire signed [13:0] w4_;
  wire signed [13:0] w5_;
  wire signed [14:0] w8_;
  wire signed [14:0] w10;
  wire signed [14:0] w10_;
  wire signed [14:0] w11_;
  wire signed [14:0] w9_;
	 
// ------------------------------------------
// Combinational logic
// ------------------------------------------
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

  
// ------------------------------------------
// Outputs
// ------------------------------------------
  assign Y1 = w2_;
  assign Y2 = w3_;
  assign Y3 = w4_;
  assign Y4 = w5_;
  assign Y5 = w8_;
  assign Y6 = w10_;
  assign Y7 = w10_;
  assign Y8 = w11_;
  assign Y9 = w11_;
  assign Y10 = w9_;
  assign Y11 = w11_;
  assign Y12 = w10_;
  assign Y13 = w8_;
  assign Y14 = w5_;
  assign Y15 = w3_;

endmodule //t4_affine_11

