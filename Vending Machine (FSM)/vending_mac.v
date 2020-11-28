module vending_mac (output reg [1:0] z, input wire reset, clk, n, d, q, D);
	reg [2:0] current_state, next_state;
	parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101, s6 = 3'b110;

	//STATE MEMORY
	always @ (posedge clk or negedge reset)
	begin
		if (!reset)
			current_state <= s0;
		else
			current_state <= next_state;
	end

	//NEXT STATE LOGIC
	// n-Nickel, d-Dime, q-Quarter, D-Done
	always @ (current_state or n or d or q or D)
	begin
		case (current_state)
			s0: if(n) next_state=s1; else if(d) next_state=s2; else if(q) next_state=s5;
			s1: if(n) next_state=s2; else if(d) next_state=s3; else if(q) next_state=s6;
			s2: if(D) next_state=s0; else if(n) next_state=s3; else if(d) next_state=s4; else if(q) next_state=s6;
			s3: if(D) next_state=s0; else if(n) next_state=s4; else if(d) next_state=s5; else if(q) next_state=s6;
			s4: if(D) next_state=s0; else if(n) next_state=s5; else if(d) next_state=s6; else if(q) next_state=s6;
			s5: if(D) next_state=s0; else if(n) next_state=s6; else if(d) next_state=s6; else if(q) next_state=s6;
			s6: if(D) next_state=s0; else if(n) next_state=s6; else if(d) next_state=s6; else if(q) next_state=s6;
			default: next_state=s0;
		endcase
	end
	
	//OUTPUT LOGIC
	always @ (current_state or D)
	begin
		case (current_state)
			s2:if(D) z=2'b01;//pencil 
			s3:if(D) z=2'b01;//pencil 
			s4:if(D) z=2'b10;//eraser 
			s5:if(D) z=2'b10;//eraser 
			s6:if(D) z=2'b11;//pen 
			default: z=2'b00;
		endcase
	end
endmodule
