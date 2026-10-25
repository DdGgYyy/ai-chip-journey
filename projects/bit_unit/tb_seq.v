`timescale 1ns/1ps

module tb_seq #(
    parameter W = 8
) ();
    reg         clk, rst_n;
    reg  [W-1:0] a;
    reg  [1:0]   sel;
    wire [W-1:0] y;
    wire         valid;

    integer fd, i, s, cyc;

    bit_unit_seq #(.W(W)) dut (
        .clk(clk), .rst_n(rst_n),
        .a(a), .sel(sel),
        .y(y), .valid(valid)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_seq.vcd");
        $dumpvars(0, tb_seq);

        fd = $fopen("results_seq.txt", "w");
        cyc = 0;
        clk = 0; rst_n = 0; a = 0; sel = 0;
        #12 rst_n = 1;

        // 1024 组，每拍换一个输入 → valid 应该每拍都是 1
        for (i = 0; i < (1 << W); i = i + 1) begin
            for (s = 0; s < 4; s = s + 1) begin
                @(negedge clk);
                a   = i[W-1:0];
                sel = s[1:0];
                @(posedge clk); #1;
                $fdisplay(fd, "%0d %0d %0d %0d %0d", cyc, a, sel, y, valid);
                cyc = cyc + 1;
            end
        end

        // 保持测试：同一输入保持 4 拍 → valid 只第一拍为 1
        @(negedge clk);
        a = {W{1'b1}};
        sel = 2'b01;
        for (s = 0; s < 4; s = s + 1) begin
            @(posedge clk); #1;
            $fdisplay(fd, "%0d %0d %0d %0d %0d", cyc, a, sel, y, valid);
            cyc = cyc + 1;
            if (s < 3) @(negedge clk);
        end

        $fclose(fd);
        $display("done: %0d cycles", cyc);
        $finish;
    end
endmodule
