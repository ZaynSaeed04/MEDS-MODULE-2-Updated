`timescale 1ns/1ps

module tb_3gates;

    int ab; // Use 'int' instead of a 2-bit vector so it doesn't wrap around infinitely
    logic a, b;
    logic y_and, y_or, y_xor;

    // Instantiate all three Devices Under Test (DUTs)
    and_gate dut_and (.a(a), .b(b), .y(y_and));
    or_gate  dut_or  (.a(a), .b(b), .y(y_or));
    xor_gate dut_xor (.a(a), .b(b), .y(y_xor));

    initial begin
        $dumpfile("wave_loop.vcd");
        $dumpvars(0, tb_3gates);
    end

    // Self-checking task
    task automatic check(
        input logic actual,
        input logic expected,
        input string name
    );
        if (actual !== expected)
            $display("[FAIL] %s: expected=%0b actual=%0b at time=%0t", name, expected, actual, $time);
        else
            $display("[PASS] %s: value=%0b at time=%0t", name, actual, $time);
    endtask

    initial begin
        $timeformat(-9, 0, " ns", 0);

        // Sweep 0 through 3 safely using an integer loop variable
        for (ab = 0; ab <= 3; ab = ab + 1) begin
            {a, b} = ab[1:0]; // Unpack the lower 2 bits onto individual inputs
            #10;              // Let combinational logic settle

            // Verify outputs against expected logic operations
            check(y_and, a & b,      $sformatf("AND ab=%02b", ab[1:0]));
            check(y_or,  a | b,      $sformatf("OR ab=%02b", ab[1:0]));
            check(y_xor, a ^ b,      $sformatf("XOR ab=%02b", ab[1:0]));
        end

        $display("All tests completed.");
        $finish;
    end

endmodule