`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2020 04:16:20 PM
// Design Name: 
// Module Name: tb_datapath
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

module tb_datapath;

reg clk = 0;
reg load = 0;
reg sel = 0;
reg Cin;

wire[15:0] led;
reg[15:0] sw;

reg[4:0] a;
reg[4:0] b;

always @ (*) begin 
    sw[15:12] = a;
    sw[11:8] = b;
    sw[7:4] = a;
    sw[3:0] = b;
end

datapath uut (
    .clk(clk),
    .load(load),
    .sel(sel),
    .Cin(Cin),
    .sw(sw),
    .led(led)
    );

initial begin
    // test 1 using rca
    a = 4'b0000;
    b = 4'b0000;
    Cin = 0;
    sel = 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 1 using cla
    sel <= 1;
    #5
    load = 1;
    #5
    load = 0;
    #10
    
    // test 2 using rca
    a = 4'b0000;
    b = 4'b0001;
    Cin = 1;
    sel <= 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 2 using cla
    sel <= 1;
    #5
    load = 1;
    #5
    load = 0;
    #10
    
    
    // test 3 using rca
    a = 4'b0001;
    b = 4'b0101;
    Cin = 0;
    sel = 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 3 using cla
    sel = 1;
    #5
    load = 1;
    #5
    load = 0;
    #10
        
    
    // test 4 using rca
    a = 4'b0111;
    b = 4'b0111;
    Cin = 0;
    sel = 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 4 using cla
    sel = 1;
    #5
    load = 1;
    #5
    load = 0;
    #10
    
    
    // test 5 using rca
    a = 4'b1000;
    b = 4'b0111;
    Cin = 1;
    sel = 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 5 using cla
    sel = 1;
    #5
    load = 1;
    #5
    load = 0;
    #10
    
    // test 6 using rca
    a = 4'b1100;
    b = 4'b0100;
    Cin = 0;
    sel = 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 6 using cla
    sel = 1;
    #5
    load = 1;
    #5
    load = 0;
    #10
    
    
    // test 7 using rca
    a = 4'b1000;
    b = 4'b1000;
    Cin = 1;
    sel = 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 7 using cla
    sel = 1;
    #5
    load = 1;
    #5
    load = 0;
    #10
    
    
    // test 8 using rca
    a = 4'b1001;
    b = 4'b1010;
    Cin = 1;
    sel = 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 8 using cla
    sel = 1;
    #5
    load = 1;
    #5
    load = 0;
    #10
    
    
    // test 9 using rca
    a = 4'b1111;
    b = 4'b1111;
    Cin = 0;
    sel = 0;
    #5
    load = 1;
    #5
    load = 0;
    #10
    // test 9 using cla
    sel = 1;
    #5
    load = 1;
    #5
    load = 0;
    
    
end

always begin
#1 clk = ~clk;
end

endmodule

