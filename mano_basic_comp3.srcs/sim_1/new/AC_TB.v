`timescale 1ns/1ps

module AC_TestBench;

    // Inputs
    reg [15:0] Data;
    reg INR, LD, CLK, CLR;
    
    // Outputs
    wire [15:0] Q;
    
    // Instantiate the module under test
    AC dut (
        .Q(Q),
        .Data(Data),
        .INR(INR),
        .LD(LD),
        .CLK(CLK),
        .CLR(CLR)
    );
    
    // Clock generation
    always #5 CLK = ~CLK;
    
    initial begin
        CLR = 0;
        LD = 0;
        CLK = 0;
        INR = 0;
        // Reset the module
        Data = 16'h1114;
        LD = 1;
        #10;
        LD = 0;
        INR = 1;
        #10;
        INR = 0;
        CLR = 1;
        /*
        // Load data into Q
        CLR = 1;
        Data = 16'h1234;
        #10;
        CLR = 0;
        
        // Increment Q
        INR = 1;
        #5;
        INR = 0;
        
        // Wait for Q to update
        #5;
 */
        
    end

endmodule
