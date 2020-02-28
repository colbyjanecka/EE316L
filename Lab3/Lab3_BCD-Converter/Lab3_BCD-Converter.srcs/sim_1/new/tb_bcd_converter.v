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


module tb_bcd_converter;


reg [7:0] sw;
reg [3:0] an;
wire [7:0] seg;

    // Module test instantiation
    bcd_converter c(.sw(sw), .AN(AN), .SSD(SSD));

    initial begin
    seg = 4'b0000;     // test 1 on SSD
    an = 2'b01;
    #50
    seg = 4'b0002;     // test 2 on SSD
    #50
    seg = 4'b0003;     // test 3 on SSD
    #50
    end



endmodule
