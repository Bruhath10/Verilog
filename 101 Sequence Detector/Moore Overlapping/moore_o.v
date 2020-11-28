module moore_o (output reg z, input wire x, clk, reset);

	reg [1:0] current_state, next_state;
	parameter a = 2'b00, b = 2'b01, c = 2'b10, d = 2'b11;

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
			c: if(x == 1'b1) next_state = d; else next_state = a;
			d: if(x == 1'b1) next_state = b; else next_state = c;
			default: next_state = a;
		endcase
	end
	
	// Output Logic
	always@ (current_state)
	begin
		case(current_state)
			d:  z = 1'b1; 
			default: z = 1'b0;
		endcase
	end
endmodule
