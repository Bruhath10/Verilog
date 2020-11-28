module even_pg (p,x,y,z);
    output p;
    input x,y,z;
    assign p = x^y^z;
endmodule
