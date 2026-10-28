module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire sel;
    wire [15:0] sum0, sum1;
    wire cout1, cout2;
    add16 inst1(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(sum[15:0]),.cout(sel));
    add16 inst2(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.sum(sum0),.cout(cout1));
    add16 inst3(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.sum(sum1),.cout(cout2));
    always @(*) begin
        if (sel==1'b0) begin
            sum[31:16] = sum0;
        end
        else begin
            sum[31:16] = sum1;
        end
    end
        
endmodule
