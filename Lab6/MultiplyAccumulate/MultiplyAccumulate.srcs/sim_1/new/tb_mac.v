`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 07:45:59 PM
// Design Name: 
// Module Name: tb_mac
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


module tb_mac(

    );
    
    reg clk = 0;
    reg load  = 0;
    reg reset = 0;
    reg [15:0] sw;
    wire done;
    wire [7:0] led;
    wire [3:0] an;
    wire [6:0] seg;
    
    mac uut(
        .clk(clk),
        .load(load),
        .reset(reset),
        .sw(sw),
        .done(done),
        .led(led),
        .an(an),
        .seg(seg));
    
    always #5 clk = ~clk;
    
    initial begin
    reset = 1;
    #100 reset = 0; sw = 16'h02FF; load = 1;
    end
endmodule
