module adder#(parameter w=16)(
  input [w-1:0] in0, in1,
  output [w-1:0] out
  );
  assign out = in0+in1;
endmodule
