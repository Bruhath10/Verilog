module ED_FF#(parameter w = 16)(
 input clk, en,
 input [w-1:0] d,
 output reg[w-1:0]  q
 );
 always@(posedge clk) begin
   if(en == 1)
    q = d;
   else
    q = q;
   end
endmodule
