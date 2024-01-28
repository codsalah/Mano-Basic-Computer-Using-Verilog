module controlUnit ( CLK, T, cout, AC, IR,
                     CLRAR, INRAR, LoadAR,
                     CLRPC, INRPC, LoadPC,
                     CLRAC, INRAC, LoadAC,
                     CLRDR, INRDR, LoadDR,
                     CLRIR, INRIR, LoadIR,
                     WRITE, READ,
                     CMA, LDA, ADD, AND,
                     CLRSC, INRSC,
                     E, X,I,
                     D);

    input CLK, cout;
	input [15:0] AC, IR;
	input [7:0] T, D;
	output CLRAR, INRAR, LoadAR,
           CLRPC, INRPC, LoadPC,
           CLRAC, INRAC, LoadAC,
           CLRDR, INRDR, LoadDR,
           CLRIR, INRIR, LoadIR,
           WRITE, READ,
           CMA, LDA, ADD, AND,
           CLRSC, INRSC,
           E,I;
	  
    output [7:0] X;
    
    wire [7:0] D;
	wire [11:0] B = IR [11:0];
	wire [2:0] OPCODE = IR [14:12];
	wire I = IR[15];
	wire r, enable;
	wire In, En, o3, a1, a2, a5, a6, a6n;
	reg moshtarak; //?????/* A wire that store EN or COUT and work as input of E flipflop */
	
	assign In = ~I;
	assign 	r =	D[7] & T[3] &In;

    /////////////////--DECODER--//////////////////////
	Decoder3to8 dec(OPCODE, D[7:0]);	//(I, O);
	
	/////////////////--AR CONTROL--///////////////////
	AR_Control ar(LoadAR, INRAR, T, D, I);
	
	/////////////////--PC CONTROL--///////////////////
	PC_Control pc(CLRPC, INRPC, LoadPC,I, E, T, D, B, AC);  
	
	/////////////////--DR CONTROL--///////////////////
	DR_Control dr(LoadDR, INRDR, CLRDR, T, D);  //module DR_Control(Load, INR, CLR, T, D);
	
	/////////////////--AC CONTROL--///////////////////
	AC_Control acc(AND, CMA, LDA, ADD, LoadAC, INRAC, CLRAC, T, D, B, I); 
	 
	/////////////////--IR CONTROL--///////////////////
	IR_Control ir(D, T, CLRIR, INRIR, LoadIR);
	
	////////////////--RAM CONTROL--///////////////////
	RAM_Control ram(WRITE, READ, T, D, I);
	
    ////////////////--SEQUENCE COUNTER CONTROL--///////////////////
	SC_Control sc(CLRSC, INRSC, T, D, I);	// (CLR, INR, T, D, I);

	////////////////--BUS CONTROL--///////////////////
	BUS_Control bus(X, D, T, I);    /* input I T, D output x;*/
	
	
	
	
	
endmodule