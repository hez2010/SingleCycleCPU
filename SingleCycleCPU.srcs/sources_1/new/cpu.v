`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Sun Yat-sen University
// Engineer: Enze He
//
// Create Date: 11/10/2019 11:46:12 PM
// Design Name: CPU
// Module Name: CPU
// Project Name: SingleCycleCPU
// Target Devices: Basys3
// Tool Versions: 2019.1.3
// Description: CPU
//
// Dependencies: -
//
// Revision: -
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`include "defines.v"

module CPU(
    input clk,
    input rst,
    output [4:0] rs,
    output [4:0] rt,
    output [31:0] currentPC,
    output [31:0] newPC,
    output [31:0] insOut,
    output [31:0] readData1,
    output [31:0] readData2,
    output [4:0] writeReg,
    output [31:0] writeData,
    output [31:0] immediate,
    output [31:0] aluResult,
    output [31:0] outData);
    
    wire pcWre, aluSrcA, aluSrcB, regDataSrc, regWre, insRW, rd, wr, regDst, extSel, zero, sign;
    wire [1:0] pcSrc;
    wire [2:0] aluOp;
    wire [25:0] address;
    wire [31:0] nextPC, iAddress, extendedData, dataOut, iDataOut, jumpPC, result, readData1_tmp, readData2_tmp, regA, regB;

    // ALU: rega,regb,op,result,zero,sign
    // ControlUnit: op,zero,sign,pcWre,aluSrcA,aluSrcB,regDataSrc,regWre,insRW,rd,wr,regDst,extSel,pcSrc,aluOp
    // DataMemory: clk,aAddr,dataIn,rd,wr,dataOut
    // extendedData: immediate,extSel,extImmediate
    // InstructionMemory: insRW,address,dataOut
    // nextPC: clk,rst,pcWre,newPC,address
    // Register: clk,we,rst,readReg1,readReg2,writeReg,writeData,readData1,readData2
    // Selector1In2_5: select,dataA,dataB,dataY
    // Selector1In2_32: select,dataA,dataB,dataY
    
    PC pc(clk, rst, pcWre, newPC, iAddress);
    InstructionMemory insM(insRW, iAddress, iDataOut);
    ControlUnit ctrlUnit(iDataOut[31:26], zero, sign, pcWre, aluSrcA, aluSrcB, regDataSrc, regWre, insRW, rd, wr, regDst, extSel, pcSrc, aluOp);
    Selector1In2_5 regSel(regDst, iDataOut[20:16], iDataOut[15:11], writeReg);
    Register regf(clk, regWre, rst, iDataOut[25:21], iDataOut[20:16], writeReg, writeData, readData1_tmp, readData2_tmp);
    Selector1In2_32 regASel(aluSrcA, readData1_tmp, {{17{0}}, iDataOut[10:6]}, regA);
    Extend extend(iDataOut[15:0], extSel, extendedData);
    Selector1In2_32 regBSel(aluSrcB, readData2_tmp, extendedData, regB);
    ALU alu(regA, regB, aluOp, result, zero, sign);

    JumpPCHelper jPC(iAddress, iDataOut[25:0], jumpPC);
    NextPCHelper nPC(rst, pcSrc, iAddress, extendedData, jumpPC, nextPC);

    DataMemory dataM(clk, result, readData2_tmp, rd, wr, dataOut);
    Selector1In2_32 dataSel(regDataSrc, result, dataOut, writeData);

    assign currentPC = iAddress;
    assign newPC = nextPC;
    assign rs = iDataOut[25:21];
    assign rt = iDataOut[20:16];
    assign immediate = iDataOut[15:0];
    assign readData1 = readData1_tmp;
    assign readData2 = readData2_tmp;
    assign insOut = iDataOut;
    assign outData = dataOut;
    assign aluResult = result;
endmodule