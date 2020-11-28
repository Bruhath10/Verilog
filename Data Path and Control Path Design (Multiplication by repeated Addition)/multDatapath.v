`include "2inputMux.v"
`include "D_FF.v"
`include "adder.v"
`include "subtractor.v"
`include "equality.v"

module multDathpath#(parameter w=16) (
  input clk,
  input [w-1:0] operands_bits_A, operands_bits_B,
  output [w-1:0] result_bits_data,
  input A_en, B_en, M_en, B_mux_sel, M_mux_sel,
  output B_zero);

  wire [w-1:0] A, B_mux_out, B, M_mux_out, M, sub_out, add_out;
  twoinMUX#(w) B_mux (.in0(operands_bits_B), .in1(sub_out), .sel(B_mux_sel), .out(B_mux_out));
  twoinMUX#(w) M_mux (.in0(16'b0), .in1(add_out), .sel(M_mux_sel), .out(M_mux_out));
  ED_FF#(w) A_ff(.clk(clk), .en(A_en), .d(operands_bits_A), .q(A));
  ED_FF#(w) B_ff(.clk(clk), .en(B_en), .d(B_mux_out), .q(B));
  ED_FF#(w) M_ff(.clk(clk), .en(M_en), .d(M_mux_out), .q(M));
  adder#(w) add(.in0(A), .in1(M), .out(add_out));
  subtractor#(w) sub(.in0(B), .in1(16'b1), .out(sub_out));
  equality#(w) lt(.in0(sub_out), .in1(16'b0), .out(B_zero));
  assign result_bits_data = M;
endmodule
