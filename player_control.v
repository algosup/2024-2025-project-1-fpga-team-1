`include "constants.v"


// Player control module
module player_control(
    input wire CLK,         // Clock
    input wire SW1,         // Up
    input wire SW2,         // Down
    input wire SW3,         // Left
    input wire SW4,         // Right
    output wire [9:0] rplayer_x, rplayer_y // Player position
);

    reg [31:0] speed_count = 0;    // Speed counter

    initial begin
             rplayer_x = H_DISPLAY / 2 - PLAYER_WIDTH / 2;  // Player x position
             rplayer_y = V_DISPLAY - PLAYER_HEIGHT ;    // Player y position
    end

    always @(posedge CLK) 
    begin
            if (speed_count < PLAYER_SPEED) begin
                speed_count <= speed_count + 1;
            end
            if (SW1 && rplayer_y > 0 && speed_count == PLAYER_SPEED) begin
                rplayer_y <= rplayer_y - 32;
                speed_count <= 0;
            end
            if (SW2 && rplayer_y < V_DISPLAY - PLAYER_HEIGHT && speed_count == PLAYER_SPEED)begin
                rplayer_y <= rplayer_y + 32;
                speed_count <= 0;
            end
            if (SW3 && rplayer_x > 0 && speed_count == PLAYER_SPEED)begin
                rplayer_x <= rplayer_x - 32;
                speed_count <= 0;
            end
            if (SW4 && rplayer_x < H_DISPLAY - PLAYER_WIDTH && speed_count == PLAYER_SPEED)begin
                rplayer_x <= rplayer_x + 32;
                speed_count <= 0;
            end
    end


endmodule