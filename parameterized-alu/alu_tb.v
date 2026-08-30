module alu_tb(

    );
    parameter width = 8;

    reg [width-1:0] A, B;
    reg [3:0] opcode;
    wire [width-1:0] y;
    
    alu dut(A, B, opcode, y);
        
    initial 
        begin
            $monitor("A = %b and B = %b, opcode = %b, y = %b", A, B, opcode, y);
            A = 8'b10101011;
            B = 8'b00001111;
            
            opcode = 4'b0000; #10;   // ADD
            opcode = 4'b0001; #10;   // SUB
            opcode = 4'b0010; #10;   // AND
            opcode = 4'b0011; #10;   // OR
            opcode = 4'b0100; #10;   // XOR
            opcode = 4'b0101; #10;   // LEFT SHIFT
            opcode = 4'b0110; #10;   // RIGHT SHIFT
            opcode = 4'b0111; #10;   // EQUAL
            opcode = 4'b1000; #10;   // GREATER
            opcode = 4'b1001; #10;   // LESS
            opcode = 4'b1010; #10;   // GREATER/EQUAL
            opcode = 4'b1011; #10;   // LESS/EQUAL
    
        end
endmodule
