// Gate Level
module mux_gate_level (i0,i1,s,out);
  input i0,i1,s;
  output out;
  wire s1,p,q;
  not a0(s1,s);
  and a1(p,s1,i0);
  and a2(q,s,i1);
  or a3(out,p,q);
endmodule

// Data_flow
module mux_data_flow (i0,i1,s,out);
  input i0,i1,s;
  output out;
  assign out = (~s & i0) | (s & i1);
endmodule 

// Behavioual
module mux_behavioual (i0,i1,s,out);
input i0,i1,s;
output out;
reg out;
always @ ( i0,i1,s ) 
begin
  if (s) 
    out = i1; 
  else
    out = i0;
end
endmodule
