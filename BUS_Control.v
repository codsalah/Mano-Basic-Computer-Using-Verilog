module BUS_Control(x, D, T, I);

	input  I;
	input [7:0] T, D;
	output [7:0] x;
	
	wire o3;
	wire D7n, Rn;
	wire a1, a2, a3, a9, a10;
	
	assign D7n = ~D[7];	
	
	assign a1 = D[4] & T[4];
	assign a2 = D[5] & T[5];
	assign a3 = D[5] & T[4];
	assign x[1] = a1 | a2;         //AR as source
	assign x[2] = a3 | T[0];       //PC as source
	assign x[3] = T[6] & D[6];     //DR as source
	assign x[4] = D[3] & T[4];     //AC as source
	assign x[5] = T[2] ;           //IR as source
	assign a9 = D7n & I & T[3];    //for indirect
	assign o3 = D[0] | D[1] | D[2];
	assign a10 = o3 & T[4];
	assign x[7] = a9 | a10;   // M[AR] as source 	
	
endmodule
