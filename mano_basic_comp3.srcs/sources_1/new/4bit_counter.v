module counter(clk, clr, count);
  input clk, clr;     // Input signals include clock and asynchronous reset
  output [3:0] count; // Output signal is a 4-bit counter value
  reg [3:0] count;    // Register for storing the count

  always @(posedge clk, negedge clr) begin // On positive clock edge or negative reset edge
    if (!clr) begin                       // If reset signal is active low
      count <= 4'b0000;                   // Reset the count to zero
    end else begin                        // Otherwise
      count <= count + 1;                 // Increment the count by one
    end
  end                                   // End of Always block
endmodule                             // End of Module declaration