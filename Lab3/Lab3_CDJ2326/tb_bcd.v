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
wire [6:0] seg;
wire dp;

    // Module test instantiation
    bcd bcd(.sw(sw), .an(an), .seg(seg), .dp(dp));

    initial begin
    sw = 4'b0000;     // test 0 on SSD
    #10;
    sw = 4'b0001;     // test 1 on SSD
    #10;
    sw = 4'b0010;     // test 1 on SSD
    #10;
    sw = 4'b0011;     // test 3 on SSD
    #10;
    sw = 4'b0100;     // test 4 on SSD
    #10;
    sw = 4'b0101;     // test 5 on SSD
    #10;
    sw = 4'b0110;     // test 6 on SSD
    #10;
    sw = 4'b0111;     // test 7 on SSD
    #10;
    sw = 4'b1000;     // test 8 on SSD
    #10;
    sw = 4'b1001;     // test 9 on SSD
    #10;
    sw = 4'b1010;     // test A on SSD
    #10;
    sw = 4'b1011;     // test b on SSD
    #10;
    sw = 4'b1100;     // test C on SSD
    #10;
    sw = 4'b1101;     // test d on SSD
    #10;
    sw = 4'b1110;     // test E on SSD
    #10;
    sw = 4'b1111;     // test F on SSD
    #10;
    end



endmodule
