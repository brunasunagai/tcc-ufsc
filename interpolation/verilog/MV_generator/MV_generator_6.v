/*--------------------------------------------------------------------
 * File: MV_generator_6.v
 * Date generated: 2023-04-12
 * Date modified: 08/05/2023
 * Author: Bruna Suemi Nagai
 * Description: Motion Vectors generator for 6-parameters
 *------------------------------------------------------------------------------ */

module MV_generator_6 (
	X_COORD,				// The X coordinate of the sample to be reconstructed [Fast Affine ME for VVC, Park S.]
	Y_COORD,				// The Y coordinate of the sample to be reconstructed [Fast Affine ME for VVC, Park S.]	
	MV_0_H,					// Horizontal component for MV0
	MV_1_H,					// Horizontal component for MV1	
    MV_2_H,					// Horizontal component for MV2	
	MV_0_V,					// Vertical component for MV0
	MV_1_V,					// Vertical component for MV1	
    MV_2_V,					// Vertical component for MV2	
	MV_H_OUT,				// Horizontal component for the resultant MV
	MV_V_OUT				// Vertical component for the resultant MV	
);


// ------------------------------------------
// IO declaration
// ------------------------------------------
	input signed [7:0] X_COORD;
	input signed [7:0] Y_COORD;
	
	input signed [7:0] MV_0_H;
	input signed [7:0] MV_1_H;
    input signed [7:0] MV_2_H;
	
	input signed [7:0] MV_0_V;
	input signed [7:0] MV_1_V;
    input signed [7:0] MV_2_V;

	output wire signed [18:0] MV_H_OUT;
	output wire signed [18:0] MV_V_OUT;
	

// ------------------------------------------
// Signals definitions
// ------------------------------------------
	wire signed [7:0] MINUS_MV_0_H;
	wire signed [7:0] MINUS_MV_0_V;

	wire signed [8:0] SUB_H_0;
    wire signed [8:0] SUB_H_1;

	wire signed [8:0] SUB_V_0;
    wire signed [8:0] SUB_V_1;
	
	wire signed [16:0] MULT_H_0;	// 9 bits * 8 bits = 17 bits
	wire signed [16:0] MULT_H_1;	// 9 bits * 8 bits = 17 bits
    
	wire signed [16:0] MULT_V_0;	// 9 bits * 8 bits = 17 bits
	wire signed [16:0] MULT_V_1;	// 9 bits * 8 bits = 17 bits
	
	wire signed [17:0] SUM_H;
	wire signed [17:0] SUM_V;
	
	wire signed [18:0] MV_0_H_EXT;
	wire signed [18:0] MV_0_V_EXT;
	
	
// ------------------------------------------
// Logic
// ------------------------------------------
	assign MINUS_MV_0_H = ~MV_0_H + 8'b1;
	assign MINUS_MV_0_V = ~MV_0_V + 8'b1; 

	assign SUB_H_0 = {MV_1_H[7], MV_1_H} + {MINUS_MV_0_H[7], MINUS_MV_0_H};	
    assign SUB_H_1 = {MV_2_H[7], MV_2_H} + {MINUS_MV_0_H[7], MINUS_MV_0_H};

	assign SUB_V_0 = {MV_1_V[7], MV_1_V} + {MINUS_MV_0_V[7], MINUS_MV_0_V};
    assign SUB_V_1 = {MV_2_V[7], MV_2_V} + {MINUS_MV_0_V[7], MINUS_MV_0_V};
	
	assign MULT_H_0 = SUB_H_0 * X_COORD;
	assign MULT_H_1 = SUB_H_1 * Y_COORD; 
	
	assign MULT_V_0 = SUB_V_0 * X_COORD;
	assign MULT_V_1 = SUB_V_1 * Y_COORD; 

	// When there's a division by 4, the point is fixed at .xx (>> 2)
	// When there's a division by 4, the point is fixed at .xx (>> 2)
    
	assign SUM_H = {MULT_H_0[16], MULT_H_0} + {MULT_H_1[16], MULT_H_1};
	assign MV_0_H_EXT = {MV_0_H[7], MV_0_H[7], MV_0_H[7], MV_0_H[7], MV_0_H[7], MV_0_H[7], MV_0_H[7], MV_0_H[7], MV_0_H[7], MV_0_H, 2'b0};
	
	assign SUM_V = {MULT_V_0[16], MULT_V_0} + {MULT_V_1[16], MULT_V_1}; 
	assign MV_0_V_EXT = {MV_0_V[7], MV_0_V[7], MV_0_V[7], MV_0_V[7], MV_0_V[7], MV_0_V[7], MV_0_V[7], MV_0_V[7], MV_0_V[7], MV_0_V, 2'b0};
	
	assign MV_H_OUT = {SUM_H[17], SUM_H} + MV_0_H_EXT;
	assign MV_V_OUT = {SUM_V[17], SUM_V} + MV_0_V_EXT;
	
endmodule // MV_generator_6
