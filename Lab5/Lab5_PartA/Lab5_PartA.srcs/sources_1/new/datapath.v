`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/20/2020 03:26:53 PM
// Design Name:
// Module Name: datapath
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


module datapath(
    input clk, load, sel, Cin,
    input [15:0] sw,
    output [15:0] led
    );

    wire [4:0] total_rca;
    wire [4:0] total_cla;
    wire [4:0] rca_load;
    wire [4:0] cla_load;

rca r1(
    clk,
    load,
    sw[7:4],sw[3:0],
    Cin,
    total_rca
    );

cla c1(
    clk,
    load,
    sw[15:12],sw[11:8],
    Cin,
    total_cla
);

loadreg r2(
    clk,
    sel,
    total_rca,
    rca_load
);

loadreg c2(
    clk,
    sel,
    total_cla,
    cla_load
);

assign led[7:0] = total_rca;
assign led[15:8] = total_cla;


endmodule
