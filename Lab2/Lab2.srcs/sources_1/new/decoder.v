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


module decoder( up, left, right, enable, 
    combo0, combo1, combo2, combo3, combo4, combo5, combo6, combo7

    );
    
      input up, left, right, enable;
      output combo0, combo1, combo2, combo3, combo4, combo5, combo6, combo7;
//    output [0:7] combo

    
    // Structural
    
    wire notUp, notLeft, notRight;
    
    not g1(notUp, up);
    not g2(notLeft, left);
    not g3(notRight, right);
    and g4(combo0, notUp, notLeft, notRight, enable);
    and g5(combo1, notUp, notLeft, right, enable);
    and g6(combo2, notUp, left, notRight, enable);
    and g7(combo3, notUp, left, right, enable);
    and g8(combo4, up, notLeft, notRight, enable);
    and g9(combo5, up, notLeft, right, enable);
    and g10(combo6, up, left, notRight, enable);
    and g11(combo7, up, left, right, enable);
    
    
    // Dataflow
//    assign combo0 = (~up) & (~left) & (~right) & (enable);
//    assign combo1 = (~up) & (~left) & (right) & (enable);
//    assign combo2 = (~up) & (left) & (~right) & (enable);
//    assign combo3 = (~up) & (left) & (right) & (enable);
//    assign combo4 = (up) & (~left) & (~right) & (enable);
//    assign combo5 = (up) & (~left) & (right) & (enable);
//    assign combo6 = (up) & (left) & (~right) & (enable);
//    assign combo7 = (up) & (left) & (right) & (enable);
    
    // Behavioral
    
        
    
endmodule
