`include "multDatapath.v"
`include "multControlunit.v"

module mult#(parameter w = 16) (
  input clk, reset, input_available,
  input  [w-1:0] operands_bits_A, operands_bits_B,
  output [w-1:0] result_bits_data,
  output result_rdy,
	input result_taken);

  wire A_en, B_en, M_en, B_mux_sel, M_mux_sel, B_zero;
multDathpath#(16) datapath(
  .clk(clk),
	.operands_bits_A(operands_bits_A),
	.operands_bits_B(operands_bits_B),
	.result_bits_data(result_bits_data),
  .A_en(A_en),
  .B_en(B_en),
  .M_en(M_en),
  .B_mux_sel(B_mux_sel),
  .M_mux_sel(M_mux_sel),
  .B_zero(B_zero)
  );
multControlunit controlunit(
  .clk(clk),
  .reset(reset),
	.input_available(input_available),
  .result_taken(result_taken),
	.result_rdy(result_rdy),
  .A_en(A_en),
  .B_en(B_en),
  .M_en(M_en),
  .B_mux_sel(B_mux_sel),
  .M_mux_sel(M_mux_sel),
  .B_zero(B_zero)
  );
endmodule
