////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2018 Chipus Microelectronics. All rights reserved.
// Chipus Microelectronics Confidential Proprietary.
//
// Use, copy or distribution of this code is not allowed without 
// Chipus Microelectronics explicit written consent.
////////////////////////////////////////////////////////////////////////////////
// $Id: memory_controller.v 627 2022-09-15 19:27:21Z mherve $
////////////////////////////////////////////////////////////////////////////////
// Company:         Chipus Microelectronics
// Project Name:    Redbird
// Module Name:     MODULE_CMX221_DIGITAL
// Description:     This block will interface with the memory wrapper to execute
//                  the memory IP atomic operations such as “read”, “write” and
//                  “erase”, and to control the section of memory that will work
//                  as OTP.
////////////////////////////////////////////////////////////////////////////////

module memory_controller (
    i_i2c_data,
    i_i2c_byte_request,
    i_i2c_byte_ready,
    i_i2c_active,
    o_i2c_w_pending,
    o_i2c_data,
    clk,
    rst_async_n,
//     i_save_status,
    i_test_mode,
    o_otp_external_data,
    i_otp_external_data,
    i_otp_external_addr,
    i_otp_external_data_en,
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
    i_command,
    o_ovpc_trim_strobe

);



// ------------------------------------------
// Parameters
// ------------------------------------------



// ------------------------------------------
// Local Parameters
// ------------------------------------------

    // Bit width of data adapted to generic interface
    localparam integer NBW_DATA = 'd8;



// ------------------------------------------
// IO declaration
// ------------------------------------------

    // I2C: data received
    input  wire [NBW_DATA-1:0] i_i2c_data;

    // I2C: data is requested
    input  wire i_i2c_byte_request;

    // I2C: data received
    input  wire i_i2c_byte_ready;

    // I2C: active flag
    input  wire i_i2c_active;

    // I2C: data available from source
    output wire o_i2c_w_pending;

    // I2C: data to send
    output wire [NBW_DATA-1:0] o_i2c_data;

    // System clock
    input  wire clk;

    // System assynchronous inverted logic reset
    input  wire rst_async_n;

    // Indicates status regs need to be saved
//     input  wire i_save_status;

    // Test mode selection (1: Test mode; 0: User mode)
    input  wire i_test_mode;

    // External Register access (OTP)
    output wire [NBW_DATA-1:0] o_otp_external_data;

    // External Register access (OTP)
    input  wire [NBW_DATA-1:0] i_otp_external_data;

    // External Register access (OTP)
    input  wire [5-1:0] i_otp_external_addr;

    // External Register access (OTP)
    input  wire i_otp_external_data_en;

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
    output wire o_ready;

    // Memory initialization done
    output wire o_init_done;

    // Save regbank content on OTP or MTP
    input  wire [NBW_DATA-1:0] i_command;
    
    // OVPC Trim Update
    output wire o_ovpc_trim_strobe;



// ------------------------------------------
// Interconnection signals
// ------------------------------------------

    // Interconnects: eeprom_info_block_control
    wire [NBW_DATA-1:0] eeprom_info_block_control_addr;
    wire [NBW_DATA-1:0] eeprom_info_block_control_data;
    wire [4-1:0] eeprom_info_block_control_op;
    wire eeprom_info_block_control_region;
    wire eeprom_info_block_control_op_valid;
    wire [NBW_DATA-1:0] eeprom_info_block_control_otp_external_data;
    wire [NBW_DATA-1:0] eeprom_info_block_control_aldo_trim0;
    wire [NBW_DATA-1:0] eeprom_info_block_control_dldo_trim0;
    wire [NBW_DATA-1:0] eeprom_info_block_control_isr_trim0;
    wire [NBW_DATA-1:0] eeprom_info_block_control_isr_trim1;
    wire [NBW_DATA-1:0] eeprom_info_block_control_isr_trim2;
    wire [NBW_DATA-1:0] eeprom_info_block_control_isr_trim3;
    wire [NBW_DATA-1:0] eeprom_info_block_control_isr_trim4;
    wire [NBW_DATA-1:0] eeprom_info_block_control_osc_trim0;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b1_trim0;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b1_trim1;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b1_trim2;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b1_trim3;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b1_trim4;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b1_trim5;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b2_trim0;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b2_trim1;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b2_trim2;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b2_trim3;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b2_trim4;
    wire [NBW_DATA-1:0] eeprom_info_block_control_b2_trim5;
    wire [NBW_DATA-1:0] eeprom_info_block_control_ovpc_trim0;
    wire [NBW_DATA-1:0] eeprom_info_block_control_ovpc_trim1;
    wire [NBW_DATA-1:0] eeprom_info_block_control_can0_trim0;
    wire [NBW_DATA-1:0] eeprom_info_block_control_can1_trim0;
    wire eeprom_info_block_control_ready;
    wire eeprom_info_block_control_init_done;
    wire eeprom_info_block_control_ovpc_trim_strobe;

    // Interconnects: eeprom_main_block_control
    wire eeprom_main_block_control_i2c_w_pending;
    wire [NBW_DATA-1:0] eeprom_main_block_control_i2c_data;
    wire [NBW_DATA-1:0] eeprom_main_block_control_addr;
    wire [NBW_DATA-1:0] eeprom_main_block_control_data;
    wire [4-1:0] eeprom_main_block_control_op;
    wire eeprom_main_block_control_region;
    wire eeprom_main_block_control_op_valid;
    wire eeprom_main_block_control_mem_access_mux_sel;
    wire eeprom_main_block_control_ready;

    // Interconnects: mem_wrapper_access_mux
    wire [NBW_DATA-1:0] mem_wrapper_access_mux_addr;
    wire [NBW_DATA-1:0] mem_wrapper_access_mux_data;
    wire [4-1:0] mem_wrapper_access_mux_op;
    wire mem_wrapper_access_mux_region;
    wire mem_wrapper_access_mux_op_valid;
    wire mem_wrapper_access_mux_info_valid;
    wire [NBW_DATA-1:0] mem_wrapper_access_mux_info_data;
    wire mem_wrapper_access_mux_main_valid;
    wire [NBW_DATA-1:0] mem_wrapper_access_mux_main_data;

    // Interconnects: EN0256X8AA130BH02_wrapper
    wire EN0256X8AA130BH02_wrapper_valid;
    wire [NBW_DATA-1:0] EN0256X8AA130BH02_wrapper_data;


    // Output assignments    
    assign o_otp_external_data = eeprom_info_block_control_otp_external_data;
    assign o_aldo_trim0 = eeprom_info_block_control_aldo_trim0;
    assign o_dldo_trim0 = eeprom_info_block_control_dldo_trim0;
    assign o_isr_trim0 = eeprom_info_block_control_isr_trim0;
    assign o_isr_trim1 = eeprom_info_block_control_isr_trim1;
    assign o_isr_trim2 = eeprom_info_block_control_isr_trim2;
    assign o_isr_trim3 = eeprom_info_block_control_isr_trim3;
    assign o_isr_trim4 = eeprom_info_block_control_isr_trim4;
    assign o_osc_trim0 = eeprom_info_block_control_osc_trim0;
    assign o_b1_trim0 = eeprom_info_block_control_b1_trim0;
    assign o_b1_trim1 = eeprom_info_block_control_b1_trim1;
    assign o_b1_trim2 = eeprom_info_block_control_b1_trim2;
    assign o_b1_trim3 = eeprom_info_block_control_b1_trim3;
    assign o_b1_trim4 = eeprom_info_block_control_b1_trim4;
    assign o_b1_trim5 = eeprom_info_block_control_b1_trim5;
    assign o_b2_trim0 = eeprom_info_block_control_b2_trim0;
    assign o_b2_trim1 = eeprom_info_block_control_b2_trim1;
    assign o_b2_trim2 = eeprom_info_block_control_b2_trim2;
    assign o_b2_trim3 = eeprom_info_block_control_b2_trim3;
    assign o_b2_trim4 = eeprom_info_block_control_b2_trim4;
    assign o_b2_trim5 = eeprom_info_block_control_b2_trim5;
    assign o_ovpc_trim0 = eeprom_info_block_control_ovpc_trim0;
    assign o_ovpc_trim1 = eeprom_info_block_control_ovpc_trim1;
    assign o_can0_trim0 = eeprom_info_block_control_can0_trim0;
    assign o_can1_trim0 = eeprom_info_block_control_can1_trim0;
    assign o_init_done = eeprom_info_block_control_init_done;
    assign o_ovpc_trim_strobe = eeprom_info_block_control_ovpc_trim_strobe;
    assign o_i2c_w_pending = eeprom_main_block_control_i2c_w_pending;
    assign o_i2c_data = eeprom_main_block_control_i2c_data;
    assign o_ready = eeprom_main_block_control_ready && eeprom_info_block_control_ready;
    



// ------------------------------------------
// Instances
// ------------------------------------------

    // This subblock is responsible for trimming memory and save status before system shutdown
    eeprom_info_block_control #(
        .NBW_DATA(NBW_DATA)
    ) inst_eeprom_info_block_control (
        .clk(clk),
        .rst_async_n(rst_async_n),
//         .i_save_status(i_save_status),
        .i_test_mode(i_test_mode),
        .i_valid(mem_wrapper_access_mux_info_valid),
        .i_data(mem_wrapper_access_mux_info_data),
        .o_addr(eeprom_info_block_control_addr),
        .o_data(eeprom_info_block_control_data),
        .o_op(eeprom_info_block_control_op),
        .o_region(eeprom_info_block_control_region),
        .o_op_valid(eeprom_info_block_control_op_valid),
        .i_otp_load(i_command[0]),
        .i_otp_save(i_command[1]),
        .i_otp_erase(i_command[2]),
        .i_otp_lock(i_command[3]),
        .o_otp_external_data(eeprom_info_block_control_otp_external_data),
        .i_otp_external_data(i_otp_external_data),
        .i_otp_external_addr(i_otp_external_addr),
        .i_otp_external_data_en(i_otp_external_data_en),
        .o_aldo_trim0(eeprom_info_block_control_aldo_trim0),
        .o_dldo_trim0(eeprom_info_block_control_dldo_trim0),
        .o_isr_trim0(eeprom_info_block_control_isr_trim0),
        .o_isr_trim1(eeprom_info_block_control_isr_trim1),
        .o_isr_trim2(eeprom_info_block_control_isr_trim2),
        .o_isr_trim3(eeprom_info_block_control_isr_trim3),
        .o_isr_trim4(eeprom_info_block_control_isr_trim4),
        .o_osc_trim0(eeprom_info_block_control_osc_trim0),
        .o_b1_trim0(eeprom_info_block_control_b1_trim0),
        .o_b1_trim1(eeprom_info_block_control_b1_trim1),
        .o_b1_trim2(eeprom_info_block_control_b1_trim2),
        .o_b1_trim3(eeprom_info_block_control_b1_trim3),
        .o_b1_trim4(eeprom_info_block_control_b1_trim4),
        .o_b1_trim5(eeprom_info_block_control_b1_trim5),
        .o_b2_trim0(eeprom_info_block_control_b2_trim0),
        .o_b2_trim1(eeprom_info_block_control_b2_trim1),
        .o_b2_trim2(eeprom_info_block_control_b2_trim2),
        .o_b2_trim3(eeprom_info_block_control_b2_trim3),
        .o_b2_trim4(eeprom_info_block_control_b2_trim4),
        .o_b2_trim5(eeprom_info_block_control_b2_trim5),
        .o_ovpc_trim0(eeprom_info_block_control_ovpc_trim0),
        .o_ovpc_trim1(eeprom_info_block_control_ovpc_trim1),
        .o_can0_trim0(eeprom_info_block_control_can0_trim0),
        .o_can1_trim0(eeprom_info_block_control_can1_trim0),
        .o_ready(eeprom_info_block_control_ready),
        .o_init_done(eeprom_info_block_control_init_done),
        .o_ovpc_trim_strobe(eeprom_info_block_control_ovpc_trim_strobe)
    );

    // This block will interface external microcontroller with Main block for READ, WRITE and ERASE operations.
    eeprom_main_block_control #(
        .NBW_DATA(NBW_DATA)
    ) inst_eeprom_main_block_control (
        .clk(clk),
        .rst_async_n(rst_async_n),
        .i_valid(mem_wrapper_access_mux_main_valid),
        .i_data(mem_wrapper_access_mux_main_data),
        .i_i2c_data(i_i2c_data),
        .i_i2c_byte_request(i_i2c_byte_request),
        .i_i2c_byte_ready(i_i2c_byte_ready),
        .i_i2c_active(i_i2c_active),
        .o_i2c_w_pending(eeprom_main_block_control_i2c_w_pending),
        .o_i2c_data(eeprom_main_block_control_i2c_data),
        .o_addr(eeprom_main_block_control_addr),
        .o_data(eeprom_main_block_control_data),
        .o_op(eeprom_main_block_control_op),
        .o_region(eeprom_main_block_control_region),
        .o_op_valid(eeprom_main_block_control_op_valid),
        .o_mem_access_mux_sel(eeprom_main_block_control_mem_access_mux_sel),
        .o_ready(eeprom_main_block_control_ready)
    );

    // Mux to select which of the other subblocks will send/receive data to memory
    mem_wrapper_access_mux #(
        .NBW_DATA(NBW_DATA)
    ) inst_mem_wrapper_access_mux (
        .i_valid(EN0256X8AA130BH02_wrapper_valid),
        .i_data(EN0256X8AA130BH02_wrapper_data),
        .o_addr(mem_wrapper_access_mux_addr),
        .o_data(mem_wrapper_access_mux_data),
        .o_op(mem_wrapper_access_mux_op),
        .o_region(mem_wrapper_access_mux_region),
        .o_op_valid(mem_wrapper_access_mux_op_valid),
        .o_info_valid(mem_wrapper_access_mux_info_valid),
        .o_info_data(mem_wrapper_access_mux_info_data),
        .i_info_addr(eeprom_info_block_control_addr),
        .i_info_data(eeprom_info_block_control_data),
        .i_info_op(eeprom_info_block_control_op),
        .i_info_region(eeprom_info_block_control_region),
        .i_info_op_valid(eeprom_info_block_control_op_valid),
        .o_main_valid(mem_wrapper_access_mux_main_valid),
        .o_main_data(mem_wrapper_access_mux_main_data),
        .i_main_addr(eeprom_main_block_control_addr),
        .i_main_data(eeprom_main_block_control_data),
        .i_main_op(eeprom_main_block_control_op),
        .i_main_region(eeprom_main_block_control_region),
        .i_main_op_valid(eeprom_main_block_control_op_valid),
        .i_selector(eeprom_main_block_control_mem_access_mux_sel)
    );

    // EN0256X8AA130BH02 IP memory wrapper to generate IP transactions based on commands for the following operations: Read, Write, Erase, Margin Read
    EN0256X8AA130BH02_wrapper #(
        .NBW_DATA(NBW_DATA)
    ) inst_EN0256X8AA130BH02_wrapper (
        .clk(clk),
        .rst_async_n(rst_async_n),
        .o_valid(EN0256X8AA130BH02_wrapper_valid),
        .o_data(EN0256X8AA130BH02_wrapper_data),
        .i_addr(mem_wrapper_access_mux_addr),
        .i_data(mem_wrapper_access_mux_data),
        .i_op(mem_wrapper_access_mux_op),
        .i_region(mem_wrapper_access_mux_region),
        .i_op_valid(mem_wrapper_access_mux_op_valid)
    );


    
endmodule
