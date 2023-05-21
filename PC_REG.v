
module PC(Q, INR, Data, Load, CLK, CLR);

	output [11:0] Q;
	input [11:0] Data;
	input INR, Load, CLK, CLR;

	wire [11:0] inr012, Sum, moshtarak;
	wire cout;

	reg [15:0] out; //store the value of pc after the increemnt by one
	
	/*if INR is true assign b000000000001 to inr012 pc = pc + 1
	else do nothing*/
	assign inr012 = INR ? 12'b000000000001 : 12'b0;  
	
	assign {cout , Sum} = inr012 + out;  //add the values of inr012 and out
                                         //The result of this addition is assigned to Sum and cout
                                         
	//always @*
	if (INR)
		assign moshtarak = Sum;
	if (Load)
		assign moshtarak = Data;
				
	wire en;
	assign en = Load^INR; 
	/* if load and increment are different then the XOR operation evaluates to true 
	taht prevent the PC from having increment and load at the same time [error] */

	always @(posedge CLK or posedge CLR)
		begin
			if(CLR)
				out <= 12'b0;
			else if(en)
				out <= moshtarak;
		end
	
	assign Q = out;
	
endmodule