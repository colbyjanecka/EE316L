`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 07:06:14 PM
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(
    input clk,
    output slow_clk
    );
    
    reg [2:0] count = 0;
    reg clk_out = 0;
    assign slow_clk = clk_out;
    assign slow_clk = count[2];
    
    always @(posedge clk) begin
        
        if(count == 4) count = 0;
        else count = count+1;
        
    end
        
endmodule
