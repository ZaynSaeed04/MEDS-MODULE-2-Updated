`timescale 1ns/1ps

module tb_half_adder_dual;

    logic a, b;
    logic sum_comb, carry_comb;

    half_adder_dual dut (
        .a(a),
        .b(b),
        .sum_comb(sum_comb),
        .carry_comb(carry_comb)
    );
    initial begin
        $dumpfile("tb_half_adder_dual.vcd");
        $dumpvars(0, tb_half_adder_dual);
        
    end


    initial begin
        // 00
        a = 0; b = 0; #1;
        if (sum_comb !== 0 || carry_comb !== 0) $display("FAIL at 00");
        else                                    $display("OK   at 00");

        // 01
        a = 0; b = 1; #1;
        if (sum_comb !== 1 || carry_comb !== 0) $display("FAIL at 01");
        else                                    $display("OK   at 01");

        // 10
        a = 1; b = 0; #1;
        if (sum_comb !== 1 || carry_comb !== 0) $display("FAIL at 10");
        else                                    $display("OK   at 10");

        // 11
        a = 1; b = 1; #1;
        if (sum_comb !== 0 || carry_comb !== 1) $display("FAIL at 11");
        else                                    $display("OK   at 11");

        $finish;
    end

endmodule