module REG_16(Q, INR, Data, LD, CLK, CLR);

    initial Q = 0;
 
	output reg [15:0] Q;
	input [15:0] Data;
	input INR, LD, CLK, CLR;
	
	always @(posedge CLK)
	begin
		if(CLR)
			Q <= 16'b0;
		else if(LD)
			Q <= Data;
		else if(INR)
			Q <= Q + 1;
	end	
endmodule