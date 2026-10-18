module RAM_8x8(
    input clk, rst, wr_enb,
    input [2:0] wr_add, rd_add,
    input [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] mem [7:0];
    integer i;

    always @(posedge clk or posedge rst) 
        begin
            if (rst) begin
                for (i = 0; i < 8; i = i + 1)
                    mem[i] <= 8'b0;
    
                data_out <= 8'b0;
            end
            else begin
                if (wr_enb)
                    mem[wr_add] <= data_in;
                else
                    data_out <= mem[rd_add];
            end
    end

endmodule
