`include "two_four.v"

module two_four_tb();

    output p,q,r,s;
    reg a,b;

    two_four d1(p,q,r,s,a,b);

    initial
    begin
        a = 1'b0;
        b = 1'b0;
        #10 a = 1'b1;
        #20 b = 1'b0;
        #15 b = 1'b1;
        #10 a = 1'b0;
        #20 a = 1'b1;
    end

    initial 
    begin
        $dumpfile("two_four.vcd");
        $dumpvars(0, two_four_tb);
    end

    initial
    begin
        $monitor("t = %3d a = %b b = %b p = %b q = %b r = %b s = %b \n ", $time, a, b, p, q, r, s);
    end

endmodule
