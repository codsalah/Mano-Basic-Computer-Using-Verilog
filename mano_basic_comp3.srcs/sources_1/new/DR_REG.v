`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2023 07:04:06 AM
// Design Name: 
// Module Name: DR_REG
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DR_reg(LD,CLK,INR,CLR,inDR,DR );
    input LD,CLK,INR,CLR;
    input [15:0] inDR;
    output [15:0] DR;
    /*   "inDR" is the data entering DR , 
         "DR" is output of DR ,
         inr16 is 0000000000000001 that's used to be added to DR at enabling increment signalS   */
    wire[15:0]inr16,sum;
    wire cout;
    reg[15:0] out;
    
    assign inr16=INR?16'b0000000000000001:16'b0;
    assign {cout,sum}= inr16+out;
    
    
   always @(posedge CLK or posedge CLR)
		begin
			if(CLR)
				begin
					out<=16'b0;
				end
				
			else if(LD)
				begin
					out<=inDR;
				end	
					
			else if(INR)
				begin
					out<=sum;
				end										  
			end	
	assign DR =out ;
	
endmodule
