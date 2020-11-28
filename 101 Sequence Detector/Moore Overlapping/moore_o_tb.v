`include "moore_o.v"
module moore_o_tb ();
	reg x, clk, reset;
	output z;

	moore_o m1(z,x,clk,reset);

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
		#10 x = 1'b1;
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
        $dumpfile("moore_o.vcd");
        $dumpvars(0, moore_o_tb);
    end

	initial
    begin
        $monitor("t = %3d x = %b z = %b \n ", $time, x, z);
    end
endmodule