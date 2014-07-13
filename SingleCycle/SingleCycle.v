module SingleCycle(
);
    reg reset;
    reg sysclk;
    reg clk;
    reg UART_RX;
    reg[7:0] switch;
    reg pulse;
    wire UART_TX;
    wire[7:0] LED;
    wire[11:0] digits;
    wire interrupt;
    wire read_acc;
    wire write_acc;

    wire[2:0] PCSrc;
    wire[31:0] ConBA;
    wire[31:0] ALUOut;
    wire[31:0] DataBusA;
    wire[31:0] DataBusB;
    wire[31:0] PC;
    wire[31:0] NewPC;
    wire[31:0] WriteData;

    ID id(
        .reset(reset),
        .clk(clk),
        .PCSrc(PCSrc),
        .ConBA(ConBA),
        .ALUOut0(ALUOut[0]),
        .DataBusA(DataBusA),
        .PC(PC),
        .NewPC(NewPC)
    );

    wire[31:0] ALUIn1;
    wire[31:0] ALUIn2;

    wire[5:0] Format;
    wire[5:0] Funct;
    wire[25:0] JT;
    wire[15:0] Imm16;
    wire[4:0] Shamt;
    wire[4:0] Rd;
    wire[4:0] Rt;
    wire[4:0] Rs;

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
    
    IX ix(
        .reset(reset),
        .clk(clk),
        .PC(PC),
        .NewPC(NewPC),
        .WriteData(WriteData),
        .DataBusA(DataBusA),
        .DataBusB(DataBusB),
        .ConBA(ConBA),
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
        .pulse(pulse)
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
        .NewPC(PC),
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

    initial begin
        $display("Hello!");
    end

endmodule
