
`include "four_bc.v"

module stimulus;
    reg [3:0] a;
    reg [3:0] b;
    wire k,l,m;


    four_bc f1 (a,b,k,l,m);

    initial 
    begin
        $dumpfile("four_bc.vcd");
        $dumpvars(0, stimulus);
    end

    initial
    begin
        a = 4'b1100; 
        b = 4'b1010; 
        #20 a = 4'b1101; 
        #30 b = 4'b1101; 
        #40 a = 4'b1011;
        #20 b = 4'b1111;
        #10 b = 4'b1011;
        #10;
    end

    initial
    begin
        $monitor("t = %3d a = %b b = %b k = %b l = %b m = %b \n ", $time, a, b, k, l, m);
    end

endmodule
