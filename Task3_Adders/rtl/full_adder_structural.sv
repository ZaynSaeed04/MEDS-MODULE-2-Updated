`timescale 1ns/1ps
module full_adder_structural(
    input  logic a, b, cin,
    output logic sum, cout
);
    logic sum1, carry1, carry2;
    // First Half Adder (adds a and b)
    assign sum1   = a ^ b;
    assign carry1 = a & b;

    // Second Half Adder (adds intermediate sum1 and cin)
    assign sum    = sum1 ^ cin;
    assign carry2 = sum1 & cin;

    // OR Gate combining the two carries
    assign cout   = carry1 | carry2;

endmodule


