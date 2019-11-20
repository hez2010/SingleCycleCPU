`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Sun Yat-sen University
// Engineer: Enze He
//
// Create Date: 10/17/2019 11:24:03 AM
// Design Name: ALU
// Module Name: ALU
// Project Name: SingleCycleCPU
// Target Devices: Basys3
// Tool Versions: 2019.1.3
// Description: ALU
//
// Dependencies: -
//
// Revision: -
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`include "defines.v"

module ALU(
    input [31:0] rega,
    input [31:0] regb,
    input [2:0] op,
    output reg [31:0] result,
    output zero,
    output sign);

    always @(op or rega or regb) begin
        case (op)
            `ALU_OP_ADD: result = (rega + regb);
            `ALU_OP_SUB: result = (rega - regb);
            `ALU_OP_SLL: result = (regb << rega);
            `ALU_OP_OR: result = (rega | regb);
            `ALU_OP_AND: result = (rega & regb);
            `ALU_OP_LT: result = (rega < regb) ? 1 : 0;
            `ALU_OP_SLT: result = (((rega < regb) && (rega[31] == regb[31])) || ((rega[31] && !regb[31]))) ? 1 : 0;
            `ALU_OP_XOR: result = (rega ^ regb);
            default: result = 0;
        endcase
    end

    assign zero = (result == 0) ? 1 : 0;
    assign sign = result[31];
endmodule
