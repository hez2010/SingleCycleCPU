`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 10:18:46 PM
// Design Name: 
// Module Name: DisplayData
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

module DisplayData(
    input [1:0] digBit,
    input [7:0] currentPC,
    input [7:0] newPC,
    input [4:0] rs,
    input [4:0] rt,
    input [7:0] readData1,
    input [7:0] readData2,
    input [7:0] result,
    input [7:0] dataOut,
    output [15:0] displayDataOut);
    
    reg [15:0] displayData;
    initial begin
        displayData <= 0;
    end

    always @(*) begin
        case (digBit)
            2'b00: begin
                displayData[15:8] = currentPC[7:0];
                displayData[7:0] = newPC[7:0];
            end
            2'b01: begin
                displayData[15:12] = 0;
                displayData[12:8] = rs;
                displayData[7:0] = readData1[7:0];
            end
            2'b10: begin
                displayData[15:12] = 0;
                displayData[12:8] = rt;
                displayData[7:0] = readData2[7:0];
            end
            2'b11: begin
                displayData[15:8] = result[7:0];
                displayData[7:0] = dataOut[7:0];
            end
        endcase
    end

    assign displayDataOut = displayData;
    
endmodule