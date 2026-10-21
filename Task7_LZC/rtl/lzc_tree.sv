module lzc_tree (
    input  logic [31:0] in_data,
    output logic [5:0]  lzc_out
);

    logic [31:0] temp;

    always_comb begin
        temp    = in_data;
        lzc_out = 6'd0;

        if (in_data == 32'd0) begin
            lzc_out = 6'd32;
        end
        else begin

            // Stage 1: Check the upper 16 bits
            if (temp[31:16] == 16'd0) begin
                lzc_out = lzc_out + 6'd16;
                temp = temp << 16;
            end

            // Stage 2: Check the upper 8 bits
            if (temp[31:24] == 8'd0) begin
                lzc_out = lzc_out + 6'd8;
                temp = temp << 8;
            end

            // Stage 3: Check the upper 4 bits
            if (temp[31:28] == 4'd0) begin
                lzc_out = lzc_out + 6'd4;
                temp = temp << 4;
            end

            // Stage 4: Check the upper 2 bits
            if (temp[31:30] == 2'd0) begin
                lzc_out = lzc_out + 6'd2;
                temp = temp << 2;
            end

            // Stage 5: Check the upper 1 bit
            if (temp[31] == 1'b0) begin
                lzc_out = lzc_out + 6'd1;
            end
        end
    end

endmodule
