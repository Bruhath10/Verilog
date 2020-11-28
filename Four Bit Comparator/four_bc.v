module two_bc(input [1:0]a,
    input [1:0] b,
    output k,
    output l,
    output m);

    assign l = (a[1]&b[1] | ~a[1]&~b[1])&(a[0]&b[0] | ~a[0]&~b[0]);
    assign k = a[1]&~b[1] | (a[1]&b[1] | ~a[1]&~b[1])&(a[0]&~b[0]);
    assign m = ~a[1]&b[1] | (a[1]&b[1] | ~a[1]&~b[1])&(~a[0]&b[0]);

endmodule


module four_bc(input [3:0]a,
    input [3:0] b,
    output k,
    output l,
    output m);

    wire l1,l2,k1,k2,m1,m2;
    two_bc c1(a[1:0], b[1:0], k1,l1,m1);
    two_bc c2(a[3:2], b[3:2], k2,l2,m2);

    assign l = l1&l2;
    assign k = k2 | l2&k1;
    assign m = m2 | l2&m1;

endmodule
