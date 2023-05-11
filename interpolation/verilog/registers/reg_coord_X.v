/*-----------------------------------------------------------------------------------
* File: reg_coord_X.v
* Date generated: 25/03/2023
* Date modified: 10/05/2023
* Author: Bruna Suemi Nagai
* Description: Stores the upper-left (first) horizontal coordenate component of the block of pixels
*----------------------------------------------------------------------------------- */

module reg_coord_X (
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
    input signed [7:0] DATA_IN;			// Data in
    output reg signed [7:0] DATA_OUT;	    // Data out
    

// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @(posedge CLK, negedge RST_ASYNC_N) begin
if (!RST_ASYNC_N)                        // If rst async is low
    begin
            DATA_OUT <= 8'b0;
    end
    
    else if (WRITE_EN) 		 			    // If write enable is high
    begin
        DATA_OUT <= DATA_IN; 			    // Write data to the register at the specified address
    end 
end

endmodule // reg_coord_X
    