////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2018 Chipus Microelectronics. All rights reserved.
// Chipus Microelectronics Confidential Proprietary.
//
// Use, copy or distribution of this code is not allowed without 
// Chipus Microelectronics explicit written consent.
////////////////////////////////////////////////////////////////////////////////
// $Id: eeprom_main_block_control.v 453 2022-07-26 20:04:14Z dnamorim $
////////////////////////////////////////////////////////////////////////////////
// Company:         Chipus Microelectronics
// Project Name:    
// Module Name:     
// Description:     
////////////////////////////////////////////////////////////////////////////////

module eeprom_main_block_control (
    clk,
    rst_async_n,
    i_valid,
    i_data,
    i_i2c_data,
    i_i2c_byte_request,
    i_i2c_byte_ready,
    i_i2c_active,
    o_i2c_w_pending,
    o_i2c_data,
    o_addr,
    o_data,
    o_op,
    o_region,
    o_op_valid,
    o_mem_access_mux_sel,
    o_ready

);
 
 
// ------------------------------------------
// Parameters
// ------------------------------------------

    // Bit width of data adapted to generic interface
    parameter  integer NBW_DATA = 'd8;


 
 
// ------------------------------------------
// IO declaration
// ------------------------------------------

    // System clock
    input  wire clk;

    // System assynchronous inverted logic reset
    input  wire rst_async_n;

    // Valid operation
    input  wire i_valid;

    // Memory data read
    input  wire [NBW_DATA-1:0] i_data;

    // I2C: data received
    input  wire [NBW_DATA-1:0] i_i2c_data;

    // I2C: data is requested
    input  wire i_i2c_byte_request;

    // I2C: data received
    input  wire i_i2c_byte_ready;

    // I2C: active flag
    input  wire i_i2c_active;

    // I2C: data available from source
    output reg o_i2c_w_pending;

    // I2C: data to send
    output reg [NBW_DATA-1:0] o_i2c_data;

    // Memory address
    output reg [NBW_DATA-1:0] o_addr;

    // Output data to memory
    output reg [NBW_DATA-1:0] o_data;

    // Operation
    output reg [4-1:0] o_op;

    // Main memory (0), Information Block (1)
    output reg o_region;

    // Valid operation
    output reg o_op_valid;

    // Output mem access mux selector
    output reg o_mem_access_mux_sel;

    // Ready to execute new operation
    output reg o_ready;


 
 
// ------------------------------------------
// Local parameters
// ------------------------------------------

    // FSM size
    localparam integer FSM_SIZE = 'd4;

    // State encodings
    localparam [FSM_SIZE-1:0]   IDLE         = 4'b0000,
                                GET_COMMAND  = 4'b0001,
                                WAIT_ADDRESS = 4'b0010,
                                GET_ADDRESS  = 4'b0011,
                                READ_1       = 4'b0100,
                                READ_2       = 4'b0101,
                                READ_3       = 4'b0110,
                                WRITE_1      = 4'b0111,
                                WRITE_2      = 4'b1000,
                                WRITE_3      = 4'b1001,
                                WRITE_4      = 4'b1010,
                                ERASE_1      = 4'b1011,
                                ERASE_2      = 4'b1100,
                                ERASE_3      = 4'b1101;
                                             
    // Operation encodings                   
    localparam [3:0]            READ         = 4'b0000,
                                WRITE        = 4'b0010,
                                ERASE        = 4'b0011;

// ------------------------------------------
// Signals
// ------------------------------------------
    
    reg [FSM_SIZE-1:0]  state; 
    reg [FSM_SIZE-1:0]  next_state;
    reg [NBW_DATA-1:0]  next_o_i2c_data;
    reg [NBW_DATA-1:0]  next_o_addr;
    reg [NBW_DATA-1:0]  next_o_data;
    reg [3:0]           next_o_op;
    reg                 next_o_i2c_w_pending;
    reg                 next_o_region;
    reg                 next_o_op_valid;
    reg                 next_o_mem_access_mux_sel;
    reg                 next_o_ready;
 

// ------------------------------------------
// Logic
// ------------------------------------------

    // Sequential procedure for state
    always @ (posedge clk, negedge rst_async_n)
    begin 
        if (!rst_async_n)
            state   <= IDLE;
        else
            state   <= next_state;
    end

    // Combinational procedure for next state
    always @(*)
    begin
        next_state = state;
        case (state)
            IDLE:           if (i_i2c_byte_ready)
                                next_state = GET_COMMAND;
                
            GET_COMMAND:    case (i_i2c_data)
                                8'h01: next_state = WAIT_ADDRESS;
                                8'h02: next_state = WAIT_ADDRESS;
                                8'h04: next_state = ERASE_1;
                                default: next_state = IDLE;
                            endcase
                
            WAIT_ADDRESS:   if (i_i2c_byte_ready)
                                next_state = GET_ADDRESS;
                                
            GET_ADDRESS:    case (o_op)
                                READ:   next_state = READ_1;
                                WRITE:  next_state = WRITE_1;
                                ERASE:  next_state = ERASE_1;
                            endcase
                            
            READ_1:         next_state = READ_2;
                                
            READ_2:         next_state = READ_3;
                
            READ_3:         if (i_valid)
                                next_state = IDLE;
                
            WRITE_1:        if (i_i2c_byte_ready)
                                next_state = WRITE_2;
                                
            WRITE_2:        next_state = WRITE_3;
                            
            WRITE_3:        next_state = WRITE_4;
            
            WRITE_4:         if (i_valid)
                                next_state = IDLE;
                            
            ERASE_1:        next_state = ERASE_2;
                
            ERASE_2:        next_state = ERASE_3;
                
            ERASE_3:        if (i_valid)
                                next_state = IDLE;
        endcase
    end

    // Combinational procedure for next outputs
    always @(*)
    begin
        next_o_i2c_data           = o_i2c_data;
        next_o_addr               = o_addr;
        next_o_data               = o_data;
        next_o_op                 = o_op;
        next_o_i2c_w_pending      = o_i2c_w_pending;
        next_o_region             = o_region;
        next_o_op_valid           = o_op_valid;
        next_o_mem_access_mux_sel = o_mem_access_mux_sel;
        next_o_ready              = o_ready;
        case (state)
            IDLE:           begin
                                next_o_region = 1'b0;                   // operations only on Main Block
                                if (i_i2c_byte_ready)
                                    next_o_mem_access_mux_sel = 1'b1;
                            end
                            
            GET_COMMAND:    case (i_i2c_data)
                                8'h01: next_o_op = READ;
                                8'h02: next_o_op = WRITE;
                                8'h04: next_o_op = ERASE;
                            endcase
            
            GET_ADDRESS:    next_o_addr = i_i2c_data;

            READ_1:         next_o_op_valid = 1'b1;
            
            READ_2:         next_o_op_valid = 1'b0;
            
            READ_3:         if (i_valid)
                            begin
                                next_o_i2c_data = i_data;
                                next_o_mem_access_mux_sel = 1'b0;
                            end
            
            WRITE_2:        begin
                                next_o_data = i_i2c_data;
                                next_o_op_valid = 1'b1;
                                next_o_ready = 1'b0;
                            end
                            
            WRITE_3:        next_o_op_valid = 1'b0;
            
            WRITE_4:        if (i_valid)
                            begin
                                next_o_ready = 1'b1;
                                next_o_mem_access_mux_sel = 1'b0;
                            end
                                
            ERASE_1:        begin
                                next_o_op_valid = 1'b1;
                                next_o_ready = 1'b0;
                            end
                            
            ERASE_2:        next_o_op_valid = 1'b0;
            
            ERASE_3:        if (i_valid)
                            begin
                                next_o_ready = 1'b1;
                                next_o_mem_access_mux_sel = 1'b0;
                            end
        endcase
    end

    // Sequential procedure for outputs to memory wrapper
    always @ (posedge clk, negedge rst_async_n)
    begin 
        if (!rst_async_n)
        begin
            o_i2c_data              <= {NBW_DATA{1'b0}};
            o_addr                  <= {NBW_DATA{1'b0}};
            o_data                  <= {NBW_DATA{1'b0}};
            o_op                    <= 4'b0;
            o_i2c_w_pending         <= 1'b1;
            o_region                <= 1'b0;
            o_op_valid              <= 1'b0;
            o_mem_access_mux_sel    <= 1'b0;
            o_ready                 <= 1'b1;
        end
        else
        begin
            o_i2c_data              <= next_o_i2c_data;
            o_addr                  <= next_o_addr;
            o_data                  <= next_o_data;
            o_op                    <= next_o_op;
            o_i2c_w_pending         <= next_o_i2c_w_pending;
            o_region                <= next_o_region;
            o_op_valid              <= next_o_op_valid;
            o_mem_access_mux_sel    <= next_o_mem_access_mux_sel;
            o_ready                 <= next_o_ready;
        end
    end
 
    
endmodule
