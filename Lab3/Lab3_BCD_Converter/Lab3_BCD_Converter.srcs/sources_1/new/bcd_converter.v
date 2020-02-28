`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Colby Janecka
//
// Create Date: 02/05/2020 12:15:14 PM
// Design Name:
// Module Name: decoder
// Project Name: Lab2
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


module bcd(
   input [3:0] sw,
   output [3:0] an,
   output [6:0] seg,
   output dp );

assign an = 4'b1110; // Enable rightmost anode, an0
assign dp = 1; // Disable decimal point since we aren't using it in this lab

    // Structural



    // Dataflow

    assign seg[0] = sw[0];
//    assign seg[0] = (sw[3] & ~sw[1]) | (sw[3] & ~sw[2] & ~sw[0])
//                    |(~sw[2] & ~sw[1]) | (sw[2] & ~sw[0])
//                    |(~sw[3] & sw[0]) | (~sw[3] & sw[2] & sw[1]);


    // Behavioral

//    reg out_buf = 0;
//    assign out = out_buf;


//    always @ (up or left or right or down or s0 or s1)
//    begin
//        case ({s1, s0})
//            2'b00: out_buf <= up;
//            2'b01: out_buf <= left;
//            2'b10: out_buf <= right;
//            2'b11: out_buf <= down;
//        endcase
//    end




endmodule
