`timescale 1ns / 1ps

// UART_Reciver Module
// Reveives data from UART_RX, and generates an impluse RX_STATUS
// Created by Zhengrong Wang
// Created 02/07/2014
// Last modified 05/07/2014 by Zhixun Tan
// Modification note:
// 1. Modify indentation: now there are only 4-spaces
// 2. Add module specification

// UART_Receiver
// This module receives data bit by bit.
// * As soon as it completely receives a piece of 8-bit data,
//   1) RX_DATA becomes the 8-bit data it has received
//   2) RX_STATUS has a short impulse of 1,
//      RX_STATUS is 0 ordinarily.
// * The receiver can be reset, and it will regard anything it has already received.
module UART_Receiver(
    input UART_RX,
    input sysclk,
    input brclk,
    input reset,
    output RX_STATUS,
    output [7:0] RX_DATA
);

    reg [7:0] count;
    reg sample_en;
    wire sample_clk;

    divider_16 di(brclk, sample_en, sample_clk);

    reg [7:0] RX_DATA_REG;
    reg [7:0] RX_DATA_TEMP;
    assign RX_DATA = RX_DATA_REG;
    reg RX_STATUS_REG;
    assign RX_STATUS = (~RX_STATUS_REG) && (x);

    always @(posedge brclk or negedge reset) begin
        if (!reset) begin
            count <= 8'h00;
            sample_en <= 1'b0;
        end else if (!UART_RX && count == 8'h00) begin
            count <= 8'h01;
            sample_en <= 1'b0;
        end else if (count > 8'h00) begin
            case(count)
            8'h90: begin
                sample_en <= 1'b0;
                count <= 8'h00;
            end
            8'h09: begin
                count <= count + 8'h01;
                sample_en <= 1'b1;
            end
            default: begin
                count <= count + 8'h01;
            end
            endcase
        end
    end

    reg x;
    always @(posedge sysclk or negedge reset) begin
        if (~reset) begin
            x <= 1'b0;
        end else if (count == 8'h90) begin
            x <= 1'b1;
        end else begin
            x <= 1'b0;
        end
    end

    always @(posedge sysclk or negedge reset) begin
        if (!reset) begin
            RX_STATUS_REG <= 1'b0;
            RX_DATA_REG <= 8'h00;
        end else begin
            if (count == 8'h90) begin
                RX_DATA_REG <= RX_DATA_TEMP;
            end
            RX_STATUS_REG <= x;
        end
    end

    always @(posedge sample_clk or negedge reset) begin
        if (!reset) begin
            RX_DATA_TEMP <= 8'h00;
        end else begin
            RX_DATA_TEMP <= RX_DATA_TEMP >> 1;
            RX_DATA_TEMP[7] <= UART_RX;
        end
    end

endmodule
