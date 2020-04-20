`timescale 1ns / 1ps

module adder(
 input a, b, Cin,
 output S, Cout);
  
assign S = (a ^ b ^ Cin);
assign Cout = ((a & b) | (a & Cin) | (b & Cin));

    
endmodule