`timescale 1ns/1ns

module testbench5000();
    reg [31:0] A, B;
    reg SUB;
    wire [31:0] ans;
    wire cout, V;
    integer i, delay;
    time apply, change; // apply = time it takes for the inputs to apply; change = time the output last changed
    
    addsub32 dut(A, B, SUB, ans, cout, V);
    
    always @(ans or V) begin // tracks the last output change
        change = $time;
    end

    initial begin
        $dumpfile("test5000.vcd");
        $dumpvars(0, testbench5000);
    end

    initial begin
        
        A = 32'hxxxxxxxx;
        B = 32'hxxxxxxxx;
        SUB = 1'bx;

        delay = $fopen("5000_Delays.txt", "w");
        #1
        
        // Run 5000 random tests
        for (i = 0; i < 5000; i = i + 1) begin
            #10;
            A = $random;
            B = $random; 
            SUB = $random % 2;
            apply = $time;
            #70; // gives it time to set

            $fwrite(delay, "%0d\n", ((change - apply) + 1)); // calculate the delay just like how i did it by hand on vapor view
        end

        $fclose(delay);
        $finish;
    end
endmodule