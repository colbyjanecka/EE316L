`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UT Austin
// Engineer: Jerry Yang

// Module Name: updown
// Description: This HLSM is an up-down counter. When btnU (input name: up) is pushed,
//  the counter on the seven-seg increments by 1. When btnD (input name: down) is pushed,
//  the counter on the seven-seg decrements by 1. See README for HLSM diagram.
// 
// Dependencies: sevenseg.v, bcd.v, clkdiv.v, fsmdiv.v
//////////////////////////////////////////////////////////////////////////////////


module updown(
    input clk, up, down, reset,  
    output [3:0] an,
    output [6:0] seg
    );
    
    // Set up clock divider
    wire fsmclk;
    clkdiv c2(.clk(clk), .fsmclk(fsmclk));
    
    // Set up count register - note that this is not a single variable 
    // This is because we are implementing it as a load register, with nextcount being the input
    // A load register is necessary because if you just did count = count + 1 in your combinational always block,
    //   it would cause a combinatorial loop aka race conditions.
    // Writes are always to the "next" variable, reads are always from the "current" variable
    reg [15:0] count, nextcount;
    sevenseg segout(clk, count, reset, an, seg);
    
    // Set up HLSM state register - Same as FSM
    // The state register is actually just a load register with clk as its only input
    // Writes are always to the "next" variable, reads are always from the "current" variable
    reg [1:0] cs, ns; // cs = current state, ns = next state
    
    // Initialize state and output variables
    initial begin
        count = 0;
        nextcount = 0;
        cs = 0;
        ns = 0;
    end
    
    // HLSM combinational logic - Notice the use of non-blocking
    // In the sensitivity list, we now put the input variables (up, down) and register variables (state, count)
    always @(cs, count, up, down) begin
        case(cs)
        0: begin // Initial state - set counter to 0
            nextcount <= 0;
            ns <= 1; // Go to wait state
            end
        1: begin // Wait state - wait for either up or down (but not both) to be triggered
	    // Need to specify output in every state to prevent latches being inferred (which can cause unpredictable behavior)
            nextcount <= count; 
            // Note how I specify every possible case for ns - very important also to prevent inferred latches
            if(up ~^ down) ns <= 1; // ~^ is the bitwise operator for XNOR 
            else if(up) ns <= 2;
            else ns <= 3;
            end
        2: begin // Count-up state
            if(count == 16'hFFFF) nextcount <= 0; // Do the increment
            else nextcount <= count + 1;
            if(up ~^ down) ns <= 1; // ~^ is the bitwise operator for XNOR 
            else if(down) ns <= 3;
            else ns <= 2;            
            end
        3: begin // Count-down state
            if(count == 0) nextcount <= 16'hFFFF; // Rollover - Technically not necessary but here to illustrate edge case
            else nextcount <= count - 1; // Do the decrement
            if(up ~^ down) ns <= 1; // ~^ is the bitwise operator for XNOR 
            else if(down) ns <= 3;
            else ns <= 2;
            end
         default: begin
            nextcount <= 0;
            ns <= 0;
            end
        endcase
    end
    
    // HLSM driver w/ reset - Update all registers at same time
    always @(posedge fsmclk) begin
        if(reset) begin
            cs <= 0;
            count <= 0;
            end
        else begin 
            cs <= ns;
            count <= nextcount;
            end
        end
    
endmodule
