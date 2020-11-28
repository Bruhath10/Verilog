module four_two(a,b,p,q,r,s);
    input p,q,r,s;
    output a,b;

    assign a = (~p & ~q & ~r & s) | (~p & ~q & r & ~s);
    assign b = (~p & ~q & ~r & s) | (~p & q & ~r & ~s);

endmodule
