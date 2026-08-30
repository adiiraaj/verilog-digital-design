module alu #(
    parameter width = 8)(
    input [width-1:0] A, B, input [3:0] opcode, output reg [width-1:0] y
    );

     // Combinational logic: output changes whenever an input changes
    always@(*)
        begin
            case (opcode)
                4'b0000 : y = A + B;       // Add
                4'b0001 : y = A - B;       // Subtract
                4'b0010 : y = A & B;       // Bitwise AND
                4'b0011 : y = A | B;       // Bitwise OR
                4'b0100 : y = A ^ B;       // Bitwise XOR
    
                4'b0101 : y = A << 1;      // Left shift by 1 bit
                4'b0110 : y = A >> 1;      // Right shift by 1 bit
    
                4'b0111 : y = (A == B);    // Check if A is equal to B
                4'b1000 : y = (A > B);     // Check if A is greater than B
                4'b1001 : y = (A < B);     // Check if A is less than B
                4'b1010 : y = (A >= B);    // Check if A is greater than or equal to B
                4'b1011 : y = (A <= B);    // Check if A is less than or equal to B
                
                default : y = {width{1'b0}};
            endcase 
        end
endmodule
