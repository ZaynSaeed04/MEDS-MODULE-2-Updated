`timescale 1ns/1ps
module half_adder_dual(
    input  logic a, b,
    // output logic sum_assign, carry_assign,
    output logic sum_comb,   carry_comb
);

    // // 1. Continuous Assignment Version
    // assign sum_assign   = a ^ b;
    // assign carry_assign = a & b;

    // 2. Always_comb Version using a case statement with concatenation
    always_comb begin
        case ({a, b})
            2'b00: begin sum_comb = 1'b0; carry_comb = 1'b0; end
            2'b01: begin sum_comb = 1'b1; carry_comb = 1'b0; end
            2'b10: begin sum_comb = 1'b1; carry_comb = 1'b0; end
            2'b11: begin sum_comb = 1'b0; carry_comb = 1'b1; end
            default: begin sum_comb = 1'b0; carry_comb = 1'b0; end
        endcase
    end

endmodule