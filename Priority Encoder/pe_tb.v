`include "four_two_pe.v"
module pe_tb();
    output a,b;
    reg p,q,r,s;
    four_two_pe e1(a,b,p,q,r,s);
    initial
    begin
        p = 1'b1; q = 1'b1; r = 1'b0; s = 1'b0;
        #10 p = 1'b0; q = 1'b1; r = 1'b1; s = 1'b0;
        #10 p = 1'b1; q = 1'b0; r = 1'b0; s = 1'b1;
        #10 p = 1'b1; q = 1'b1; r = 1'b1; s = 1'b1;
        #15 p = 1'b0; q = 1'b1; r = 1'b0; s = 1'b0;
    end
    initial
    begin
        $dumpfile("four_two_pe.vcd");
        $dumpvars(0, pe_tb);
    end
    initial
    begin
        $monitor("t = %3d p = %b q = %b r = %b s = %b a = %b b = %b \n ",$time, p, q, r, s, a, b);
    end
endmodule
