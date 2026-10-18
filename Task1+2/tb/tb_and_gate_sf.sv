module tb_and_gate_sf;

    logic [1:0] ab;           
    logic       a, b, y;      

    and_gate dut (
        .a(a), 
        .b(b), 
        .y(y)
    );

    initial 
    begin
        $dumpfile("wave_sf.vcd");
        $dumpvars(0, tb_and_gate_sf); 
    end

    task automatic check(input logic actual, expected, string name);
        if (actual !== expected) begin
            $display("[FAIL] %s: expected=%0b, actual=%0b", name, expected, actual);
        end else begin
            $display("[PASS] %s: value=%0b", name, actual);
        end
    endtask

    function automatic logic expected_fn(input logic a, b);
        return a & b;
    endfunction

    initial 
    begin
        for (ab = 2'b00; ; ab = ab + 1) 
        begin
            {a, b} = ab; 
            #1; 
            
            check(y, expected_fn(a, b), $sformatf("ab=%02b", ab));
            
            if (ab == 2'b11) 
                break;
        end
        $finish; 
    end

endmodule