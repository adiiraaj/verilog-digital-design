module alu #(
    parameter width = 8)(
    input [width-1:0] A, B, input [3:0] opcode, output reg [width-1:0] y
    );
    
    always@(*)
        begin
            case (opcode)
                4'b0000 : y = A + B;
                4'b0001 : y = A - B;
                4'b0010 : y = A & B;
                4'b0011 : y = A | B;
                4'b0100 : y = A ^ B;
                4'b0101 : y = A << 1;
                4'b0110 : y = A >> 1;
                4'b0111 : y = (A == B);
                4'b1000 : y = (A > B);
                4'b1001 : y = (A < B);
                4'b1010 : y = (A >= B);
                4'b1011 : y = (A <= B);
                
                default : y = {width{1'b0}};
            endcase 
        end
endmodule
