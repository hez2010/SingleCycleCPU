`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/17/2019 11:29:25 AM
// Design Name:
// Module Name: InstructionMemory
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(
    input insRW,
    input [31:0] address,
    output reg [31:0] dataOut
    );
    
    reg [7:0] memory[0:127];
    initial
        $readmemb("C:/Users/hez20/Vivado/SingleCycleCPU/data/memory.txt", memory);
    
    always @(*) begin
        if (insRW) begin
            dataOut[31:24] = memory[address];
            dataOut[23:16] = memory[address + 1];
            dataOut[15:8] = memory[address + 2];
            dataOut[7:0] = memory[address + 3];
        end
    end
endmodule
