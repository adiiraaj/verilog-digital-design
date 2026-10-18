module RAM_8x8_tb(

    );
    reg clk, rst, wr_enb;
    reg [2:0] wr_add, rd_add;
    reg [7:0] data_in;
    wire [7:0] data_out;
    
    RAM_8x8 dut( clk, rst, wr_enb, wr_add, rd_add, data_in, data_out);
    
    initial 
        begin
            {clk, rst, wr_enb, wr_add, rd_add, data_in} = 0;
        end 
        
    always #5 clk = ~clk;
    
    initial 
        begin
            rst = 1;
            #10;
            rst = 0;
            #10;
            
            wr_enb = 1;
            wr_add = 3'b100;
            data_in = 5;
            #10;
            
            wr_enb = 1;
            wr_add = 3'b101;
            data_in = 10;
            #10;
            
            rd_add = 3'b100;
            #10;
            rd_add = 3'b101;
            #10;
            $finish;
            
        end 
endmodule
