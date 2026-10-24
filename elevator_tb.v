`timescale 1ns/1ps
module elevator_tb;
reg clk=0, reset=1, request_valid=0;
reg [1:0] requested_floor=0;
wire [1:0] current_floor;
wire moving_up,moving_down,door_open,busy;
integer errors=0;
elevator_controller #(.DOOR_OPEN_CYCLES(3)) dut(.clk(clk),.reset(reset),.request_valid(request_valid),.requested_floor(requested_floor),.current_floor(current_floor),.moving_up(moving_up),.moving_down(moving_down),.door_open(door_open),.busy(busy));
always #5 clk=~clk;
task check_floor; input [1:0] expected; begin if(current_floor!==expected) begin $display("FAIL: expected floor %0d, got %0d",expected,current_floor); errors=errors+1; end else $display("PASS: current floor = %0d",current_floor); end endtask
task request; input [1:0] floor; begin @(negedge clk); requested_floor=floor; request_valid=1; @(negedge clk); request_valid=0; end endtask
task wait_for_door; integer cycles; begin cycles=0; while(!door_open && cycles<20) begin @(negedge clk); cycles=cycles+1; end if(!door_open) begin $display("FAIL: door did not open"); errors=errors+1; end else $display("PASS: door opened at floor %0d",current_floor); end endtask
initial begin $dumpfile("elevator.vcd"); $dumpvars(0,elevator_tb); repeat(2) @(negedge clk); reset=0; #1; check_floor(0); $display("TEST 1: Move from floor 0 to floor 3"); request(3); wait_for_door(); check_floor(3); repeat(5) @(negedge clk); $display("TEST 2: Move from floor 3 to floor 1"); request(1); wait_for_door(); check_floor(1); repeat(5) @(negedge clk); $display("TEST 3: Request the current floor"); request(1); wait_for_door(); check_floor(1); repeat(5) @(negedge clk); $display("TEST 4: Reset the controller"); reset=1; @(negedge clk); reset=0; #1; check_floor(0); if(errors==0) $display("ALL TESTS PASSED"); else $display("TESTS FAILED: %0d errors",errors); $finish; end
endmodule
