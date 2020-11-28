`include "even_parity.v"

module even_parity_tb();
    output p;
    reg x,y,z;
    even_pg p1(p,x,y,z);
    initial
    begin
        x=1'b0; y=1'b0; z=1'b0;
        #10 x=1'b0; y=1'b0; z=1'b1;
        #10 x=1'b0; y=1'b1; z=1'b0;
        #10 x=1'b0; y=1'b1; z=1'b1;
        #10 x=1'b1; y=1'b0; z=1'b0;
        #10 x=1'b1; y=1'b0; z=1'b1;
        #10 x=1'b1; y=1'b1; z=1'b0;
        #10 x=1'b1; y=1'b1; z=1'b1;
    end
    initial
    begin
        $dumpfile("even_parity.vcd");
        $dumpvars(0, even_parity_tb);
    end
    initial
    begin
        $monitor("t = %3d x = %b y = %b z = %b p = %b \n ",$time, x, y, z, p);
    end
endmodule