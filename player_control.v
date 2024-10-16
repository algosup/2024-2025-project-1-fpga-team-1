module player_control(
    input wire CLK,         // Clock
    input wire SW1,         // Up
    input wire SW2,         // Down
    input wire SW3,         // Left
    input wire SW4,         // Right
    output reg LED1, LED2, LED3, LED4, // LEDs
    input wire [9:0] car_x1, car_x2, car_x3, car_x4, car_x6 , car_x5, car_x7, car_x8, // Car positions
    output reg [9:0] rplayer_x, rplayer_y // Player position
);

    reg [31:0] speed_count = 0;    // Speed counter

    initial begin
        rplayer_x = 640/2;  // Player x position
        rplayer_y = 448;      // Player y position
        LED1 = 0;
        LED2 = 0;
        LED3 = 0;
        LED4 = 0;
    end

    always @(posedge CLK) begin
        if (speed_count < PLAYER_SPEED) begin
            speed_count <= speed_count + 1;
        end else begin
            speed_count <= 0;
            // Player movement
            if (SW1 && rplayer_y > 0) begin
                rplayer_y <= rplayer_y - 32;
                 speed_count <= 0;
            end else if (SW2 && rplayer_y < V_DISPLAY - PLAYER_HEIGHT) begin
                rplayer_y <= rplayer_y + 32;
                 speed_count <= 0;
            end else if (SW3 && rplayer_x > 0) begin
                rplayer_x <= rplayer_x - 32;
                 speed_count <= 0;
            end else if (SW4 && rplayer_x < H_DISPLAY - PLAYER_WIDTH) begin
                rplayer_x <= rplayer_x + 32;
                 speed_count <= 0;
            end
        end

        // Collision detection with car1
        if ((rplayer_x + PLAYER_WIDTH > car_x1) && (rplayer_x < car_x1 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y1) && (rplayer_y < CAR_Y1 + CAR_HEIGHT)) begin
            rplayer_x <= 640/2;
            rplayer_y <= 448;
        end

        // Collision detection with car2
        if ((rplayer_x + PLAYER_WIDTH > car_x2) && (rplayer_x < car_x2 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y2) && (rplayer_y < CAR_Y2 + CAR_HEIGHT)) begin
            rplayer_x <= 640/2;
            rplayer_y <= 448;
        end

        // Collision detection with car3
        if ((rplayer_x + PLAYER_WIDTH > car_x3) && (rplayer_x < car_x3 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y3) && (rplayer_y < CAR_Y3 + CAR_HEIGHT)) begin
            rplayer_x <= 640/2;
            rplayer_y <= 448;
        end

        // Collision detection with car4
        if ((rplayer_x + PLAYER_WIDTH > car_x4) && (rplayer_x < car_x4 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y4) && (rplayer_y < CAR_Y4 + CAR_HEIGHT)) begin
            rplayer_x <= 640/2;
            rplayer_y <= 448;
        end

        // Collision detection with car5
        if ((rplayer_x + PLAYER_WIDTH > car_x5) && (rplayer_x < car_x5 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y5) && (rplayer_y < CAR_Y5 + CAR_HEIGHT)) begin
            rplayer_x <= 640/2;
            rplayer_y <= 448;
        end

        // Collision detection with car6
        if ((rplayer_x + PLAYER_WIDTH > car_x6) && (rplayer_x < car_x6 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y6) && (rplayer_y < CAR_Y6 + CAR_HEIGHT)) begin
            rplayer_x <= 640/2;
            rplayer_y <= 448;
        end

        // Collision detection with car7
        if ((rplayer_x + PLAYER_WIDTH > car_x7) && (rplayer_x < car_x7 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y7) && (rplayer_y < CAR_Y7 + CAR_HEIGHT)) begin
            rplayer_x <= 640/2;
            rplayer_y <= 448;
        end

        // Collision detection with car8
        if ((rplayer_x + PLAYER_WIDTH > car_x8) && (rplayer_x < car_x8 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y8) && (rplayer_y < CAR_Y8 + CAR_HEIGHT)) begin
            rplayer_x <= 640/2;
            rplayer_y <= 448;
        end
    end
endmodule
