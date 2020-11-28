module equality#(parameter w=16)(
  input [w-1:0] in0, in1,
  output out
  );
  assign out = (in0==in1)?1:0;
endmodule
