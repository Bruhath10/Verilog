`include "2_1.v"
module two_one_tb ();
  reg s,i0,i1;
  wire out1,out2,out3;
  mux_gate_level m1(i0,i1,s,out1);
  mux_data_flow m2(i0,i1,s,out2);
  mux_behavioual m3(i0,i1,s,out3);
  initial
  begin
    $dumpfile("mux.vcd");
    $dumpvars(0, two_one_tb);
  end
  initial
  begin
    i0=0;i1=0;s=0;
    #10  i0=0;i1=0;s=1;
    #10  i0=0;i1=1;s=0;
    #10  i0=0;i1=1;s=1;
    #10  i0=1;i1=0;s=0;
    #10  i0=1;i1=0;s=1;
    #10  i0=1;i1=1;s=0;
    #10  i0=1;i1=1;s=1;
    #20 $finish;
  end
  initial begin
    $monitor("t=%3d i0=%b, i1=%b, s=%b, out1(gate level)=%b, out2(data flow)=%b, out3(behavioral)=%b",$time,i0,i1,s,out1,out2,out3);
  end
endmodule 