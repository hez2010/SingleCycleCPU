`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 11:34:46 AM
// Design Name: 
// Module Name: Test
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


module Test();
    reg clk;
    reg rst;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [31:0] currentPC;
    wire [31:0] newPC;
    wire [31:0] insOut;
    wire [31:0] readData1;
    wire [31:0] readData2;
    wire [4:0] writeReg;
    wire [31:0] writeData;
    wire [31:0] immediate;
    wire [31:0] result;
    wire [31:0] dataOut;
    
    parameter CLK_CYCLE = 100;
    CPU cpu(clk, rst, rs, rt, currentPC, newPC, insOut, readData1, readData2, writeReg, writeData, immediate, result, dataOut);

    initial begin
        clk = 0; rst = 0;
        #(CLK_CYCLE/2) rst = 1;
        forever #(CLK_CYCLE/2) clk = ~clk;
    end
endmodule
