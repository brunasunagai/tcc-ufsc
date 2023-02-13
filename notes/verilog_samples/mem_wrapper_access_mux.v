////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2018 Chipus Microelectronics. All rights reserved.
// Chipus Microelectronics Confidential Proprietary.
//
// Use, copy or distribution of this code is not allowed without 
// Chipus Microelectronics explicit written consent.
////////////////////////////////////////////////////////////////////////////////
// $Id: mem_wrapper_access_mux.v 400 2022-07-07 00:24:32Z dnamorim $
////////////////////////////////////////////////////////////////////////////////
// Company:         Chipus Microelectronics
// Project Name:    
// Module Name:     
// Description:     
////////////////////////////////////////////////////////////////////////////////

module mem_wrapper_access_mux (
    i_info_addr,
    i_info_data,
    i_info_op,
    i_info_region,
    i_info_op_valid,
    o_info_valid,
    o_info_data,
    i_main_addr,
    i_main_data,
    i_main_op,
    i_main_region,
    i_main_op_valid,
    o_main_valid,
    o_main_data,
    i_valid,
    i_data,
    o_addr,
    o_data,
    o_op,
    o_region,
    o_op_valid,
    i_selector

);
 
 
// ------------------------------------------
// Parameters
// ------------------------------------------

    // Bit width of data adapted to generic interface
    parameter  integer NBW_DATA = 'd8;


 
 
// ------------------------------------------
// IO declaration
// ------------------------------------------

    // Adress output to memory
    input  wire [NBW_DATA-1:0] i_info_addr;

    // Data output to memory
    input  wire [NBW_DATA-1:0] i_info_data;

    // Operation
    input  wire [4-1:0] i_info_op;

    // Main memory (0), Information Block (1)
    input  wire i_info_region;

    // Valid operation
    input  wire i_info_op_valid;

    // Valid operation
    output wire o_info_valid;

    // Memory data read
    output wire [NBW_DATA-1:0] o_info_data;

    // Adress output to memory
    input  wire [NBW_DATA-1:0] i_main_addr;

    // Data output to memory
    input  wire [NBW_DATA-1:0] i_main_data;

    // Operation
    input  wire [4-1:0] i_main_op;

    // Main memory (0), Information Block (1)
    input  wire i_main_region;

    // Valid operation
    input  wire i_main_op_valid;

    // Valid operation
    output wire o_main_valid;

    // Memory data read
    output wire [NBW_DATA-1:0] o_main_data;

    // Valid operation
    input  wire i_valid;

    // Memory data read
    input  wire [NBW_DATA-1:0] i_data;

    // Adress output to memory
    output wire [NBW_DATA-1:0] o_addr;

    // Data output to memory
    output wire [NBW_DATA-1:0] o_data;

    // Operation
    output wire [4-1:0] o_op;

    // Main memory (0), Information Block (1)
    output wire o_region;

    // Valid operation
    output wire o_op_valid;

    // Mux Selector input
    input  wire i_selector;


 
 
// ------------------------------------------
// Local parameters
// ------------------------------------------



// ------------------------------------------
// Mux Logic
// ------------------------------------------
    assign o_addr       = i_selector ? i_main_addr      : i_info_addr;
    assign o_data       = i_selector ? i_main_data      : i_info_data;
    assign o_op         = i_selector ? i_main_op        : i_info_op;
    assign o_region     = i_selector ? i_main_region    : i_info_region;
    assign o_op_valid   = i_selector ? i_main_op_valid  : i_info_op_valid;
 
    assign o_main_valid = i_selector ? i_valid          : 'h0;
    assign o_main_data  = i_selector ? i_data           : 'h0;
    assign o_info_valid = i_selector ? 'h0              : i_valid;
    assign o_info_data  = i_selector ? 'h0              : i_data;
    
endmodule
