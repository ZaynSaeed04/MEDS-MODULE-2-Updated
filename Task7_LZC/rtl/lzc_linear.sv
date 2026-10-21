module lzc_linear(
    input  logic [31:0] in_data,
    output logic [5:0]  lzc_out
);

    always_comb begin
        lzc_out = 6'd32;

        for (int i = 31; i >= 0; i--) begin
            if (in_data[i]) begin
                lzc_out = 31 - i;
                break;
            end
        end
    end

endmodule
