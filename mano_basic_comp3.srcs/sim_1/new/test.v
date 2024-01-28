`timescale 1 ns / 1 ps

module Mainn_tb;

wire   [15:0]   DR, AC, IR, MEM;
wire   [11:0]   PC, AR;
wire [7:0] T, D;
wire [2:0] outsc;
wire [15:0] Data;
wire [2:0] SSS;
wire [7:0] X;
wire I;
wire E;

reg CLK;

Mainn mano(CLK,
     DR, AC, IR, MEM,
     PC, AR,
     T, D,
     outsc,
     Data,
     SSS,
     X,
     I,
     E
     ); 
     
     initial CLK = 0;
     always #5 CLK = ~CLK;




endmodule
