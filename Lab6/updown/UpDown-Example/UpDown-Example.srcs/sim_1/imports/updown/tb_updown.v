`timescale 1ns / 1ps

module tb_updown(

    );
    reg clk = 0;
    reg up  = 0;
    reg down = 0;
    reg reset = 0;
    wire [3:0] an;
    wire [6:0] seg;
    updown uut(clk, up, down, reset, an, seg); 
    
    always #5 clk = ~clk;
    
    initial begin
    reset = 1;
    #10 reset = 0; up = 1;
    #500 up = 0; down = 1;
    #500 up = 1; reset = 1;
    #100 reset = 0; up = 0; down = 0;
    end
endmodule
