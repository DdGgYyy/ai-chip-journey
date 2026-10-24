`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire a_b;
    wire c_d;
    wire e;
    assign a_b = a & b;
    assign c_d = c & d;
    assign e = a_b || c_d;
    assign out = e;
    assign out_n = ~e;

endmodule

