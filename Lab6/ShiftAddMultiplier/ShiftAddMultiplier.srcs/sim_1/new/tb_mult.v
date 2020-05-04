`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 05:33:00 PM
// Design Name: 
// Module Name: tb_mult
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


module tb_mult(

    );
    
    reg clk;
    reg start;
    reg [7:0] sw;
    wire stop;
    wire [7:0] product;
    reg [3:0] a, b;
    
    always @ (*) begin 
        sw[7:4] = a;
        sw[3:0] = b;
    end
    
    mult m0(
        .clk(clk),
        .start(start),
        .sw(sw),
        .stop(stop),
        .product(product));
    
    initial begin
        clk = 0;
        start = 1;
        a = 15;
        b = 15;
        #10
        start = 0;
        
    end
        
    always begin
        #5 clk = ~clk;
    end
    
endmodule
