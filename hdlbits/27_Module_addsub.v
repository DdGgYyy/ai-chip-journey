module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b1;
	assign b1 = sub ? ~b : b;
    wire cout1, cout2;
    add16 inst1(.a(a[15:0]),.b(b1[15:0]),.cin(sub),.sum(sum[15:0]),.cout(cout1));
    add16 inst2(.a(a[31:16]),.b(b1[31:16]),.cin(cout1),.sum(sum[31:16]),.cout(cout2));
endmodule
