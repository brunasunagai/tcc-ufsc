/*------------------------------------------------------------------------------
 * File: reg_bank_buffer.v
 * Date generated: 2023-03-13
 * Date modified: 2023-04-03
 * Author: Bruna Suemi Nagai
 * Description: A buffer to store each cycle output for the 2nd pass.
 *------------------------------------------------------------------------------ */

module reg_bank_buffer(
    CLK,
    RST_ASYNC_N,
    ADDR_SEL, 
    DATA_IN, 
    WRITE_EN, 
    READ_EN, 
    DATA_OUT
);


// ------------------------------------------
// IO declaration
// ------------------------------------------
	input CLK;                              // Clock
	input RST_ASYNC_N;						// Asynchronous reset
    input [3:0] ADDR_SEL;					// 4 bits to select between N+T-1=9 different registers
    input signed [164:0] DATA_IN;			// Data to be written 
    input WRITE_EN;							// Enables writing
	input READ_EN;							// Enables reading
    output signed [164:0] DATA_OUT;		    // Data read output
    
    
// ------------------------------------------
// Signals definitions
// ------------------------------------------
reg signed [164:0] REG_BANK [8:0];               	// Register bank with 9 registers of 8 bits each
reg signed [164:0] REG_BANK_OUT; 					// Register for intermediate output data

assign DATA_OUT = REG_BANK_OUT;				// Intermediate output data to definetly output


// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @(posedge CLK, negedge RST_ASYNC_N) begin
   if (!RST_ASYNC_N)
	begin
            REG_BANK[0] <= 165'b0;
			REG_BANK[1] <= 165'b0;
			REG_BANK[2] <= 165'b0;
			REG_BANK[3] <= 165'b0;
			REG_BANK[4] <= 165'b0;
			REG_BANK[5] <= 165'b0;
			REG_BANK[6] <= 165'b0;
			REG_BANK[7] <= 165'b0;
			REG_BANK[8] <= 165'b0;
	end
	
   else if (WRITE_EN) 		 					// If write enable is high
	begin
		REG_BANK[ADDR_SEL] <= DATA_IN; 			// Write data to the register at the specified address
	end 
	
	else if (READ_EN)
	begin
		REG_BANK_OUT <= REG_BANK[ADDR_SEL]; 	// Output data from the register at the specified address
	end
end

endmodule

