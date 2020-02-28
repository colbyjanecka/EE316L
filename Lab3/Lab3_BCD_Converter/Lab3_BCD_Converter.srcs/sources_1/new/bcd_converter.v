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

//    assign seg[0] = (~sw[3] & ~sw[2] & ~sw[1] & sw[0]) | 
//                    (~sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
//                    (sw[3] & sw[2] & ~sw[1] & sw[0]) |
//                    (sw[3] & ~sw[2] & sw[1] & sw[0]);
                    
//    assign seg[1] = (~sw[3] & sw[2] & ~sw[1] & sw[0]) | 
//                    (sw[2] & sw[1] & ~sw[0]) |
//                    (sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
//                    (sw[3] & sw[1] & sw[0]);
                    
//    assign seg[2] = (~sw[3] & ~sw[2] & sw[1] & ~sw[0]) | 
//                    (sw[3] & sw[2] & sw[1]) |
//                    (sw[3] & sw[2] & ~sw[0]);
                    
//    assign seg[3] = (~sw[3] & ~sw[2] & ~sw[1] & sw[0]) | 
//                    (~sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
//                    (sw[2] & sw[1] & sw[0]) |
//                    (sw[3] & ~sw[2] & sw[1] & ~sw[0]);
                    
//    assign seg[4] = (~sw[3] & sw[0]) | (~sw[3] & sw[2] & ~sw[1])
//                    |(sw[0] & ~sw[1] & ~sw[2]);
                    
//    assign seg[5] = (~sw[3] & ~sw[2] & sw[0]) | 
//                    (~sw[3] & ~sw[2] & sw[1]) |
//                    (~sw[3] & sw[1] & sw[0]) |
//                    (sw[3] & sw[2] & ~sw[1] & sw[0]); 
                    
//    assign seg[6] = (~sw[3] & ~sw[2] & ~sw[1]) | 
//                    (~sw[3] & sw[2] & sw[1] & sw[0]) |
//                    (sw[3] & sw[2] & ~sw[1] & ~sw[0]);                

    // Behavioral

    reg seg_buf = 0;
    assign seg = seg_buf;


    always @(*)
    begin
        case(sw)
        4'b0000: seg_buf = 7'b0000001;
        4'b0001: seg_buf = 7'b1001111;
        4'b0010: seg_buf = 7'b0010010;
        4'b0011: seg_buf = 7'b0000110;
        4'b0100: seg_buf = 7'b1001100;
        4'b0101: seg_buf = 7'b0100100;
        4'b0110: seg_buf = 7'b0100000;
        4'b0111: seg_buf = 7'b0001111;
        4'b1000: seg_buf = 7'b0000000;
        4'b1001: seg_buf = 7'b0000100;
        4'b1010: seg_buf = 7'b0001000;
        4'b1011: seg_buf = 7'b1100000;
        4'b1100: seg_buf = 7'b0110001;
        4'b1101: seg_buf = 7'b1000010;
        4'b1110: seg_buf = 7'b0110000;
        4'b1111: seg_buf = 7'b0111000;
    

        endcase
    end




endmodule
