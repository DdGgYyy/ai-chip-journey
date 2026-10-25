`timescale 1ns/1ps
`default_nettype none

module bit_unit #(
    parameter W = 8                 // 必须为偶数且 >= 4
) (
    input  wire [W-1:0] a,
    input  wire [1:0]   sel,
    output reg  [W-1:0] y
);
    integer i;

    always @(*) begin
        case (sel)
            // 00: 全部位序反转
            2'b00: begin
                for (i = 0; i < W; i = i + 1)
                    y[i] = a[W-1-i];
            end
            // 01: 高低半区交换
            2'b01: y = {a[W/2-1:0], a[W-1:W/2]};
            // 10: 循环左移 1 位
            2'b10: y = {a[W-2:0], a[W-1]};
            // 11: 低半区复制到高半区
            2'b11: y = {2{a[W/2-1:0]}};
            default: y = {W{1'b0}};
        endcase
    end
endmodule
