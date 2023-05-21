`include "Control_Unit.v"
`include "PC_REG.v"
`include "DR_REG.v"	
`include "AC_REG.v"
`include "seq_counter.v"  
`include "Encoder8x3.v" 
`include "AC_adderNlogic.v"	
`include "Mux8_x3.v"
`define	BLE	16'b0

module Mainn(input CLK,output reg[15:0] mem9);

                                                                                                /*wire[15:0] write_data, read_data; 
                                                                                                reg [4095*16:0] mem2;
                                                                                                
                                                                                                reg[15:0] mem[0:4095];
                                                                                                reg [15:0] r;
                                                                                              */
                                                                                                /*initial begin
                                                                                                    mem[0] = 16'b0010000000000111; 
                                                                                                    mem[1] = 16'b0001000000001000;
                                                                                                    mem[2] = 16'b0011000000001001;
                                                                                                    mem[7] = 16'b0000000000000001;
                                                                                                    mem[8] = 16'b0000000000000010;
                                                                                                    mem[9] = 16'b0000000000000000;
                                                                                                end	 */
                                                                                                
                                                                                             // wire[0:15] mem1[0:4095];
                                                                                             
                                                                                            // assign mem[1]=4'h1008;
                                                                                              
                                                                                                //input [15:0]mem1[0:4095];
                                                                                                 // wire [0:15] mem1[0:4095];
                                                                                                //output [0:15]memory;		
                                                                                                //  reg [0:15]memory;
                                                                                                //input [4095:0]mem1;
                                                                                                //output wire [15:0]m[4095:0];	
                                                                                                 //output reg d-out[4095:0];
                                                                                                //wire [0:15] mem[0:4095];	
                                                                                                
                                                                                                //integer i,j;
                                                                                                /*initial
                                                                                                    begin
                                                                                                for (i=0;i<4095;i=i+1)
                                                                                                    assign mem[i]=mem1[i];	   
                                                                                                //for(i=0;i<4095;i=i+1)
                                                                                                    //for (j=0;j<15;j=j+1)
                                                                                                    end	 */
	wire[15:0] DataRead;
	wire[15:0] DataWrite; 
	
	
	wire [15:0] AC,DR;						   
	wire [6:0] T;
	wire CLRAC, INRAC, LoadAC, SHR,SHL ,COM,LDA,INPT,DR1, ADD, AND, CLRAR, INRAR, LoadAR, CLRPC,
	 INRPC, LoadPC, STR, LoadRAM, INRDR, LoadDR, CLRSC, S, LoadIR, LoadTR, E;
	
	wire  cout;
	wire [2:0] SSS;
	wire [7:0] X;


	wire[15:0] Data;                /* data of selected register from bus selection MUX ,where this register is currently the source ,,,,
	                                    & then placed as input to all registers as below but only one will be loaded  */
	
	wire[15:0] m1, m2, m3, m4, m5 ;         // (reg) input wires of the bus selection
	reg[15:0] m7;
	//integer i=0;
	//for(i;i<4095;i=i+1)
	//assign mem[i] =memory[i];
	
	wire[11:0] ARdata , AR;	                                                        //AR IS Q , ARDATA IS DATA IN 
	assign ARdata = Data[11:0];
	PC AR_reg (AR, INRAR, ARdata ,LoadAR, CLK, CLRAR);                             //instatiating AR reg.
	
	assign m1={ 4'b0000, AR[11:0]}; 
	
	
	wire [11:0] PCdata , PC;
	assign PCdata = Data[11:0];
	PC pc_reg(PC , INRPC, PCdata, LoadPC, CLK, CLRPC); 
	
	assign m2={ 4'b0000, PC[11:0]}; 
	
	
	DR_reg dr_reg(DR, INRDR, Data, LoadDR, CLK, CLRDR);
	assign m3=DR;
	
	
	wire[15:0] ACDATA;                                                  ///ACDATA is INPUT OF AC reg. coming from ALU as an output not common bus
	ALU Ac_Arth(AC, AND, DR, ADD, INPR,INPT, LDA, COM, SHL, E, SHR, ACDATA, cout);
	
	AC ac_reg (AC, INRAC, ACDATA, LoadAC, CLK, CLRAC);	
	assign m4=AC;	
	
	// IR & IR control
	reg[15:0]IR ;	                             ////IR ?????output ?????????????
	always @(posedge CLK)
		begin
	assign IR = LoadIR ? Data :IR; // IR  IS THE OUTPUT OF THE IR REG                     
	end	   
	assign m5=IR;                              /////???????????????? I THINK m5= IR 
	

    controlUnit CTRLunit (T,AC, DR,cout,CLK, IR, CLRAC, INRAC, LoadAC, SHR, SHL ,COM, INPT,LDA,
     ADD, AND, CLRAR, INRAR, LoadAR, CLRPC, INRPC, LoadPC, STR, LoadRAM, INRDR,
     LoadDR, CLRSC, S, LoadIR, LoadTR, E, X);                                                  //instatiating   control unit 
     
	Encoder_8x3 pdec(SSS,X);	                           //instatiating bus control & connecting x (as an input)from encoder to x (as an output to)control unit
	
	MUX BUS_SELECTION (16'bx, m1,m2,m3, m4, m5, , m7   ,SSS  , Data );    // bus is selecting data from the registers due to S0,S1,S2 (SSS)
	
	
	
	//// controlling SC ,LD,CLR,INR                                           ????????????????????????
	wire Notclr;  // INCREMENT SC
	assign Notclr = ~CLRSC;
    wire INRsc , LDsc ;  //// INCREMENT SC + HLT , load SC + HLT
    wire [2:0] DataCounter, outsc;	
    
	assign INRsc = Notclr & S;
	assign LDsc = CLRSC & S; 
	assign DataCounter = Notclr ? 3'b001 : 3'b000;	//store write , load Read
	                      //// controlling SC :CLR,INR                                           ????????????????????????
	/*wire Notclr;  // INCREMENT SC
	assign Notclr = ~CLRSC;
    wire INRsc , LDsc ;  //// INCREMENT SC + HLT , load SC + HLT
    wire [2:0] DataCounter, outsc;	
    
	assign INRsc = Notclr & S;
	assign LDsc = CLRSC & S; 
	assign DataCounter = Notclr ? 3'b001 : 3'b000;	//store write , load Read*/
	
	
	   
	SequenceCounter sc (LDsc, INRsc , DataCounter, CLK, outsc);   ///  SequenceCounter(LD, INC, data, CLK, out);

	 
	Decoder3to8 dec(outsc, T);
	

                                                //Memory memory( LoadRAM,STR, AR, write_data, read_data);  
                                            //Memory M(CLK, LoadRAM,STR, AR, write_data, read_data);
                                            /*if(LoadRAM)
                                                assign m7=mem[AR];
                                            else if(STR)
                                                mem[AR] = Data;
                                            end	                                          // creating a RAM 
                                              
                                             always @(CLK)
                                                assign  mem9[15:0]=mem[1];*/
	
	  
//assign	m=mem;
endmodule