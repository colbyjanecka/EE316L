`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 04:28:41 PM
// Design Name: 
// Module Name: mult
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


module mult(
 input clk,                 // Use input clock - no need for clock divider
 input start,               // Center button
 input [7:0] sw,            // Multiplicands - sw[7:4], sw[3:0]
 output stop,               // Stop signal - LED[15]
 output reg [7:0] product   // Product - LED[7:0]
 ); 
    
    //define accumulator
     reg [8:0] ACC;
     
     reg [7:0] temp;
     
     wire [4:0] ADD_res;
     
     reg stop_reg = 0;
     assign stop = stop_reg;

     // shift counter
     reg [2:0] count;  
     
     // Set up HLSM state register - Same as FSM
     // The state register is actually just a load register with clk as its only input
     // Writes are always to the "next" variable, reads are always from the "current" variable
     reg [2:0] cs, ns; // cs = current state, ns = next state
     
     // Initialize state and output variables
     initial begin
         ACC = 0;
         cs = 0;
         ns = 0;
         count = 0;
     end
 
     always @(cs) begin
        case(cs)
        0:  begin // IDLE state. STOP = 1
                stop_reg = 1;
                if(start == 1'b1)
                begin
                    ns <= 1;
                end
                else begin
                    ns <= 0;
                end
            end
        1:  begin // INIT state. LOAD_cmd = 1
                stop_reg = 0;
                ACC[8:4] <= 5'b00000;
                ACC[3:0] <= sw[3:0] ;
                ns <= 2;
            end
        2:  begin // TEST state
                if (ACC[0] == 0) ns <= 4;
                else ns <= 3;
            end
        3:  begin // ADD state. ADD_cmd = 1;
                temp [7:4] = sw[7:4];
                temp [3:0] = 4'b0000;
                ACC = ACC + temp; 
                ns <= 4;
            end
        4:  begin // SHIFT state. SHIFT_cmd = 1 and count = count + 1
                ACC = ACC >> 1;
                count = count + 1;
                if(count == 4) begin
                    ns <= 0;
                end
                else ns <= 2;
            end
        default: begin
            ns <= 0;
                 end
        endcase
        product <= ACC[7:0];
    end
            
            
    always @(posedge clk) begin
        cs <= ns;
    end
 
endmodule
