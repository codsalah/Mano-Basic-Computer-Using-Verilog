module AC_Control(AND, COM, SHR, SHL,INPT, DR, ADD, LD, INR, CLR, T, D, B, I);

	output AND, SHR, SHL , COM, INPT, DR, ADD, LD, INR, CLR;
	input[7:0] T, D;
	input[15:0] B;
	input I;
	
	wire In;
	wire r, p;
	assign In = ~I;

	assign p = D[7] & I & T[3];
	assign r = D[7] & In & T[3];
	
	assign AND = D[0] & T[5];  
	assign ADD = T[5] & D[1];
	assign DR = T[5] & D[2];
	assign COM = B[9] & r;
	assign SHL = B[6] & r;
	assign SHR = B[7] & r;
	assign INR = B[5] & r;
	assign INPT = B[11] & p;
	
	assign LD =( AND | ADD | DR | SHL | SHR | COM | INPT );  
    assign CLR = r & B[11]; 
endmodule