`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Sun Yat-sen University
// Engineer: Enze He
//
// Create Date: 11/15/2019 12:12:31 PM
// Design Name: DataMemory
// Module Name: DataMemory
// Project Name: SingleCycleCPU
// Target Devices: Basys3
// Tool Versions: 2019.1.3
// Description: DataMemory
//
// Dependencies: -
//
// Revision: -
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module DataMemory(
    input clk,
    input [31:0] dAddr,
    input [31:0] dataIn,
    input rd,
    input wr,
    output [31:0] dataOut);
    
    reg [7:0] memory [0:68];

    assign dataOut[7:0] = rd ? memory[dAddr + 3] : 8'bz;
    assign dataOut[15:8] = rd ? memory[dAddr + 2] : 8'bz;
    assign dataOut[23:16] = rd ? memory[dAddr + 1] : 8'bz;
    assign dataOut[31:24] = rd ? memory[dAddr] : 8'bz;

    always@(negedge clk) begin
        if (wr) begin
            memory[dAddr] <= dataIn[31:24];
            memory[dAddr + 1] <= dataIn[23:16];
            memory[dAddr + 2] <= dataIn[15:8];
            memory[dAddr + 3] <= dataIn[7:0];
        end
    end
endmodule