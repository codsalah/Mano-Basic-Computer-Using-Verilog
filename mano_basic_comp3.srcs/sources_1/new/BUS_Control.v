module BUS_Control(x, D, T, I);

	input  I;
	input [7:0] T, D;

	output [7:0] x;

	wire D7n = ~D[7];
	wire A1,A2,A3,A4,A5,A6,A7,A8;
	assign A1= D[5] & T[5] ;
	assign A2= D[4] & T[4] ;
	assign A3= D[5] & T[4] ;
	assign A4= D[2]& T[5]  ;
	assign A5= (D[6] & T[6]);
	assign A6=  D7n & I & T[3];
	assign A7= ((D[0] | D[1] | D[2]) & T[4]);
	assign A8 = (D[6] & T[4]);
	
	assign x[0] = 0;
	assign x[1] = A2 | A1;                                                         //AR as source
	assign x[2] = A3 | T[0];                                                       //PC as source
	assign x[3] = A4 | A5  ;                                                       //DR as source
	assign x[4] = D[3] & T[4];                                                     //AC as source
	assign x[5] = T[2] ;                                                           //IR as source
    assign x[6] = 0 ;                                                              //TR as source
    assign x[7] = A6 | A7 | T[1] | A8;                                             //M[AR] as source

endmodule