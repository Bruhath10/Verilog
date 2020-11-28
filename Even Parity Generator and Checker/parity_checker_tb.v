`include "parity_checker.v"

module checker_tb();
    output c;
    reg x,y,z,p;
    parity_checker p1(c,p,x,y,z);
    initial
    begin
        x=1'b0; y=1'b0; z=1'b0; p=1'b1;
        #10 x=1'b0; y=1'b0; z=1'b1; p=1'b1;
        #10 x=1'b0; y=1'b1; z=1'b0; p=1'b0;
        #10 x=1'b0; y=1'b1; z=1'b1; p=1'b1;
        #10 x=1'b1; y=1'b0; z=1'b0; p=1'b1;
        #10 x=1'b1; y=1'b0; z=1'b1; p=1'b1;
        #10 x=1'b1; y=1'b1; z=1'b0; p=1'b0;
        #10 x=1'b1; y=1'b1; z=1'b1; p=1'b1;
    end
    initial
    begin
        $dumpfile("checker.vcd");
        $dumpvars(0, checker_tb);
    end
    initial
    begin
        $monitor("t = %3d x = %b y = %b z = %b p = %b c = %b \n ",$time, x, y, z, p, c);
    end
endmodule
