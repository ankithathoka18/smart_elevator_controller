module elevator_controller #(parameter DOOR_OPEN_CYCLES = 3) (input wire clk, input wire reset, input wire request_valid, input wire [1:0] requested_floor, output reg [1:0] current_floor, output wire moving_up, output wire moving_down, output wire door_open, output wire busy);
localparam IDLE=2'b00, MOVE_UP=2'b01, MOVE_DOWN=2'b10, DOOR_OPEN=2'b11;
reg [1:0] state;
reg [1:0] destination_floor;
reg [2:0] door_count;
assign moving_up=(state==MOVE_UP);
assign moving_down=(state==MOVE_DOWN);
assign door_open=(state==DOOR_OPEN);
assign busy=(state!=IDLE);
always @(posedge clk) begin
 if(reset) begin state<=IDLE; current_floor<=0; destination_floor<=0; door_count<=0; end
 else case(state)
 IDLE: begin door_count<=0; if(request_valid) begin destination_floor<=requested_floor; if(requested_floor>current_floor) state<=MOVE_UP; else if(requested_floor<current_floor) state<=MOVE_DOWN; else state<=DOOR_OPEN; end end
 MOVE_UP: begin if(current_floor<destination_floor) begin current_floor<=current_floor+1'b1; if((current_floor+1'b1)>=destination_floor) state<=DOOR_OPEN; end else state<=DOOR_OPEN; end
 MOVE_DOWN: begin if(current_floor>destination_floor) begin current_floor<=current_floor-1'b1; if((current_floor-1'b1)<=destination_floor) state<=DOOR_OPEN; end else state<=DOOR_OPEN; end
 DOOR_OPEN: begin if(DOOR_OPEN_CYCLES<=1) begin door_count<=0; state<=IDLE; end else if(door_count>=DOOR_OPEN_CYCLES-1) begin door_count<=0; state<=IDLE; end else door_count<=door_count+1'b1; end
 default: begin state<=IDLE; door_count<=0; end
 endcase
end
endmodule
