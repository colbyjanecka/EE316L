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

    wire wireA0, wireA1, wireA2, wireA3, 
         wireB0, wireB1, wireB2, wireB3,
         wireC0, wireC1, wireC2,
         wireD0, wireD1, wireD2, wireD3,
         wireE0, wireE1, wireE2,
         wireF0, wireF1, wireF2, wireF3,
         wireG0, wireG1, wireG2;
         
    wire not0, not1, not2, not3;
    
    not n0(not0, sw[0]);
    not n1(not1, sw[1]);
    not n2(not2, sw[2]);
    not n3(not3, sw[3]);
    
    and andA0(wireA0, not3, not3, not1, sw[0]);
    and andA1(wireA1, not3, sw[2], not1, not0);
    and andA2(wireA2, sw[3], sw[2], not1, sw[0]);
    and andA3(wireA3, sw[3], not2, sw[1], sw[0]);
    
    and andB0(wireB0, not3, sw[2], not1, sw[0]);
    and andB1(wireB1, sw[2], sw[1], not0);
    and andB2(wireB2, sw[3], sw[2], not1, not0);
    and andB3(wireB3, sw[3], sw[1], sw[0]);
    
    
    
    
    and andC(wireC, 
    

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

    reg [6:0] seg_buf = 0;
    assign seg = seg_buf;


    always @(*)
    begin
        case(sw)
        4'b0000: seg_buf = 7'b1000000;
        4'b0001: seg_buf = 7'b1111001;
        4'b0010: seg_buf = 7'b0100100;
        4'b0011: seg_buf = 7'b0110000;
        4'b0100: seg_buf = 7'b0011001;
        4'b0101: seg_buf = 7'b0010010;
        4'b0110: seg_buf = 7'b0000010;
        4'b0111: seg_buf = 7'b1111000;
        4'b1000: seg_buf = 7'b0000000;
        4'b1001: seg_buf = 7'b0010000;
        4'b1010: seg_buf = 7'b0001000;
        4'b1011: seg_buf = 7'b0000011;
        4'b1100: seg_buf = 7'b1000110;
        4'b1101: seg_buf = 7'b0100001;
        4'b1110: seg_buf = 7'b0000110;
        4'b1111: seg_buf = 7'b0001110;
    

        endcase
    end




endmodule
