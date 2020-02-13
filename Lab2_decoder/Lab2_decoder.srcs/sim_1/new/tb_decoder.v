`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 11:36:31 AM
// Design Name: 
// Module Name: tb_decoder
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


module tb_decoder;

reg up, left, right, enable;
wire combo0, combo1, combo2, combo3, combo4, combo5, combo6, combo7;

    // Module test instantiation
    decoder d(.up(up), .left(left), .right(right), .enable(enable),
     .combo0(combo0), .combo1(combo1), .combo2(combo2));
    
    initial begin
    up=0; left=0; right=0; enable=1;      
    #10                        
    up=0; left=0; right=1; enable=1;
    #10
    up=0; left=1; right=0; enable=1;
    #10
    up=0; left=1; right=1; enable=1;
    #10;
    end


endmodule
