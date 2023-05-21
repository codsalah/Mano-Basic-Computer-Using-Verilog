module AR_Control(LD, CLR, INR, T, D, I);

	input  I;
	input [7:0] T, D;
	output LD, CLR, INR;
	
	wire D7n, Rn;
	wire a1, a2, a3;
	
	assign D7n = ~D[7];
	
	assign a1 = D7n & I & T[3];
	assign a2 = T[2] & Rn;
	assign a3 = Rn & T[0];
	assign CLR = T[0];
	assign INR = D[5] & T[4];
	assign LD = a1 | a2 | a3;
	
endmodule