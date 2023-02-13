////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2018 Chipus Microelectronics. All rights reserved.
// Chipus Microelectronics Confidential Proprietary.
//
// Use, copy or distribution of this code is not allowed without 
// Chipus Microelectronics explicit written consent.
////////////////////////////////////////////////////////////////////////////////
// $Id: EN0256X8AA130BH02_wrapper.v 340 2022-06-10 22:07:44Z dnamorim $
////////////////////////////////////////////////////////////////////////////////
// Company:         Chipus Microelectronics
// Project Name:    
// Module Name:     
// Description:     
////////////////////////////////////////////////////////////////////////////////

module EN0256X8AA130BH02_wrapper (
    clk,
    rst_async_n,
    i_addr,
    i_data,
    i_op,
    i_region,
    i_op_valid,
    o_data,
    o_valid

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

    // Adress input to memory
    input  wire [NBW_DATA-1:0] i_addr;

    // Data input to memory
    input  wire [NBW_DATA-1:0] i_data;

    // Operation
    input  wire [4-1:0] i_op;

    // Main memory (0), Information Block (1)
    input  wire i_region;

    // Valid operation
    input  wire i_op_valid;

    // Memory data read
    output wire [NBW_DATA-1:0] o_data;

    // Valid operation
    output wire o_valid;


 
 
// ------------------------------------------
// Local parameters
// ------------------------------------------



// ------------------------------------------
// Signals
// ------------------------------------------

 

// ------------------------------------------
// Logic
// ------------------------------------------

 
    
endmodule
