module SequenceCounter(CLR, INC, CLK, out);

	input CLR, INC, CLK;
	output reg [2:0] out;
	
	initial out = 0;

	always @ (posedge CLK)
		begin
			if(CLR)
				out = 3'b000;
			else if(INC)
				out = out + 3'b001;
		end
		
endmodule