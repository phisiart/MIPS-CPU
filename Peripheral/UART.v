`timescale 1ns / 1ps

// UART Peripheral
// Created by Zhengrong Wang
// Created 03/07/2014
// Last Modified 05/07/2014 by Zhixun Tan
// Modification note:
// 1. Modify indentation: now there are only 4-spaces
// 2. Add module specification

// UART
// This module is for I/O.
// input:
//   UART_RX: read the input bit by bit
//   RX_READ: a feedback impulse of 1 that tells the UART that what it read has been used by outer modules
//   [7:0]UART_TXD: what the user want to send
//   TX_EN: set it to 1 as a new sending order
//   sysclk
//   reset
// output:
//   [7:0]UART_RXD: the 8-bit data it has just read
//   RX_EFF: 
//   UART_TX: send data out bit by bit
//   TX_STATUS: 1 if the sender is free, see UART_Sender.v
//   
module UART(
    input UART_RX,
    output UART_TX,
    output [7:0] UART_RXD,
    input [7:0] UART_TXD,
    output reg RX_EFF,
    input RX_READ,
    output TX_STATUS,
    input TX_EN,
    input sysclk,
    input reset
);
    wire brclk;
    wire RX_STATUS;

    wire reset_UBRG;

    // negedge_detc module to detect the negedge of reset
    // it generates a negative impluse to reset the UART_Baud_Rate_Generator Module

    negedge_detc NEG_inst(
        .clk(sysclk),
        .signal(reset),
        .z(reset_UBRG)
    );

    //////////////////////////

    // RX_EFF:
    // 1'b1: THE UART_RXD hasn't been read
    // 1'b0: THE UART_RXD has been read, and no new data has been received
    // basically, RX_EFF is a flag to tell whether the data stored in UART_RXD is unused

    //////////////////////////

    always @(posedge sysclk or negedge reset) begin
        if (!reset) begin
            RX_EFF <= 1'b0;
        end else if (RX_READ) begin
            RX_EFF <= 1'b0;
        end else if (RX_STATUS) begin
            RX_EFF <= 1'b1;
        end
    end

    // Generate the baud rate
    UART_Baud_Rate_Generator UBRG_inst(
        .sysclk(sysclk),
        .reset(reset_UBRG),
        .brclk(brclk)
    );

    UART_Receiver UART_Receiver_inst(
        .UART_RX(UART_RX), 
        .sysclk(sysclk), 
        .brclk(brclk), 
        .reset(reset), 
        .RX_STATUS(RX_STATUS), 
        .RX_DATA(UART_RXD)
    );

    wire baudclk;
    divider_16 di(brclk, reset_UBRG, baudclk);

    UART_Sender UART_Sender_inst(
        .sysclk(sysclk), 
        .baudclk(baudclk), 
        .reset(reset), 
        .TX_DATA(UART_TXD), 
        .TX_EN(TX_EN), 
        .UART_TX(UART_TX), 
        .TX_STATUS(TX_STATUS)
    );

endmodule

// The negedge_detc module is used to detect the negedge of some signal
// Designed by FSM
// When a negedge comes, the output is set to 0 for 2 clock cycles.
module negedge_detc(
    input clk,
    input signal,
    output z
);
    reg [1:0] status;
    assign z = status[1] || signal;
    wire [1:0] status_next;
    assign status_next[0] = (~status[0]) & (~signal) & (~status[1]);
    assign status_next[1] = (~signal) & (status[0] | status[1]);
    always @(posedge clk) begin
        status <= status_next;
    end
endmodule
