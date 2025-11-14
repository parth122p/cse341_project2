`timescale 1ns/1ns // sets the timescale to 1ns

/* module for the 1 bit full adder, got it from the verilog_2 lecture notes!! */
module fulladder(a, b, cin, sum, cout); // FIXED: removed extra comma
    
    input a, b, cin; // input ports: a, b are the bits we wanna add; cin = carry in
    output sum, cout; // output ports: sum = sum (duh); cout = carry out
    wire w1, w2, w3, w4; // defines the wires
    
    xor // defines the XOR gates!!!!
        g1(w1, a, b), // assigns wire 1 to a XOR b
        g2(sum, w1, cin); // FIXED: removed extra comma, fixed variable name
    
    and // defines the AND gates (carries if both vars = 1)
        g3(w2, cin, b), // wire 2 connects cin AND b
        g4(w3, cin, a), // cin AND a
        g5(w4, a, b); // a AND b
        
    or // OR gate (combines all the carry terms for the carry out)
        g6(cout, w2, w3, w4); // connects cout to wire 2 OR 3 OR 4

endmodule

/* module for the 32 add/sub */
module addsub32(A, B, SUB, ans, cout, V); // A and B  are the 2 32 bit numbers we wanna use; SUB = 1 if we wanna subtract, 0 if we wanna add; ans = the result; V = overflow flag; =1 when theres a signed overflow, =0 if theres nothing wrong
    input [31:0] A, B; 
    input SUB; 
    output [31:0] ans; // FIXED: changed to match your variable name
    output cout, V;
    
    wire [31:0] Bx; // B after we XOR with sub
    wire [32:0] C; // carry
    
    /* xor each bit of B with SUB to get the compliment
    when SUB = 0 (addition): Bx = B
    when SUB = 1 (subtraction): Bx = -B */
    xor x0(Bx[0], B[0], SUB);
    xor x1(Bx[1], B[1], SUB);
    xor x2(Bx[2], B[2], SUB);
    xor x3(Bx[3], B[3], SUB);
    xor x4(Bx[4], B[4], SUB);
    xor x5(Bx[5], B[5], SUB);
    xor x6(Bx[6], B[6], SUB);
    xor x7(Bx[7], B[7], SUB);
    xor x8(Bx[8], B[8], SUB);
    xor x9(Bx[9], B[9], SUB);
    xor x10(Bx[10], B[10], SUB);
    xor x11(Bx[11], B[11], SUB);
    xor x12(Bx[12], B[12], SUB);
    xor x13(Bx[13], B[13], SUB);
    xor x14(Bx[14], B[14], SUB);
    xor x15(Bx[15], B[15], SUB);
    xor x16(Bx[16], B[16], SUB);
    xor x17(Bx[17], B[17], SUB);
    xor x18(Bx[18], B[18], SUB);
    xor x19(Bx[19], B[19], SUB);
    xor x20(Bx[20], B[20], SUB);
    xor x21(Bx[21], B[21], SUB);
    xor x22(Bx[22], B[22], SUB);
    xor x23(Bx[23], B[23], SUB);
    xor x24(Bx[24], B[24], SUB);
    xor x25(Bx[25], B[25], SUB);
    xor x26(Bx[26], B[26], SUB);
    xor x27(Bx[27], B[27], SUB);
    xor x28(Bx[28], B[28], SUB);
    xor x29(Bx[29], B[29], SUB);
    xor x30(Bx[30], B[30], SUB);
    xor x31(Bx[31], B[31], SUB); // never done something more tedious
    
    
    assign C[0] = SUB; // assign the carry to whatever sub is; if its 0 carry on the addition like normally, if its 1 add 1 for twos compliment
    
    /* connects 32 full adders, the carries ripple from one to the next
    takes a bit from A and one from B + carry in, adds the bits to the ans  and carry out */
    fulladder fa0(A[0], Bx[0], C[0], ans[0], C[1]); // start at the first bit (LSB)
    fulladder fa1(A[1], Bx[1], C[1], ans[1], C[2]);
    fulladder fa2(A[2], Bx[2], C[2], ans[2], C[3]);
    fulladder fa3(A[3], Bx[3], C[3], ans[3], C[4]);
    fulladder fa4(A[4], Bx[4], C[4], ans[4], C[5]);
    fulladder fa5(A[5], Bx[5], C[5], ans[5], C[6]);
    fulladder fa6(A[6], Bx[6], C[6], ans[6], C[7]);
    fulladder fa7(A[7], Bx[7], C[7], ans[7], C[8]);
    fulladder fa8(A[8], Bx[8], C[8], ans[8], C[9]);
    fulladder fa9(A[9], Bx[9], C[9], ans[9], C[10]);
    fulladder fa10(A[10], Bx[10], C[10], ans[10], C[11]);
    fulladder fa11(A[11], Bx[11], C[11], ans[11], C[12]);
    fulladder fa12(A[12], Bx[12], C[12], ans[12], C[13]);
    fulladder fa13(A[13], Bx[13], C[13], ans[13], C[14]);
    fulladder fa14(A[14], Bx[14], C[14], ans[14], C[15]);
    fulladder fa15(A[15], Bx[15], C[15], ans[15], C[16]);
    fulladder fa16(A[16], Bx[16], C[16], ans[16], C[17]);
    fulladder fa17(A[17], Bx[17], C[17], ans[17], C[18]);
    fulladder fa18(A[18], Bx[18], C[18], ans[18], C[19]);
    fulladder fa19(A[19], Bx[19], C[19], ans[19], C[20]);
    fulladder fa20(A[20], Bx[20], C[20], ans[20], C[21]);
    fulladder fa21(A[21], Bx[21], C[21], ans[21], C[22]);
    fulladder fa22(A[22], Bx[22], C[22], ans[22], C[23]);
    fulladder fa23(A[23], Bx[23], C[23], ans[23], C[24]);
    fulladder fa24(A[24], Bx[24], C[24], ans[24], C[25]);
    fulladder fa25(A[25], Bx[25], C[25], ans[25], C[26]);
    fulladder fa26(A[26], Bx[26], C[26], ans[26], C[27]);
    fulladder fa27(A[27], Bx[27], C[27], ans[27], C[28]);
    fulladder fa28(A[28], Bx[28], C[28], ans[28], C[29]);
    fulladder fa29(A[29], Bx[29], C[29], ans[29], C[30]);
    fulladder fa30(A[30], Bx[30], C[30], ans[30], C[31]);
    fulladder fa31(A[31], Bx[31], C[31], ans[31], C[32]); // last bit (MSB)
    
    
    assign cout = C[32]; // get the final carry out from the last full adder
    assign V = C[31] ^ C[32];  // xor the carry in and carry out of bit 31; V = 1 when the carry in does not equal the carry out
endmodule

/* test bench module */
module testbench();

    reg [31:0] A, B; // test inputs
    reg SUB;
    wire [31:0] ans;
    wire cout, V;
    
    addsub32 adder(A, B, SUB, ans, cout, V);
    
    initial begin

        $monitor("%0t A=%h, B=%h, SUB=%b, ans=%h, cout=%b, V=%b", $time, A, B, SUB, ans, cout, V); // print whenever a value changes
        $display("%0t A=%h, B=%h, SUB=%b, ans=%h, cout=%b, V=%b", $time, A, B, SUB, ans, cout, V); // print the inital values
        
        /* Addition tests */
        #10 A=32'h00000021; B=32'h00000022; SUB=0;  // 33 + 34 (simply adds 2 numbers)
        #10 A=32'hF1E3B1BF; B=32'h00FBDBFD; SUB=0;  // -236736065 + 16505853 (adds a neg and pos number)  
        #10 A=32'hBBBBBBBB; B=32'h44444444; SUB=0;  // 1011 + 0100 (should make all the bits 1)
        #10 A=32'h00010000; B=32'h0000FFFF; SUB=0;  // 65536 + 65535 (forces the carry to go thru only the upper 16 bits)
        #10 A=32'h3C89EEBD; B=32'h37FFDF35; SUB=0;  // 1015672509 + 939515701 (two random numbers)

        
        // 5 Subtraction tests  
        #10 A=32'h4D72BA7C; B=32'hD0991D68; SUB=1;  // 1299364476 - (-795271832) (subtract a pos nnumber by a neg number)
        #10 A=32'hFFFFFFFF; B=32'h13B72214; SUB=1;  // -1 - 330768916  (subtracts -1 by a random pos number)
        #10 A=32'hC5834557; B=32'hD08052AB; SUB=1;  // -981252777  - (-796896597) (subtracts 2 random negative numbers)
        #10 A=32'h66CDA371; B=32'h1B786DEB; SUB=1;  //  1724752753 - 460877291 (simple subtract)
        #10 A=32'h336FB7E5; B=32'h336FB7E5; SUB=1;  // 862959589 - 862959589 (subtracts 2 of the same number [should be 0])
        
        // 5 Overflow cases
        #10 A=32'h7FFFFFFF; B=32'h00000001; SUB=0;  // max + 1 (overflows thru all the adders)
        #10 A=32'h784EBA56; B=32'h7B5140F2; SUB=0;  // 2018425430 + 2068922610 (adds 2 very large numbers that exceed the max)
        #10 A=32'h84AEBF0E; B=32'h87B145AA; SUB=0;  // -2068922610 + (-2018425430) (same as above but with neg numbers)
        #10 A=32'h4242D46B; B=32'hC242D46B; SUB=1;  // 1,111,676,011 - (-1,035,807,637) 
        #10 A=32'h80000000; B=32'h00000001; SUB=1;  // min - 1
        
        // 5 No-overflow cases
        #10 A=32'h6E3A9F1B; B=32'h11C560E4; SUB=0;  // 1849876251  + 298553572 
        #10 A=32'h7FFFFFFF; B=32'h80000000; SUB=1;  // 1028546410 + 1118937237 (adds to the max)
        #10 A=32'h6FABCDE1; B=32'h12345678; SUB=1;  // 1873530337 - 305419896 
        #10 A=32'h9F1E2D3C; B=32'h8A7B6C5D; SUB=1;  // -1625412292 - (-1971622819)
        #10 A=32'h56789ABC; B=32'hFEDCBA98; SUB=1;  // 1450744508 - (-19088744)
        
        #10; 
        $display("%0t A=%h, B=%h, SUB=%b, ans=%h, cout=%b, V=%b", $time, A, B, SUB, ans, cout, V);
        #10 $finish;
    end
endmodule
