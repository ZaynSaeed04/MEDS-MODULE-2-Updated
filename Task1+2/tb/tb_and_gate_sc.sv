`timescale 1ns/1ps

module tb_and_gate_sc;

    logic a, b;
    logic y;

    // Device Under Test (DUT)
    and_gate dut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial 
    begin
        $dumpfile("wave_sc.vcd");//file name must be put 1st before $dumpvars as $dumpvars will use the file name
        $dumpvars(0, tb_and_gate_sc); //dump all variables in the tb_and_gate module
    end

    // Self-checking task
    task automatic check(
        input logic actual,
        input logic expected,
        input string name
    );
        if (actual !== expected)
            $display(
                "[FAIL] %s: expected=%0b actual=%0b at time=%0t",
                name, expected, actual, $time
            );
        else
            $display(
                "[PASS] %s: value=%0b at time=%0t",
                name, actual, $time
            );
    endtask

    initial begin
        $timeformat(-9, 0, " ns", 0);

        // Test 1: 0 AND 0 = 0
        a = 0; b = 0;
        #10;
        check(y, 0, "AND 00");

        // Test 2: 0 AND 1 = 0
        a = 0; b = 1;
        #10;
        check(y, 0, "AND 01");

        // Test 3: 1 AND 0 = 0
        a = 1; b = 0;
        #10;
        check(y, 0, "AND 10");

        // Test 4: 1 AND 1 = 1
        a = 1; b = 1;
        #10;
        check(y, 1, "AND 11");

        $finish;
    end

endmodule
