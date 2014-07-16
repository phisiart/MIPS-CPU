`timescale 1ns / 1ps

module Pipeline_Core(
    input clk,
    input reset,
    output [7:0] led,
    input [7:0] switch,
    output [11:0] digits,
    output [7:0] UART_TXD,
    input [7:0] UART_RXD,
    input TX_STATUS,
    input RX_EFF,
    output TX_EN,
    output RX_READ
    );


////////////////////////////////
//---------------------------
// signals within IF stage


wire [31:0] IF_iPC;
wire [31:0] IF_oPC;
wire [31:0] IF_NEXT_PC;
wire [31:0] IF_INSTRUCTION;

////////////////////////////////
//---------------------------
// signals between IF/ID

wire [31:0] IF_ID_NEXT_PC;
wire [31:0] IF_ID_INSTRUCTION;
wire [5:0] 	IF_ID_FORMAT, IF_ID_FUNCT;
wire [25:0] IF_ID_JT;
wire [15:0] IF_ID_Imm16;
wire [4:0] 	IF_ID_Shamt, IF_ID_Rd, IF_ID_Rt, IF_ID_Rs;
wire [2:0] PCSrc;

assign PCSrc = (ID_EX_PCSrc == 3'b001 && EX_ALUResult[0]) ? 3'b001 : (ID_PCSrc == 3'b001 ? 3'b000 : ID_PCSrc);

////////////////////////////////
//---------------------------
// signals within ID stage

wire [31:0] ID_READ_DATA1, ID_READ_DATA2, ID_EXTEND, ID_ALUSrc2_ELSE;
wire [5:0] ID_ALUFUNCT;
wire [1:0] ID_RegDst, ID_MemToReg;
wire [2:0] ID_PCSrc;
wire ID_ALUSrc1, ID_ALUSrc2, ID_MemRd, ID_MemWr, ID_RegWr, ID_Sign, ID_EXTOp, ID_LUOp;

////////////////////////////////
//---------------------------
// signals between ID/EX

wire [5:0] ID_EX_ALUFUNCT;
wire [4:0] ID_EX_Rs, ID_EX_Rt, ID_EX_Rd, ID_EX_Shamt;
wire [1:0] ID_EX_RegDst, ID_EX_MemToReg;
wire [2:0] ID_EX_PCSrc;
wire ID_EX_ALUSrc1, ID_EX_ALUSrc2, ID_EX_MemRd, ID_EX_MemWr, ID_EX_RegWr, ID_EX_Sign;
wire [31:0] ID_EX_Extend, ID_EX_ALUSrc2_ELSE, ID_EX_ReadData1, ID_EX_ReadData2, ID_EX_NextPC;

////////////////////////////////
//---------------------------
// signals with EX stage

wire [31:0] EX_ALUSrc1, EX_ALUSrc2, EX_ALUResult, EX_ConBA, EX_RegDst, EX_ForwardAData, EX_ForwardBData, EX_ForwardJrData;

////////////////////////////////
//---------------------------
// signals within MEM stage

wire [31:0] MEM_ReadData;

////////////////////////////////
//---------------------------
// signals between MEM/WB

wire MEM_WB_RegWr;
wire [31:0] MEM_WB_ALUResult, MEM_WB_ReadData, MEM_WB_RegDst, MEM_WB_NextPC;
wire [1:0] MEM_WB_MemToReg;

////////////////////////////////
//---------------------------
// signals within WB stage

wire [31:0] WB_CurrentPC;
wire [31:0] WB_RegWriteData;

////////////////////////////////
//---------------------------
// signal of interrupt

wire MEM_Interrupt;

////////////////////////////////
//---------------------------
// Forward singals

wire [1:0] EX_ForwardA, EX_ForwardB, EX_ForwardJr;

////////////////////////////////
//---------------------------
// Harzard detection signals

wire [2:0] PCWrite, IF_ID_Write, IF_ID_Flush, ID_EX_Flush;

wire IF_ID_Flush_OR, ID_EX_Flush_OR;
assign IF_ID_Flush_OR = IF_ID_Flush[0] && IF_ID_Flush[1] && IF_ID_Flush[2];
assign ID_EX_Flush_OR = ID_EX_Flush[0] && ID_EX_Flush[1] && ID_EX_Flush[2];

wire PCWrtieOR, IF_ID_WriteOR;
assign PCWriteOR = PCWrite[0] && PCWrite[1] && PCWrite[2];
assign IF_ID_WriteOR = IF_ID_Write[0] && IF_ID_Write[1] && IF_ID_Write[2];

/////////////////////////////////////
//----------------------------------
// IF STAGE
////////////////////////////////////

MUX4 ForwardJr_MUX(
	.iData0(ID_READ_DATA1),
	.iData1(EX_ALUResult),
	.iData2(MEM_ReadData),
	.iData3(WB_RegWriteData),
	.iControl(EX_ForwardJr),
	.oData(EX_ForwardJrData)
	);

MUX8 PC_MUX_INST(
	.iData0(IF_NEXT_PC),
	.iData1(EX_ConBA),
	.iData2({IF_NEXT_PC[31:28], IF_ID_JT, 2'b00}),
	.iData3(EX_ForwardJrData),
	.iData4(32'h80000000),
	.iData5(32'h80000004),
	.iData6(32'h0),
	.iData7(32'h0),
	.iCtrl(PCSrc),
	.oData(IF_iPC)
	);


PC_REG PC_INST(
	.clk(clk),
	.reset(reset),
	.PCWrite(PCWriteOR),
	.iPC(IF_iPC),
	.oPC(IF_oPC)
	);

ADD PC_ADDER(
	.A(IF_oPC),
	.B(32'h00000004),
	.Signed(1'b0),
	.S(IF_NEXT_PC)
	);

ROM ROM_INST(
	.addr(IF_oPC),
	.data(IF_INSTRUCTION)
	);

IF_ID_REG IF_ID_REG_INST(
	.clk(clk),
	.reset(reset),
	.flush(IF_ID_Flush_OR),
	.IF_ID_Write(IF_ID_WriteOR),
	.iNextPC(IF_NEXT_PC),
	.iInstruction(IF_INSTRUCTION),
	.oNextPC(IF_ID_NEXT_PC),
    .oInstruction(IF_ID_INSTRUCTION),
    .FORMAT(IF_ID_FORMAT),
    .JT(IF_ID_JT),
    .Imm16(IF_ID_Imm16),
    .Shamt(IF_ID_Shamt),
    .Rd(IF_ID_Rd),
    .Rt(IF_ID_Rt),
    .Rs(IF_ID_Rs),
    .FUNCT(IF_ID_FUNCT)
    );

//////////////////////////////////////////
//----------------------------------
// ID STAGE
//////////////////////////////////////////

Hazard_Detection_Unit Hazard_Detection_Unit_INST(
	.ID_EX_MemRd(ID_EX_MemRd),
	.ID_EX_Rt(ID_EX_Rt),
	.IF_ID_Rs(IF_ID_Rs),
	.IF_ID_Rt(IF_ID_Rt),
	.ID_PCSrc(ID_PCSrc),
	.ID_EX_PCSrc(ID_EX_PCSrc),
	.EX_ALUResult0(EX_ALUResult[0]),
	.PCWrite(PCWrite),
	.IF_ID_WRITE(IF_ID_Write),
	.IF_ID_Flush(IF_ID_Flush),
	.ID_EX_Flush(ID_EX_Flush)
	);

RegFile RegFile_INST(
	.clk(clk),
	.reset(reset),
	.addr1(IF_ID_Rs),
	.addr2(IF_ID_Rt),
	.addr3(MEM_WB_RegDst[4:0]),
	.data1(ID_READ_DATA1),
	.data2(ID_READ_DATA2),
	.data3(WB_RegWriteData),
	.wr(MEM_WB_RegWr)
	);

Control_Unit Ctrl_Inst(
	.Instruction(IF_ID_INSTRUCTION),
	.Interrupt(MEM_Interrupt),
	//.Interrupt(1'b0),
	.PCSrc(ID_PCSrc),
	.RegDst(ID_RegDst),
	.RegWr(ID_RegWr),
	.ALUSrc1(ID_ALUSrc1),
	.ALUSrc2(ID_ALUSrc2),
	.ALUFun(ID_ALUFUNCT),
	.Sign(ID_Sign),
	.MemWr(ID_MemWr),
	.MemRd(ID_MemRd),
	.MemToReg(ID_MemToReg),
	.EXTOp(ID_EXTOp),
	.LUOp(ID_LUOp)
	);

Extend Extend_INST(
	.imm16(IF_ID_Imm16),
	.ExtendOp(ID_EXTOp),
	.imm32(ID_EXTEND)
	);

MUX2 LU_MUX_INST(
	.iData0(ID_EXTEND),
	.iData1({IF_ID_Imm16, 16'h0000}),
	.Ctrl(ID_LUOp),
	.oData(ID_ALUSrc2_ELSE)
	);

ID_EX_REG ID_EX_REG_INST(
	.clk(clk),
	.reset(reset),
	.flush(ID_EX_Flush_OR),
	.PCSrc(ID_PCSrc),
	.RegDst(ID_RegDst),
	.RegWr(ID_RegWr),
	.ALUSrc1(ID_ALUSrc1),
	.ALUSrc2(ID_ALUSrc2),
	.ALUFun(ID_ALUFUNCT),
	.Sign(ID_Sign),
	.MemWr(ID_MemWr),
	.MemRd(ID_MemRd),
	.MemToReg(ID_MemToReg),
	.Extend(ID_EXTEND),
	.ALUSrc2_ELSE(ID_ALUSrc2_ELSE),
	.Rs(IF_ID_Rs),
	.Rt(IF_ID_Rt),
	.Rd(IF_ID_Rd),
	.Shamt(IF_ID_Shamt),
	.ReadData1(ID_READ_DATA1),
	.ReadData2(ID_READ_DATA2),
	.NextPC(IF_ID_NEXT_PC),
	.oPCSrc(ID_EX_PCSrc),
	.oRegDst(ID_EX_RegDst),
	.oRegWr(ID_EX_RegWr),
	.oALUSrc1(ID_EX_ALUSrc1),
	.oALUSrc2(ID_EX_ALUSrc2),
	.oALUFun(ID_EX_ALUFUNCT),
	.oSign(ID_EX_Sign),
	.oMemWr(ID_EX_MemWr),
	.oMemRd(ID_EX_MemRd),
	.oMemToReg(ID_EX_MemToReg),
	.oExtend(ID_EX_Extend),
	.oALUSrc2_ELSE(ID_EX_ALUSrc2_ELSE),
	.oRs(ID_EX_Rs),
	.oRt(ID_EX_Rt),
	.oRd(ID_EX_Rd),
	.oShamt(ID_EX_Shamt),
	.oReadData1(ID_EX_ReadData1),
	.oReadData2(ID_EX_ReadData2),
	.oNextPC(ID_EX_NextPC)
	);

////////////////////////////////////////////
//----------------------------------
// EX STAGE
///////////////////////////////////////////




// signals between EX/MEM
wire [31:0] EX_MEM_ConBA, EX_MEM_ALUResult, EX_MEM_ReadData2, EX_MEM_RegDst, EX_MEM_NextPC;
wire [2:0] EX_MEM_PCSrc;
wire [1:0] EX_MEM_MemToReg;
wire EX_MEM_RegWr, EX_MEM_MemWr, EX_MEM_MemRd;

MUX4 ForwardA_MUX(
	.iData0(ID_EX_ReadData1),
	.iData1(WB_RegWriteData),
	.iData2(EX_MEM_ALUResult),
	.iData3(32'h0),
	.iControl(EX_ForwardA),
	.oData(EX_ForwardAData)
	);

MUX4 ForwardB_MUX(
	.iData0(ID_EX_ReadData2),
	.iData1(WB_RegWriteData),
	.iData2(EX_MEM_ALUResult),
	.iData3(32'h0),
	.iControl(EX_ForwardB),
	.oData(EX_ForwardBData)
	);

Forward_Unit Forward_Unit_INST(
	.EX_MEM_RegWr(EX_MEM_RegWr),
	.EX_MEM_RegDst(EX_MEM_RegDst[4:0]),
	.ID_EX_Rt(ID_EX_Rt),
	.ID_EX_Rs(ID_EX_Rs),
	.ID_PCSrc(ID_PCSrc),
	.ID_EX_RegWr(ID_EX_RegWr),
	.MEM_WB_RegWr(MEM_WB_RegWr),
	.MEM_WB_RegDst(MEM_WB_RegDst[4:0]),
	.ForwardA(EX_ForwardA),
	.ForwardB(EX_ForwardB),
	.ForwardJr(EX_ForwardJr)
	);

MUX2 ALUSrc1_MUX_INST(
	.iData0(EX_ForwardAData),
	.iData1({27'h0, ID_EX_Shamt}),
	.Ctrl(ID_EX_ALUSrc1),
	.oData(EX_ALUSrc1)
	);

MUX2 ALUSrc2_MUX_INST(
	.iData0(EX_ForwardBData),
	.iData1(ID_EX_ALUSrc2_ELSE),
	.Ctrl(ID_EX_ALUSrc2),
	.oData(EX_ALUSrc2)
	);

ALU ALU_INST(
	.A(EX_ALUSrc1),
	.B(EX_ALUSrc2),
	.Signed(ID_EX_Sign),
	.ALUFunc(ID_EX_ALUFUNCT),
	.S(EX_ALUResult)
	);

ADD ConBA_ADD_INST(
	.A({ID_EX_Extend[29:0], 2'b00}),
	.B(ID_EX_NextPC),
	.Signed(1'b1),
	.S(EX_ConBA)
	);

MUX4 RegDstMux_INST(
	.iData0({27'h0, ID_EX_Rd}),
	.iData1({27'h0, ID_EX_Rt}),
	.iData2(32'd31),
	.iData3(32'd26),
	.iControl(ID_EX_RegDst),
	.oData(EX_RegDst)
	);

EX_MEM_REG EX_MEM_REG_INST(
	.clk(clk),
	.reset(reset),
	.NextPC(ID_EX_NextPC),
	.MemWr(ID_EX_MemWr),
	.MemRd(ID_EX_MemRd),
	.PCSrc(ID_PCSrc),
	.RegWr(ID_EX_RegWr),
	.MemToReg(ID_EX_MemToReg),
	.ALUResult(EX_ALUResult),
	.ReadData2(EX_ForwardBData),
	.RegDst(EX_RegDst),
	.oNextPC(EX_MEM_NextPC),
	.oPCSrc(EX_MEM_PCSrc),
	.oRegWr(EX_MEM_RegWr),
	.oMemWr(EX_MEM_MemWr),
	.oMemRd(EX_MEM_MemRd),
	.oMemToReg(EX_MEM_MemToReg),
	.oALUResult(EX_MEM_ALUResult),
	.oReadData2(EX_MEM_ReadData2),
	.oRegDst(EX_MEM_RegDst)
	);

////////////////////////////////////////////////
//----------------------------------
// MEM STAGE
////////////////////////////////////////////////



DataMem DataMem_INST(
	.clk(clk),
	.reset(reset),
	.read(EX_MEM_MemRd),
	.write(EX_MEM_MemWr),
	.addr(EX_MEM_ALUResult),
	.rdata(MEM_ReadData),
	.wdata(EX_MEM_ReadData2),
	.led(led),
	.switch(switch),
	.digits(digits),
	.UART_TXD(UART_TXD),
	.UART_RXD(UART_RXD),
	.TX_STATUS(TX_STATUS),
	.RX_EFF(RX_EFF),
	.TX_EN(TX_EN),
	.RX_READ(RX_READ),
	.interrupt(MEM_Interrupt)
	);

MEM_WB_REG MEM_WB_REG_INST(
	.clk(clk),
	.reset(reset),
	.RegWr(EX_MEM_RegWr),
	.MemToReg(EX_MEM_MemToReg),
	.ALUResult(EX_MEM_ALUResult),
	.ReadData(MEM_ReadData),
	.RegDst(EX_MEM_RegDst),
	.NextPC(EX_MEM_NextPC),
	.oRegWr(MEM_WB_RegWr),
	.oALUResult(MEM_WB_ALUResult),
	.oReadData(MEM_WB_ReadData),
	.oMemToReg(MEM_WB_MemToReg),
	.oRegDst(MEM_WB_RegDst),
	.oNextPC(MEM_WB_NextPC)
	);

///////////////////////////////////////
//----------------------------------
// WB STAGE
//////////////////////////////////////

SUB CurrentPC(
	.A(MEM_WB_NextPC),
	.B(32'h4),
	.Signed(1'b0),
	.S(WB_CurrentPC)
	);

MUX4 MemToReg_MUX(
	.iData0(MEM_WB_ALUResult),
	.iData1(MEM_WB_ReadData),
	.iData2(MEM_WB_NextPC),
	.iData3(WB_CurrentPC),
	.iControl(MEM_WB_MemToReg),
	.oData(WB_RegWriteData)
	);


endmodule
