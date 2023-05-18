/*-----------------------------------------------------------------------------------
* File: control.v
* Date generated: 25/03/2023
* Date modified: 15/05/2023
* Author: Bruna Suemi Nagai
* Description: FSM. 
*----------------------------------------------------------------------------------- */

module control (
	// External input
	input CLK_CTRL,
	input RESET_ALL,
	input START,
	
	// MV Gen input
	input INTERP_X, 
	input INTERP_Y,
	input CTRL_X, 
	input CTRL_Y,
	
	// Interpolator input
	input LOOP_3,
   input LOOP_4,
   input LOOP_9,
   input LOOP_13,
	
	// MV Gen output
	output reg RST_ASYNC_MV_GEN,				// Set of reg resets: coord_X, coord_Y, X, Y, MV_0, MV_1, gen_MV_X, gen_MV_Y and count_block.
   output reg WRITE_REGS_COORDS,				// Enable writing to registers coord_X and coord_Y.
	output reg WRITE_REGS_CPMVS,				// Enable writing to registers MV_0 and MV_1.
   output reg WRITE_REGS_GEN_MVS,				// Enable writing to registers gen_MV_X and gen_MV_Y.
	output reg WRITE_REG_X,						// Enable writing for reg_X.
	output reg WRITE_REG_Y,						// Enable writing for reg_Y.
	output reg WRITE_REG_COUNT_BLOCK,			// Enable writing for reg_count_block.
	output reg SEL_X,								// Select: 0 - original X coord; 1: incremented X coord.
	output reg SEL_Y,								// Select: 0 - original X coord; 1: incremented X coord.
		
	// Interpolator output
	output reg RST_ASYNC_INTERP,				// Async reset for regs INPUT_LINE, INT_OUT and BUFFER.
	output reg RST_ASYNC_REG_COUNTER,
	output reg WRITE_REG_INPUT_LINE,
	output reg WRITE_REG_COUNTER,
	output reg WRITE_REG_INT_OUT,
	output reg WRITE_BUFFER,
	output reg SEL_BUFFER_IN,					// 0: 1st pass output; 1: OUT_REG_INPUT_LINE
	output reg SEL_INTERP_LINE_IN,			// 0: buffer; 1: OUT_REG_INPUT_LINE
	output reg SEL_DIMENSION,					// 0: Y; 1: X
	
	// External output
	output reg FLAG_INT_OUT,
	output reg DONE_ALL
);


	
// ------------------------------------------
// Local parameters
// ------------------------------------------
   // State encodings
   localparam [3:0] S_IDLE         		= 4'b0000,
                    S_LOAD_MVGEN_IN  	= 4'b0001,
                    S_MVGEN_INIT 		= 4'b0010,
                    S_MVGEN_DONE  		= 4'b0011,
                    S_INT_DECISION 		= 4'b0100,
						  S_LOAD_BUFFER     	= 4'b0101,
                    S_INT_X       		= 4'b0110,
                    S_INT_Y       		= 4'b0111,
                    S_INT_XY_H      	= 4'b1000,
                    S_INT_XY_V      	= 4'b1001,
                    S_SKIP      			= 4'b1010,
                    S_LOOP1      		= 4'b1011,
                    S_LOOP2				= 4'b1100,
                    S_NEXT_LINE     	= 4'b1101,
                    S_NEXT_COLUMN     	= 4'b1110,
						  S_DONE 				= 4'b1111;
						  

 
// ------------------------------------------
// Signals
// ------------------------------------------    
    reg [3:0]  STATE; 
    reg [3:0]  NEXT_STATE; 
	 
    reg NEXT_RST_ASYNC_MV_GEN;
    reg NEXT_WRITE_REGS_COORDS;
    reg NEXT_WRITE_REGS_CPMVS;
    reg NEXT_WRITE_REGS_GEN_MVS;
    reg NEXT_WRITE_REG_X;
    reg NEXT_WRITE_REG_Y;
    reg NEXT_WRITE_REG_COUNT_BLOCK;
    reg NEXT_SEL_X;
    reg NEXT_SEL_Y;

    reg NEXT_RST_ASYNC_INTERP;
    reg NEXT_RST_ASYNC_REG_COUNTER;
    reg NEXT_WRITE_REG_INPUT_LINE;
    reg NEXT_WRITE_REG_COUNTER;
    reg NEXT_WRITE_REG_INT_OUT;
    reg NEXT_WRITE_BUFFER;
    reg NEXT_SEL_BUFFER_IN;
    reg NEXT_SEL_INTERP_LINE_IN;
    reg NEXT_SEL_DIMENSION;

    reg NEXT_FLAG_INT_OUT;
    reg NEXT_DONE_ALL;
	 
	 
// ------------------------------------------
// Logic
// ------------------------------------------
    // Sequential procedure for state
    always @ (posedge CLK_CTRL, negedge RESET_ALL)
    begin 
        if (!RESET_ALL)
            STATE   <= S_IDLE;
        else
            STATE   <= NEXT_STATE;
    end

	 
	 
    // Combinational procedure for next state
    always @(*)
    begin
        NEXT_STATE = STATE;
        case (STATE)
            S_IDLE: begin      
					if (START == 1'b1) begin
						NEXT_STATE = S_LOAD_MVGEN_IN;
					end
					else begin 
						NEXT_STATE = S_IDLE;
					end
				end				 
	
            S_LOAD_MVGEN_IN: begin
					NEXT_STATE = S_MVGEN_INIT;
				end
					
            S_MVGEN_INIT: begin
					NEXT_STATE = S_MVGEN_DONE;
				end
					
            S_MVGEN_DONE: begin
					NEXT_STATE = S_INT_DECISION;
				end
					
            S_INT_DECISION: begin
					if (INTERP_X == 1'b0 && INTERP_Y == 1'b0) begin
						NEXT_STATE = S_SKIP;
               end
					else if (INTERP_X == 1'b1 && INTERP_Y == 1'b0) begin
						NEXT_STATE = S_INT_X;
               end
					else if (INTERP_X == 1'b0 && INTERP_Y == 1'b1) begin
						NEXT_STATE = S_LOAD_BUFFER;
               end
					else begin
						NEXT_STATE = S_INT_XY_H;
               end
				end
            
				S_SKIP: begin
					if (LOOP_3 == 1'b1) begin
						NEXT_STATE = S_SKIP;
					end
					else if (LOOP_3 == 1'b0 && CTRL_Y == 1'b1) begin
						NEXT_STATE = S_NEXT_COLUMN;
					end
					else if (LOOP_3 == 1'b0 && CTRL_Y == 1'b0 && CTRL_X == 1'b0) begin
						NEXT_STATE = S_DONE;
					end
					else begin
						NEXT_STATE = S_NEXT_LINE;
					end
				end
				
				S_INT_X: begin
					NEXT_STATE = S_LOOP1;
				end
				
				S_LOAD_BUFFER: begin
					if (LOOP_9 == 1'b1) begin
						NEXT_STATE = S_LOAD_BUFFER;
					end
					else begin
						NEXT_STATE = S_INT_Y;
					end
				end
				
				S_INT_Y: begin
					NEXT_STATE = S_LOOP1;
				end
				
				S_INT_XY_H: begin
					NEXT_STATE = S_LOOP2;
				end
				
				S_LOOP1: begin
					if (LOOP_4 == 1'b1 && INTERP_X == 1'b1 && INTERP_Y == 1'b0) begin
						NEXT_STATE = S_INT_X;
					end
					else if (LOOP_13 == 1'b1 && INTERP_X == 1'b0 && INTERP_Y == 1'b1) begin
						NEXT_STATE = S_INT_Y;
					end
					else if (LOOP_13 == 1'b1 && INTERP_X == 1'b1 && INTERP_Y == 1'b1) begin
						NEXT_STATE = S_INT_XY_H;
					end
					else if (LOOP_4 == 1'b0 && INTERP_Y == 1'b0 && CTRL_Y == 1'b1) begin 
						NEXT_STATE = S_NEXT_COLUMN;
					end
					else if (LOOP_13 == 1'b0 && INTERP_Y == 1'b1 && CTRL_Y == 1'b1) begin 
						NEXT_STATE = S_NEXT_COLUMN;
					end
					else if (LOOP_4 == 1'b0 && INTERP_Y == 1'b0 && CTRL_Y == 1'b0 && CTRL_X == 1'b1) begin 
						NEXT_STATE = S_NEXT_LINE;
					end
					else if (LOOP_13 == 1'b0 && INTERP_Y == 1'b1 && CTRL_Y == 1'b0 && CTRL_X == 1'b1) begin 
						NEXT_STATE = S_NEXT_LINE;
					end
					else if (LOOP_4 == 1'b0 && INTERP_Y == 1'b0 && CTRL_Y == 1'b0 && CTRL_X == 1'b0) begin 
						NEXT_STATE = S_DONE;
					end
					else if (LOOP_13 == 1'b0 && INTERP_Y == 1'b1 && CTRL_Y == 1'b0 && CTRL_X == 1'b0) begin 
						NEXT_STATE = S_DONE;
					end
				end
				
				S_LOOP2: begin 
					if (LOOP_9 == 1'b1) begin
						NEXT_STATE = S_LOOP2;
					end
					else begin
						NEXT_STATE = S_INT_XY_V;
					end
				end 
				
				S_INT_XY_V: begin
					NEXT_STATE = S_LOOP1;
				end 
				
				S_NEXT_COLUMN: begin 
					NEXT_STATE = S_MVGEN_DONE;
				end 
				
				S_NEXT_LINE: begin 
					NEXT_STATE = S_MVGEN_DONE;
				end 
				
				S_DONE: begin 
					if (RESET_ALL == 1'b0) begin 
						NEXT_STATE = S_DONE;
					end
					else begin 
						NEXT_STATE = S_IDLE; 
					end 
				end 
				
        endcase
    end

//NEXT_RST_ASYNC_MV_GEN = 1'b1;
//NEXT_WRITE_REGS_COORDS = 1'b0;
//NEXT_WRITE_REGS_CPMVS = 1'b0;
//NEXT_WRITE_REGS_GEN_MVS = 1'b0;
//NEXT_WRITE_REG_X = 1'b0;
//NEXT_WRITE_REG_Y = 1'b0;
//NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
//NEXT_SEL_X = 1'b0;
//NEXT_SEL_Y = 1'b0;
//
//NEXT_RST_ASYNC_INTERP = 1'b1;
//NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
//NEXT_WRITE_REG_INPUT_LINE = 1'b0;
//NEXT_WRITE_REG_COUNTER = 1'b0;
//NEXT_WRITE_REG_INT_OUT = 1'b0;
//NEXT_WRITE_BUFFER = 1'b0;
//NEXT_SEL_BUFFER_IN = 1'b0;
//NEXT_SEL_INTERP_LINE_IN = 1'b0;
//NEXT_SEL_DIMENSION = 1'b0;
//
//NEXT_FLAG_INT_OUT = 1'b0;
//NEXT_DONE_ALL = 1'b0;
	 
	 
    // Combinational procedure for next outputs
	     always @(*) begin	
			case (STATE)
				S_IDLE: begin 
					NEXT_RST_ASYNC_MV_GEN = 1'b1;				
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end 
				
				S_LOAD_MVGEN_IN: begin 
//					RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b1;				
//					RST_ASYNC_INTERP = 1'b1;
//					RST_ASYNC_REG_COUNTER = 1'b1;

					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_MVGEN_INIT: begin 
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b1;
					NEXT_WRITE_REG_X = 1'b1;
					NEXT_WRITE_REG_Y = 1'b1;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_MVGEN_DONE: begin 
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b1;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_INT_DECISION: begin 
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_INPUT_LINE = 1'b1;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_LOAD_BUFFER: begin 
					NEXT_WRITE_REG_INPUT_LINE = 1'b1;
					NEXT_WRITE_REG_COUNTER = 1'b1;
					NEXT_WRITE_BUFFER = 1'b1;
					NEXT_SEL_BUFFER_IN = 1'b1;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_INT_X: begin 					
					NEXT_WRITE_REG_INPUT_LINE = 1'b1;
					NEXT_WRITE_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b1;
					NEXT_SEL_DIMENSION = 1'b1;
					NEXT_FLAG_INT_OUT = 1'b0;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_INT_Y: begin 
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_INT_XY_H: begin 
					NEXT_WRITE_REG_INPUT_LINE = 1'b1;
					NEXT_WRITE_REG_COUNTER = 1'b1;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b1;
					NEXT_SEL_DIMENSION = 1'b1;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_INT_XY_V: begin 
					NEXT_WRITE_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_SKIP: begin 
					NEXT_WRITE_REG_INPUT_LINE = 1'b1;
					NEXT_WRITE_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INT_OUT = 1'b1;
					NEXT_SEL_BUFFER_IN = 1'b1;
					NEXT_FLAG_INT_OUT = 1'b1;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end	
				
				S_LOOP1: begin 
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_BUFFER = 1'b1;
					NEXT_SEL_BUFFER_IN = 1'b0;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_LOOP2: begin 
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b1;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b1;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_NEXT_LINE: begin 
					NEXT_WRITE_REG_X = 1'b1;
					NEXT_WRITE_REG_Y = 1'b1;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b1;
					NEXT_SEL_X = 1'b1;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_NEXT_COLUMN: begin 
					NEXT_WRITE_REG_Y = 1'b1;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b1;
					NEXT_SEL_Y = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
					NEXT_DONE_ALL = 1'b0;
				end
				
				S_DONE: begin 
					NEXT_WRITE_REG_INPUT_LINE = 1'b0;
					NEXT_WRITE_REG_COUNTER = 1'b0;
					NEXT_WRITE_REG_INT_OUT = 1'b0;
					NEXT_FLAG_INT_OUT = 1'b0;
					NEXT_DONE_ALL = 1'b1;
					
					NEXT_RST_ASYNC_MV_GEN = 1'b1;
					NEXT_WRITE_REGS_COORDS = 1'b0;
					NEXT_WRITE_REGS_CPMVS = 1'b0;
					NEXT_WRITE_REGS_GEN_MVS = 1'b0;
					NEXT_WRITE_REG_X = 1'b0;
					NEXT_WRITE_REG_Y = 1'b0;
					NEXT_WRITE_REG_COUNT_BLOCK = 1'b0;
					NEXT_SEL_X = 1'b0;
					NEXT_SEL_Y = 1'b0;
					NEXT_RST_ASYNC_INTERP = 1'b1;
					NEXT_RST_ASYNC_REG_COUNTER = 1'b1;
					NEXT_WRITE_BUFFER = 1'b0;
					NEXT_SEL_BUFFER_IN = 1'b0;
					NEXT_SEL_INTERP_LINE_IN = 1'b0;
					NEXT_SEL_DIMENSION = 1'b0;
				end			
				
        endcase
    end
	 
	 
	 
    // Sequential procedure for outputs to memory wrapper
    always @ (posedge CLK_CTRL, negedge RESET_ALL)
    begin 
        if (!RESET_ALL)
        begin
					RST_ASYNC_MV_GEN 			<= 1'b0;
					WRITE_REGS_COORDS 		<= 1'b0;
					WRITE_REGS_CPMVS 			<= 1'b0;
					WRITE_REGS_GEN_MVS 		<= 1'b0;
					WRITE_REG_X 				<= 1'b0;
					WRITE_REG_Y 				<= 1'b0;
					WRITE_REG_COUNT_BLOCK 	<= 1'b0;
					RST_ASYNC_INTERP 			<= 1'b0;
					RST_ASYNC_REG_COUNTER 	<= 1'b0;
					WRITE_REG_INPUT_LINE 	<= 1'b0;
					WRITE_REG_COUNTER 		<= 1'b0;
					WRITE_REG_INT_OUT 		<= 1'b0;
					WRITE_BUFFER 				<= 1'b0;
					FLAG_INT_OUT 				<= 1'b0;
					DONE_ALL 					<= 1'b0;
        end
        else begin
					RST_ASYNC_MV_GEN				<= NEXT_RST_ASYNC_MV_GEN;
					WRITE_REGS_COORDS				<= NEXT_WRITE_REGS_COORDS;
					WRITE_REGS_CPMVS				<= NEXT_WRITE_REGS_CPMVS;
					WRITE_REGS_GEN_MVS			<= NEXT_WRITE_REGS_GEN_MVS;
					WRITE_REG_X						<= NEXT_WRITE_REG_X;
					WRITE_REG_Y						<= NEXT_WRITE_REG_Y;
					WRITE_REG_COUNT_BLOCK		<= NEXT_WRITE_REG_COUNT_BLOCK;
					SEL_X								<= NEXT_SEL_X;
					SEL_Y								<= NEXT_SEL_Y;

					RST_ASYNC_INTERP				<= NEXT_RST_ASYNC_INTERP;
					RST_ASYNC_REG_COUNTER		<= NEXT_RST_ASYNC_REG_COUNTER;
					WRITE_REG_INPUT_LINE			<= NEXT_WRITE_REG_INPUT_LINE;
					WRITE_REG_COUNTER				<= NEXT_WRITE_REG_COUNTER;
					WRITE_REG_INT_OUT				<= NEXT_WRITE_REG_INT_OUT;
					WRITE_BUFFER					<= NEXT_WRITE_BUFFER;
					SEL_BUFFER_IN					<= NEXT_SEL_BUFFER_IN;
					SEL_INTERP_LINE_IN			<= NEXT_SEL_INTERP_LINE_IN;
					SEL_DIMENSION					<= NEXT_SEL_DIMENSION;

					FLAG_INT_OUT					<= NEXT_FLAG_INT_OUT;
					DONE_ALL							<= NEXT_DONE_ALL;			
        end
    end

										
endmodule // control






