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

    wire div2, div4, div8, div16, div32, div64, div128,
         div256, div512, div1024, div2048, div4096;
    reg [11:0] count = 0;

    assign div2 = count[0];
    assign div4 = count[1];   // set led to 25 MHz
    assign div8 = count[2];   // set led to 12.5 MHz
    assign div16 = count[3];   // set led to 6.25 MHz
    assign div32 = count[4];   // set led to 3.13 MHz
    assign div64 = count[5];   // set led to 1.56 MHz
    assign div128 = count[6];   // set led to 0.78 MHz
    assign div256 = count[7];   // set led to 0.39 MHz
    assign div512 = count[8];   // set led to 195 kHz
    assign div1024 = count[9];   // set led to 97.7 kHz
    assign div2048 = count[10];   // set led to 48.8 kHz
    assign div4096 = count[11];   // set led to 24.4 kHz


    assign led[0] = div2;   // set led to 50 MHz
    assign led[1] = div4;   // set led to 25 MHz
    assign led[2] = div8;   // set led to 12.5 MHz
    assign led[3] = div16;   // set led to 6.25 MHz
    assign led[4] = div32;   // set led to 3.13 MHz
    assign led[5] = div64;   // set led to 1.56 MHz
    assign led[6] = div128;   // set led to 0.78 MHz
    assign led[7] = div256;   // set led to 0.39 MHz
    assign led[8] = div512;   // set led to 195 kHz
    assign led[9] = div1024;   // set led to 97.7 kHz
    assign led[10] = div2048;   // set led to 48.8 kHz
    assign led[11] = div4096;   // set led to 24.4 kHz
    assign led[12] = div2;   // 50 MHz placeholder
    assign led[13] = div2;   // 50 MHz placeholder
    assign led[14] = div2;   // 50 MHz placeholder
    assign led[15] = div2;   // 50 MHz placeholder

    always @(posedge clk) begin
        count = count + 1;
    end

endmodule
