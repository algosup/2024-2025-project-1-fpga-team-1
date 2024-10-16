`include "constants.v"
module color_generation 
(
    input CLK,         // Clock
    input [9:0] player_x, player_y, car_x1, car_x2, car_x3, car_x4, car_x5, car_x6, car_x7, car_x8, // Player and car positions
    output VGA_R2, VGA_G2, VGA_B2, // VGA colors
    input [9:0] h_count, v_count, // VGA positions
    input temp_red, temp_green, temp_blue // temp colors
);

    // VGA colors
    reg r_VGA_R2, r_VGA_G2, r_VGA_B2;

    // Generation of VGA for player movement 
    always @(posedge CLK) begin
        if (h_count < H_DISPLAY && v_count < V_DISPLAY) begin
            if ((h_count >= player_x) && (h_count < player_x + PLAYER_WIDTH) &&
                (v_count >= player_y) && (v_count < player_y + PLAYER_HEIGHT)) begin
                r_VGA_R2 <= 0;   // Green (Player)
                r_VGA_G2 <= 1;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x1) && (h_count < car_x1 + CAR_WIDTH) &&
                        (v_count >= CAR_Y1) && (v_count < CAR_Y1 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_1)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x2) && (h_count < car_x2 + CAR_WIDTH) &&
                        (v_count >= CAR_Y2) && (v_count < CAR_Y2 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_2)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x3) && (h_count < car_x3 + CAR_WIDTH) &&
                        (v_count >= CAR_Y3) && (v_count < CAR_Y3 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_3)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x4) && (h_count < car_x4 + CAR_WIDTH) &&
                        (v_count >= CAR_Y4) && (v_count < CAR_Y4 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_4)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x5) && (h_count < car_x5 + CAR_WIDTH) &&
                        (v_count >= CAR_Y5) && (v_count < CAR_Y5 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_5)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x6) && (h_count < car_x6 + CAR_WIDTH) &&
                        (v_count >= CAR_Y6) && (v_count < CAR_Y6 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_6)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            // end else if ((h_count >= car_x7) && (h_count < car_x7 + CAR_WIDTH) &&
            //             (v_count >= CAR_Y7) && (v_count < CAR_Y7 + CAR_HEIGHT)) begin
            //     r_VGA_R2 <= 1;   // Red (Car_7)
            //     r_VGA_G2 <= 0;
            //     r_VGA_B2 <= 0;
            // end else if ((h_count >= car_x8) && (h_count < car_x8 + CAR_WIDTH) &&
            //             (v_count >= CAR_Y8) && (v_count < CAR_Y8 + CAR_HEIGHT)) begin
            //     r_VGA_R2 <= 1;   // Red (Car_8)
            //     r_VGA_G2 <= 0;
            //     r_VGA_B2 <= 0;
            end else if ((h_count >= SAFE_X) && (h_count < SAFE_X + SAFE_WIDTH) &&
                        (v_count >= SAFE_Y) && (v_count < SAFE_Y + SAFE_HEIGHT)) begin
                r_VGA_R2 <= 0.9;   // SAFE ZONE TOP
                r_VGA_G2 <= 0.9;
                r_VGA_B2 <= 0.9;
            end else if ((h_count >= SAFE_X) && (h_count < SAFE_X + SAFE_WIDTH) &&
                        (v_count >= SAFE_Y2) && (v_count < SAFE_Y2 + SAFE_HEIGHT)) begin
                r_VGA_R2 <= 0.9;   // SAFE ZONE BOTTOM
                r_VGA_G2 <= 0.9;
                r_VGA_B2 <= 0.9;
            end else if ((h_count >= SAFE_X) && (h_count < SAFE_X + SAFE_WIDTH) &&
                        (v_count >= SAFE_Y3) && (v_count < SAFE_Y3 + SAFE_HEIGHT)) begin
                r_VGA_R2 <= 0.9;   // SAFE ZONE MIDDLE
                r_VGA_G2 <= 0.9;
                r_VGA_B2 <= 0.9;
            end else begin
                r_VGA_R2 <= temp_red;
                r_VGA_G2 <= temp_green;
                r_VGA_B2 <= temp_blue;
            end
        end else begin
            r_VGA_R2 <= 0;
            r_VGA_G2 <= 0;
            r_VGA_B2 <= 0;
        end
    end

    // VGA register to VGA output
        assign VGA_R2 = r_VGA_R2;
        assign VGA_G2 = r_VGA_G2;
        assign VGA_B2 = r_VGA_B2;

    // Square color generation
    always @(posedge CLK) begin
        temp_red = 0;
        temp_green = 0;
        temp_blue = 0;

    end


endmodule