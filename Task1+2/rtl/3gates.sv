`timescale 1ns/1ps

module and_gate (
    input logic a,
    input logic b,
    output logic y
);
    assign y = a & b;
endmodule

module or_gate (
    input logic a,
    input logic b,
    output logic y
);
    assign y = a | b;
endmodule

module xor_gate (
    input logic a,
    input logic b,
    output logic y
);
    assign y = a ^ b;
endmodule