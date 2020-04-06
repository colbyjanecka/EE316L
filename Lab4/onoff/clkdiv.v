`timescale 1ns / 1ps

// This module implements a clock divider by counting the number of elapsed clock cycles and toggling an output bit
// when a specifc number of cycles is reached.
// For example, if you wanted a 100Hz clock from a 100MHz clock, you would need to wait 1 million cycles between
// each rising edge, or 500,000 cycles between each toggling of the output bit.
module clkdiv(
    input clk,
    output slow_clk
    );
    
    reg [31:0] count = 0; // Initialize clock cycle counter to 0
    reg clk_out = 0; // Buffer for output clock
    assign slow_clk = clk_out; // Tie buffer to output
    
    // Note that the sensitivity list now contains "posedge clk"
    // This means that the always block will only run when the clk has a rising edge (transitions from 0 to 1)
    always @(posedge clk) begin
        // Increment cycle counter
        count = count + 1;
        
        // Check if target number of cycles has elapsed for 100Hz slow clock - in this case, 500,000 cycles
        if(count == 4) begin
            clk_out = ~clk_out; // Toggle the output bit that represents the clock
            count = 0; // Reset the cycle counter to zero
        end
    end 
endmodule
