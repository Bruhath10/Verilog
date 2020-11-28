`include "vm.v"

module vm_tb();
	reg clk,reset,n,d,q,D;
	wire [1:0] z;
	vending_mac v1(z,reset,clk,n,d,q,D);

	always
		#10 clk = ~clk;
	initial
	begin
		$dumpfile("vending_mac.vcd");
		$dumpvars(0, vm_tb);
	end

	initial
	begin
		clk = 1'b0; reset = 1'b0; n=1'b0; d=1'b0; q=1'b0; D=1'b0;
		#0 reset = 1'b1;
		#6 n=1'b1; D=1'b1;
		#6 n=1'b0; D=1'b0;
		#15 q=1'b1;D=1'b1;
		#5 q=1'b0;D=1'b0;
		#15 d=1'b1;D=1'b1;
		#5 d=1'b0;D=1'b0;
		#15 n=1'b1;d=1'b1;D=1'b1;
		#5 n=1'b0;d=1'b0;D=1'b0;
		#15 n=1'b1;q=1'b1;D=1'b1;
		#5 n=1'b0;q=1'b0;D=1'b0;
		#20 $finish;
	end

	initial
	begin
	$monitor("t=%3d, n=%b, d=%b, q=%b, D=%b, z=%b",$time,n,d,q,D,z);
	end
endmodule
