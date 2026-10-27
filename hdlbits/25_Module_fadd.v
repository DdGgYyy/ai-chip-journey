module add16(input [15:0] a, input [15:0] b, input cin, output [15:0] sum, output cout);
    wire cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8,cout9,cout10,cout11,cout12,cout13,cout14,cout15,cout16;
    add1 fadd1(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout1), .sum(sum[0]));
    add1 fadd2(.a(a[1]), .b(b[1]), .cin(cout1), .cout(cout2), .sum(sum[1]));
    add1 fadd3(.a(a[2]), .b(b[2]), .cin(cout2), .cout(cout3), .sum(sum[2]));
    add1 fadd4(.a(a[3]), .b(b[3]), .cin(cout3), .cout(cout4), .sum(sum[3]));
    add1 fadd5(.a(a[4]), .b(b[4]), .cin(cout4), .cout(cout5), .sum(sum[4]));
    add1 fadd6(.a(a[5]), .b(b[5]), .cin(cout5), .cout(cout6), .sum(sum[5]));
    add1 fadd7(.a(a[6]), .b(b[6]), .cin(cout6), .cout(cout7), .sum(sum[6]));
    add1 fadd8(.a(a[7]), .b(b[7]), .cin(cout7), .cout(cout8), .sum(sum[7]));
    add1 fadd9(.a(a[8]), .b(b[8]), .cin(cout8), .cout(cout9), .sum(sum[8]));
    add1 fadd10(.a(a[9]), .b(b[9]), .cin(cout9), .cout(cout10), .sum(sum[9]));
    add1 fadd11(.a(a[10]), .b(b[10]), .cin(cout10), .cout(cout11), .sum(sum[10]));
    add1 fadd12(.a(a[11]), .b(b[11]), .cin(cout12), .cout(cout12), .sum(sum[11]));
    add1 fadd13(.a(a[12]), .b(b[12]), .cin(cout12), .cout(cout13), .sum(sum[12]));
    add1 fadd14(.a(a[13]), .b(b[13]), .cin(cout13), .cout(cout14), .sum(sum[13]));
    add1 fadd15(.a(a[14]), .b(b[14]), .cin(cout14), .cout(cout15), .sum(sum[14]));
    add1 fadd16(.a(a[15]), .b(b[15]), .cin(cout15), .cout(cout16), .sum(sum[15]));
    assign cout = cout16;
endmodule

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cin1, cin2;
    add16 inst1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(cin1));
    add16 inst2(.a(a[31:16]), .b(b[31:16]), .cin(cin1), .sum(sum[31:16]), .cout(cin2));

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
	assign sum = a^b^cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule
