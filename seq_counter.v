module SC_Control(CLR, T, D, R);

	output CLR;
	input [7:0] T, D, R;
	
	wire a1, a2, a3, a4, a5, o1, o2;
	
	assign a1 = R & T[2];
	assign o1 = D[4] | D[3];
	assign a2 = o1 & T[4];
	assign a3 = D[7] & T[3];
	assign a4 = D[6] & T[6] ;
	assign o2 = D[2] | D[1] | D[0] | D[5];
	assign a5 = o2 & T[5];
	assign CLR = a1 | a2 | a3 | a4 | a5;
	
endmodule