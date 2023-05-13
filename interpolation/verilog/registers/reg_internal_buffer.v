/*-----------------------------------------------------------------------------------
* File: reg_internal_buffer.v
* Date generated: 25/03/2023
* Date modified: 11/05/2023
* Author: Bruna Suemi Nagai
* Description: Stores one sample. It is used to build the transposed buffer.
*----------------------------------------------------------------------------------- */

module reg_internal_buffer (
    CLK,
    RST_ASYNC_N, 
    WRITE_EN,
    DATA_IN,  
    DATA_OUT
);


// ------------------------------------------
// IO declaration
// ------------------------------------------
    input CLK;                              // Clock
    input RST_ASYNC_N;						// Asynchronous reset
    input WRITE_EN;							// Enables writing
    input signed [10:0] DATA_IN;			// Data in
    output reg signed [10:0] DATA_OUT;	    // Data out
    

// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @(posedge CLK, negedge RST_ASYNC_N) begin
if (!RST_ASYNC_N)                        // If rst async is low
    begin
            DATA_OUT <= 11'b0;
    end
    
    else if (WRITE_EN) 		 			    // If write enable is high
    begin
        DATA_OUT <= DATA_IN; 			    // Write data to the register at the specified address
    end 
end

endmodule // reg_internal_buffer
    