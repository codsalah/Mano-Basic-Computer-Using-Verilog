module PC_Control(CLR, INR, Load, I, E, T, D, B, AC);
	
	input I, E;
	input [7:0] T, D;
	input [15:0] B;
	input [15:0] AC;
	
	output CLR, INR, Load;
	
    wire In, AC15n, En, a1, a3, r, a6 ,a7 ,a8 ,a9 ,a10 ,o1 ,a11;
    wire a15, a16;
    
    assign In= ~I;
    assign r= In & D[7] & T[3];
    assign AC15n = ~AC[15];
    assign En=~E;
    
	assign a1=  T[1];
	assign a8 = B[3] & AC[15];      //SNA
	assign a9 = AC15n & B[4];       //SPA
	assign a10 = En & B[1];         //SZE    
    assign a15 = T[4] & D[4];
	assign a16 = D[5] & T[5]; 
    assign o1 = a8 | a9 | a10;
	assign a11 = r & o1;            // all SNA , SPA , SZE


	assign Load = a15 | a16;        // if one of these conditions is true then pc = load data
	assign INR = a1 | a11 ; // if one of these conditions is true then pc <= pc + 1
	assign CLR= r & B[0];  // CLR PC

endmodule
