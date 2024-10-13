`include "constant.v"

module color_generation 
(
    input CLK,         // Clock
    input [9:0] player_x, player_y, car_x, car_y, car_x2, car_y2, car_x3, car_y3, car_x4, car_y4, // Player and car positions
    output VGA_R2, VGA_G2, VGA_B2, // VGA colors
    input [9:0] h_count, v_count, // VGA positions
    input temp_red, temp_green, temp_blue // temp colors
);

reg r_VGA_R2, r_VGA_G2, r_VGA_B2;

// Generation of VGA for player movement 
    always @(posedge CLK) begin
        if (h_count < H_DISPLAY && v_count < V_DISPLAY) begin
            if ((h_count >= player_x) && (h_count < player_x + PLAYER_WIDTH) &&
                (v_count >= player_y) && (v_count < player_y + PLAYER_HEIGHT)) begin
                r_VGA_R2 <= 0;   // Green (Player)
                r_VGA_G2 <= 1;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x) && (h_count < car_x + CAR_WIDTH) &&
                        (v_count >= car_y) && (v_count < car_y + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_1)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x2) && (h_count < car_x2 + CAR_WIDTH) &&
                        (v_count >= car_y2) && (v_count < car_y2 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_2)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x3) && (h_count < car_x3 + CAR_WIDTH) &&
                        (v_count >= car_y3) && (v_count < car_y3 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_3)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
            end else if ((h_count >= car_x4) && (h_count < car_x4 + CAR_WIDTH) &&
                        (v_count >= car_y4) && (v_count < car_y4 + CAR_HEIGHT)) begin
                r_VGA_R2 <= 1;   // Red (Car_4)
                r_VGA_G2 <= 0;
                r_VGA_B2 <= 0;
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

endmodule