`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/17/2020 02:31:24 PM
// Design Name:
// Module Name: rca
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


module rca(
input clk, load,
 input [3:0] a, b,
 input Cin,
 output [4:0] total);

wire s0, s1, s2, s3, o0, o1, o2, o3;
reg[4:0] D;

adder c1 (.a(a[0]), .b(b[0]), .Cin(Cin), .S(s0), .Cout(o0));
adder c2 (.a(a[1]), .b(b[1]), .Cin(o0), .S(s1), .Cout(o1));
adder c3 (.a(a[2]), .b(b[2]), .Cin(o1), .S(s2), .Cout(o2));
adder c4 (.a(a[3]), .b(b[3]), .Cin(o2), .S(s3), .Cout(o3));

assign total = {o3, s3, s2, s1, s0};

endmodule
