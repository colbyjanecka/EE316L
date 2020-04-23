`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/17/2020 03:10:43 PM
// Design Name:
// Module Name: tb_adders
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


module tb_adders;

reg clk;
reg load;
reg[3:0] a;
reg[3:0] b;
reg Cin;
wire[4:0] total_rca;
wire[4:0] total_cla;

rca uut (
    .clk(clk),
    .load(load),
    .a(a),
    .b(b),
    .Cin(Cin),
    .total(total_rca)
);

cla cla0 (
    .clk(clk),
    .load(load),
    .a(a),
    .b(b),
    .Cin(Cin),
    .total(total_cla)

    );

initial begin

clk = 0;
load = 0;

a = 4'b0001;
b = 4'b0100;
Cin = 1'b0;

#20;

load = 1;

#20;

a = 4'b0000;
b = 4'b0111;
Cin = 1'b1;

#20;

load = 0;

#20;

a = 4'b0001;
b = 4'b0010;
Cin = 1'b0;

#20;

load = 1;

#20;

a = 4'b0111;
b = 4'b0111;
Cin = 1'b0;

#20;

load = 0;

#20;

end

always
#1 clk = ~clk;

endmodule
