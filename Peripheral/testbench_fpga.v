`timescale 1ns / 1ps

// TESTBENCH for ALL Peripherals
// Created by Zhengrong Wang
// Created 04/07/2014
// Last modified 04/07/2014

////////////////////////////

// The testbench recieves some data from UART_RX and prints it through leds
// And the testbench sends some data from switch to PC

/////////////////////////////

module testbench_fpga(
    input sysclk,
    input [7:0] switch,
    input UART_RX,
    output UART_TX,
    output [7:0] led,
    input reset
    );

wire [7:0] UART_RXD;
wire [7:0] UART_TXD;
wire RX_EFF;
wire RX_READ;
wire TX_STATUS;
wire TX_EN;

wire [7:0] oled;
assign led = oled;

UART UART_inst (
		.UART_RX(UART_RX), 
		.UART_TX(UART_TX), 
		.UART_RXD(UART_RXD), 
		.UART_TXD(UART_TXD), 
		.RX_EFF(RX_EFF), 
		.RX_READ(RX_READ), 
		.TX_STATUS(TX_STATUS), 
		.TX_EN(TX_EN), 
		.sysclk(sysclk), 
		.reset(reset)
	);

reg clk;
reg read;
reg write;
reg [31:0] addr;
reg [31:0] wdata;

wire interrupt;
wire read_acc;
wire write_acc;
wire [31:0] rdata;

reg [7:0] 	count;
	
always @(posedge sysclk or negedge reset) begin
	if (!reset) begin
		count <= 8'h00;
		clk <= 0;
	end
	else if (count == 8'hff) begin
		count <= 8'h00;
		clk <= ~clk;
	end
	else begin
		count <= count + 8'h1;
	end
end

DataMem uu (
		.clk(clk), 
		.reset(reset), 
		.read(read), 
		.write(write), 
		.addr(addr),
		.rdata(rdata), 
		.wdata(wdata), 
		.led(oled), 
		.switch(switch), 
		.digits(digits), 
		.UART_TXD(UART_TXD), 
		.UART_RXD(UART_RXD), 
		.TX_STATUS(TX_STATUS),
		.RX_EFF(RX_EFF),
		.TX_EN(TX_EN),
		.RX_READ(RX_READ),
		.interrupt(interrupt), 
		.read_acc(read_acc), 
		.write_acc(write_acc)
	);

//////////////////////////////

// Notice that this is a small program
// It receives the data from UART_RXD and uses leds to show them
// Also it get an 8 bits number and sends it through UART
// All the peripherals are sealed in the DataMem, the CPU can only "see" the RAM

////////////////////////////

reg [4:0] state;

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		state <= 4'h0;
		read <= 1'b0;
		write <= 1'b0;
		wdata <= 32'h0000000;
		addr <= 32'h00000000;
	end
	else begin
		case(state)
		4'h0: begin
			if (RX_EFF) begin
				read <= 1'b1;
				addr <= 32'h4000001c;
				state <= 4'h1;
			end
		end
		4'h1: begin
			read <= 1'b0;
			wdata <= rdata;
			state <= 4'h2;
		end
		4'h2: begin
			write <= 1'b1;
			addr <= 32'h4000000c;
			state <= 4'h3;
		end
		4'h3: begin
			write <= 1'b0;
			read <= 1'b1;
			addr <= 32'h40000010;
			state <= 4'h4;
		end
		4'h4: begin
			read <= 1'b0;
			wdata <= rdata;
			state <= 4'h5;
		end
		4'h5: begin
			write <= 1'b1;
			addr <= 32'h40000018;
			state <= 4'h6;
		end
		4'h6: begin
			if (TX_STATUS) begin
				write <= 1'b1;
				addr <= 32'h40000020;
				wdata <= 32'h00000001;
				state <= 4'h7;
			end
		end
		4'h7: begin
			write <= 1'b1;
			addr <= 32'h40000020;
			wdata <= 32'h0;
			state <= 4'h8;
		end
		default: begin
			read <= 1'b0;
			write <= 1'b0;
			state <= 4'h0;
		end
		endcase
	end
end

endmodule
