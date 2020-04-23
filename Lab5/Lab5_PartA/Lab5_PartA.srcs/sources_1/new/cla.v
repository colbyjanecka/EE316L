`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/20/2020 02:10:18 PM
// Design Name:
// Module Name: cla
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


module cla(
    input clk, load,
    input [3:0] a, b,
    input Cin,
    output [4:0] total);
    
    wire [3:0] G, P, S;
    wire [4:0] C;
    wire Cout;
    wire [4:0] D;
    
    //CLA Dataflow Model
    assign P[0] = a[0] ^ b[0];
    assign P[1] = a[1] ^ b[1];
    assign P[2] = a[2] ^ b[2];
    assign P[3] = a[3] ^ b[3];
    assign G[0] = a[0] & b[0];
    assign G[1] = a[1] & b[1];
    assign G[2] = a[2] & b[2];
    assign G[3] = a[3] & b[3];
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0]&C[0]);
    assign C[2] = (P[1]&P[0]&C[0]) | (P[1]&G[0]) | G[1];
    assign C[3] = (P[2]&P[1]&P[0]&C[0]) | (P[2]&P[1]&G[0]) | (P[2]&G[1]) | G[2];
    assign C[4] = (P[3]&P[2]&P[1]&P[0]&C[0]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&G[1]) | (P[3]&G[2]) | G[3];
    assign Cout = C[4];
    
    assign S[0] = P[0] ^ C[0];
    assign S[1] = P[1] ^ C[1];
    assign S[2] = P[2] ^ C[2];
    assign S[3] = P[3] ^ C[3];
    
    assign D = {Cout, S};
    
    loadreg r0(.clk(clk), .load(load), .D(D), .Q(total));

endmodule