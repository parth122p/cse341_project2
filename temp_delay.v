`timescale 1ns/1ns 

module testbench();

    reg [31:0] A, B; // test inputs
    reg SUB;
    wire [31:0] ans;
    wire cout, V;
    
    addsub32 adder(A, B, SUB, ans, cout, V);

    initial begin
        $dumpfile("temp_delay.vcd");   // VCD file name
        $dumpvars(0, testbench);       // dump everything in this testbench
    end

    initial begin

        $monitor("%0t A=%08h, B=%08h, SUB=%b, ans=%08h, cout=%b, V=%b", $time, A, B, SUB, ans, cout, V);

        // #1
        A = 32'h00000000; B = 32'h00000000; SUB = 0; // previous inputs
        #10;                           

        A = 32'h7B5E4C6A; B = 32'h1CCDA1E4; SUB = 0; // operation
        #100;   

        // #2
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; SUB = 0; // new previous inputs (all 1s)
        #10;                                     

        A = 32'h7B5E4C6A; B = 32'h1CCDA1E4; SUB = 0; // same operation
        #100;                      

        $finish;
    end

endmodule
