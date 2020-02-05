`timescale 1ns / 1ps

//This is a testbench. Testbenches are used to simulate the behavior of modules in software.
//In a testbench, you list the series of inputs that you want Vivado to simulate.
//Upon simulation, Vivado creates a waveform that will showcase the change in inputs and the outputs' response.
//The waveform is also called a timing diagram, as it charts the response of the outputs over time.
//Vivado's simulation software also comes with debugging tools that allow you to step through your code,
//which you will learn later.

module tb_gate;
    reg a;      //Define the inputs of our device-under-test (DUT) as registers
    reg b;
    wire c;     //Define the output of our device-under-test (DUT) as a wire
    
    gate g(.a(a), .b(b), .c(c)); // This line instantiates the gate module. In other words, one instance of the gate module
                                 // is created and acts as a "black-box". We call this the "device/unit-under-test" (DUT).
                                 // This "black-box" functions like the gate module. We have named it g, and connected
                                 // the variable a in the testbench to the input a in gate, b to b, and c to c.
    
    initial begin                // This initial block toggles the inputs. In simulation, Vivado observes the outputs.
    a=0; b=0;                    // Unlike the always block, the initial block runs only once.
    #10                          // A delay of 10ns is used to ensure the circuit output is displayed.
    a=1; b=0;
    #10
    a=0; b=1;
    #10
    a=1; b=1;
    #10;
    end
    
endmodule
