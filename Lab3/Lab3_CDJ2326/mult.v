`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2020 05:35:27 PM
// Design Name: 
// Module Name: mult
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
`include "bcd.v" 

module mult(
   input [3:0] sw,
   output [3:0] an,
   output [6:0] seg,
   output dp );
   
   wire [3:0] sw_temp;
   assign an = 4'b1110; // Enable rightmost anode, an0
   assign dp = 1; // Disable decimal point since we aren't using it in this lab
   
    // dataflow
    
    assign sw_temp[0] = sw[2] & sw[0];
    assign sw_temp[1] = (~sw[3]&sw[2]&sw[1]&~sw[0])|
                    (~sw[3]&sw[2]&sw[1]&sw[0])|
                    (sw[3]&~sw[2]&~sw[1]&sw[0])|
                    (sw[3]&~sw[2]&sw[1]&sw[0])|
                    (sw[3]&sw[2]&~sw[1]&sw[0])|
                    (sw[3]&sw[2]&sw[1]&~sw[0]);
    //assign sw_temp[1] = (sw[2] & sw[1]) | (sw[3] & sw[0]);
    assign sw_temp[2] = (sw[3] & ~sw[2]) & (sw[1] & ~sw[0]) |
                 (sw[3] & ~sw[2]) & (sw[1] & sw[0]) |
                 (sw[3] & sw[2]) & (sw[1] & ~sw[0]);
    assign sw_temp[3] = (sw[3] & sw[2] & sw[1] & sw[0]);
    
    bcd bcd_out(sw_temp, an, seg, dp );
    
endmodule
