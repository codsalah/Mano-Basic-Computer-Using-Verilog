
module test;
	reg clk;
	wire[15:0] out;
	Mainn n(clk,out); 
	
	initial
		begin
			clk=1'b1;
			   $monitor($time," clk=%b out=%b",clk, out );
		
		 #40 $finish;	
		end			 
				
		always #5 clk=~clk; 
	
endmodule