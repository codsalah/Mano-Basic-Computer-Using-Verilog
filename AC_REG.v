module AC(Q, INR, Data, LD, CLK, CLR);

	output reg [15:0] Q;
	input [15:0] Data;
	input INR, LD, CLK, CLR;
	
	always @(posedge CLK or posedge CLR)
		begin
			if(CLR)
				Q = 16'b0;
			else if(LD)
				Q = Data;
		end	
		
endmodule