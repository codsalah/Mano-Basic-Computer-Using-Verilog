module AR_Control(LD, INR, T, D, I, CLR);

	input  I;
	input [7:0] T, D;
	output LD, INR, CLR;
	
	wire D7n = ~D[7];
	wire a1, a2, a3;
	
	assign a1 = D7n & I & T[3];
	assign a2 = T[2] ;
	assign a3 =  T[0];
	assign INR = D[5] & T[4];
	assign LD = a1 | a2 | a3;
	assign CLR = 0;  //;w;
	
endmodule