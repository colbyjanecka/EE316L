`timescale 1ns / 1ps

module loadreg(
    input clk, load,
    input [4:0] D,
    output reg [4:0] Q);
    
initial Q = 0;
always @(load) begin
    Q <= D;
end
endmodule