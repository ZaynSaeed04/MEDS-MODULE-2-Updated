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



module decoder_3x8(
    input  logic [2:0] in,
    input  logic       enable,
    output logic [7:0] out
);

    decoder_2x4 dec0(
        .in(in[1:0]),
        .enable(enable & ~in[2]),
        .out(out[3:0])
    );

    decoder_2x4 dec1(
        .in(in[1:0]),
        .enable(enable & in[2]),
        .out(out[7:4])
    );

endmodule