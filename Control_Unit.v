

module controlUnit(T,AC, DR,cout,  CLK, IR, 
CLRAC, INRAC, LoadAC, SHR, SHL ,COM, INPT,DR1, ADD, AND,
 CLRAR, INRAR, LoadAR, CLRPC, INRPC, LoadPC, STR, LoadRAM,
 INRDR, LoadDR, CLRSC, S, LoadIR, LoadTR, E, X);

    input CLK, cout;
	input [15:0] IR,AC,DR;
	input [6:0] T;
	output  CLRAC, INRAC, LoadAC, SHR, SHL ,COM, INPT,DR1, ADD, AND, 
	 CLRAR, INRAR, LoadAR, CLRPC, INRPC, LoadPC, STR, LoadRAM, INRDR,
	 LoadDR, CLRSC, S, LoadIR, LoadTR, E;
	 
	output [7:0] X;

	wire [7:0] D;
	wire[15:0] B;
	wire [2:0] SS;
	wire  r, enable; 
	wire In,En, o3,  a1,a2,a3,a4,a5,a6,a6n;
	wire I; 
	reg moshtarak; /*what is moshtarak and I input or output
    assign IR[15]=I;*/  

	AC_Control ac(AND, SHR, SHL, COM, INPT, DR1, ADD, LoadAC, INRAC, CLRAC, T, D, B, I);  
	AR_Control ar(LoadAR, CLRAR, INRAR, T, D, I);
	PC_Control pc(CLRPC, INRPC, LoadPC, I, T, D, DR, AC, B, E);  
	RAM_Control ram(STR, LoadRAM, T, D, I);
	DR_Control dr(LoadDR, INRDR, T, D); 
	SC_Control sc(CLRSC, T, D);	
	
	assign B[0]=IR[0]; 
	assign B[1]=IR[1];
	assign B[2]=IR[2];
	assign B[3]=IR[3];
	assign B[4]=IR[4];
	assign B[5]=IR[5];
	assign B[6]=IR[6];
	assign B[7]=IR[7];
	assign B[8]=IR[8];
	assign B[9]=IR[9];
	assign B[10]=IR[10];
	assign B[11]=IR[11]; 
	assign B[15]=IR[15]; 
	// ---------------------- //
	assign SS[0]=IR[12];
	assign SS[1]=IR[13];
	assign SS[2]=IR[14];
	
	Decoder3to8 dec(SS, D[7:0]);	
	BUS_Control bus(X, D, T, I);
	
	
	assign In=~I;
	assign 	r=	D[7] & T[3] &In;
	
	
	assign LoadIR= T[1]; 
	
	assign  enable =  T[2];
	D_flipflop dffI (I, B[15], CLK, enable);  
	
		
	assign a1 = T[5] & D[1];
	assign a2 = B[8] & r;		   
	assign a3 = B[6] & r;
	assign a4 = B[7] & r;
	assign o3 = a1 | a2 | a3 | a4;
	assign a5 = B[10] & r; 
	
	assign En=~E;

	initial begin
		if(a1)
			assign moshtarak = cout;
		if(a3) 
			assign moshtarak=AC[15];
		if(a4)
			assign moshtarak=AC[0];
		if (a2)
		   assign moshtarak= En;
	end

	
	//buf B1(moshtarak, cout,a6);
	//buf B2(moshtarak, AC[15], a8);
	//buf B3(moshtarak, AC[0], a9);	
	
	//buf(moshtarak, En , a2);                                   //????????
	D_ff_reset dffE(E, cout, CLK, o3,a5 );
	

	
	
	assign a6=B[0] & r; 
	assign a6n=~a6;
 
	D_ff_reset dffS(S, a6n, CLK,, a6);
	
endmodule