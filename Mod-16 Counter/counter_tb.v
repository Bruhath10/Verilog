`include "counter.v"
module tb ();
	reg x,clk,reset,preload;
	reg [3:0] load;
	output [3:0] count;

	counter c1 (x,clk,reset,preload,load,count);
	initial
	begin
		clk = 1'b0;
		reset = 1'b1;
		#500 $finish;
	end
	always
		#0.5 clk = ~clk;
	initial
	begin
		#3 reset=0; preload = 0; load = 0; x = 0;
		#4 reset = 1; preload = 0; load = 0; x = 1;
		#200 preload = 0; load = 0; x = 0;
	end
	initial
	begin
        $dumpfile("counter.vcd");
        $dumpvars(0, tb);
    end
	initial
	begin
		$monitor("t = %3d preload = %b load = %b x = %b count = %b \n ", $time, preload, load, x, count);
	end
endmodule