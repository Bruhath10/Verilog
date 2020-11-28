module d_ff (q,qbar,d,clk,reset);
	output reg q,qbar;
	input d,clk,reset;

	always@(posedge clk, negedge reset)
	begin
		if(!reset)
			begin
				q = 1'b0;
				qbar = 1'b1;
			end
		else
			begin
				q <= d;
				qbar <= ~d;
			end
	end
endmodule
