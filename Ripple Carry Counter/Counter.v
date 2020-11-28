// module D_FF with synchronous reset
module D_FF(q, d, clk, reset);
	output q;
	input d, clk, reset;
	reg q;
	//Lots of new constructs. Ignore the functionality 
	// of the constructs for now. Concentrate on how the 
	// design block is built in a top-down fashion.

	always @(posedge reset or negedge clk)
		if (reset)
			q <= 1'b0;
		else
			q <= d;
endmodule


module T_FF(q, clk, reset);
	output q;
	input clk, reset;
	wire d;
	
	// Instantiate D_FF. Call it dff0.
	D_FF dff0(q, d, clk, reset); 
        //D_FF dff0 (.q(q), .d(d), .clk(clk), .reset(reset)); 	
	// not gate is a Verilog primitive. 
	not n1(d, q); 

endmodule


module ripple_carry_counter(q, clk, reset);

	output [3:0] q; 
	input clk, reset; 

	// Four instances of the module T_FF are created. 
	// Each has a unique name. 
	// Each instance is passed a set of signals.	
	// Notice, that each instance is a copy of the module T_FF.

	T_FF tff0(q[0],clk, reset);
	T_FF tff1(q[1],q[0], reset);
	T_FF tff2(q[2],q[1], reset);
	T_FF tff3(q[3],q[2], reset);
endmodule
