`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 10:18:46 PM
// Design Name: 
// Module Name: Display
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


module Display(
    input clk,
    input rst,
    input [15:0] data,
    output reg [3:0] digSrc,
    output reg [6:0] digCodeSrc);
    
    reg [1:0] digBit;
    reg [3:0] dig;
    wire [3:0] src;
    assign src = 4'b1111;
    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            digBit <= 0;
        end
        else begin
            digBit <= digBit + 1;
        end
    end
    
    always @(*) begin
        case (digBit)
            0: dig = data[3:0];
            1: dig = data[7:4];
            2: dig = data[11:8];
            3: dig = data[15:12];
        endcase
    end
    
    always @(*) begin
        case (dig)
            4'h0: digCodeSrc = 7'b0000001; //0
            4'h1: digCodeSrc = 7'b1001111; //1
            4'h2: digCodeSrc = 7'b0010010; //2
            4'h3: digCodeSrc = 7'b0000110; //3
            4'h4: digCodeSrc = 7'b1001100; //4
            4'h5: digCodeSrc = 7'b0100100; //5
            4'h6: digCodeSrc = 7'b0100000; //6
            4'h7: digCodeSrc = 7'b0001111; //7
            4'h8: digCodeSrc = 7'b0000000; //8
            4'h9: digCodeSrc = 7'b0000100; //9
            4'hA: digCodeSrc = 7'b0001000; //A
            4'hB: digCodeSrc = 7'b1100000; //B
            4'hC: digCodeSrc = 7'b0110001; //C
            4'hD: digCodeSrc = 7'b1000010; //D
            4'hE: digCodeSrc = 7'b0110000; //E
            4'hF: digCodeSrc = 7'b0111000; //F
        endcase
    end
    
    
    always @(*) begin
        digSrc = 4'b1111; // close all
        if (src[digBit]) digSrc[digBit] = 0; // display
    end
endmodule
