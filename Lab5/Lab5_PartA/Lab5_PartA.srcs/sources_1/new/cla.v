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
    output [4:0] total
    );

    wire [3:0] G, P, C;

    wire [4:0] S;
    wire Cout;
    wire [4:0] Data;

    assign Q = {Cout, S};

    P = a ^ b
    G = a&b
    C = P ^ S
    S = G + (P & G)


    //assign Data = {Cout, S};
    assign Data[4] = Cout;
    assign Data[3:0] = C;

    loadreg reg(.clk(clk), .load(load), .Data(Data), .total(total));

endmodule
