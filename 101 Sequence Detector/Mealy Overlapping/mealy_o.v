module mealy_o (output reg z, input wire x, clk, reset);

	reg [1:0] current_state, next_state;
	parameter a = 2'b00, b = 2'b01, c = 2'b10;

	// State Memory
	always@ (posedge clk or negedge reset)
	begin
		if (!reset)
			current_state <= a;
		else
			current_state <= next_state;
	end

	// Next State Logic
	always@ (current_state or x)
	begin
		case(current_state)
			a: if(x == 1'b1) next_state = b; else next_state = a;
			b: if(x == 1'b1) next_state = b; else next_state = c;
			c: if(x == 1'b1) next_state = b; else next_state = a;
			default: next_state = a;
		endcase
	end

	// Output Logic
	always@ (current_state or x)
	begin
		case(current_state)
			a: if(x == 1'b1) z = 1'b0; else z = 1'b0;
			b: if(x == 1'b1) z = 1'b0; else z = 1'b0;
			c: if(x == 1'b1) z = 1'b1; else z = 1'b0;
			default: z = 1'b0;
		endcase
	end
endmodule
