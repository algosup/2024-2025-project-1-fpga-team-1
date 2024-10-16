module player_control(
    input wire CLK,         // Clock
    input wire SW1,         // Up
    input wire SW2,         // Down
    input wire SW3,         // Left
    input wire SW4,         // Right
    input wire [9:0] car_x1, car_x2, car_x3, car_x4, car_x6 , car_x5, car_x7, car_x8, // Car positions
    output reg [9:0] rplayer_x, rplayer_y, // Player position
    input INC,  
    output reg S1_A,
    output reg S1_B,
    output reg S1_C,
    output reg S1_D,
    output reg S1_E,
    output reg S1_F,
    output reg S1_G,
    output reg S2_A,
    output reg S2_B,
    output reg S2_C,
    output reg S2_D,
    output reg S2_E,
    output reg S2_F,
    output reg S2_G,
);

    reg [31:0] speed_count = 0;    // Speed counter

    reg is_collided = 0;           // Collision flag
    reg [3:0] units = 4'b0000;
    reg [3:0] tens = 4'b0000;

    initial begin
        rplayer_x = 640/2;  // Player x position
        rplayer_y = 448;      // Player y position
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
            is_collided <= 1;
        end

        // Collision detection with car2
        if ((rplayer_x + PLAYER_WIDTH > car_x2) && (rplayer_x < car_x2 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y2) && (rplayer_y < CAR_Y2 + CAR_HEIGHT)) begin
            is_collided <= 1;
        end

        // Collision detection with car3
        if ((rplayer_x + PLAYER_WIDTH > car_x3) && (rplayer_x < car_x3 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y3) && (rplayer_y < CAR_Y3 + CAR_HEIGHT)) begin
            is_collided <= 1;
        end

        // Collision detection with car4
        if ((rplayer_x + PLAYER_WIDTH > car_x4) && (rplayer_x < car_x4 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y4) && (rplayer_y < CAR_Y4 + CAR_HEIGHT)) begin
            is_collided <= 1;
        end

        // Collision detection with car5
        if ((rplayer_x + PLAYER_WIDTH > car_x5) && (rplayer_x < car_x5 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y5) && (rplayer_y < CAR_Y5 + CAR_HEIGHT)) begin
            is_collided <= 1;
        end

        // Collision detection with car6
        if ((rplayer_x + PLAYER_WIDTH > car_x6) && (rplayer_x < car_x6 + CAR_WIDTH) &&
            (rplayer_y + PLAYER_HEIGHT > CAR_Y6) && (rplayer_y < CAR_Y6 + CAR_HEIGHT)) begin
            is_collided <= 1;
        end
        // // Collision detection with car7
        // if ((rplayer_x + PLAYER_WIDTH > car_x7) && (rplayer_x < car_x7 + CAR_WIDTH) &&
        //     (rplayer_y + PLAYER_HEIGHT > CAR_Y7) && (rplayer_y < CAR_Y7 + CAR_HEIGHT)) begin
        //     is_collided <= 1;
        // end

        // // Collision detection with car8
        // if ((rplayer_x + PLAYER_WIDTH > car_x8) && (rplayer_x < car_x8 + CAR_WIDTH) &&
        //     (rplayer_y + PLAYER_HEIGHT > CAR_Y8) && (rplayer_y < CAR_Y8 + CAR_HEIGHT)) begin
        //     is_collided <= 1;
        // end

        if (is_collided || (SW1 && SW2 && SW3 && SW4)) begin
            rplayer_x <= H_DISPLAY / 2;
            rplayer_y <= V_DISPLAY - PLAYER_HEIGHT;
            is_collided <= 0;
            tens <= 4'b0000;
            units <= 4'b0000;
            speed_count <= 0;
        end

        if (rplayer_y == 0) begin
            if (units == 4'b1001) begin
                units <= 4'b0000;
                if (tens != 4'b1001) begin
                    tens <= tens + 1;
                end
            end else begin
                units <= units + 1;
            end
            rplayer_x <= H_DISPLAY / 2;
            rplayer_y <= V_DISPLAY - PLAYER_HEIGHT;
        end

        case (tens)
            4'b0000: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0000001;
            4'b0001: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1001111;
            4'b0010: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0010010;
            4'b0011: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0000110;
            4'b0100: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1001100;
            4'b0101: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0100100;
            4'b0110: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0100000;
            default: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0111000;
        endcase
        case (units)
            4'b0000: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000001;
            4'b0001: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1001111;
            4'b0010: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0010010;
            4'b0011: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000110;
            4'b0100: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1001100;
            4'b0101: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0100100;
            4'b0110: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0100000;
            4'b0111: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0001111;
            4'b1000: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000000;
            4'b1001: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000100;
            default: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0011000;
        endcase


    end








endmodule
