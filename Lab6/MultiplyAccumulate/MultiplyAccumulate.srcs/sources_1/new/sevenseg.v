`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 07:10:37 PM
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
    
    wire [3:0] an0, an1, an2, an3;
    wire [6:0] seg0, seg1, seg2, seg3;
    wire dp0, dp1, dp2, dp3;
    
    bcd bcd1 (sw[3:0],  an0,  seg0, dp0);
    bcd bcd2 (sw[7:4],  an1,  seg1, dp1);
    bcd bcd3 (sw[11:8],  an2,  seg2, dp2);
    bcd bcd4 (sw[15:12], an3,  seg3, dp3);
    
    clkdiv c1(clk, slow_clk);
    
    always @(*) begin
        case(current_state)
        0: begin
            an = 4'b1110;
            seg = seg0;
            if(reset == 0) next_state = 1;
            end
        1: begin
            an = 4'b1101;
            seg = seg1;
            if(reset == 0) next_state = 2;
            end
        2: begin
            an = 4'b1011;
            seg = seg2;
            if(reset == 0) next_state = 3;
            end
        3: begin
            an = 4'b0111;
            seg = seg3;
            if(reset == 0) next_state = 0;
            end
        endcase
    end
    
    always @(posedge slow_clk or posedge reset)
    begin
        if(reset == 1) next_state <= 0;
        current_state <= next_state;
    end

            
    
    
endmodule