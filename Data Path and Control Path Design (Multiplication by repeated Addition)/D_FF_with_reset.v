module RD_FF(
  input clk, reset,
  input [1:0] d,
  output reg [1:0] q
	);
  always@(posedge clk) begin
  if(reset)
    q=0;
  else
    q=d;
  end
endmodule
