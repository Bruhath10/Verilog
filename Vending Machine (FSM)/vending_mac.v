module ven ();

	input wire D,clk,reset;
	input wire[1:0] m;
	output reg[1:0] z;

	reg [2:0] current_state, next_state;
	parameter a=3'b000, b=3'b001, c=3'b010, d=3'b011, e=3'b100, f=3'b101;

	// State Memory block
	always@(posedge clk, negedge reset)
	begin
		if(!reset)
			current_state <= a;
		else
			current_state <= next_state;
	end

	// Next State Logic block
	// Nickel(m = 2'b00), Dimes(m = 2'b01), Quarters(m = 2'b10), Done(D = 1'b1)
	always@(current_state or D)
	begin
		case(current_state)
			a: if(m==2'b00 and D==1'b0) next_state = b; else if(m==2'b01 and D==1'b0) next_state = c; else if(m==2'b10 and D==1'b0) next_state = f; else next_state = a;
			b: if(m==2'b00 and D==1'b0) next_state = c; else if(m==2'b01 and D==1'b0) next_state = d; else if(m==2'b10 and D==1'b0) next_state = e; else next_state = a;
			c: if(m==2'b00 and D==1'b0) next_state = d; else if(m==2'b01 and D==1'b0) next_state = e; else if(m==2'b10 and D==1'b0) next_state = f; else next_state = a;
			d: if(m==2'b00 and D==1'b0) next_state = e; else if(m==2'b01 and D==1'b0) next_state = f; else if(m==2'b10 and D==1'b0) next_state = f; else next_state = a;
			e: if(m==2'b00 and D==1'b0) next_state = f; else if(m==2'b01 and D==1'b0) next_state = f; else if(m==2'b10 and D==1'b0) next_state = f; else next_state = a;
			f: if(m==2'b00 and D==1'b0) next_state = f; else if(m==2'b01 and D==1'b0) next_state = f; else if(m==2'b10 and D==1'b0) next_state = f; else next_state = a;
			default: next_state = a;
		endcase
	end

	// Output Logic block
	// Pencil(z = 2'b00), Eraser(z = 2'b01), Pen(z = 2'b10) 
	always@(current_state or D)
	begin
		case(current_state)
			a: if(m==2'b01 and D==1'b1) z = 2'b01; else if(m==2'b10 and D==1'b1) z = 2'b10; else z = 2'b00;
			b: if(m==2'b00 and D==1'b1) z = 2'b01; else if(m==2'b01 and D==1'b1) z = 2'b01; else if(m==2'b10 and D==1'b1) z = 2'b11; else z = 2'b00;
			c: if(m==2'b00 and D==1'b1) z = 2'b01; else if(m==2'b01 and D==1'b1) z = 2'b10; else if(m==2'b10 and D==1'b1) z = 2'b11; else z = 2'b00;
			d: if(m==2'b00 and D==1'b1) z = 2'b10; else if(m==2'b01 and D==1'b1) z = 2'b10; else if(m==2'b10 and D==1'b1) z = 2'b11; else z = 2'b00;
			e: if(m==2'b00 and D==1'b1) z = 2'b10; else if(m==2'b01 and D==1'b1) z = 2'b11; else if(m==2'b10 and D==1'b1) z = 2'b11; else z = 2'b00;
			f: if(m==2'b00 and D==1'b1) z = 2'b11; else if(m==2'b01 and D==1'b1) z = 2'b11; else if(m==2'b10 and D==1'b1) z = 2'b11; else z = 2'b00;
			default: z=2'b00;
		endcase
	end
endmodule
