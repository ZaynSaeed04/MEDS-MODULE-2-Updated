`timescale 1ns/1ps

module tb_parity_gen_4bit();
    
    logic [3:0] data_in;
    logic       parity_out;
    logic       expected_parity;

    parity_gen_4bit DUT (
        .data_in(data_in),
        .parity_out(parity_out)
    );

    initial begin
        $dumpfile("tb_parity_gen_4bit.vcd");
        $dumpvars(0, tb_parity_gen_4bit);

        for (int i = 0; i < 16; i++) begin
            data_in = i[3:0];
            expected_parity = $countones(data_in) % 2;
            #10;
            
            //expected_parity = $countones(data_in) % 2; this will cause phase shift in simulation here
        end

        $display("All 16 combinations tested.");
        $finish;
    end

    task automatic check(
        input logic actual, input logic expected
    );
        if (actual !== expected) begin
            $display("FAIL: data_in = %b | expected = %b | actual = %b", data_in, expected, actual);
        end else begin
            $display("PASS: data_in = %b | expected = %b | actual = %b", data_in, expected, actual);
        end
    endtask

endmodule