module ALU(AND,ADD, LDA, CMA,E,AC, DR,cout , ACDATA);
    input AND,ADD, LDA, CMA,E;    //instructions signals 
    input [15:0] AC, DR;
    
    output cout ;
    output [15:0]  ACDATA;
    
    wire [15:0] and16,add16,lda16,cma16;     // turning the instructions signals into 16-bit signal to be anded 
   
    wire [15:0] AND1,AND2,AND3,AND4 ,SUM;         //AND gate of each instruction  
    wire CARRY;
    
    //AND OPERATION
    assign and16 = (AND ? 16'hffff :16'b0);
	assign AND1 = AC & and16 & DR;
	
	//ADD OPERTION , {CARRY,SUM} is the result of a full-adder
	assign {CARRY,SUM} = AC + DR ;
	assign cout = CARRY;
	
	assign add16 = (ADD ? 16'b1111111111111111 :16'b0);
	assign AND2 = SUM & add16 ;
	
	//LDA OPERATION (load AC with DR content )
	assign lda16 = (LDA ? 16'hffff :16'b0);
	assign AND3 = lda16 & DR ;
	
	//CMA OPERATION (Complement AC content)
	assign cma16 = (CMA ? 16'hffff : 16'b0);
	assign AND4 = (~AC) & cma16;
	
	
		wire o1 ,o2;

	

    assign ACDATA = AND1 | AND2| AND3| AND4;   // All AND gates signals to be into an OR gate that results in AC 
endmodule