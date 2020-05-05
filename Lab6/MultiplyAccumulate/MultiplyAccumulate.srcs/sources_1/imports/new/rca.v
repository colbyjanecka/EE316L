`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 07:01:34 PM
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
 input [7:0] a, b,
 input Cin, 
 output [8:0] total); 
    
wire s0, s1, s2, s3, s4, s5, s6, s7, o0, o1, o2, o3, o4, o5, o6, o7;
reg[4:0] D;

adder c1 (.a(a[0]), .b(b[0]), .Cin(Cin), .S(s0), .Cout(o0));
adder c2 (.a(a[1]), .b(b[1]), .Cin(o0), .S(s1), .Cout(o1));
adder c3 (.a(a[2]), .b(b[2]), .Cin(o1), .S(s2), .Cout(o2));
adder c4 (.a(a[3]), .b(b[3]), .Cin(o2), .S(s3), .Cout(o3));
adder c5 (.a(a[4]), .b(b[4]), .Cin(o3), .S(s4), .Cout(o4));
adder c6 (.a(a[5]), .b(b[5]), .Cin(o4), .S(s5), .Cout(o5));
adder c7 (.a(a[6]), .b(b[6]), .Cin(o5), .S(s6), .Cout(o6));
adder c8 (.a(a[7]), .b(b[7]), .Cin(o6), .S(s7), .Cout(o7));

always @(*) begin
    D = {o7, s6, s5, s4, s3, s3, s2, s1, s0};
end

loadreg c9 (.clk(clk), .load(load), .D(D), .Q(total)); 
    
endmodule
