`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Sun Yat-sen University
// Engineer: Enze He
//
// Create Date: 11/10/2019 11:46:12 PM
// Design Name: Control
// Module Name: Control
// Project Name: SingleCycleCPU
// Target Devices: Basys3
// Tool Versions: 2019.1.3
// Description: Control
//
// Dependencies: -
//
// Revision: -
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`include "defines.v"

module ControlUnit(
    input [5:0] op,
    input zero,
    input sign,
    output pcWre,
    output aluSrcA,
    output aluSrcB,
    output regDataSrc,
    output regWre,
    output insRW,
    output rd,
    output wr,
    output regDst,
    output extSel,
    output [1:0] pcSrc,
    output [2:0] aluOp);

    assign pcWre = (op == `OP_HALT) ? 0 : 1;

    assign aluSrcA = (op == `OP_SLL) ? 1 : 0;
    assign aluSrcB = (op == `OP_ADDIU || op == `OP_ANDI || op == `OP_ORI || op == `OP_SLTI || op == `OP_SW || op == `OP_LW) ? 1 : 0;
    
    assign regDataSrc = (op == `OP_LW) ? 1 : 0;
    assign regWre = (op == `OP_SW || op == `OP_BEQ || op == `OP_BNE || op == `OP_BLTZ || op == `OP_J || op == `OP_HALT) ? 0 : 1;
    
    assign insRW = 1;

    assign rd = (op == `OP_LW) ? 1 : 0;
    assign wr = (op == `OP_SW) ? 1 : 0;

    assign regDst = (op == `OP_ADD || op == `OP_SUB || op == `OP_AND || op == `OP_OR || op == `OP_SLL) ? 1 : 0;
    assign extSel = (op == `OP_ANDI || op == `OP_ORI) ? 0 : 1;
    
    assign pcSrc[1] = (op == `OP_HALT || op == `OP_J) ? 1 : 0;
    assign pcSrc[0] = (op == `OP_HALT || (op == `OP_BEQ && zero) || (op == `OP_BNE && !zero) || (op == `OP_BLTZ && sign)) ? 1 : 0;
    
    assign aluOp[2] = (op == `OP_ANDI || op == `OP_AND || op == `OP_SLTI) ? 1 : 0;
    assign aluOp[1] = (op == `OP_ORI || op == `OP_OR || op == `OP_SLL || op == `OP_SLTI || op == `OP_J) ? 1 : 0;
    assign aluOp[0] = (op == `OP_SUB || op == `OP_ORI || op == `OP_OR || op == `OP_BEQ || op == `OP_BNE || op == `OP_BLTZ) ? 1 : 0;

endmodule
