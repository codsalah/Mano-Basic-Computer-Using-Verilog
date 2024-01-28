module decoder(value,timing_signals);
  
  input [3:0] value;
  output reg [15:0] timing_signals;
  
  //The ternary operator in Verilog works as follows:

  //(condition) ? (if true) : (if false);
  
  assign timing_signals = (value == 4'b0000) ? 16'h0001 :
                          (value == 4'b0001) ? 16'h0002 :
                          (value == 4'b0010) ? 16'h0004 :
                          (value == 4'b0011) ? 16'h0008 :
                          (value == 4'b0100) ? 16'h0010 :
                          (value == 4'b0101) ? 16'h0020 :
                          (value == 4'b0110) ? 16'h0040 :
                          (value == 4'b0111) ? 16'h0080 :
                          (value == 4'b1000) ? 16'h0100 :
                          (value == 4'b1001) ? 16'h0200 :
                          (value == 4'b1010) ? 16'h0400 :
                          (value == 4'b1011) ? 16'h0800 :
                          (value == 4'b1100) ? 16'h1000 :
                          (value == 4'b1101) ? 16'h2000 :
                          (value == 4'b1110) ? 16'h4000 :
                                               16'h8000 ;
endmodule
