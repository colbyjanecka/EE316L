`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 06:57:19 PM
// Design Name: 
// Module Name: mac
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


module mac(
 input clk, load, reset,
 input [15:0] sw,
 output done, // dp
 output [15:0] led,
 output [3:0] an,
 output [6:0] seg
 );
 
 wire [7:0] a;
 wire [3:0] b, c;
 assign a = sw[15:8];
 assign b = sw[7:4];
 assign c = sw[3:0];
 reg [7:0] ACC;
 
 assign led = ACC;
 
 wire [7:0] add_result;
 wire [7:0] mult_result;
 
 reg start_mult;
 reg load_add;
 
 reg donereg;
 
 reg [15:0] sevenseg_input;
 
 mult m0(
    .clk(clk),
    .start(start_mult),
    .a(b),
    .b(c),
    .stop(stop_mult),
    .product(mult_result));
 
 rca r0(
    .clk(clk),
    .load(load_add),
    .a(ACC),
    .b(mult_result),
    .Cin(add_Cin),
    .total(add_result));
    
sevenseg s0(
    .clk(clk),
    .sw(sevenseg_input),
    .reset(reset),
    .an(an),
    .seg(seg));

assign done = donereg;

 always@(posedge clk) begin
    donereg = 0;
    if(reset == 1) begin
        ACC = sw[15:8];
    end
    if(load == 1) begin
        ACC = a;
        start_mult = 1;
        #50
        start_mult = 0;
        load_add = 1;
        #50
        load_add = 0;
        ACC = add_result;
        sevenseg_input = add_result;
        donereg = 1;
    end
end
        
 
endmodule 
