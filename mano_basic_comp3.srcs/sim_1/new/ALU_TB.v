module ALU_tb;
    reg AND, ADD, LDA, CMA, E;
    reg [15:0] AC, DR;
    wire [15:0] ACDATA;
    wire cout;

    ALU dut (
        .AND(AND),
        .ADD(ADD),
        .LDA(LDA),
        .CMA(CMA),
        .E(E),
        .AC(AC),
        .DR(DR),
        .cout(cout),
        .ACDATA(ACDATA)
    );

    initial begin
        AND = 1; ADD = 0; LDA = 0; CMA = 0; E = 0; AC = 16'h0001; DR = 16'h0011;
        #10;
        // Test AND operation with AC=0x1234 and DR=0x5678
        AND = 1; AC = 16'h1234; DR = 16'h5678;
        #10;
        //ADD = 1;
        // Expected result: ACDATA = 16'h0230 (because 0x1234 & 0x5678 = 0x0230)


        $finish;
    end
endmodule
