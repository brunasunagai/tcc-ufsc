////////////////////////////////////////////////////////////////////////////////
// Disciplina:      Video Coding
// Project Name:    Affine Transform
// Module Name:     
// Description:     
////////////////////////////////////////////////////////////////////////////////

module affine_transform  #(parameter WIDTH=8)	(  
	in_S,
	in_x,
	in_y,
	in_mv0_h,
	in_mv1_h,
	in_mv0_v,
	in_mv1_v,
	out_mv_h,
	out_mv_v,
	clk,
	rst
);



// ------------------------------------------
// IO declaration
// ------------------------------------------
	input [3 : 0]         in_S; 
	input signed [WIDTH - 1 : 0] in_x;
	input signed [WIDTH - 1 : 0] in_y;
	input signed [WIDTH - 1 : 0] in_mv0_h;
	input signed [WIDTH - 1 : 0] in_mv1_h;
	input signed [WIDTH - 1 : 0] in_mv0_v;
	input signed [WIDTH - 1 : 0] in_mv1_v;
	input 		      clk;
	input                 rst;

	output reg signed [WIDTH - 1 : 0] out_mv_h;
	output reg signed [WIDTH - 1 : 0] out_mv_v;

	

                   

// ------------------------------------------
// Signals definitions
// ------------------------------------------
	reg [3 : 0] sig_in_S; 
	reg signed [WIDTH - 1 : 0] sig_in_x;
	reg signed [WIDTH - 1 : 0] sig_in_y;
	reg signed [WIDTH - 1 : 0] sig_in_mv0_h;
	reg signed [WIDTH - 1 : 0] sig_in_mv1_h;
	reg signed [WIDTH - 1 : 0] sig_in_mv0_v;
	reg signed [WIDTH - 1 : 0] sig_in_mv1_v;

	wire unsigned [WIDTH - 1 : 0]   out_rom;
	wire signed [WIDTH - 1 : 0]   sig6,sig7;
	wire signed [23 : 0]   a,b;
	wire signed [2*WIDTH - 1 : 0] sig1,sig2,sig3,sig4;



// ------------------------------------------
// Logic
// ------------------------------------------

	always @(posedge clk, posedge rst) 
	    begin
		if(rst) begin
			
		    sig_in_S     <= 8'b11111111;	
		    sig_in_x     <= 8'b11111111;
		    sig_in_y     <= 8'b11111111;
		    sig_in_mv0_h <= 8'b11111111;
		    sig_in_mv1_h <= 8'b11111111;
		    sig_in_mv0_v <= 8'b11111111;
		    sig_in_mv1_v <= 8'b11111111;	
			
		    out_mv_h     <=  8'b11111111;
		    out_mv_v     <=  8'b11111111;
		end else begin
		    sig_in_S     <= in_S;	
		    sig_in_x     <= in_x;
		    sig_in_y     <= in_y;
		    sig_in_mv0_h <= in_mv0_h;
		    sig_in_mv1_h <= in_mv1_h;
		    sig_in_mv0_v <= in_mv0_v;
		    sig_in_mv1_v <= in_mv1_v;	
			
		    out_mv_h     <=  sig6;
		    out_mv_v     <=  sig7;
		end
	    end


	rom u1 (.addr(sig_in_S), .data(out_rom));

	assign a = $signed({(sig_in_mv1_h - sig_in_mv0_h), 4'b0000}) * $signed({4'b0000,out_rom});
	assign b = $signed({(sig_in_mv1_v - sig_in_mv0_v), 4'b0000}) * $signed({4'b0000,out_rom});

	assign sig1 = $signed(a[19:12]) * $signed(sig_in_x);
	assign sig2 = $signed(b[19:12]) * $signed(sig_in_y);
	assign sig3 = $signed((8'h00 - b[19:12])) * $signed(sig_in_x);
	assign sig4 = $signed(a[19:12]) * $signed(sig_in_y);

	assign sig6 = $signed(sig1[11:4]) + $signed(sig2[11:4]) + $signed(sig_in_mv0_h);
	assign sig7 = $signed(sig3[11:4]) + $signed(sig4[11:4]) + $signed(sig_in_mv0_v);	

	//assign out_mv_h = (a[15:8] * in_x) + (b[15:8] * in_y) + in_mv0_h;
	//assign out_mv_v = ((8'h00 - b[15:8]) * in_x) + (a[15:8] * in_y) + in_mv0_v;


endmodule
