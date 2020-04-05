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

    assign led[0] = count[0];   // set led to 50 MHz
    assign led[1] = count[1];   // set led to 25 MHz
    assign led[2] = count[2];   // set led to 12.5 MHz
    assign led[3] = count[3];   // set led to 6.25 MHz
    assign led[4] = count[4];   // set led to 3.13 MHz
    assign led[5] = count[5];   // set led to 1.56 MHz
    assign led[6] = count[6];   // set led to 0.78 MHz
    assign led[7] = count[7];   // set led to 0.39 MHz
    assign led[8] = count[8];   // set led to 195 kHz
    assign led[9] = count[9];   // set led to 97.7 kHz
    assign led[10] = count[10];   // set led to 48.8 kHz
    assign led[11] = count[11];   // set led to 24.4 kHz
    assign led[12] = count[12];   // 50 MHz placeholder
    assign led[13] = count[13];   // 50 MHz placeholder
    assign led[14] = count[14];   // 50 MHz placeholder
    assign led[15] = count[15];   // 50 MHz placeholder

    always @(posedge clk) begin
        count = count + 1;
    end

endmodule
