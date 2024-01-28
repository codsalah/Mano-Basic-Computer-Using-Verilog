module D_ff_reset(Q, D, CLK, Enable, REST);

	output reg Q;
	input D, CLK, Enable,REST;

	always @(posedge CLK or posedge REST) begin
		if(REST)
			Q <= 1'b0;
		else if(Enable)
			Q <= D;
	end	

endmodule
