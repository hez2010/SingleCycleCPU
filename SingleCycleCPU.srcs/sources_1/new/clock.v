`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 10:18:46 PM
// Design Name: 
// Module Name: Clock
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


module Clock(
    input clk,
    input rst,
    output divClk);
    
    reg [16:0] cnt;
    always @(posedge clk or negedge rst) begin
        if (!rst) cnt <= 0;
        else cnt <= cnt + 1;
    end
    
    assign divClk = cnt[16];
endmodule
