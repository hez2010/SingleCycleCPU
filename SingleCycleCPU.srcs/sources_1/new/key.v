`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 10:18:46 PM
// Design Name: 
// Module Name: Key
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


module Key(
    input clk,
    input key,
    output reg led);
    always @(posedge clk) begin
        if (key) led <= 0;
        else led <= 1;
    end
endmodule
