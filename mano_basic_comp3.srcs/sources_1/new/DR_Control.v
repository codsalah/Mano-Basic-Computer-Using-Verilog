module DR_Control(Load, INR, CLR, T, D);

	input [7:0] T, D;
	output Load, INR, CLR;
	wire o;
	assign o= D[0] | D[1] | D[2] ;
	
	assign Load = T[4] & o;
	assign INR = 0;
	assign CLR = 0;

endmodule