`include "D_FF_with_reset.v"

module multControlunit(
  input clk, reset, input_available, result_taken,
  output reg result_rdy, A_en, B_en, M_en, B_mux_sel, M_mux_sel,
  input B_zero);

  localparam WAIT = 2'd0;
  localparam CALC = 2'd1;
  localparam DONE = 2'd2;
  reg  [1:0] state_next;
  wire [1:0] state;
  RD_FF state_ff (
       .clk (clk),
       .reset (reset),
       .d (state_next),
       .q (state) );
  always@(*) begin
     M_mux_sel    = 1'bx;
     M_en         = 1'b0;
     A_en         = 1'b0;
     B_mux_sel    = 1'bx;
     B_en         = 1'b0;
     result_rdy   = 1'b0;
    case ( state )
  	  WAIT : begin
    	  M_mux_sel    = 1'b0;
    	  M_en         = 1'b1;
        A_en         = 1'b1;
    	  B_mux_sel    = 1'b0;
    	  B_en         = 1'b1;
	    end
	    CALC :  begin
	      M_mux_sel = 1'b1;
	      M_en      = 1'b1;
        A_en      = 1'b1;
	      B_mux_sel = 1'b1;
	      B_en      = 1'b1;
	    end
	    DONE : result_rdy = 1'b1;
    endcase
   end
   always @(*)begin
      state_next = state;
      case ( state )
      	WAIT : if (input_available) state_next = CALC;
        CALC : if (B_zero) state_next = DONE;
        DONE : if (result_taken) state_next = WAIT;
     endcase
   end
endmodule