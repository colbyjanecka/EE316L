`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 07:06:14 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
    input clk,
    input sw,
    output reg led
    );
    
    wire slow_clk;
    clkdiv c1(clk, slow_clk);
    
    reg [1:0] current_state = 0;
    reg [1:0] next_state = 0;
    
    always @(*) begin
        case(current_state)
        0: begin
            led = 0;
            if (sw==1) next_state = 1;
            else next_state = 0;
            end
        1: begin
            led = 1;
            if (sw==1) next_state = 2;
            else next_state = 0;
            end
        2: begin
            led = 0;
            if (sw==1) next_state = 2;
            else next_state = 0;
            end
        default: begin
            led = 0;
            next_state = 0;
            end
        endcase
    end
    
    always @(posedge slow_clk) begin
        current_state <= next_state;
    end
    
endmodule
