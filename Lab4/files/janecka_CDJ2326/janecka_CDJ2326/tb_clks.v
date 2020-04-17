`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 04:18:14 PM
// Design Name: 
// Module Name: tb_clks
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


module tb_clks;

    reg clk = 0;
    wire [15:0] led;
    
    clks c(clk, led);
    always #5 clk = ~clk;

endmodule
