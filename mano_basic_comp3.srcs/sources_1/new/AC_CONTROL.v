module AC_Control(AND, CMA, LDA, ADD, Load, INR, CLR, T, D, B, I);

	input[7:0] T, D;
	input[15:0] B;
	input I;

	output Load, INR, CLR;
	
	wire In = ~I;
	wire r = D[7] & In & T[3];
	output AND, CMA, LDA, ADD;
	
	assign AND = D[0] & T[5];  
	assign ADD = T[5] & D[1];
	assign LDA = T[5] & D[2]; //  LD
	assign CMA = B[9] & r;
	
	assign INR = B[5] & r;
	assign Load =( AND | ADD | LDA  | CMA );  
    assign CLR = r & B[11]; 
endmodule