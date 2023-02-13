///////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019 Chipus Microelectronics. All rights reserved.
// Chipus Microelectronics Confidential Proprietary.
//
// Use, copy or distribution of this code is not allowed without
// Chipus Microelectronics explicit written consent.
//////////////////////////////////////////////////////////////////////////////////////
// $Id: memreg.v 400 2022-07-07 00:24:32Z dnamorim $
//////////////////////////////////////////////////////////////////////////////////////
// Company:         Chipus Microelectronics
// Project Name:    R3
// Module Name:     r3_regbank
// Description:     Register bank type: Memory.
//                  This register type samples input upon enable.
/////////////////////////////////////////////////////////////////////////////////////


module memreg #(    parameter REGSIZE = 8,                          // Register size in bits
                    parameter PRESET = 8'h00                        // Register preset value
               )
               (    input                       clk,                // Clock Pin
                    input                       rst_n,              // Assynchrounous Negative Edge Reset
                    input       [REGSIZE-1:0]   i_data,             // Regbank Interface : Input Data
                    input                       i_wr_en,            // Regbank Interface : Write enable
                    input       [REGSIZE-1:0]   i_mem_data,         // Memory Interface : Input Data
                    input                       i_mem_wr_en,        // Memory Interface : Write enable
                    output reg  [REGSIZE-1:0]   o_data              // Data Output
                );


// ------------------------------------------
// Logic definition
// ------------------------------------------
    always @(posedge clk, negedge rst_n) 
    begin

        if(!rst_n)
            o_data <= PRESET;
            
        else begin
        
            // Regbank condition
            if (i_wr_en)
                o_data <= i_data[REGSIZE-1:0];
                
            // Memory condition
            else if (i_mem_wr_en)    
                o_data <= i_mem_data[REGSIZE-1:0];
               
        end
        
    end


endmodule