module four_two_pe(a,b,p,q,r,s);
    
    input p,q,r,s;
    output a,b;

    assign a = r | s;
    assign b = s | (q&~r);

endmodule
