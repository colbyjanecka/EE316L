`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 05:13:57 PM
// Design Name: 
// Module Name: loadreg
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


module loadreg(
    input clk, load,
    input [4:0] D,
    output reg [4:0] Q);
    
initial Q = 0;
always @(load) begin
    Q <= D;
end
endmodule