`include "mult.v"

module mult_test;
	reg [15:0] inA, inB;
	reg clk, reset, input_available;
	reg result_taken;
	wire [15:0] out;
	wire result_rdy;
	mult multiplication (
    .clk(clk),
    .reset(reset),
    .input_available(input_available),
    .operands_bits_A(inA),
    .operands_bits_B(inB),
    .result_bits_data(out),
    .result_rdy(result_rdy),
    .result_taken(result_taken)
    );
	initial	begin
		clk = 1'b1;
		reset = 1'b1;
		input_available = 1'b0;
	end
	always
  	#5 clk = ~clk;
  initial begin
  	inA = 8;
  	inB = 7;
  	#13 reset = 1'b0;
  	#10 input_available = 1'b1;
  	#80 result_taken = 1'b1;
  	$finish;
	end
	initial 
    begin
        $dumpfile("mult.vcd");
        $dumpvars(0, mult_test);
    end
	initial
	$monitor($time , " out=%d, clk=%b, reset=%b, input_available=%b, result_rdy=%b, result_taken=%b", out, clk, reset, input_available, result_rdy, result_taken);
endmodule
