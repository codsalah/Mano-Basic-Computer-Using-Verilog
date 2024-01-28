module MUX_tb;

	// Inputs
	reg [15:0] d [7:0];
    reg [7:0] D;
    reg [7:0] T;
    reg I;
	// Outputs
	wire [15:0] out;
	wire [2:0] sel;
    wire [7:0] x;
    
	// Instantiate the MUX module
	MUX M(d[0],d[1],d[2],d[3],d[4],d[5],d[6],d[7],sel,out);
	BUS_Control control(x, D, T, I);
	Encoder_8x3 encoder(sel, x);


//assign x[1] = (D[4] & T[4]) | (D[5] & T[5]);                                   //AR as source
//	assign x[2] = (D[5] & T[4]) | T[0];                                            //PC as source
//	assign x[3] = 0 ;                                                              //DR as source
//	assign x[4] = D[3] & T[4];                                                     //AC as source
//	assign x[5] = T[2] ;                                                           //IR as source
//    assign x[6] = 0 ;                                                              //TR as source
//    assign x[7] = (D7n & I & T[3]) | ((D[0] | D[1] | D[2]) & T[4]) | T[1]; 
    
	// Initialize inputs
	initial begin
		d [0]= 8'b00000001;
		d [1]= 8'b00000010;
		d [2]= 8'b00000100;
		d [3]= 8'b00001000;
		d [4]= 8'b00010000;
		d [5]= 8'b00100000;
		d [6]= 8'b01000000;
		d [7]= 8'b10000000;
//		sel = 3'b000;    // Select input 0 by default
//		x = 0;
//		#5
//		x[3] = 1;
//		#5
//		x[3] = 0;
//		x[1] = 1;
		D = 0;
        T = 0;
        I = 0;
    
        #10
        D[4] = 1;
        T[4] = 1;
        
        #10
        D[4] = 0;
        T[4] = 0;
        T[1] = 1;
            
	end

	// Stimulus
	//always #10 sel = sel + 1; // Cycle through all inputs every 10ns

	// Print output
	//always @(out) $display("sel=%b d=%b out=%b", sel, d, out);

endmodule