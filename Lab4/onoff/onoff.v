`timescale 1ns / 1ps

// This module implements a Moore FSM that turns an LED on and off. One button turns the LED on, the other off.
// The module instantiates clkdiv.v, a clock divider that will run at 100Hz on-board.

module onoff(
    input clk, // clk signal - periodic clock signal that drives the FSM
    input on,  // On button (btnR) - turns the LED on
    input off, // Off button (btnL) - turns the LED off
    output reg led // LED - Turns on and off. Note that led is a reg, not a wire.
                   // This is because we are only updating it in always blocks and nowhere else,
                   // whereas before, we were updating it from gates or boolean expressions.
    );
    
    wire slow_clk; // Create a wire for the slow_clk that will be generated from the clock divider
    clkdiv c1(clk, slow_clk); // Instantiate the clock divider module
    
    // Create variables to hold current and next state
    reg current_state = 0;
    reg next_state = 0;
    
    // No need to create an led_buf here because led is a reg type.
    // If led were the default wire type, we would need to include the led_buf.
    // reg led_buf = 0;
    // assign led = led_buf;
    
    // Combinational logic portion of FSM - calculate outputs based on inputs
    // Note the empty sensitivity list - all combinational always blocks will have an empty sensitivity list.
    always @(*) begin
        case(current_state) // Using the current state, determine the output and next state
        0: begin // State 0
            led = 0; // Set output - in this case, turn LED off
            if(on) next_state = 1; // If the ON button is pushed, set next state to state 1 where LED is on
            else next_state = 0; // Else, stay in state 0
            end 
        1: begin // State 1
            led = 1; // Set output - in this case, turn LED on
            if(off) next_state = 0; // If the OFF button is pushed, set next state to 0 where LED is off
            else next_state = 1; // Else, stat in state 1
            end 
        default: begin // Default state, in case not all conditions are covered by the above cases
            led = 0;
            next_state = 0;
            end
        endcase
    
    end
    
    // Sequential logic portion of FSM - update registers with new state
    // Note that "posedge slow_clk" is now in the sensitivity list of the always block. This means tha the always block
    // will only run on the rising edge of the divided clock signal - 100Hz.
    always @(posedge slow_clk) begin
        current_state <= next_state;
    end
    
endmodule
