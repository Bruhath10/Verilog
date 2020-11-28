module twoinMUX#(parameter w = 16) (
  input [w-1:0]in0, in1,
  input sel,
  output[w-1:0] out
  );
  assign out = sel?in1:in0;
endmodule
