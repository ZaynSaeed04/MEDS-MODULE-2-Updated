`timescale 1ns/1ps

module tb_nor_only_realization_1();

    logic a;
    logic b;
    logic c;
    logic d;
    logic out;

    nor_only_realization_1 DUT (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );

    initial begin
        $dumpfile("tb_nor_only_realization_1.vcd");
        $dumpvars(0, tb_nor_only_realization_1);
    end

    initial begin
        $monitor("Time: %0t | a: %b | b: %b | c: %b | d: %b | out: %b", $time, a, b, c, d, out);
        a = 0; b = 0; c = 0; d = 0; #10;
        a = 0; b = 0; c = 0; d = 1; #10;
        a = 0; b = 0; c = 1; d = 0; #10;
        a = 0; b = 0; c = 1; d = 1; #10;
        a = 0; b = 1; c = 0; d = 0; #10;
        a = 0; b = 1; c = 0; d = 1; #10;
        a = 0; b = 1; c = 1; d = 0; #10;
        a = 0; b = 1; c = 1; d = 1; #10;
        a = 1; b = 0; c = 0; d = 0; #10;
        a = 1; b = 0; c = 0; d = 1; #10;
        a = 1; b = 0; c = 1; d = 0; #10;
        a = 1; b = 0; c = 1; d = 1; #10;
        a = 1; b = 1; c = 0; d = 0; #10;
        a = 1; b = 1; c = 0; d = 1; #10;
        a = 1; b = 1; c = 1; d = 0; #10;
        a = 1; b = 1; c = 1; d = 1; #10;
        $display("All 16 combinations of inputs have been tested.");
        $finish;
    end

    

endmodule

