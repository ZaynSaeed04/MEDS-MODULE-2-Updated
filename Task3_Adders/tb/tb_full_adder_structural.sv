`timescale 1ns/1ps

module tb_full_adder_structural;

    logic a, b, cin;
    logic sum, cout;

    full_adder_structural dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("tb_full_adder_structural.vcd");
        $dumpvars(0, tb_full_adder_structural);
    end

    initial begin
        // 000 -> sum=0 cout=0
        a=0; b=0; cin=0; #1;
        if (sum !== 0 || cout !== 0) $display("FAIL at 000");
        else                         $display("OK   at 000");

        // 001 -> sum=1 cout=0
        a=0; b=0; cin=1; #1;
        if (sum !== 1 || cout !== 0) $display("FAIL at 001");
        else                         $display("OK   at 001");

        // 010 -> sum=1 cout=0
        a=0; b=1; cin=0; #1;
        if (sum !== 1 || cout !== 0) $display("FAIL at 010");
        else                         $display("OK   at 010");

        // 011 -> sum=0 cout=1
        a=0; b=1; cin=1; #1;
        if (sum !== 0 || cout !== 1) $display("FAIL at 011");
        else                         $display("OK   at 011");

        // 100 -> sum=1 cout=0
        a=1; b=0; cin=0; #1;
        if (sum !== 1 || cout !== 0) $display("FAIL at 100");
        else                         $display("OK   at 100");

        // 101 -> sum=0 cout=1
        a=1; b=0; cin=1; #1;
        if (sum !== 0 || cout !== 1) $display("FAIL at 101");
        else                         $display("OK   at 101");

        // 110 -> sum=0 cout=1
        a=1; b=1; cin=0; #1;
        if (sum !== 0 || cout !== 1) $display("FAIL at 110");
        else                         $display("OK   at 110");

        // 111 -> sum=1 cout=1
        a=1; b=1; cin=1; #1;
        if (sum !== 1 || cout !== 1) $display("FAIL at 111");
        else                         $display("OK   at 111");

        $finish;
    end

endmodule

