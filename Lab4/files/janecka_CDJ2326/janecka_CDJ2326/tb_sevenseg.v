`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 08:50:21 PM
// Design Name: 
// Module Name: tb_sevenseg
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


module tb_sevenseg(

    );
    
    reg clk = 0;
    reg [15:0] sw;
    reg reset = 0;
    wire [3:0] an;
    wire [6:0] seg;
    sevenseg uut (clk, sw, reset, an, seg);
    
    always #5 clk = ~clk;
    
    initial begin
    sw = 16'b0011001000010000; // output 3210 to segs
    #200
    reset = 1;
    #100
    reset = 0;
    #200
    reset = 1;
    #25
    reset = 0;
    #100
    sw = 16'b000000100100011; // output 0123 to segs
    #200
    reset = 1;
    #100
    reset = 0;
    #200
    reset = 1;
    #25
    reset = 0;
    end
    
endmodule
