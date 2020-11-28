module parity_checker(c,p,x,y,z);
    output c;
    input x,y,z,p;

    assign c = x^y^z^p;
endmodule