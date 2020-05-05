`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 07:14:57 PM
// Design Name: 
// Module Name: bcd
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


module bcd(
   input [3:0] sw,
   output [3:0] an,
   output [6:0] seg,
   output dp );

assign an = 4'b1110; // Enable rightmost anode, an0
assign dp = 1; 

    assign seg[0] = (~sw[3] & ~sw[2] & ~sw[1] & sw[0]) |
                    (~sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
                    (sw[3] & sw[2] & ~sw[1] & sw[0]) |
                    (sw[3] & ~sw[2] & sw[1] & sw[0]);

    assign seg[1] = (~sw[3] & sw[2] & ~sw[1] & sw[0]) |
                    (sw[2] & sw[1] & ~sw[0]) |
                    (sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
                    (sw[3] & sw[1] & sw[0]);

    assign seg[2] = (~sw[3] & ~sw[2] & sw[1] & ~sw[0]) |
                    (sw[3] & sw[2] & sw[1]) |
                    (sw[3] & sw[2] & ~sw[0]);

    assign seg[3] = (~sw[3] & ~sw[2] & ~sw[1] & sw[0]) |
                    (~sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
                    (sw[2] & sw[1] & sw[0]) |
                    (sw[3] & ~sw[2] & sw[1] & ~sw[0]);

    assign seg[4] = (~sw[3] & sw[0]) | (~sw[3] & sw[2] & ~sw[1])
                    |(sw[0] & ~sw[1] & ~sw[2]);

    assign seg[5] = (~sw[3] & ~sw[2] & sw[0]) |
                    (~sw[3] & ~sw[2] & sw[1]) |
                    (~sw[3] & sw[1] & sw[0]) |
                    (sw[3] & sw[2] & ~sw[1] & sw[0]);

    assign seg[6] = (~sw[3] & ~sw[2] & ~sw[1]) |
                    (~sw[3] & sw[2] & sw[1] & sw[0]) |
                    (sw[3] & sw[2] & ~sw[1] & ~sw[0]);
                    
endmodule