`timescale 1ns/1ps
`default_nettype none

module bit_unit_seq #(
    parameter W = 8
) (
    input  wire         clk,
    input  wire         rst_n,      // 低有效
    input  wire [W-1:0] a,
    input  wire [1:0]   sel,
    output reg  [W-1:0] y,
    output reg          valid
);
    integer i;
    reg [W-1:0] y_comb;
    reg [W-1:0] a_d;        // 上一拍的 a
    reg [1:0]   sel_d;      // 上一拍的 sel

    // ---------- 组合逻辑 ----------
    always @(*) begin
        case (sel)
            2'b00: begin
                for (i = 0; i < W; i = i + 1)
                    y_comb[i] = a[W-1-i];
            end
            2'b01: y_comb = {a[W/2-1:0], a[W-1:W/2]};
            2'b10: y_comb = {a[W-2:0], a[W-1]};
            2'b11: y_comb = {2{a[W/2-1:0]}};
            default: y_comb = {W{1'b0}};
        endcase
    end

    // ---------- 时序逻辑 ----------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_d   <= {W{1'b0}};
            sel_d <= 2'b00;
            y     <= {W{1'b0}};
            valid <= 1'b0;
        end else begin
            a_d   <= a;
            sel_d <= sel;
            y     <= y_comb;
            valid <= (a != a_d) || (sel != sel_d);
        end
    end
endmodule

`default_nettype wire
