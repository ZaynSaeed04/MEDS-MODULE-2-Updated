module nor_only_realization_1(
    input logic a,b,c,d,
    output logic out

);

    logic n1,n2,n3;

    assign n1 = ~( b | c | d );
    assign n2 = ~( ~a | b |c );
    assign n3 = ~( ~a | d );

    assign out = ~( n1 | n2 | n3 );

endmodule


