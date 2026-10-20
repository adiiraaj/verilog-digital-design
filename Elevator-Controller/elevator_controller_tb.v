`timescale 1ns / 1ps

module elevator_controller_tb;

    reg clk, rst, emergency_stop;
    reg [3:0] floor_req;

    wire move_up, move_down, motor_stop;
    wire [1:0] current_floor;

    // DUT instantiation
    elevator_controller dut(
        clk, rst, emergency_stop, floor_req,
        move_up, move_down, motor_stop, current_floor
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        emergency_stop = 0;
        floor_req = 4'b0000;

        // Test 1: Reset
        #20;
        rst = 0;

        // Test 2: Request floor 1 from floor 0
        floor_req = 4'b0010;
        #40;

        // Test 3: Request floor 2
        floor_req = 4'b0100;
        #40;

        // Test 4: Request floor 3
        floor_req = 4'b1000;
        #40;

        // Test 5: Request floor 0 (move down)
        floor_req = 4'b0001;
        #40;

        // Test 6: Request the current floor (floor 0)
        floor_req = 4'b0001;
        #20;

        // Test 7: Multiple requests: floors 1 and 3
        // Floor 1 should win because it has higher priority
        floor_req = 4'b1010;
        #40;

        // Test 8: Multiple requests: floors 0 and 2
        // Floor 0 should win
        floor_req = 4'b0101;
        #40;

        // Test 9: Multiple requests: floors 2 and 3
        // Floor 2 should win
        floor_req = 4'b1100;
        #40;

        // Test 10: All four floor requests active
        // Floor 0 should win
        floor_req = 4'b1111;
        #40;

        // Test 11: No floor request
        floor_req = 4'b0000;
        #20;

        // Test 12: Emergency stop while operating
        floor_req = 4'b1000;
        #10;
        emergency_stop = 1;
        #30;

        // Test 13: Release emergency stop
        emergency_stop = 0;
        #30;

        // Test 14: Reset while operating
        floor_req = 4'b0100;
        #10;
        rst = 1;
        #20;
        rst = 0;
        #30;

        // Test 15: Request floor 3 after reset
        floor_req = 4'b1000;
        #50;

        // Finish simulation
        floor_req = 4'b0000;
        #20;
        $finish;
    end
    
    initial 
        begin
            $monitor(
            "Time=%0t | Reset=%b | Emergency=%b | Request=%b | Floor=%0d | Up=%b | Down=%b | Stop=%b",
            $time, rst, emergency_stop, floor_req,
            current_floor, move_up, move_down, motor_stop
            );
        end 

endmodule
