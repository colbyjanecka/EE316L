`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 08:26:01 PM
// Design Name: 
// Module Name: sevenseg
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


module sevenseg(
    input clk,
    input [15:0] sw,
    input reset,
    output reg [3:0] an,
    output reg [6:0] seg
    );
    
    wire slow_clk;
    reg [3:0] out;
    reg [1:0] next_state = 0;
    reg [1:0] current_state = 0;
    reg dp = 1;
    
    clkdiv c1(clk, slow_clk);
    
    
    always @(*) begin
        case(current_state)
        0: begin
            an = 4'b1110;
            out = sw[3:0];
            if(reset == 0) next_state = 1;
            end
        1: begin
            an = 4'b1101;
            out = sw[7:4];
            if(reset == 0) next_state = 2;
            end
        2: begin
            an = 4'b1011;
            out = sw[11:8];
            if(reset == 0) next_state = 3;
            end
        3: begin
            an = 4'b0111;
            out = sw[15:12];
            if(reset == 0) next_state = 0;
            end
        endcase
    end
    
    always @(posedge slow_clk or posedge reset)
    begin
        if(reset == 1) next_state <= 0;
        current_state <= next_state;
    end
    
    
    always @(*) begin
    case(out)
        0: seg = 7'b0000001;
        1: seg = 7'b1001111;
        2: seg = 7'b0010010;
        3: seg = 7'b0000110;
        4: seg = 7'b1001100;
        5: seg = 7'b0100100;
        6: seg = 7'b0100000;
        7: seg = 7'b0001111;
        8: seg = 7'b0000000;
        9: seg = 7'b0000100;
        default: seg = 7'b0000001;
        endcase
    end
endmodule
