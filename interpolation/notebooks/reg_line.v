/*-----------------------------------------------------------------------------------
 * File: reg_line.v
 * Date generated: 2023-03-25
 * Date modified: 2023-03-30
 * Author: Bruna Suemi Nagai
 * Description: A register to store the input line of padding + intergers from ref block.
 *----------------------------------------------------------------------------------- */

module reg_line(
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
    input signed [71:0] DATA_IN;			// Data to be written 
    output reg signed [71:0] DATA_OUT;	    // Data read output
    

// ------------------------------------------
// Sequential logic
// ------------------------------------------
always @(posedge CLK, negedge RST_ASYNC_N) begin
   if (!RST_ASYNC_N)                        // If rst async is low
	begin
            DATA_OUT <= 72'b0;
	end
	
   	else if (WRITE_EN) 		 			    // If write enable is high
	begin
		DATA_OUT <= DATA_IN; 			    // Write data to the register at the specified address
	end 
end

endmodule

