module SC_Control (CLR, INR, T, D, I);

	input [7:0] T, D;
	input I;
	
	output CLR, INR;
	
	wire a1, a2, a3, a4, a5, o1, o2;
	wire In = ~I;
	wire r = D[7] & In & T[3];
	
	assign o1 = D[4] | D[3];
	assign a2 = o1 & T[4];
	assign a3 = D[7] & T[3];
	assign o2 = D[2] | D[1] | D[0] | D[5];
	assign a5 = o2 & T[5];
	
	assign CLR = a2 | a5 | r;  // r ???????
	assign INR = (~CLR);
	
endmodule