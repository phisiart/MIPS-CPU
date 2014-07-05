`timescale 1ns / 1ps

// UART_Sender module
// Created by Zhengrong Wang
// Created 02/07/2014
// Last modified 05/07/2014 By Zhixun Tan
// Modification note:
// 1. Modify indentation: now they are all 4-spaces
// 2. Add module specification

// UART_Sender
// This module sends data bit by bit.
// * UART_TX is the bit it is currently sending.
// * TX_STATUS: 1 if the sender is free: no data is being sent and it is happy to take a new order.
//              0 if the sender is occupied: data is being sent
// * To give it an order, you
//     1) specify the 8-bit data through TX_DATA
//     2) give TX_EN an impulse of 1, the sender will detect the impulse.
// * The sender can be reset, and it will be set free.
module UART_Sender(
    input sysclk,
    input baudclk,
    input reset,
    input [7:0] TX_DATA,
    input TX_EN,
    output UART_TX,
    output TX_STATUS
);

    reg [7:0] TX_DATA_REG;
    reg [3:0] count;
    reg UART_TX_REG;
    assign UART_TX = UART_TX_REG;
    reg TX_STATUS_REG;
    assign TX_STATUS = TX_STATUS_REG;

    always @(posedge baudclk or posedge TX_EN) begin
        if (!reset) begin
            TX_DATA_REG <= 8'h00;
            UART_TX_REG <= 1'b1;
            count <= 4'h0;
            TX_STATUS_REG <= 1'b1;
        end else if (TX_EN) begin
            TX_DATA_REG <= TX_DATA;
            count <= 4'h1;
        end else begin
            case(count)
            4'ha: begin
                count <= 4'hb;
                UART_TX_REG <= 1'b1;
            end
            4'hb: begin
                TX_STATUS_REG <= 1'b1;
                count <= 4'h0;
            end
            4'h1: begin
                UART_TX_REG <= 1'b0;
                count <= 4'h2;
                TX_STATUS_REG <= 1'b0;
            end
            4'h0: begin
            end
            default: begin
                UART_TX_REG <= TX_DATA_REG[0];
                TX_DATA_REG <= TX_DATA_REG >> 1;
                count <= count + 4'h1;
            end
            endcase
        end
    end

endmodule
