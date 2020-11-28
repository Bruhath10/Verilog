module two_four(p,q,r,s,a,b);

    input a,b;
    output p,q,r,s;

    assign p = ~a & ~b;
    assign q = ~a & b;
    assign r = a & ~b;
    assign s = a & b;

endmodule
