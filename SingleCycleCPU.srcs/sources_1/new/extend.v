`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/16/2019 7:43:27 PM
// Design Name:
// Module Name: Extend
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

module Extend(
    input [15:0] immediate,
    input extSel,
    output [31:0] extImmediate);
    
    assign extImmediate[15:0] = immediate[15:0];
    assign extImmediate[31:16] = (extSel && immediate[15]) ? 16'hFFFF : 16'h0000;

endmodule