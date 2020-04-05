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

    reg [11:0] count = 0;
    wire [11:0] div;
    assign div = count;
    assign led[11:0] = div;

    reg [3:0] count12 = 0;
    assign div12 = count12[3] & count12[0]; // check for 10
    assign led[12] = div12;

    reg [7:0] count13 = 0;
    assign div13 = count13[6] & count13[5] & count13[1] & count13[0];
    assign led[13] = div13;

    reg [9:0] count14 = 0;
    assign div14 = count14[9] & count14[8] & count14[7] & count14[6]
                & count14[5] & count14[2] & count14[1] & count14[0];
    assign led[14] = div14;

    reg[13:0] count15 = 0;
    assign div15 = count15[13] & count15[10] & count15[9] & count15[8]
                & count15[3] & count15[2] & count15[1] & count15[0];

    always @(posedge clk) begin
        count = count + 1;  // count for led 0 - 11

        if(count12 == 9) count12 = 0; // count for led 12
        else count12 = count12 + 1;

        if(count13 == 99) count13 = 0; // count for led 13
        else count13 = count13 + 1;

        if(count14 == 999) count14 = 0; // count for led 14
        else count14 = count14 + 1;

        if(count15 == 9999) count15 = 0; // count for led 15
        else count15 = count15 + 1;

    end

endmodule
