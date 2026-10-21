module decoder_2x4(
    input  logic [1:0] in,
    input  logic       enable,
    output logic [3:0] out
);

    always_comb begin
        out = 4'b0000;

        if (enable) begin
            out[in] = 1'b1;
        end
    end

endmodule
