`timescale 1ns/1ps

module tb_bit_unit #(
    parameter W = 8
) ();
    reg  [W-1:0] a;
    reg  [1:0]   sel;
    wire [W-1:0] y;

    integer fd;
    integer i, s;

    bit_unit #(.W(W)) dut (.a(a), .sel(sel), .y(y));

    initial begin
        if (W <= 8) begin
            $dumpfile("tb_bit_unit.vcd");
            $dumpvars(0, tb_bit_unit);
        end

        fd = $fopen("results.txt", "w");
        if (fd == 0) begin
            $display("ERROR: cannot open results.txt");
            $finish;
        end

        for (i = 0; i < (1 << W); i = i + 1) begin
            for (s = 0; s < 4; s = s + 1) begin
                a   = i[W-1:0];
                sel = s[1:0];
                #1;
                $fdisplay(fd, "%0d %0d %0d", a, sel, y);
            end
        end

        $fclose(fd);
        $display("done: %0d cases", (1 << W) * 4);
        $finish;
    end
endmodule
