////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2018 Chipus Microelectronics. All rights reserved.
// Chipus Microelectronics Confidential Proprietary.
//
// Use, copy or distribution of this code is not allowed without 
// Chipus Microelectronics explicit written consent.
////////////////////////////////////////////////////////////////////////////////
// $Id: eeprom_info_block_control.v 650 2022-09-21 11:13:02Z mherve $
////////////////////////////////////////////////////////////////////////////////
// Company:         Chipus Microelectronics
// Project Name:    
// Module Name:     
// Description:     
////////////////////////////////////////////////////////////////////////////////

module eeprom_info_block_control (
    clk,
    rst_async_n,
//     i_save_status,
    i_test_mode,
    i_otp_load,
    i_otp_save,
    i_otp_erase,
    i_otp_lock,
    o_otp_external_data,
    i_otp_external_data,
    i_otp_external_addr,
    i_otp_external_data_en,
    i_valid,
    i_data,
    o_addr,
    o_data,
    o_op,
    o_region,
    o_op_valid,
    o_aldo_trim0,
    o_dldo_trim0,
    o_isr_trim0,
    o_isr_trim1,
    o_isr_trim2,
    o_isr_trim3,
    o_isr_trim4,
    o_osc_trim0,
    o_b1_trim0,
    o_b1_trim1,
    o_b1_trim2,
    o_b1_trim3,
    o_b1_trim4,
    o_b1_trim5,
    o_b2_trim0,
    o_b2_trim1,
    o_b2_trim2,
    o_b2_trim3,
    o_b2_trim4,
    o_b2_trim5,
    o_ovpc_trim0,
    o_ovpc_trim1,
    o_can0_trim0,
    o_can1_trim0,
    o_ready,
    o_init_done,
    o_ovpc_trim_strobe
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

    // Indicates status regs need to be saved
//     input  wire i_save_status;

    // Test mode selection (1: Test mode; 0: User mode)
    input  wire i_test_mode;

    // Command from regbank to load memory content on regs
    input  wire i_otp_load;

    // Command from regbank to save regs on memory
    input  wire i_otp_save;

    // Command from regbank to erase memory content
    input  wire i_otp_erase;

    // Command from regbank to prevent further writings on memory
    input  wire i_otp_lock;

    // External Register access (MTP)
    output reg [NBW_DATA-1:0] o_otp_external_data;

    // External Register access (MTP)
    input  wire [NBW_DATA-1:0] i_otp_external_data;

    // External Register access (MTP)
    input  wire [5-1:0] i_otp_external_addr;

    // External Register access (MTP)
    input  wire i_otp_external_data_en;

    // Valid operation
    input  wire i_valid;

    // Memory data read
    input  wire [NBW_DATA-1:0] i_data;

    // Adress output to memory
    output wire [NBW_DATA-1:0] o_addr;

    // Data output to memory
    output reg [NBW_DATA-1:0] o_data;

    // Operation
    output reg [4-1:0] o_op;

    // Main memory (0), Information Block (1)
    output reg o_region;

    // Valid operation
    output reg o_op_valid;

    // ALDO trim
    output wire [NBW_DATA-1:0] o_aldo_trim0;

    // DLDO trim
    output wire [NBW_DATA-1:0] o_dldo_trim0;

    // ISR trim
    output wire [NBW_DATA-1:0] o_isr_trim0;

    // ISR trim
    output wire [NBW_DATA-1:0] o_isr_trim1;

    // ISR trim
    output wire [NBW_DATA-1:0] o_isr_trim2;

    // ISR trim
    output wire [NBW_DATA-1:0] o_isr_trim3;

    // ISR trim
    output wire [NBW_DATA-1:0] o_isr_trim4;

    // Osc trim
    output wire [NBW_DATA-1:0] o_osc_trim0;

    // Buck 5V trim
    output wire [NBW_DATA-1:0] o_b1_trim0;

    // Buck 5V trim
    output wire [NBW_DATA-1:0] o_b1_trim1;

    // Buck 5V trim
    output wire [NBW_DATA-1:0] o_b1_trim2;

    // Buck 5V trim
    output wire [NBW_DATA-1:0] o_b1_trim3;

    // Buck 5V trim
    output wire [NBW_DATA-1:0] o_b1_trim4;

    // Buck 5V trim
    output wire [NBW_DATA-1:0] o_b1_trim5;

    // Buck 3v3 trim
    output wire [NBW_DATA-1:0] o_b2_trim0;

    // Buck 3v3 trim
    output wire [NBW_DATA-1:0] o_b2_trim1;

    // Buck 3v3 trim
    output wire [NBW_DATA-1:0] o_b2_trim2;

    // Buck 3v3 trim
    output wire [NBW_DATA-1:0] o_b2_trim3;

    // Buck 3v3 trim
    output wire [NBW_DATA-1:0] o_b2_trim4;

    // Buck 3v3 trim
    output wire [NBW_DATA-1:0] o_b2_trim5;

    // OVPC trim
    output wire [NBW_DATA-1:0] o_ovpc_trim0;

    // OVPC trim
    output wire [NBW_DATA-1:0] o_ovpc_trim1;

    // Can0 Trimming
    output wire [NBW_DATA-1:0] o_can0_trim0;

    // Can1 Trimming
    output wire [NBW_DATA-1:0] o_can1_trim0;

    // Ready to execute new operation
    output reg  o_ready;

    // Memory initialization done
    output reg  o_init_done;
    
    // OVPC Trim Update Strobe
    output wire o_ovpc_trim_strobe;


 
 
// ------------------------------------------
// Local parameters
// ------------------------------------------

    // FSM size
    localparam integer FSM_SIZE = 'd6;

    // State encodings
    localparam [FSM_SIZE-1:0]   READ_LOCK_BIT_1 = 6'b000000,
                                READ_LOCK_BIT_2 = 6'b000001,
                                READ_LOCK_BIT_3 = 6'b000010,
                                READ_LOCK_BIT_4 = 6'b000011,
                                READ_LOCK_BIT_5 = 6'b000100,
                                INIT_READ_OTP_1 = 6'b000101,
                                INIT_READ_OTP_2 = 6'b000110,
                                INIT_READ_OTP_3 = 6'b000111,
                                INIT_READ_OTP_4 = 6'b001000,
                                INIT_READ_OTP_5 = 6'b001001,
                                INIT_READ_MTP_1 = 6'b001010,
                                INIT_READ_MTP_2 = 6'b001011,
                                INIT_READ_MTP_3 = 6'b001100,
                                INIT_READ_MTP_4 = 6'b001101,
                                INIT_READ_MTP_5 = 6'b001110,
                                IDLE            = 6'b001111,
                                SAVE_1          = 6'b010000,
                                SAVE_2          = 6'b010001,
                                SAVE_3          = 6'b010010,
                                SAVE_4          = 6'b010011,
                                WRITE_1         = 6'b010100,
                                WRITE_2         = 6'b010101,
                                WRITE_3         = 6'b010110,
                                WRITE_4         = 6'b010111,
                                WRITE_5         = 6'b011000,
                                WRITE_6         = 6'b011001,
                                WRITE_7         = 6'b011010,
                                WRITE_8         = 6'b011011,
                                READ_1          = 6'b011100,
                                READ_2          = 6'b011101,
                                READ_3          = 6'b011110,
                                READ_4          = 6'b011111,
                                READ_5          = 6'b100000,
                                READ_6          = 6'b100001,
                                READ_7          = 6'b100010,
                                READ_8          = 6'b100011,
                                LOCK_1          = 6'b100100,
                                LOCK_2          = 6'b100101,
                                LOCK_3          = 6'b100110,
                                LOCK_4          = 6'b100111,
                                LOCK_5          = 6'b101000,
                                LOCK_6          = 6'b101001,
                                LOCK_7          = 6'b101010,
                                LOCK_8          = 6'b101011,
                                ERASE_1         = 6'b101100,
                                ERASE_2         = 6'b101101,
                                ERASE_3         = 6'b101110,
                                ERASE_4         = 6'b101111;

    // Operation encodings                   
    localparam [3:0]            READ         = 4'b0000,
                                WRITE        = 4'b0010,
                                ERASE        = 4'b0011;
                                
    // Pointer Limits
    localparam [4:0]            LOCK_BIT_POINTER_LIMIT  = 5'd1;
    localparam [4:0]            OTP_POINTER_LIMIT       = 5'd27;
    localparam [4:0]            MTP_POINTER_LIMIT       = 5'd18;
    localparam [NBW_DATA-1:0]   OTP_LOCK_BYTE           = 8'd31;

    
// ------------------------------------------
// Signals
// ------------------------------------------
    // Control Signals (FSM)
    reg [FSM_SIZE-1:0]  state; 
    reg [FSM_SIZE-1:0]  next_state;
    reg [4:0]           pointer_reg;
    reg [4:0]           pointer_limit_reg;
    reg [NBW_DATA-1:0]  addr_reg;
    reg [4:0]           next_pointer_limit;
    reg [NBW_DATA-1:0]  next_addr_reg;
    reg [3:0]           next_o_op; 
    reg                 next_o_region; 
    reg                 next_o_op_valid;
    reg                 next_o_ready;
    reg                 next_o_init_done;
    wire                valid_read;
    reg [NBW_DATA-1:0]  otp_control_data;
    
    // OTP Registers signals
    wire                otp_reg_wr_en;
    wire [NBW_DATA-1:0] otp_control;
    reg                 otp_control_en;    
    wire                otp_control_wr_en;
    reg                 otp_control_mem_en;
    wire                otp_control_mem_wr_en;
    wire [NBW_DATA-1:0] part_id_0;
    reg                 part_id_0_en;    
    wire                part_id_0_wr_en;
    reg                 part_id_0_mem_en;
    wire                part_id_0_mem_wr_en;
    wire [NBW_DATA-1:0] part_id_1;
    reg                 part_id_1_en;    
    wire                part_id_1_wr_en;
    reg                 part_id_1_mem_en;
    wire                part_id_1_mem_wr_en;
    reg [NBW_DATA-1:0]  aldo_trim0;
    reg                 aldo_trim0_en;    
    wire                aldo_trim0_wr_en;
    reg                 aldo_trim0_mem_en;
    wire                aldo_trim0_mem_wr_en;
    reg [NBW_DATA-1:0]  dldo_trim0;
    reg                 dldo_trim0_en;    
    wire                dldo_trim0_wr_en;
    reg                 dldo_trim0_mem_en;
    wire                dldo_trim0_mem_wr_en;
    reg [NBW_DATA-1:0]  isr_trim0;
    reg                 isr_trim0_en;    
    wire                isr_trim0_wr_en;
    reg                 isr_trim0_mem_en;
    wire                isr_trim0_mem_wr_en;
    reg [NBW_DATA-1:0]  isr_trim1;
    reg                 isr_trim1_en;    
    wire                isr_trim1_wr_en;
    reg                 isr_trim1_mem_en;
    wire                isr_trim1_mem_wr_en;   
    reg [NBW_DATA-1:0]  isr_trim2;
    reg                 isr_trim2_en;    
    wire                isr_trim2_wr_en;
    reg                 isr_trim2_mem_en;
    wire                isr_trim2_mem_wr_en;
    reg [NBW_DATA-1:0]  isr_trim3;
    reg                 isr_trim3_en;    
    wire                isr_trim3_wr_en;
    reg                 isr_trim3_mem_en;
    wire                isr_trim3_mem_wr_en;
    reg [NBW_DATA-1:0]  isr_trim4;
    reg                 isr_trim4_en;    
    wire                isr_trim4_wr_en;
    reg                 isr_trim4_mem_en;
    wire                isr_trim4_mem_wr_en;
    reg [NBW_DATA-1:0]  osc_trim0;
    reg                 osc_trim0_en;    
    wire                osc_trim0_wr_en;
    reg                 osc_trim0_mem_en;
    wire                osc_trim0_mem_wr_en;
    reg [NBW_DATA-1:0]  b1_trim0;
    reg                 b1_trim0_en;    
    wire                b1_trim0_wr_en;
    reg                 b1_trim0_mem_en;
    wire                b1_trim0_mem_wr_en;
    reg [NBW_DATA-1:0]  b1_trim1;
    reg                 b1_trim1_en;    
    wire                b1_trim1_wr_en;
    reg                 b1_trim1_mem_en;
    wire                b1_trim1_mem_wr_en;
    reg [NBW_DATA-1:0]  b1_trim2;
    reg                 b1_trim2_en;    
    wire                b1_trim2_wr_en;
    reg                 b1_trim2_mem_en;
    wire                b1_trim2_mem_wr_en;
    reg [NBW_DATA-1:0]  b1_trim3;
    reg                 b1_trim3_en;    
    wire                b1_trim3_wr_en;
    reg                 b1_trim3_mem_en;
    wire                b1_trim3_mem_wr_en;
    reg [NBW_DATA-1:0]  b1_trim4;
    reg                 b1_trim4_en;    
    wire                b1_trim4_wr_en;
    reg                 b1_trim4_mem_en;
    wire                b1_trim4_mem_wr_en;
    reg [NBW_DATA-1:0]  b1_trim5;
    reg                 b1_trim5_en;    
    wire                b1_trim5_wr_en;
    reg                 b1_trim5_mem_en;
    wire                b1_trim5_mem_wr_en;
    reg [NBW_DATA-1:0]  b2_trim0;
    reg                 b2_trim0_en;    
    wire                b2_trim0_wr_en;
    reg                 b2_trim0_mem_en;
    wire                b2_trim0_mem_wr_en;
    reg [NBW_DATA-1:0]  b2_trim1;
    reg                 b2_trim1_en;    
    wire                b2_trim1_wr_en;
    reg                 b2_trim1_mem_en;
    wire                b2_trim1_mem_wr_en;
    reg [NBW_DATA-1:0]  b2_trim2;
    reg                 b2_trim2_en;    
    wire                b2_trim2_wr_en;
    reg                 b2_trim2_mem_en;
    wire                b2_trim2_mem_wr_en;
    reg [NBW_DATA-1:0]  b2_trim3;
    reg                 b2_trim3_en;    
    wire                b2_trim3_wr_en;
    reg                 b2_trim3_mem_en;
    wire                b2_trim3_mem_wr_en;
    reg [NBW_DATA-1:0]  b2_trim4;
    reg                 b2_trim4_en;    
    wire                b2_trim4_wr_en;
    reg                 b2_trim4_mem_en;
    wire                b2_trim4_mem_wr_en;
    reg [NBW_DATA-1:0]  b2_trim5;
    reg                 b2_trim5_en;    
    wire                b2_trim5_wr_en;
    reg                 b2_trim5_mem_en;
    wire                b2_trim5_mem_wr_en;
    reg [NBW_DATA-1:0]  ovpc_trim0;
    reg                 ovpc_trim0_en;    
    wire                ovpc_trim0_wr_en;
    reg                 ovpc_trim0_mem_en;
    wire                ovpc_trim0_mem_wr_en;
    reg [NBW_DATA-1:0]  ovpc_trim1;
    reg                 ovpc_trim1_en;    
    wire                ovpc_trim1_wr_en;
    reg                 ovpc_trim1_mem_en;
    wire                ovpc_trim1_mem_wr_en;
    reg [NBW_DATA-1:0]  can0_trim0;
    reg                 can0_trim0_en;    
    wire                can0_trim0_wr_en;
    reg                 can0_trim0_mem_en;
    wire                can0_trim0_mem_wr_en;
    reg [NBW_DATA-1:0]  can1_trim0;
    reg                 can1_trim0_en;    
    wire                can1_trim0_wr_en;
    reg                 can1_trim0_mem_en;
    wire                can1_trim0_mem_wr_en;
        
    // OVPC Trim Strobe
    reg                 ovpc_trim_strobe_reg;
    wire                ovpc_trim_update;
    
    
// ------------------------------------------
// OTP Registers 
// ------------------------------------------
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_part_id_0      (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(part_id_0_wr_en),     .i_mem_data(i_data), .i_mem_wr_en(part_id_0_mem_wr_en),     .o_data(part_id_0    ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_part_id_1      (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(part_id_1_wr_en),     .i_mem_data(i_data), .i_mem_wr_en(part_id_1_mem_wr_en),     .o_data(part_id_1    ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_aldo_trim0     (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(aldo_trim0_wr_en),    .i_mem_data(i_data), .i_mem_wr_en(aldo_trim0_mem_wr_en),    .o_data(aldo_trim0   ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_dldo_trim0     (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(dldo_trim0_wr_en),    .i_mem_data(i_data), .i_mem_wr_en(dldo_trim0_mem_wr_en),    .o_data(dldo_trim0   ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_isr_trim0      (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(isr_trim0_wr_en),     .i_mem_data(i_data), .i_mem_wr_en(isr_trim0_mem_wr_en),     .o_data(isr_trim0    ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_isr_trim1      (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(isr_trim1_wr_en),     .i_mem_data(i_data), .i_mem_wr_en(isr_trim1_mem_wr_en),     .o_data(isr_trim1    ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_isr_trim2      (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(isr_trim2_wr_en),     .i_mem_data(i_data), .i_mem_wr_en(isr_trim2_mem_wr_en),     .o_data(isr_trim2    ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_isr_trim3      (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(isr_trim3_wr_en),     .i_mem_data(i_data), .i_mem_wr_en(isr_trim3_mem_wr_en),     .o_data(isr_trim3    ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_isr_trim4      (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(isr_trim4_wr_en),     .i_mem_data(i_data), .i_mem_wr_en(isr_trim4_mem_wr_en),     .o_data(isr_trim4    ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_osc_trim0      (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(osc_trim0_wr_en),     .i_mem_data(i_data), .i_mem_wr_en(osc_trim0_mem_wr_en),     .o_data(osc_trim0    ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b1_trim0   (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b1_trim0_wr_en),  .i_mem_data(i_data), .i_mem_wr_en(b1_trim0_mem_wr_en),  .o_data(b1_trim0 ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b1_trim1   (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b1_trim1_wr_en),  .i_mem_data(i_data), .i_mem_wr_en(b1_trim1_mem_wr_en),  .o_data(b1_trim1 ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b1_trim2   (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b1_trim2_wr_en),  .i_mem_data(i_data), .i_mem_wr_en(b1_trim2_mem_wr_en),  .o_data(b1_trim2 ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b1_trim3   (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b1_trim3_wr_en),  .i_mem_data(i_data), .i_mem_wr_en(b1_trim3_mem_wr_en),  .o_data(b1_trim3 ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b1_trim4   (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b1_trim4_wr_en),  .i_mem_data(i_data), .i_mem_wr_en(b1_trim4_mem_wr_en),  .o_data(b1_trim4 ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b1_trim5   (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b1_trim5_wr_en),  .i_mem_data(i_data), .i_mem_wr_en(b1_trim5_mem_wr_en),  .o_data(b1_trim5 ));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b2_trim0  (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b2_trim0_wr_en), .i_mem_data(i_data), .i_mem_wr_en(b2_trim0_mem_wr_en), .o_data(b2_trim0));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b2_trim1  (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b2_trim1_wr_en), .i_mem_data(i_data), .i_mem_wr_en(b2_trim1_mem_wr_en), .o_data(b2_trim1));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b2_trim2  (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b2_trim2_wr_en), .i_mem_data(i_data), .i_mem_wr_en(b2_trim2_mem_wr_en), .o_data(b2_trim2));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b2_trim3  (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b2_trim3_wr_en), .i_mem_data(i_data), .i_mem_wr_en(b2_trim3_mem_wr_en), .o_data(b2_trim3));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b2_trim4  (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b2_trim4_wr_en), .i_mem_data(i_data), .i_mem_wr_en(b2_trim4_mem_wr_en), .o_data(b2_trim4));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_b2_trim5  (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(b2_trim5_wr_en), .i_mem_data(i_data), .i_mem_wr_en(b2_trim5_mem_wr_en), .o_data(b2_trim5));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_ovpc_trim0  (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(ovpc_trim0_wr_en), .i_mem_data(i_data), .i_mem_wr_en(ovpc_trim0_mem_wr_en), .o_data(ovpc_trim0));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_ovpc_trim1  (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(ovpc_trim1_wr_en), .i_mem_data(i_data), .i_mem_wr_en(ovpc_trim1_mem_wr_en), .o_data(ovpc_trim1));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_can0_trim0     (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(can0_trim0_wr_en),    .i_mem_data(i_data), .i_mem_wr_en(can0_trim0_mem_wr_en),    .o_data(can0_trim0));
    memreg #(.REGSIZE(8), .PRESET(8'h00)) inst_can1_trim0     (.clk(clk), .rst_n(rst_async_n), .i_data(i_otp_external_data), .i_wr_en(can1_trim0_wr_en),    .i_mem_data(i_data), .i_mem_wr_en(can1_trim0_mem_wr_en),    .o_data(can1_trim0));
    
    // TBD: OTP Control Byte
    memreg #(.REGSIZE(8), .PRESET(8'hFF)) inst_otp_control    (.clk(clk), .rst_n(rst_async_n), .i_data({otp_control[7:1],i_otp_external_data[0]}), .i_wr_en(otp_control_wr_en), .i_mem_data(i_data), .i_mem_wr_en(otp_control_mem_wr_en), .o_data(otp_control));
    

    
// ------------------------------------------
// OTP Registers - Regbank Interface Input Decode Logic/Output mux
// ------------------------------------------
    always @(*) begin
    
        // Default values
        part_id_0_en      = 1'b0;
        part_id_1_en      = 1'b0;
        otp_control_en    = 1'b0;
        aldo_trim0_en     = 1'b0;
        dldo_trim0_en     = 1'b0;
        isr_trim0_en      = 1'b0;
        isr_trim1_en      = 1'b0;
        isr_trim2_en      = 1'b0;
        isr_trim3_en      = 1'b0;
        isr_trim4_en      = 1'b0;
        osc_trim0_en      = 1'b0;
        b1_trim0_en   = 1'b0;
        b1_trim1_en   = 1'b0;
        b1_trim2_en   = 1'b0;
        b1_trim3_en   = 1'b0;
        b1_trim4_en   = 1'b0;
        b1_trim5_en   = 1'b0;
        b2_trim0_en  = 1'b0;
        b2_trim1_en  = 1'b0;
        b2_trim2_en  = 1'b0;
        b2_trim3_en  = 1'b0;
        b2_trim4_en  = 1'b0;
        b2_trim5_en  = 1'b0;
        ovpc_trim0_en  = 1'b0;
        ovpc_trim1_en  = 1'b0;
        can0_trim0_en     = 1'b0;
        can1_trim0_en     = 1'b0;
        o_otp_external_data = 8'hFF;
        
        case(i_otp_external_addr)

            5'd0:  begin part_id_0_en   = 1'b1; o_otp_external_data  = part_id_0    ; end
            5'd1:  begin part_id_1_en   = 1'b1; o_otp_external_data  = part_id_1    ; end
            5'd2:  begin aldo_trim0_en  = 1'b1; o_otp_external_data  = aldo_trim0   ; end
            5'd3:  begin dldo_trim0_en  = 1'b1; o_otp_external_data  = dldo_trim0   ; end
            5'd4:  begin isr_trim0_en   = 1'b1; o_otp_external_data  = isr_trim0    ; end
            5'd5:  begin isr_trim1_en   = 1'b1; o_otp_external_data  = isr_trim1    ; end
            5'd6:  begin isr_trim2_en   = 1'b1; o_otp_external_data  = isr_trim2    ; end
            5'd7:  begin isr_trim3_en   = 1'b1; o_otp_external_data  = isr_trim3    ; end
            5'd8:  begin isr_trim4_en   = 1'b1; o_otp_external_data  = isr_trim4    ; end
            5'd9:  begin osc_trim0_en   = 1'b1; o_otp_external_data  = osc_trim0    ; end
            5'd10: begin b1_trim0_en    = 1'b1; o_otp_external_data  = b1_trim0     ; end
            5'd11: begin b1_trim1_en    = 1'b1; o_otp_external_data  = b1_trim1     ; end
            5'd12: begin b1_trim2_en    = 1'b1; o_otp_external_data  = b1_trim2     ; end
            5'd13: begin b1_trim3_en    = 1'b1; o_otp_external_data  = b1_trim3     ; end
            5'd14: begin b1_trim4_en    = 1'b1; o_otp_external_data  = b1_trim4     ; end
            5'd15: begin b1_trim5_en    = 1'b1; o_otp_external_data  = b1_trim5     ; end
            5'd16: begin b2_trim0_en    = 1'b1; o_otp_external_data  = b2_trim0     ; end
            5'd17: begin b2_trim1_en    = 1'b1; o_otp_external_data  = b2_trim1     ; end
            5'd18: begin b2_trim2_en    = 1'b1; o_otp_external_data  = b2_trim2     ; end
            5'd19: begin b2_trim3_en    = 1'b1; o_otp_external_data  = b2_trim3     ; end
            5'd20: begin b2_trim4_en    = 1'b1; o_otp_external_data  = b2_trim4     ; end
            5'd21: begin b2_trim5_en    = 1'b1; o_otp_external_data  = b2_trim5     ; end
            5'd22: begin ovpc_trim0_en  = 1'b1; o_otp_external_data  = ovpc_trim0   ; end
            5'd23: begin ovpc_trim1_en  = 1'b1; o_otp_external_data  = ovpc_trim1   ; end
            5'd24: begin can0_trim0_en  = 1'b1; o_otp_external_data  = can0_trim0   ; end
            5'd25: begin can1_trim0_en  = 1'b1; o_otp_external_data  = can1_trim0   ; end
            5'd31: begin otp_control_en = 1'b1; o_otp_external_data  = otp_control  ; end

        endcase

    end
    
    // OTP reg Write enable
    assign otp_reg_wr_en       = i_test_mode & i_otp_external_data_en;
    
    assign part_id_0_wr_en     = otp_reg_wr_en & part_id_0_en;
    assign part_id_1_wr_en     = otp_reg_wr_en & part_id_1_en;
    assign aldo_trim0_wr_en    = otp_reg_wr_en & aldo_trim0_en;
    assign dldo_trim0_wr_en    = otp_reg_wr_en & dldo_trim0_en;
    assign isr_trim0_wr_en     = otp_reg_wr_en & isr_trim0_en;
    assign isr_trim1_wr_en     = otp_reg_wr_en & isr_trim1_en;
    assign isr_trim2_wr_en     = otp_reg_wr_en & isr_trim2_en;
    assign isr_trim3_wr_en     = otp_reg_wr_en & isr_trim3_en;
    assign isr_trim4_wr_en     = otp_reg_wr_en & isr_trim4_en;
    assign osc_trim0_wr_en     = otp_reg_wr_en & osc_trim0_en;
    assign b1_trim0_wr_en  = otp_reg_wr_en & b1_trim0_en;
    assign b1_trim1_wr_en  = otp_reg_wr_en & b1_trim1_en;
    assign b1_trim2_wr_en  = otp_reg_wr_en & b1_trim2_en;
    assign b1_trim3_wr_en  = otp_reg_wr_en & b1_trim3_en;
    assign b1_trim4_wr_en  = otp_reg_wr_en & b1_trim4_en;
    assign b1_trim5_wr_en  = otp_reg_wr_en & b1_trim5_en;
    assign b2_trim0_wr_en = otp_reg_wr_en & b2_trim0_en;
    assign b2_trim1_wr_en = otp_reg_wr_en & b2_trim1_en;
    assign b2_trim2_wr_en = otp_reg_wr_en & b2_trim2_en;
    assign b2_trim3_wr_en = otp_reg_wr_en & b2_trim3_en;
    assign b2_trim4_wr_en = otp_reg_wr_en & b2_trim4_en;
    assign b2_trim5_wr_en = otp_reg_wr_en & b2_trim5_en;
    assign ovpc_trim0_wr_en = otp_reg_wr_en & ovpc_trim0_en;
    assign ovpc_trim1_wr_en = otp_reg_wr_en & ovpc_trim1_en;
    assign can0_trim0_wr_en    = otp_reg_wr_en & can0_trim0_en;
    assign can1_trim0_wr_en    = otp_reg_wr_en & can1_trim0_en;
    assign otp_control_wr_en   = otp_reg_wr_en & otp_control_en;
    
    
// ------------------------------------------
// OTP Registers - Memory Interface Input Decode Logic/Output mux
// ------------------------------------------
    always @(*) begin
    
        // Default values - OTP
        part_id_0_mem_en      = 1'b0;
        part_id_1_mem_en      = 1'b0;
        aldo_trim0_mem_en     = 1'b0;
        dldo_trim0_mem_en     = 1'b0;
        isr_trim0_mem_en      = 1'b0;
        isr_trim1_mem_en      = 1'b0;
        isr_trim2_mem_en      = 1'b0;
        isr_trim3_mem_en      = 1'b0;
        isr_trim4_mem_en      = 1'b0;
        osc_trim0_mem_en      = 1'b0;
        b1_trim0_mem_en   = 1'b0;
        b1_trim1_mem_en   = 1'b0;
        b1_trim2_mem_en   = 1'b0;
        b1_trim3_mem_en   = 1'b0;
        b1_trim4_mem_en   = 1'b0;
        b1_trim5_mem_en   = 1'b0;
        b2_trim0_mem_en  = 1'b0;
        b2_trim1_mem_en  = 1'b0;
        b2_trim2_mem_en  = 1'b0;
        b2_trim3_mem_en  = 1'b0;
        can0_trim0_mem_en     = 1'b0;
        can1_trim0_mem_en     = 1'b0;
        otp_control_mem_en    = 1'b0;
        
        // Default value - Output assignment
        o_data                = 8'hFF;
        

        case(addr_reg[5:0])
                                                                                                                                  
            8'd0:   begin part_id_0_mem_en   = 1'b1; o_data = part_id_0;        end
            8'd1:   begin part_id_1_mem_en   = 1'b1; o_data = part_id_1;        end
            8'd2:   begin aldo_trim0_mem_en  = 1'b1; o_data = aldo_trim0;       end
            8'd3:   begin dldo_trim0_mem_en  = 1'b1; o_data = dldo_trim0;       end
            8'd4:   begin isr_trim0_mem_en   = 1'b1; o_data = isr_trim0;        end
            8'd5:   begin isr_trim1_mem_en   = 1'b1; o_data = isr_trim1;        end
            8'd6:   begin isr_trim2_mem_en   = 1'b1; o_data = isr_trim2;        end
            8'd7:   begin isr_trim3_mem_en   = 1'b1; o_data = isr_trim3;        end
            8'd8:   begin isr_trim4_mem_en   = 1'b1; o_data = isr_trim4;        end
            8'd9:   begin osc_trim0_mem_en   = 1'b1; o_data = osc_trim0;        end
            8'd10:  begin b1_trim0_mem_en    = 1'b1; o_data = b1_trim0;         end
            8'd11:  begin b1_trim1_mem_en    = 1'b1; o_data = b1_trim1;         end
            8'd12:  begin b1_trim2_mem_en    = 1'b1; o_data = b1_trim2;         end
            8'd13:  begin b1_trim3_mem_en    = 1'b1; o_data = b1_trim3;         end
            8'd14:  begin b1_trim4_mem_en    = 1'b1; o_data = b1_trim4;         end
            8'd15:  begin b1_trim5_mem_en    = 1'b1; o_data = b1_trim5;         end
            8'd16:  begin b2_trim0_mem_en    = 1'b1; o_data = b2_trim0;         end
            8'd17:  begin b2_trim1_mem_en    = 1'b1; o_data = b2_trim1;         end
            8'd18:  begin b2_trim2_mem_en    = 1'b1; o_data = b2_trim2;         end
            8'd19:  begin b2_trim3_mem_en    = 1'b1; o_data = b2_trim3;         end
            8'd20:  begin b2_trim4_mem_en    = 1'b1; o_data = b2_trim4;         end
            8'd21:  begin b2_trim5_mem_en    = 1'b1; o_data = b2_trim5;         end
            8'd22:  begin ovpc_trim0_mem_en  = 1'b1; o_data = ovpc_trim0;       end
            8'd23:  begin ovpc_trim1_mem_en  = 1'b1; o_data = ovpc_trim1;       end
            8'd24:  begin can0_trim0_mem_en  = 1'b1; o_data = can0_trim0;       end
            8'd25:  begin can1_trim0_mem_en  = 1'b1; o_data = can1_trim0;       end
            8'd31:  begin otp_control_mem_en = 1'b1; o_data = otp_control_data; end

                    

        endcase

    end
    
    
    // --------------------------------
    // Memory READ operation condition
    // --------------------------------
    assign valid_read = (o_op == READ) & i_valid;
    
    // --------------------------------
    // OTP assignments from memory
    // --------------------------------
    assign part_id_0_mem_wr_en   = valid_read & part_id_0_mem_en;
    assign part_id_1_mem_wr_en   = valid_read & part_id_1_mem_en;
    assign aldo_trim0_mem_wr_en  = valid_read & aldo_trim0_mem_en;
    assign dldo_trim0_mem_wr_en  = valid_read & dldo_trim0_mem_en;
    assign isr_trim0_mem_wr_en   = valid_read & isr_trim0_mem_en;
    assign isr_trim1_mem_wr_en   = valid_read & isr_trim1_mem_en;
    assign isr_trim2_mem_wr_en   = valid_read & isr_trim2_mem_en;
    assign isr_trim3_mem_wr_en   = valid_read & isr_trim3_mem_en;
    assign isr_trim4_mem_wr_en   = valid_read & isr_trim4_mem_en;
    assign osc_trim0_mem_wr_en   = valid_read & osc_trim0_mem_en;
    assign b1_trim0_mem_wr_en    = valid_read & b1_trim0_mem_en;
    assign b1_trim1_mem_wr_en    = valid_read & b1_trim1_mem_en;
    assign b1_trim2_mem_wr_en    = valid_read & b1_trim2_mem_en;
    assign b1_trim3_mem_wr_en    = valid_read & b1_trim3_mem_en;
    assign b1_trim4_mem_wr_en    = valid_read & b1_trim4_mem_en;
    assign b1_trim5_mem_wr_en    = valid_read & b1_trim5_mem_en;
    assign b2_trim0_mem_wr_en    = valid_read & b2_trim0_mem_en;
    assign b2_trim1_mem_wr_en    = valid_read & b2_trim1_mem_en;
    assign b2_trim2_mem_wr_en    = valid_read & b2_trim2_mem_en;
    assign b2_trim3_mem_wr_en    = valid_read & b2_trim3_mem_en;
    assign b2_trim4_mem_wr_en    = valid_read & b2_trim4_mem_en;
    assign b2_trim5_mem_wr_en    = valid_read & b2_trim5_mem_en;
    assign ovpc_trim0_mem_wr_en  = valid_read & ovpc_trim0_mem_en;
    assign ovpc_trim1_mem_wr_en  = valid_read & ovpc_trim1_mem_en;
    assign can0_trim0_mem_wr_en  = valid_read & can0_trim0_mem_en;
    assign can1_trim0_mem_wr_en  = valid_read & can1_trim0_mem_en;
    assign otp_control_mem_wr_en = valid_read & otp_control_mem_en;
    
   
// ------------------------------------------
// Output assignments
// ------------------------------------------
    // Trim Outputs
    assign o_aldo_trim0  = aldo_trim0 ; 
    assign o_dldo_trim0  = dldo_trim0 ;
    assign o_isr_trim0   = isr_trim0  ;
    assign o_isr_trim1   = isr_trim1  ;
    assign o_isr_trim2   = isr_trim2  ;
    assign o_isr_trim3   = isr_trim3  ;
    assign o_isr_trim4   = isr_trim4  ;
    assign o_osc_trim0   = osc_trim0  ;
    assign o_b1_trim0    = b1_trim0   ;
    assign o_b1_trim1    = b1_trim1   ;
    assign o_b1_trim2    = b1_trim2   ;
    assign o_b1_trim3    = b1_trim3   ;
    assign o_b1_trim4    = b1_trim4   ;
    assign o_b1_trim5    = b1_trim5   ;
    assign o_b2_trim0    = b2_trim0   ;
    assign o_b2_trim1    = b2_trim1   ;
    assign o_b2_trim2    = b2_trim2   ;
    assign o_b2_trim3    = b2_trim3   ;
    assign o_b2_trim4    = b2_trim4   ;
    assign o_b2_trim5    = b2_trim5   ;
    assign o_ovpc_trim0  = ovpc_trim0 ;
    assign o_ovpc_trim1  = ovpc_trim1 ;
    assign o_can0_trim0  = can0_trim0 ;
    assign o_can1_trim0  = can1_trim0 ;
    
    // Memory wrapper interface: addr
    assign o_addr = addr_reg;    
    
    
//--------------------------------------------
//  OVPC Trim Pulse
//--------------------------------------------
    assign o_ovpc_trim_strobe = ovpc_trim_strobe_reg;
    assign ovpc_trim_update   = (ovpc_trim0_wr_en | ovpc_trim0_mem_wr_en | ovpc_trim1_wr_en | ovpc_trim1_mem_wr_en);
    
    always @(posedge clk, negedge rst_async_n) begin
        if(!rst_async_n)
            ovpc_trim_strobe_reg    <= 1'b0;
        else begin
            ovpc_trim_strobe_reg <= ovpc_trim_update;
        end
    end
    

// ------------------------------------------
// Control Logic (Save / Load / Lock)
// ------------------------------------------
    // Sequential procedure for state
    always @ (posedge clk, negedge rst_async_n)
    begin 
        if (!rst_async_n)
            state   <= READ_LOCK_BIT_1;
        else
            state   <= next_state;
    end

    // Combinational procedure for next state
    always @(*)
    begin
        next_state = state;
        case (state)
            READ_LOCK_BIT_1:    next_state = READ_LOCK_BIT_2;
            READ_LOCK_BIT_2:    next_state = READ_LOCK_BIT_3;
            READ_LOCK_BIT_3:    next_state = READ_LOCK_BIT_4;
            READ_LOCK_BIT_4:    if (i_valid)
                                    next_state = READ_LOCK_BIT_5;
            READ_LOCK_BIT_5:    if ((i_data[0] == 1'b0) || (i_data[1] == 1'b0))              // IssueID #7899
                                    next_state = INIT_READ_OTP_1;
                                else
                                    next_state = IDLE;
            
            INIT_READ_OTP_1:    next_state = INIT_READ_OTP_2;
            INIT_READ_OTP_2:    next_state = INIT_READ_OTP_3;
            INIT_READ_OTP_3:    next_state = INIT_READ_OTP_4;
            INIT_READ_OTP_4:    if (i_valid)
                                    next_state = INIT_READ_OTP_5;
            INIT_READ_OTP_5:    if (pointer_reg < pointer_limit_reg)
                                    next_state = INIT_READ_OTP_2;
                                else
                                    next_state = INIT_READ_MTP_1;
            
            INIT_READ_MTP_1:    next_state = INIT_READ_MTP_2;
            INIT_READ_MTP_2:    next_state = INIT_READ_MTP_3;
            INIT_READ_MTP_3:    next_state = INIT_READ_MTP_4;
            INIT_READ_MTP_4:    if (i_valid)
                                    next_state = INIT_READ_MTP_5;
            INIT_READ_MTP_5:    if (pointer_reg < pointer_limit_reg)
                                    next_state = INIT_READ_MTP_2;
                                else
                                    next_state = IDLE;
            
            IDLE:       /*if (i_save_status)
                            next_state = SAVE_1;
                        else */if (i_otp_load && i_test_mode/* || i_mtp_load*/)
                            next_state = READ_1;
//                         else if ((i_otp_save & i_test_mode) || i_mtp_save)
                        else if (i_otp_save && i_test_mode && otp_control[1])
                            next_state = WRITE_1;
                        else if (i_otp_erase && i_test_mode && otp_control[1])
                            next_state = ERASE_1;
                        else if (i_otp_lock && i_test_mode && otp_control[1])
                            next_state = LOCK_1;
            
            SAVE_1:     next_state = SAVE_2;
            SAVE_2:     next_state = SAVE_3;
            SAVE_3:     if (i_valid)
                            next_state = SAVE_4;
            SAVE_4:     if (pointer_reg < pointer_limit_reg)
                            next_state = SAVE_1;
                        else
                            next_state = IDLE;
            
            WRITE_1:    next_state = WRITE_2;
            WRITE_2:    next_state = WRITE_3;
            WRITE_3:    if (i_valid)
                            next_state = WRITE_4;
            WRITE_4:    if (pointer_reg < pointer_limit_reg)
                            next_state = WRITE_1;
                        else
                            next_state = WRITE_5;
            WRITE_5:    next_state = WRITE_6;
            WRITE_6:    next_state = WRITE_7;
            WRITE_7:    if (i_valid)
                            next_state = WRITE_8;
            WRITE_8:    next_state = READ_1;
                                    
            READ_1:     next_state = READ_2;
            READ_2:     next_state = READ_3;
            READ_3:     if (i_valid)
                            next_state = READ_4;
            READ_4:     if (pointer_reg < pointer_limit_reg)
                            next_state = READ_1;
                        else
                            next_state = READ_5;
            READ_5:     next_state = READ_6;
            READ_6:     next_state = READ_7;
            READ_7:     if (i_valid)
                            next_state = READ_8;
            READ_8:     next_state = IDLE;
            
            LOCK_1:     next_state = LOCK_2;
            LOCK_2:     next_state = LOCK_3;
            LOCK_3:     if (i_valid)
                            next_state = LOCK_4;
            LOCK_4:     next_state = LOCK_5;
            LOCK_5:     next_state = LOCK_6;
            LOCK_6:     next_state = LOCK_7;
            LOCK_7:     if (i_valid)
                            next_state = LOCK_8;
            LOCK_8:     next_state = IDLE;
            
            ERASE_1:    next_state = ERASE_2;
            ERASE_2:    next_state = ERASE_3;
            ERASE_3:    if (i_valid)
                            next_state = ERASE_4;
            ERASE_4:    next_state = IDLE;
        endcase
    end

    // Combinational procedure for next outputs
    always @(*)
    begin
        next_addr_reg      = addr_reg;
        next_o_op          = o_op;
        next_o_region      = o_region;
        next_o_op_valid    = o_op_valid;
        next_pointer_limit = pointer_limit_reg;
        next_o_ready       = o_ready;
        next_o_init_done   = o_init_done;
        
        case (state)
            READ_LOCK_BIT_1:    begin
                                    next_o_region       = 1'b1;                     // operations only on Information Block
                                    next_o_op           = READ;
                                    next_pointer_limit  = LOCK_BIT_POINTER_LIMIT;
                                    next_addr_reg       = OTP_LOCK_BYTE;
                                end
            READ_LOCK_BIT_2:    next_o_op_valid = 1'b1;
            READ_LOCK_BIT_3:    next_o_op_valid = 1'b0;
            READ_LOCK_BIT_5:    if ( !((i_data[0] == 1'b0) || (i_data[1] == 1'b0)) )
                                    next_o_init_done = 1'b1;
                            
            INIT_READ_OTP_1:    begin
                                    next_o_op           = READ;
                                    next_pointer_limit  = OTP_POINTER_LIMIT;
                                    next_addr_reg       = {NBW_DATA{1'b0}};
                                end
            INIT_READ_OTP_2:    begin
                                    next_o_op_valid = 1'b1;
                                    next_o_ready    = 1'b0;
                                end
            INIT_READ_OTP_3:    next_o_op_valid = 1'b0;
            INIT_READ_OTP_5:    if (pointer_reg < pointer_limit_reg)
                                    next_addr_reg[4:0] = pointer_reg;
                            
            INIT_READ_MTP_1:    begin
                                    next_o_op           = READ;
                                    next_pointer_limit  = MTP_POINTER_LIMIT;
                                    next_addr_reg       = 8'd32;
                                end
            INIT_READ_MTP_2:    next_o_op_valid = 1'b1;
            INIT_READ_MTP_3:    next_o_op_valid = 1'b0;
            INIT_READ_MTP_5:    if (pointer_reg < pointer_limit_reg)
                                    next_addr_reg[4:0] = pointer_reg;
                                else
                                begin
                                    next_o_init_done = 1'b1;
                                    next_o_ready = 1'b1;
                                end
                                
            IDLE:       begin
//                             if (i_save_status)
//                             begin
//                                 next_o_op           = WRITE;
//                                 next_pointer_limit  = MTP_POINTER_LIMIT;
//                                 next_addr_reg       = 8'd41;
//                             end 
/*                            else*/ if (i_otp_load && i_test_mode)
                            begin
                                next_o_op           = READ;
                                next_pointer_limit  = OTP_POINTER_LIMIT;
                                next_addr_reg       = {NBW_DATA{1'b0}};
                            end
                            else if (i_otp_save && i_test_mode && otp_control[1])
                            begin
                                next_o_op           = WRITE;
                                next_pointer_limit  = OTP_POINTER_LIMIT;
                                next_addr_reg       = {NBW_DATA{1'b0}};
                            end 
                            else if (i_otp_erase && i_test_mode && otp_control[1])
                            begin
                                next_o_op           = ERASE;
                                next_pointer_limit  = OTP_POINTER_LIMIT;
                                next_addr_reg       = {NBW_DATA{1'b0}};
                            end 
                            else if (i_otp_lock && i_test_mode && otp_control[1])
                            begin
                                next_o_op           = WRITE;
                                next_pointer_limit  = LOCK_BIT_POINTER_LIMIT;
                                next_addr_reg       = OTP_LOCK_BYTE;
                            end 
//                             else if (i_mtp_save)
//                             begin
//                                 next_o_op           = WRITE;
//                                 next_pointer_limit  = MTP_POINTER_LIMIT;
//                                 next_addr_reg       = 8'd32;
//                             end
//                             else if (i_mtp_load)
//                             begin
//                                 next_o_op           = READ;
//                                 next_pointer_limit  = MTP_POINTER_LIMIT;
//                                 next_addr_reg       = 8'd32;
//                             end
                        end

            SAVE_1:     begin
                            next_o_op_valid = 1'b1;
                            next_o_ready    = 1'b0;
                        end
            SAVE_2:     next_o_op_valid = 1'b0;
            SAVE_4:     if (pointer_reg < pointer_limit_reg)
                            next_addr_reg[4:0] = pointer_reg;
                        else
                            next_o_ready = 1'b1;

            WRITE_1:    begin
                            next_o_op_valid = 1'b1;
                            next_o_ready    = 1'b0;
                        end
            WRITE_2:    next_o_op_valid = 1'b0;
            WRITE_4:    begin
                            if (pointer_reg < pointer_limit_reg)
                                next_addr_reg[4:0] = pointer_reg;
                            else
                            begin
                                next_pointer_limit  = LOCK_BIT_POINTER_LIMIT;
                                next_addr_reg       = OTP_LOCK_BYTE;
                            end
                        end
            WRITE_5:    next_o_op_valid = 1'b1;
            WRITE_6:    next_o_op_valid = 1'b0;
            WRITE_8:    begin
                            next_pointer_limit  = OTP_POINTER_LIMIT;
                            next_addr_reg[4:0] = {5{1'b0}};
                            next_o_op = READ;
                        end

            READ_1:     begin
                            next_o_op_valid = 1'b1;
                            next_o_ready    = 1'b0;
                        end
            READ_2:     next_o_op_valid = 1'b0;
            READ_4:     if (pointer_reg < pointer_limit_reg)
                            next_addr_reg[4:0] = pointer_reg;
                        else
                        begin
                            next_pointer_limit  = LOCK_BIT_POINTER_LIMIT;
                            next_addr_reg       = OTP_LOCK_BYTE;
                        end
            READ_5:     next_o_op_valid = 1'b1;
            READ_6:     next_o_op_valid = 1'b0;
            READ_8:     next_o_ready    = 1'b1;

            LOCK_1:     begin
                            next_o_op_valid = 1'b1;
                            next_o_ready    = 1'b0;
                        end
            LOCK_2:     next_o_op_valid = 1'b0;
            LOCK_4:     begin
                            next_o_op = READ;
                            next_addr_reg = OTP_LOCK_BYTE;
                        end
            LOCK_5:     next_o_op_valid = 1'b1;
            LOCK_6:     next_o_op_valid = 1'b0;
            LOCK_8:     next_o_ready    = 1'b1;

            ERASE_1:    next_o_op_valid = 1'b1;
            ERASE_2:    next_o_op_valid = 1'b0;
            ERASE_4:    next_o_ready    = 1'b1;
        endcase
    end

    // Sequential procedure for calculations
    always @ (posedge clk, negedge rst_async_n)
    begin 
        if (!rst_async_n)
        begin
            pointer_reg       <= {5{1'b0}};
            pointer_limit_reg <= {5{1'b0}};
            otp_control_data  <= 8'hFF;
        end
        else 
        begin
            pointer_limit_reg <= next_pointer_limit;
            
            case (state)
                IDLE:   /*if (i_save_status)
                            pointer_reg <= 5'd9;    // addr_reg[4:0]
                        else*/ if (i_otp_load && i_test_mode/* || i_mtp_load*/)
                            otp_control_data <= otp_control;
//                         else if ((i_otp_save & i_test_mode) || i_mtp_save)
                        else if (i_otp_save && i_test_mode && otp_control[1])
                            otp_control_data <= otp_control;
                        else if (i_otp_erase && i_test_mode && otp_control[1])
                            otp_control_data <= otp_control;
                        else if (i_otp_lock && i_test_mode && otp_control[1])
                            otp_control_data <= {otp_control[7:2],1'b0,otp_control[0]};
                        else
                            otp_control_data <= otp_control;
                            
                INIT_READ_OTP_4, INIT_READ_MTP_4, SAVE_3, WRITE_3, READ_3:          if (i_valid)
                                                                                        pointer_reg <= pointer_reg + 'd1;
            
                INIT_READ_OTP_5, INIT_READ_MTP_5, SAVE_4, WRITE_8, READ_8, LOCK_8:  if (pointer_reg == pointer_limit_reg)
                                                                                        pointer_reg <= {5{1'b0}};
                
                WRITE_4, READ_4, LOCK_4:    if (pointer_reg == pointer_limit_reg)
                                                pointer_reg <= 5'd31;    // addr_reg[4:0]
            endcase
        end
    end

    // Sequential procedure for outputs to memory wrapper
    always @ (posedge clk, negedge rst_async_n)
    begin 
        if (!rst_async_n)
        begin
            addr_reg    <= {NBW_DATA{1'b0}};
            o_op        <= 4'b0;
            o_region    <= 1'b0;
            o_op_valid  <= 1'b0;
            o_ready     <= 1'b1;
            o_init_done <= 1'b0;
        end
        else
        begin
            addr_reg    <= next_addr_reg;
            o_op        <= next_o_op;
            o_region    <= next_o_region;
            o_op_valid  <= next_o_op_valid;
            o_ready     <= next_o_ready;
            o_init_done <= next_o_init_done;
        end
    end

     
endmodule
