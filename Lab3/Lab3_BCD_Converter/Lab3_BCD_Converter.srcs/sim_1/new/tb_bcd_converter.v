`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/28/2020 12:12:54 PM
// Design Name:
// Module Name: tb_bcd-converter
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


module tb_bcd;

reg [3:0] sw;
wire [3:0] an;
wire [7:0] seg;
wire dp;

    // Module test instantiation
    bcd bcd(.sw(sw), .an(an), .seg(seg));

    initial begin
    sw = 4'b0000;     // test 1 on SSD
    #50;
    sw = 4'b0010;     // test 2 on SSD
    #50;
    sw = 4'b0011;     // test 3 on SSD
    #50;
    end



endmodule
