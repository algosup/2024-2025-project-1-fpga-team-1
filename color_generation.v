`include "constants.v"
module color_generation 
(
    input CLK,         // Clock
    input [9:0] player_x, player_y, car_x1, car_x2, car_x3, car_x4, // Player and car positions
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


    // Square generation positions
        reg [9:0] square_x[0:89];
        reg [9:0] square_y[0:89];

    integer i;
    generate
        for (i = 0; i < 90; i = i + 1) begin
            assign square_x[i] = 10 + (i % 18) * 35;
            assign square_y[i] = 320 + (i / 18) * 32;
        end
    endgenerate

    wire square_active[0:89];

    // Square active generation
    genvar i;
    generate
        for (i = 0; i < 90; i = i + 1) begin : square_active_gen
            assign square_active[i] = (h_count >= square_x[i]) && (h_count < square_x[i] + RECT_WIDTH) &&
                                    (v_count >= square_y[i]) && (v_count < square_y[i] + RECT_HEIGHT);
        end
    endgenerate


    reg [89:0] square_active;

    // Square color generation
    always @(posedge CLK) begin
        temp_red = 0;
        temp_green = 0;
        temp_blue = 0;

        if (square_active) begin
            temp_red = 1;
            temp_green = 1;
            temp_blue = 1;
        end
    end


endmodule