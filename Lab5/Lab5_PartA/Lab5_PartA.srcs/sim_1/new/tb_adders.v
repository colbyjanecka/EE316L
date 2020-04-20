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
wire[4:0] total;

rca uut (
    .clk(clk),
    .load(load),
    .a(a),
    .b(b),
    .Cin(Cin),
    .total(total)
);

initial begin

clk = 0;
load = 0;

a = 4'b0000;
b = 4'b0100;
Cin = 1'b0;

#50;

load = 1;

#50;

load = 0;

a = 4'b0000;
b = 4'b0111;
Cin = 1'b1;

#50;

load = 1;

#50;

load = 0;

a = 4'b0001;
b = 4'b0101;
Cin = 1'b0;

#50;

load = 1;

#50;

load = 0;

a = 4'b0111;
b = 4'b0111;
Cin = 1'b0;

#50;

load = 1;

#50;

load = 0;

a = 4'b1000;
b = 4'b0111;
Cin = 1'b1;

#50;

load = 1;

#50;

load = 0;

a = 4'b1100;
b = 4'b0100;
Cin = 1'b0;

#50;

load = 1;

#50;

load = 0;

a = 4'b1000;
b = 4'b1000;
Cin = 1'b1;

#50;

load = 1;

#50;

load = 0;

a = 4'b1001;
b = 4'b1010;
Cin = 1'b1;

#50;

load = 1;

#50;

load = 0;

a = 4'b1111;
b = 4'b1111;
Cin = 1'b0;

#50;

end

always
#1 clk = ~clk;

endmodule
