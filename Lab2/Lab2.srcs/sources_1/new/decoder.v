`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Colby Janecka
// 
// Create Date: 02/05/2020 12:15:14 PM
// Design Name: 
// Module Name: decoder
// Project Name: Lab2 
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


module decoder(

input up, left, right, enable,
output combo0, combo1, combo2, combo3, combo4, combo5, combo6, combo7

    );
    
// Structural

// Dataflow

assign combo0 = (~up) & (~left) & (~right) & (enable);
assign combo1 = (~up) & (~left) & (right) & (enable);
assign combo2 = (~up) & (left) & (~right) & (enable);
assign combo3 = (~up) & (left) & (right) & (enable);
assign combo4 = (up) & (~left) & (~right) & (enable);
assign combo5 = (up) & (~left) & (right) & (enable);
assign combo6 = (up) & (left) & (~right) & (enable);
assign combo7 = (up) & (left) & (right) & (enable);

// Behavioral    
    
endmodule
