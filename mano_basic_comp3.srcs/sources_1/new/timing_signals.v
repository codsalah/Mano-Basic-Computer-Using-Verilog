module timing_signals;
  wire [3:0] counter_out;
  wire [15:0] T;

  counter counter_inst(.clk(clk), .clr(clr), .count(counter_out));
  decoder decoder_inst(.value(counter_out), .timing_signals(T));
  
endmodule