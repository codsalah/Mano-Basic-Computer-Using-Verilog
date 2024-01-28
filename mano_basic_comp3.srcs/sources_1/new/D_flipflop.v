module D_flipflop(Q, D, CLK, Enable);

	output reg Q;
	input D, CLK, Enable;

	initial begin 
		Q = 1'b0; 
	end

	always @(posedge CLK) begin
		if(Enable)
			Q <= D;
	end
	
endmodule
