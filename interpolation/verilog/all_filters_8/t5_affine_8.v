/*------------------------------------------------------------------------------
 * File: t5_affine_8.v
 * Date generated: 10/02/2023
 * Date modified: 08/05/2023
 * Author: Bruna Suemi Nagai
 * Description: MCM filter for 1/16 precision coefficients - Tap 5
 *------------------------------------------------------------------------------ */

module t5_affine_8 (
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
  input  signed [7:0] X;
  output signed [7:0]	 Y1;
  output signed [7:0]	 Y2;
  output signed [7:0]	 Y3;
  output signed [7:0]	 Y4;
  output signed [8:0]	 Y5;
  output signed [9:0]	 Y6;
  output signed [9:0]	 Y7;
  output signed [9:0]	 Y8;
  output signed [9:0]	 Y9;
  output signed [8:0]	 Y10;
  output signed [9:0]	 Y11;
  output signed [9:0]	 Y12;
  output signed [8:0]	 Y13;
  output signed [7:0]	 Y14;
  output signed [7:0]	 Y15;


// ------------------------------------------
// Wires declarations
// ------------------------------------------
  wire signed [7:0] w1;
  wire signed [9:0] w4;
  wire signed [9:0] w3;
  wire signed [8:0] w2;
	 
	 
// ------------------------------------------
// Combinational logic
// ------------------------------------------
  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w2 = w1 << 1;

  
// ------------------------------------------
// Outputs
// ------------------------------------------
  assign Y1 = w1;
  assign Y2 = w1;
  assign Y3 = w1;
  assign Y4 = w1;
  assign Y5 = w2;
  assign Y6 = w3;
  assign Y7 = w3;
  assign Y8 = w3;
  assign Y9 = w3;
  assign Y10 = w2;
  assign Y11 = w3;
  assign Y12 = w3;
  assign Y13 = w2;
  assign Y14 = w1;
  assign Y15 = w1;

endmodule //t5_affine_8

