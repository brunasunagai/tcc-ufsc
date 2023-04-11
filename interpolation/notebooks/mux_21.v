/*------------------------------------------------------------------------------
 * File: mux_21.v
 * Date generated: 2023-03-27
 * Date modified: 2023-04-03
 * Author: Bruna Suemi Nagai
 * Description: Multiplexer 2:1
 *------------------------------------------------------------------------------ */

module mux_21(
	IN0,
	IN1,
	SEL, 
	OUT
);


// ------------------------------------------
// IO declaration
// ------------------------------------------
	input signed [164:0] IN0;
	input signed [164:0] IN1; 
	input SEL; 
	output reg signed [164:0] OUT;
	
	
// ------------------------------------------
// Logic
// ------------------------------------------
	always @ (SEL or IN0 or IN1)
	begin
  	case(SEL)
		1'b0: OUT = IN0;
		1'b1: OUT = IN1;
    	default: OUT = 165'b0;
  	endcase
end
endmodule
