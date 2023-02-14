/*------------------------------------------------------------------------------
 * File: rom.v
 * Date generated: 03/11/2022
 * Date modified: 13/02/2023
 * Author: Bruna Suemi Nagai
 * Description: Pre calculated values to use it as a division instead of dividing in fact 
 *------------------------------------------------------------------------------ */

module rom(

	input 	     [3:0] addr,
	output  reg unsigned [7:0] data
	);

	always @(*)
	begin
		case (addr)
			0: data = 8'b00000000;	
			1: data = 8'b01010101;	// 1/(4-1)   -> 0,333333333	-> 0.33203125
			2: data = 8'b00100100;	// 1/(8-1)   -> 0,142857142	-> 0.140625
			3: data = 8'b00010001;	// 1/(16-1)  -> 0,066666666	-> 0.06640625
			4: data = 8'b00001000;	// 1/(32-1)  -> 0,032258064	-> 0.03125
			5: data = 8'b00000100;	// 1/(64-1)  -> 0,015873015	-> 0.015625
			6: data = 8'b00000010;	// 1/(128-1) -> 0,007874015	-> 0.0078125
			7: data = 8'b00000000;	
		endcase
	end

endmodule
