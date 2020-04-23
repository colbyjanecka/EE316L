`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/20/2020 03:26:53 PM
// Design Name:
// Module Name: datapath
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


module datapath(
    input clk, load, sel, Cin,
    input [15:0] sw,
    output [15:0] led
    );

    wire [4:0] total_rca;
    wire [4:0] total_cla;
    reg [15:0] led_reg;
    

rca r1(
    .clk(clk),
    .load(load),
    .a(sw[3:0]),
    .b(sw[7:4]),
    .Cin(Cin),
    .total(total_rca)
    );

cla c1(
    .clk(clk),
    .load(load),
    .a(sw[11:8]),
    .b(sw[15:12]),
    .Cin(Cin),
    .total(total_cla)
);

loadreg r2(
    .clk(clk),
    .load(load),
    .D(led_reg),
    .Q(led)
);



    always @(*) begin
    
        if(sel == 0) begin
                led_reg[15:5] = 11'b00000000000;
                led_reg[4:0] = total_rca;
         end
         else begin
                led_reg[15:13] = 3'b000;
                led_reg[12:8] = total_cla;
                led_reg[7:0] = 8'b00000000;
         end
    end
        


endmodule
