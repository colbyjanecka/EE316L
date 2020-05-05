`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 07:13:47 PM
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
    
    reg [2:0] count1 = 0;
    reg [2:0] count2 = 2;
    
    assign slow_clk = count1[2] | count2[2];
    
    always @(posedge clk) begin
        
        if(count1 == 4) count1 = 0;
        else count1 = count1+1;
        
    end
    
    always @(posedge clk) begin
        
        if(count2 == 4) count2 = 0;
        else count2 = count2+1;
        
    end
        
endmodule


