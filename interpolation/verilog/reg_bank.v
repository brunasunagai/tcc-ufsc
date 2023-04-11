/*------------------------------------------------------------------------------
 * File: reg_buffer_165.v
 * Date generated: 13/03/2023
 * Date modified: 21/03/2023
 * Author: Bruna Suemi Nagai
 * Description: Module of one register as part of the buffer.
 *------------------------------------------------------------------------------ */

module reg_buffer_165(
    input clk,
	 input rst_async_n,						// Assynchronous reset
    input [3:0] addr_sel,					// 4 bits to select N+T-1=9 different registers
    input [7:0] data_in,					// Data to be written (8 bits each)
    input write_en,							// Enables writing
	 input read_en,							// Enables reading
    output [7:0] data_out					// Data read 
);

reg [7:0] reg_bank [8:0]; 					// Register bank with 9 registers of 8 bits each
reg [7:0] reg_bank_out; 					// Register for intermediate output data

//assign data_out = reg_bank[addr_sel]; 	// Output data from the register at the specified address
assign data_out = reg_bank_out;				// Intermediate output data to definetly output

always @(posedge clk, negedge rst_async_n) begin
   if (!rst_async_n)
	begin
            reg_bank[0] <= 8'b0;
				reg_bank[1] <= 8'b0;
				reg_bank[2] <= 8'b0;
				reg_bank[3] <= 8'b0;
				reg_bank[4] <= 8'b0;
				reg_bank[5] <= 8'b0;
				reg_bank[6] <= 8'b0;
				reg_bank[7] <= 8'b0;
				reg_bank[8] <= 8'b0;
	end
	
   else if (write_en) 		 					// If write enable is high
	begin
		reg_bank[addr_sel] <= data_in; 	// Write data to the register at the specified address
	end 
	
	else if (read_en)
	begin
		reg_bank_out <= reg_bank[addr_sel]; 	// Output data from the register at the specified address
	end
end

endmodule
