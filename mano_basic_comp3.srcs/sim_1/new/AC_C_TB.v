`timescale 1ns / 1ps

module AC_Control_tb;

    // Inputs
    reg[7:0] T;
    reg[7:0] D;
    reg[15:0] B;
    reg I;

    // Outputs
    wire AND;
    wire CMA;
    wire LDA;
    wire ADD;
    wire Load;
    wire INR;
    wire CLR;

    // Instantiate the Unit Under Test (UUT)
    AC_Control uut (
        .AND(AND),
        .CMA(CMA),
        .LDA(LDA),
        .ADD(ADD),
        .Load(Load),
        .INR(INR),
        .CLR(CLR),
        .T(T),
        .D(D),
        .B(B),
        .I(I)
    );

    initial begin
        // Initialize inputs
        T = 8'b00000000;
        D = 8'b00000000;
        B = 16'h0000;
        I = 0;
        #10;
                // Test case 4 - CMA
        T = 8'b0001000;
        D = 8'b10000000;
        B = 16'b0000000000100000;
        I = 0;
        #10;
       end 
endmodule