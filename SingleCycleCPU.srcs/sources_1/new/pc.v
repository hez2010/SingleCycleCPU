`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Sun Yat-sen University
// Engineer: Enze He
//
// Create Date: 11/10/2019 9:13:35 AM
// Design Name: PC
// Module Name: PC
// Project Name: SingleCycleCPU
// Target Devices: Basys3
// Tool Versions: 2019.1.3
// Description: PC
//
// Dependencies: -
//
// Revision: -
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`include "defines.v"

module PC(
    input clk,
    input rst,
    input pcWre,
    input [31:0] newPC,
    output reg [31:0] address);

    initial
        address = 0;

    always @(posedge clk or negedge rst)
        begin
            if (!rst) begin
                address <= 32'hFFFFFFFC;
            end
            else if (pcWre || !newPC) begin
                address <= newPC;
            end
        end
endmodule

module JumpPCHelper(
    input [31:0] pc,
    input [25:0] address,
    output reg [31:0] jumpPC);

    wire [27:0] tmp;
    assign tmp = address << 2; // address * 4

    always @(*) begin
        jumpPC[31:28] = pc[31:28];
        jumpPC[27:2] = tmp[27:2];
        jumpPC[1:0] = 0;
    end
endmodule

module NextPCHelper(
    input rst,
    input [1:0] pcSrc,
    input [31:0] pc,
    input [31:0] immediate,
    input [31:0] jumpPC,
    output reg [31:0] nextPC);

    always @(*) begin
        if (!rst) begin
            nextPC = pc + 4;
        end
        else begin
            case (pcSrc)
                `PC_NEXT: nextPC = pc + 4;
                `PC_REL_JUMP: nextPC = pc + 4 + (immediate << 2);
                `PC_ABS_JUMP: nextPC = jumpPC;
                `PC_HALT: nextPC = pc;
                default: 
                nextPC = pc + 4;
            endcase
        end
    end
endmodule