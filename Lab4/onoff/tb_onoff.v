`timescale 1ns / 1ps
module tb_onoff(

    );
    
    // Same as before, set up your inputs and outputs and instantiate module under test
    reg clk = 0;
    reg on, off;
    wire led;
    onoff uut (clk, on, off, led);
    
    // Simulate a clock by toggling a clk variable every 5 ns
    always #5 clk = ~clk ;
    
    // Same as before, list your testcases
    initial begin
    on = 0; off = 0; 
    #100
    on = 1; off = 0;
    #100
    on = 0; off = 0; 
    #100
    on = 0; off = 1;
    #100
    on = 0; off = 0; 
    
    end
     
endmodule
