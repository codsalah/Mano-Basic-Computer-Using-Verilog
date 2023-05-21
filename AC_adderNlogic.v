module ALU(
    input AND,ADD, LDA, CMA,CIR,CIL,E,     //instructions signals 
    input [15:0] AC, DR,
    
    output cout ,
    output [15:0]  ACDATA);
    
    wire [15:0] and16,add16,lda16,cma16,cir16,cil16;     // turning the instructions signals into 16-bit signal to be anded 
   
    wire [15:0] AND1,AND2,AND3,AND4,AND5,AND6 ;         //AND gate of each instruction  
    
    
    //AND OPERATION
    assign and16 = (AND ? 16'b1 :16'b0);
	assign AND1 = AC & and16 & DR;
	
	//ADD OPERTION , {CARRY,SUM} is the result of a full-adder
	assign {CARRY,SUM} = AC + DR ;
	assign cout = CARRY;
	
	assign add16 = (ADD ? 16'b1 :16'b0);
	assign AND2 = SUM & add16 ;
	
	//LDA OPERATION (load AC with DR content )
	assign lda16 = (LDA ? 16'b1 :16'b0);
	assign AND3 = lda16 & DR ;
	
	//CMA OPERATION (Complement AC content)
	assign cma16 = (CMA ? 16'b1 : 16'b0);
	assign AND4 = (~AC) & cma16;
	
	
	
	wire[15:0] acshr,acshl, e0shr, e0shl;
	wire o1 ,o2;
	//CIR (circulate/shift to right) OPERATION          ----> AC=shr AC , AC(15)= E , E= AC(0)
	assign cir16 = (CIR ? 16'b1 : 16'b0);
	
	assign acshr = AC >> 1;                                 // AC shifted to right one time with a "zero" 
	assign e0shr = E ? 16'b1000000000000000 : 16'b0;        // e0shr = E000000000000000 
	assign o1 = acshr | e0shr ;                             // o1 = {E, shifted content of AC }
	assign AND5= o1 | cir16;
	
	
	//CIL (circulate/shift to left) OPERATION          ----> AC=shl AC , AC(0)= E , E= AC(15)
	assign cil16 = (CIL ? 16'b1 : 16'b0);
	
	assign acshl = AC << 1; 
	assign e0shl = {15'b0, E};                             // e0shl = 000000000000000E
	assign o2 = acshl | e0shl ;                            // o2 = { shifted content of AC ,E}
	assign AND6 = o2 | cil16;              
	
	

    assign ACDATA = AND1 | AND2| AND3| AND4| AND5| AND6;   // All AND gates signals to be into an OR gate that results in AC 
endmodule