`include "ven.v"
module tb (input reg [1:0]m, D, clk, reset, output [1:0]z);

	ven v1(D, m[1:0], clk, reset, z[1:0]);

	initial 
    begin
        $dumpfile("ven.vcd");
        $dumpvars(0, tb);
    end

	initial
	begin
		clk = 1'b0;
		reset = 1'b1;
		D = 1'b0;
		#130 $finish;
	end

	always
		#5 clk = ~clk;
	
	initial
	begin
		#12 m = 2'b00, D=1'b0;
		#10 m = 2'b00, D=1'b1;
		#10 m = 2'b01, D=1'b1;
		#10 m = 2'b01, D=1'b0;
		#10 m = 2'b01, D=1'b1;
		#10 m = 2'b00, D=1'b0;
		#10 m = 2'b10, D=1'b1;
		#10 m = 2'b10, D=1'b0;
		#10 m = 2'b01, D=1'b1;
		#10 m = 2'b01, D=1'b0;
		#10 m = 2'b01, D=1'b0;
		#10 m = 2'b00, D=1'b1;
	end

	initial
    begin
        $monitor("t = %3d m = %b D = %b z = %b \n ", $time, m, D, z);
    end