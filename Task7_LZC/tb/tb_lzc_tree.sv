
`timescale 1ns/1ps

module tb_lzc_tree;

    logic [31:0] in_data;
    logic [5:0]  lzc_out;
    int tests = 0;

    lzc_tree dut (
        .in_data(in_data),
        .lzc_out(lzc_out)
    );

    initial begin
        $dumpfile("tb_lzc_tree.vcd");
        $dumpvars(0, tb_lzc_tree);
    end

    // Reference model
    function automatic logic [5:0] ref_lzc(
        input logic [31:0] data
    );
        ref_lzc = 6'd32;

        for (int i = 31; i >= 0; i--) begin
            if (data[i] && ref_lzc == 6'd32)
                ref_lzc = 31 - i;
        end
    endfunction

    // Check and report each test
    task automatic check(input logic [31:0] data);
        logic [5:0] expected;

        in_data = data;
        expected = ref_lzc(data);
        #1;

        tests++;

        if (lzc_out !== expected) begin
            $display(
                "FAIL | Test %0d | Input=%h | Expected=%0d | Actual=%0d",
                tests, data, expected, lzc_out
            );
            $fatal(1, "Tree LZC test failed.");
        end
        else begin
            $display(
                "PASS | Test %0d | Input=%h | Expected=%0d | Actual=%0d",
                tests, data, expected, lzc_out
            );
        end
    endtask

    initial begin
        check(32'h00000000); // All zeros
        check(32'h00000001); // Bit 0
        check(32'h00008000); // Bit 15
        check(32'h80000000); // Bit 31

        for (int k = 0; k < 50; k++)
            check($urandom);

        $display("-----------------------------------------------");
        $display("PASS: All %0d tests passed.", tests);
        $finish;
    end

endmodule
