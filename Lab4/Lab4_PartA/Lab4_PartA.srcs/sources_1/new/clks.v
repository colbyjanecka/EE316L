`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/05/2020 03:38:44 PM
// Design Name:
// Module Name: clks
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


module clks(
    input clk,
    output [15:0] led
    );

    wire div2;
    reg [11:0] count = 0;
    
    assign led[0] = count[0];   // set led to 50 hz

    always @(posedge clk) begin
        count = count + 1;
    end

endmodule
