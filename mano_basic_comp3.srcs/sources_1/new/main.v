
`define	BLE	16'b0

 module Mainn(input CLK,
     /*
     , output E,
     output reg[15:0] AC,DR
     */
     output wire [15:0] DR, AC, IR, MEM,
     output wire [11:0] PC, AR,
     output wire [7:0] T ,D,
     output wire [2:0] outsc,
     output wire [15:0] Data,
     output wire [2:0] SSS,
     output wire [7:0] X ,
     output wire I,
     output wire E
     );//????????????????????
     
	wire   INRAR, LoadAR, CLRAR,
	       INRPC, LoadPC, CLRPC,
	       INRDR, LoadDR, CLRDR,
	       INRAC, LoadAC, CLRAC,
	       INRIR, LoadIR, CLRIR,
	       WRITE, READ,
	       CIR, CIL, CMA, LDA, INPT, ADD, AND,
	       CLRSC, S;
	//////////////////////////
	wire INRSC;
	/////////////////////////
	wire  cout; //?
	assign E =cout ; 
	/////////////////////////
	wire [15:0] m1, m2, m3, m4, m5 ,m7;         // (reg) input wires of the bus selection 
	
	//RAM-------------------------------------
	RAM ramat (CLK, READ, AR, WRITE, Data, MEM );   //module RAM(CLK,read,AR,write,INDATA,OUTDATA );
    assign m7 = MEM;
                                                                                                    
	// AR REG ---------------------------------                                                   
	REG_11 AR_reg (AR, INRAR, Data[11:0], LoadAR, CLK, 1'b0 );                    //instatiating AR reg.|PC(Q, INR, Data, Load, CLK, CLR);
	assign m1 = {4'b0000, AR}; 
	
	// PC REG ----------------------------------
	REG_11 pc_reg(PC , INRPC, Data[11:0], LoadPC, CLK, CLRPC); 
	assign m2 = {4'b0000, PC};
	
	// DR ERG ---------------------------------
	REG_16 dr_reg(DR, INRDR, Data, LoadDR, CLK, CLRDR);                // REG_16(Q, INR, Data, LD, CLK, CLR);
	assign m3=DR;
	
	
	// ALU & AC REG ---------------------------
	wire [15:0] ACDATA;                                                   ///ACDATA is INPUT OF AC reg. coming from ALU as an output not common bus
	ALU Ac_ArthALU(AND, ADD, LDA, CMA,E ,AC, DR, cout , ACDATA);       //ALU(AND,ADD, LDA, CMA,E,AC, DR,cout , ACDATA);
	REG_16 ac_reg (AC, INRAC, ACDATA, LoadAC, CLK, CLRAC);	              //AC(Q, INR, Data, LD, CLK, CLR);
	assign m4 = AC;	
	
	
	// IR & IR control -------------------------------
	//reg[15:0]IR ;	                             ////IR ?????output ?????????????
	REG_16 ir_reg(IR, INRIR, Data, LoadIR, CLK, CLRIR);                // DR_reg(LD,CLK,INR,CLR,inDR,DR );
    
    //assign IR = LoadIR ? Data :IR; // IR  IS THE OUTPUT OF THE IR REG                     
	   
	assign m5 = IR;                              /////???????????????? I THINK m5= IR 
	
    // CONTROL UNIT ------------------------------------
    controlUnit CTRLunit( CLK, T, cout, AC, IR,
                          CLRAR, INRAR, LoadAR,
                          CLRPC, INRPC, LoadPC,
                          CLRAC, INRAC, LoadAC,
                          CLRDR, INRDR, LoadDR,
                          CLRIR, INRIR, LoadIR,
                          WRITE, READ,
                          CMA, LDA, ADD, AND,
                          CLRSC, INRSC,
                          E, X,I,
                          D);  //instatiating   control unit 

    //BUS SYSTEM --------------------------------------- 
	Encoder_8x3 SEL_ENC(SSS,X);	                                        //instatiating bus control & connecting x (as an input)from encoder to x (as an output to)control unit
	MUX BUS_SELECTION (16'bxxxxxxxxxxxxxxxx, m1, m2, m3, m4, m5, 16'b0000000000000000, m7, SSS, Data);  // MUX(d0,d1,d2,d3,d4,d5,d6,d7,sel,out);
	
	// Sequence COUNTER ---------------------------------------------------------
	                                        // INCREMENT SC
	assign INRSC = ~CLRSC;                             // CLRsc is an output from control unit (control sc)
	SequenceCounter sc (CLRSC, INRSC , CLK, outsc);    //  module SequenceCounter(CLR, INC, CLK, out); 
	Decoder3to8 dec(outsc, T);                   
	 
				

                                               
endmodule