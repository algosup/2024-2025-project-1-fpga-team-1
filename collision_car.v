`include "constants.v"

module collision_detector(
    input wire [9:0] player_x,    // Position of player x
    input wire [9:0] player_y,    // Position of player y
    input wire [9:0] car_x1, car_x2, car_x3, car_x4, // Car positions in x
    output reg collision          // Indication of collision
);



    // Always block to detect collision
    always @(*) begin
        collision = 0;  // Initialize collision to 0

        // Verifying collision with car 1
        if ((player_x < car_x1 + CAR_WIDTH) && (player_x + PLAYER_WIDTH > car_x1) &&
            (player_y < CAR_Y1 + CAR_HEIGHT) && (player_y + PLAYER_HEIGHT > CAR_Y1)) begin
            collision = 1;
        end

        // Verifying collision with car 2
        if ((player_x < car_x2 + CAR_WIDTH) && (player_x + PLAYER_WIDTH > car_x2) &&
            (player_y < CAR_Y2 + CAR_HEIGHT) && (player_y + PLAYER_HEIGHT > CAR_Y2)) begin
            collision = 1;
        end

        // Verifying collision with car 3
        if ((player_x < car_x3 + CAR_WIDTH) && (player_x + PLAYER_WIDTH > car_x3) &&
            (player_y < CAR_Y3 + CAR_HEIGHT) && (player_y + PLAYER_HEIGHT > CAR_Y3)) begin
            collision = 1;
        end

        // Verifying collision with car 4
        if ((player_x < car_x4 + CAR_WIDTH) && (player_x + PLAYER_WIDTH > car_x4) &&
            (player_y < CAR_Y4 + CAR_HEIGHT) && (player_y + PLAYER_HEIGHT > CAR_Y4)) begin
            collision = 1;
        end
    end

endmodule