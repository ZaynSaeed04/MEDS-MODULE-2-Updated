`timescale 1ps/1ps
module tb_decoder_3x8;

    logic [2:0] in;
    logic       enable;
    logic [7:0] out;

    int errors = 0;

    decoder_3x8 dut (
        .in(in),
        .enable(enable),
        .out(out)
    );

    initial begin
        $dumpfile("tb_decoder_3x8.vcd");
        $dumpvars(0, tb_decoder_3x8);
    end

    task automatic check(input logic [7:0] expected);
        if (out !== expected) begin
            $display("FAIL: enable=%b in=%b actual=%b expected=%b",
                     enable, in, out, expected);
            errors++;
        end
        else begin
            $display("PASS: enable=%b in=%b actual=%b expected=%b",
                     enable, in, out, expected);
        end
    endtask

    initial begin
        enable = 0;
        in = 0;
        #1;
        check(8'b00000000);

        enable = 1;

        for (int i = 0; i < 8; i++) begin
            in = i;
            #1;
            check(8'b00000001 << i);
        end

        enable = 0;

        for (int i = 0; i < 8; i++) begin
            in = i;
            #1;
            check(8'b00000000);
        end

        if (errors == 0)
            $display("\nALL TESTS PASSED!");
        else
            $display("\n%d TESTS FAILED!", errors);

        $finish;
    end

endmodule
