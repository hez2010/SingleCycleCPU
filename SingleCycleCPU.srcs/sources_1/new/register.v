`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Sun Yat-sen University
// Engineer: Enze He
//
// Create Date: 11/13/2019 10:46:12 PM
// Design Name: Register
// Module Name: Register
// Project Name: SingleCycleCPU
// Target Devices: Basys3
// Tool Versions: 2019.1.3
// Description: Register
//
// Dependencies: -
//
// Revision: -
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module Register(
    input clk,
    input we,
    input rst,
    input [4:0] readReg1,
    input [4:0] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    output [31:0] readData1,
    output [31:0] readData2);

    reg [31:0] register[1:31];
    integer i;

    assign readData1 = readReg1 == 0 ? 0 : register[readReg1];
    assign readData2 = readReg2 == 0 ? 0 : register[readReg2];

    always @(negedge clk or negedge rst) begin
        if (!rst) begin
            for (i = 1; i < 32; i = i + 1) begin
                register[i] = 0;
            end
        end
        else if (we && writeReg) begin
            register[writeReg] <= writeData;
        end
    end
endmodule