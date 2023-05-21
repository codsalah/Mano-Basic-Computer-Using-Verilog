module RAM_Control(Store, Load, T, D, I);

	input  I;
	input [7:0] T, D;
	output Store, Load;

	wire Dn7;
	wire A1, A2, A3, A4, A5, A6, A7, A8, A9;

	assign Dn7 = ~D[7];

	assign A1 =  T[1];
	assign A2 =  T[1];
	assign A3 = D[3] & T[4];
	assign A4 = D[5] & T[4];
	assign A5 = D[6] & T[6];
	assign A6 = Dn7 & I & T[3];
	assign A7 = D[6] & T[4];
	assign A9 = D[2] | D[1] | D[0];
	assign A8 = A9 & T[4];
	assign Store = A2 | A3 |A4 | A5;
	assign Load = A1 | A6 | A7 | A8;

endmodule