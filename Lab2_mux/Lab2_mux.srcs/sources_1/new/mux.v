`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Colby Janecka
// 
// Create Date: 02/05/2020 12:15:14 PM
// Design Name: 
// Module Name: decoder
// Project Name: Lab2 
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


module mux(

    input s0, s1, up, left, right, down,
    output out

    );
    
    // Structural
    
    
    // Dataflow

        assign out = s1 ? (s0 ? down : right) : (s0 ? left : up); 
    
    // Behavioral
    

        
    
endmodule
