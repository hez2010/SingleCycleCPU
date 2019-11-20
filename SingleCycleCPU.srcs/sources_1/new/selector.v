`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Sun Yat-sen University
// Engineer: Enze He
//
// Create Date: 11/14/2019 9:32:16 PM
// Design Name: Selectors
// Module Name: Selectors
// Project Name: SingleCycleCPU
// Target Devices: Basys3
// Tool Versions: 2019.1.3
// Description: Selectors
//
// Dependencies: -
//
// Revision: -
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module Selector1In2_5#(
    parameter WIDTH = 5
)(
    input select,
    input [WIDTH-1:0] dataA,
    input [WIDTH-1:0] dataB,
    output [WIDTH-1:0] dataY);

    assign dataY = select ? dataB : dataA;
endmodule

module Selector1In2_32#(
    parameter WIDTH = 32
)(
    input select,
    input [WIDTH-1:0] dataA,
    input [WIDTH-1:0] dataB,
    output [WIDTH-1:0] dataY);

    assign dataY = select ? dataB : dataA;
endmodule