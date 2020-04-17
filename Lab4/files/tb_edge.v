`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 07:21:47 PM
// Design Name: 
// Module Name: tb_edge
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


module tb_edge(

    );
    
    reg clk = 0;
    reg sw = 0;
    wire led;
    edge_detector detector (clk, sw, led);
    
    always #5 clk = ~clk;
    
    initial begin
    sw = 0;
    #49
    sw = 1;
    #51
    sw = 0;
    #100
    sw = 1;
    #50
    sw = 1;
    #50
    sw = 1;
    #50
    sw = 0;
    #140
    sw = 1;
    
    end
    
endmodule
