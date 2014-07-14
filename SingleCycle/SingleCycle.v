`timescale 1ns / 1ps
module SingleCycle(
    input reset,
    input sysclk,
    input UART_RX,
    input [7:0] switch,
    input pulse_inst,
    input pulse_alu,
    input pulse_mem,
    input pulse_reg,

    output UART_TX,
    output [7:0] LED,
    output [11:0] digits,
    output interrupt,
    output read_acc,
    output write_acc
);

    reg clk;
    integer clkcount;
    initial begin
        clk = 0;
        clkcount = 0;
    end
    always @(posedge sysclk or negedge reset) begin
        if (~reset) begin
            clkcount = 0;
            clk = 0;
        end else if (clkcount == 49) begin
            clkcount = 0;
            clk = ~clk;
        end else begin
            clkcount = clkcount + 1;
        end
    end
    // reg reset;
    // reg sysclk;
    // reg clk;
    // wire UART_RX;
    // UARTTest uarttest(UART_RX);
    // reg[7:0] switch;
    // reg pulse_inst;
    // reg pulse_alu;
    // reg pulse_mem;
    // wire UART_TX;
    // wire[7:0] LED;
    // wire[11:0] digits;
    // wire interrupt;
    // wire read_acc;
    // wire write_acc;

    wire[2:0] PCSrc;
    wire[31:0] ConBA;
    wire[31:0] ALUOut;
    wire[31:0] instruction;
    wire[31:0] DataBusA;
    wire[31:0] DataBusB;
    wire[31:0] PC;
    wire[31:0] NewPC;
    wire[31:0] WriteData;

    wire[5:0] Format;
    wire[5:0] Funct;
    wire[25:0] JT;
    wire[15:0] Imm16;
    wire[4:0] Shamt;
    wire[4:0] Rd;
    wire[4:0] Rt;
    wire[4:0] Rs;

    ID id(
        .reset(reset),
        .clk(clk),
        .PCSrc(PCSrc),
        .ConBA(ConBA),
        .ALUOut0(ALUOut[0]),
        .DataBusA(DataBusA),
        .JT(JT),
        .PC(PC),
        .NewPC(NewPC)
    );

    wire[31:0] ALUIn1;
    wire[31:0] ALUIn2;

    wire[1:0] RegDst;
    wire RegWr;
    wire ALUSrc1;
    wire ALUSrc2;
    wire[5:0] ALUFun;
    wire Sign;
    wire MemWr;
    wire MemRd;
    wire[1:0] MemToReg;
    wire EXTOp;
    wire LUOp;
    
    wire[4:0] addr3;
    IX ix(
        .reset(reset),
        .clk(clk),
        .PC(PC),
        .NewPC(NewPC),
        .instruction(instruction),
        .WriteData(WriteData),
        .DataBusA(DataBusA),
        .DataBusB(DataBusB),
        .ConBA(ConBA),
        .addr3(addr3),
        .ALUIn1(ALUIn1),
        .ALUIn2(ALUIn2),
        .Format(Format),
        .Funct(Funct),
        .JT(JT),
        .Imm16(Imm16),
        .Shamt(Shamt),
        .Rd(Rd),
        .Rt(Rt),
        .Rs(Rs),
        .PCSrc(PCSrc),
        .RegDst(RegDst),
        .RegWr(RegWr),
        .ALUSrc1(ALUSrc1),
        .ALUSrc2(ALUSrc2),
        .ALUFun(ALUFun),
        .Sign(Sign),
        .MemWr(MemWr),
        .MemRd(MemRd),
        .MemToReg(MemToReg),
        .EXTOp(EXTOp),
        .LUOp(LUOp)
    );

    ALU alu(
        .A(ALUIn1),
        .B(ALUIn2),
        .Signed(Sign),
        .ALUFunc(ALUFun),
        .S(ALUOut)
    );

    ALUPrinter alu_printer(
        .A(ALUIn1),
        .B(ALUIn2),
        .Signed(Sign),
        .ALUFunc(ALUFun),
        .S(ALUOut),
        .pulse(pulse_alu)
    );

    wire[31:0] MemReadData;
    MEM mem(
        .reset(reset),
        .sysclk(sysclk),
        .clk(clk),
        .MemRd(MemRd),
        .MemWr(MemWr),
        .ALUOut(ALUOut),
        .DataBusB(DataBusB),
        .MemToReg(MemToReg),
        .NewPC(NewPC),
        .UART_RX(UART_RX),
        .switch(switch),
        .ReadData(MemReadData),
        .WriteData(WriteData), // To Regfile
        .UART_TX(UART_TX),
        .LED(LED),
        .digits(digits),
        .interrupt(interrupt),
        .read_acc(read_acc),
        .write_acc(write_acc)
    );

    InstPrint instprint(
        .PC(PC),
        .instruction(instruction),
        .pulse(pulse_inst)
    );
    DataMemPrint datamemprint(
        .addr(ALUOut),
        .wdata(DataBusB),
        .rdata(MemReadData),
        .read(MemRd),
        .write(MemWr),
        .pulse(pulse_mem)
    );
    RegPrint regprint(
        .addr1(Rs),
        .addr2(Rt),
        .addr3(addr3),
        .data1(DataBusA),
        .data2(DataBusB),
        .data3(WriteData),
        .write(RegWr),
        .pulse(pulse_reg)
    );

endmodule

module main();
    reg reset;
    reg sysclk;
    reg clk;
    wire UART_RX;
    UARTTest uarttest(UART_RX);
    reg[7:0] switch;
    reg pulse_inst;
    reg pulse_alu;
    reg pulse_mem;
    reg pulse_reg;
    wire UART_TX;
    wire[7:0] LED;
    wire[11:0] digits;
    wire interrupt;
    wire read_acc;
    wire write_acc;

    SingleCycle cpu(
        .reset(reset),
        .sysclk(sysclk),
        //.clk(clk),
        .UART_RX(UART_RX),
        .switch(switch),
        .pulse_inst(pulse_inst),
        .pulse_alu(pulse_alu),
        .pulse_mem(pulse_mem),
        .pulse_reg(pulse_reg),
        .UART_TX(UART_TX),
        .LED(LED),
        .digits(digits),
        .interrupt(interrupt),
        .read_acc(read_acc),
        .write_acc(write_acc)
    );

    // always @(posedge cpu.mem.uart.sysclk) begin
    //     $display("sysclk posedge");
    // end
    always @(posedge cpu.mem.uart.RX_EFF) begin
        $display("rx_eff");
    end
    integer i;
    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, uarttest, cpu);
        $display("Hello!");
        pulse_inst = 0;
        pulse_alu = 0;
        pulse_mem = 0;
        pulse_reg = 0;
        clk = 0;
        sysclk = 0;
        reset = 1;
        for (i = 0; i < 1200000; i = i + 1) begin
            if (i == 100) reset = 0;
            if (i == 200) reset = 1;
            sysclk = ~sysclk;
            if (i % 50 == 0) begin
                clk = ~clk;
            end
            if ((i + 10) % 100 == 0) begin
                pulse_inst = 1;
            end else begin
                pulse_inst = 0;
            end
            if ((i + 9) % 100 == 0) begin
                pulse_alu = 1;
            end else begin
                pulse_alu = 0;
            end
            if ((i + 8) % 100 == 0) begin
                pulse_mem = 1;
            end else begin
                pulse_mem = 0;
            end
            if ((i + 7) % 100 == 0) begin
                pulse_reg = 1;
                // $display("  UART_RX = ", cpu.mem.uart.UART_RX);
                // $display("  UART_TX = ", cpu.mem.uart.UART_TX);
                // $display("  UART_RXD = ", cpu.mem.uart.UART_RXD);
                // $display("  UART_TXD = ", cpu.mem.uart.UART_TXD);
                // $display("  RX_EFF = ", cpu.mem.uart.RX_EFF);
                // $display("  RX_READ = ", cpu.mem.uart.RX_READ);
                // $display("  TX_STATUS = ", cpu.mem.uart.TX_STATUS);
                // $display("  TX_EN = ", cpu.mem.uart.TX_EN);
                // $display("  sysclk = ", cpu.mem.uart.sysclk);
                // $display("  sysclk = ", sysclk);
                // $display("  reset = ", cpu.mem.uart.reset);
                // $display("  ConBA = %08H", ConBA);
                // $display("  NewPC = %08H", NewPC);
                // $display("  PCSrc = %d", PCSrc);
                // $display("  MemToReg = %d", MemToReg);
                // $display("  EXTOp = %d", EXTOp);
            end else begin
                pulse_reg = 0;
            end
            // if (cpu.mem.uart.RX_EFF == 1) begin
            //     $display("RX_EFF = 1 !");
            // end
            #1;
        end
    end

endmodule

module UARTTest(
    output reg UART_RX
);

    initial begin
        UART_RX = 1;
        #20833 UART_RX = 0;
        #20833 UART_RX = 1;
        #20833 UART_RX = 1;
        #20833 UART_RX = 1;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 1;
        $display("UART finish 1.");

        #20833 UART_RX = 0;
        #20833 UART_RX = 1;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 0;
        #20833 UART_RX = 1;
        $display("UART finish 2.");

    end
endmodule