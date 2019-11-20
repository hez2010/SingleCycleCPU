`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 10:18:46 PM
// Design Name: 
// Module Name: Board
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


module Board(
    input clk,
    input rst,
    input key,
    input [1:0] digBit,
    output [3:0] digSrc,
    output [6:0] digCodeSrc
    );
    
    wire divClk, led;
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
    wire [15:0] displayDataOut;
    
    Clock clock(clk, rst, divClk);
    Key boardKey(divClk, key, led);
    CPU cpu(led, rst, rs, rt, currentPC, newPC, insOut, readData1, readData2, writeReg, writeData, immediate, result, dataOut);
    DisplayData data(digBit, currentPC[7:0], newPC[7:0], rs, rt, readData1[7:0], readData2[7:0], result[7:0], dataOut[7:0], displayDataOut);
    Display display(divClk, rst, displayDataOut, digSrc, digCodeSrc);
endmodule
