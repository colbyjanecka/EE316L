`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 11:36:31 AM
// Design Name: 
// Module Name: tb_decoder
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


module tb_mux;

reg s0, s1, left, right, up, down;
wire out;

    // Module test instantiation
    mux m(.up(up), .left(left), .right(right), .down(down),
     .s0(s0), .s1(s1), .out(out));
    
    initial begin
    up=0; left=0; right=0; down= 0; s0=0; s1=0;     // up selected, not pressed   
    #10                        
    up=1; left=0; right=0; down= 0; s0=0; s1=0;     // up selected, pressed       
    #10  
    up=0; left=0; right=0; down= 0; s0=0; s1=1;     // left selected, not pressed       
    #10     
    up=0; left=1; right=0; down= 0; s0=0; s1=1;     // left selected, pressed       
    #10
    up=0; left=0; right=0; down= 0; s0=1; s1=0;     // right selected, not pressed       
    #10                        
    up=0; left=0; right=1; down= 0; s0=1; s1=0;     // right selected, pressed       
    #10
    up=0; left=0; right=0; down= 0; s0=1; s1=1;     // down selected, not pressed       
    #10                        
    up=0; left=0; right=0; down= 1; s0=1; s1=1;     // down selected, pressed       
    #10;                       
    end


endmodule
