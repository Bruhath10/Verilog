`include "mealy_o.v"
module mealy_o_tb ();
	reg x, clk, reset;
	output z;

	mealy_o m1(z,x,clk,reset);

	initial
	begin
		clk = 1'b0;
		x = 1'b0;
		reset = 1'b1;
		#100 $finish;
	end

	always
		#5 clk = ~clk;
	
	initial
	begin
		#12 x = 1'b1;
		#10 x = 1'b0;
		#10 x = 1'b1;
		#10 x = 1'b0;
		#10 x = 1'b1;
		#10 x = 1'b1;
		#10 x = 1'b0;
		#10 x = 1'b1;
	end

	initial 
    begin
        $dumpfile("mealy_o.vcd");
        $dumpvars(0, mealy_o_tb);
    end

	initial
    begin
        $monitor("t = %3d x = %b z = %b \n ", $time, x, z);
    end
endmodule