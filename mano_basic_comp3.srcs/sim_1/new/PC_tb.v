module PC_Test;

	// Inputs
	reg [11:0] Data;
	reg INR, Load, CLK, CLR;

	// Outputs
	wire [11:0] Q;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.Q(Q), 
		.Data(Data), 
		.INR(INR), 
		.Load(Load), 
		.CLK(CLK), 
		.CLR(CLR)
	);

	initial begin
		// Initialize inputs
		Data = 12'h112;
		INR = 0;
		Load = 1;
		CLK = 1;
		CLR = 0;

		// Wait for some time before applying any input
		#10 

		// test case 1 - check if data is loaded correctly
		Data = 12'h123;
		Load = 0;
				CLK = 1;

		#10;
		if (Q !== 12'h123) $display("Test case 1 failed");

		// test case 2 - check if INR works correctly
		Data = 12'h0;
		INR = 1;
		CLK = 1;
		#10;
		if (Q !== 12'h1) $display("Test case 2 failed");

		// test case 3 - check if CLR works correctly
		Data = 12'h999;
		INR = 0;
		CLR = 1;
		#10;
		if (Q !== 12'h0) $display("Test case 3 failed");

		
		$display("All testcases finished successfully");
		$finish;
	end
	
endmodule