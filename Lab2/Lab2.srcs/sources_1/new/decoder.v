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


module decoder(

    input up, left, right, enable,
    output combo0, combo1, combo2, combo3, combo4, combo5, combo6, combo7
//    output [0:7] combo

    );
    
    // Structural
    
//    wire notUp, notLeft, notRight;
    
//    not g1(notUp, up);
//    not g2(notLeft, left);
//    not g3(notRight, right);
//    and g4(combo0, notUp, notLeft, notRight, enable);
//    and g5(combo1, notUp, notLeft, right, enable);
//    and g6(combo2, notUp, left, notRight, enable);
//    and g7(combo3, notUp, left, right, enable);
//    and g8(combo4, up, notLeft, notRight, enable);
//    and g9(combo5, up, notLeft, right, enable);
//    and g10(combo6, up, left, notRight, enable);
//    and g11(combo7, up, left, right, enable);
    
    
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
    
    reg combo0_buf = 0, combo1_buf = 0, combo2_buf = 0, combo3_buf = 0,
     combo4_buf = 0, combo5_buf = 0, combo6_buf = 0, combo7_buf = 0;
    
    assign combo0 = combo0_buf, combo1 = combo1_buf, combo2 = combo2_buf,
           combo3 = combo3_buf, combo4 = combo4_buf, combo5 = combo5_buf,
           combo6 = combo6_buf, combo7 = combo7_buf;
           
//     always @( * )  
     always @(up or left or right or enable)
        begin
            combo0_buf = 0;
            combo1_buf = 0;
            combo2_buf = 0;
            combo3_buf = 0;
            combo4_buf = 0;
            combo5_buf = 0;
            combo6_buf = 0;
            combo7_buf = 0;
            if (enable==1'b1)
                begin
                case ( {up, left, right } ) 
                    3'b000: combo0_buf=1'b1;
                    3'b001: combo1_buf=1'b1;
                    3'b010: combo0_buf=2'b1;
                    3'b011: combo0_buf=3'b1;
                    3'b100: combo0_buf=4'b1;
                    3'b101: combo1_buf=5'b1;
                    3'b110: combo0_buf=6'b1;
                    3'b111: combo0_buf=7'b1;
                    default: begin
                    combo0_buf = 0;
                    combo1_buf = 0;
                    combo2_buf = 0;
                    combo3_buf = 0;
                    combo4_buf = 0;
                    combo5_buf = 0;
                    combo6_buf = 0;
                    combo7_buf = 0;
                    end
                endcase
            end
        end

        
    
endmodule
