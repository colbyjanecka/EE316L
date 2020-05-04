`timescale 1ns / 1ps

module clkdiv(
    input clk,
    output fsmclk // Must be 4x slower than seven-seg clock
    );
    
    // Seven-seg module has its own clock divider (divide-by-2)
    reg [2:0] count = 0;
    assign fsmclk = count[2]; 
    always @(posedge clk) count = count + 1;

endmodule
