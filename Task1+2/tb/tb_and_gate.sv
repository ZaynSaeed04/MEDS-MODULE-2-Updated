//this is a tb of and gate
module tb_and_gate;
    logic a,b,y;

    and_gate DUT (.a(a), .b(b), .y(y));

    initial 
    begin
        $dumpfile("wave.vcd");//file name must be put 1st before $dumpvars as $dumpvars will use the file name
        $dumpvars(0, tb_and_gate); //dump all variables in the tb_and_gate module
    end

    initial
    begin
        a = 1'b0;
        b = 1'b0;
        #10;
        a = 1'b0;
        b = 1'b1;
        #10;
        a = 1'b1;
        b = 1'b0;
        #10;
        a = 1'b1;
        b = 1'b1;
        #10;
    end
endmodule
    