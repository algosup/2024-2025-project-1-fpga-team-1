// In this file we define the colors of the player, the cars, the map and the background
// This way we can easily change the colors of the game without having to change the code
// In this file we instantiate the sprite memory and we define the position of the sprite on the screen




`include "constants.v"
module color_generation 
(
    input CLK,         // Clock
    input [9:0] player_x, player_y, car_x1, car_x2, car_x3, car_x4, car_x5, car_x6, car_x7, car_x8, // Player and car positions
    output VGA_R2, VGA_G2, VGA_B2, // VGA colors
    input [9:0] h_count, v_count, // VGA positions
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
            end  else if ((h_count >= SAFE_X) && (h_count < SAFE_X + SAFE_WIDTH) &&
                        (v_count >= SAFE_Y) && (v_count < SAFE_Y + SAFE_HEIGHT)) begin
                r_VGA_R2 <= 1;   // SAFE ZONE TOP
                r_VGA_G2 <= 1;
                r_VGA_B2 <= 1;
            end else if ((h_count >= SAFE_X) && (h_count < SAFE_X + SAFE_WIDTH) &&
                        (v_count >= SAFE_Y2) && (v_count < SAFE_Y2 + SAFE_HEIGHT)) begin
                r_VGA_R2 <= 1;   // SAFE ZONE BOTTOM
                r_VGA_G2 <= 1;
                r_VGA_B2 <= 1;
            end else if ((h_count >= SAFE_X) && (h_count < SAFE_X + SAFE_WIDTH) &&
                        (v_count >= SAFE_Y3) && (v_count < SAFE_Y3 + SAFE_HEIGHT)) begin
                r_VGA_R2 <= 1;   // SAFE ZONE MIDDLE
                r_VGA_G2 <= 1;
                r_VGA_B2 <= 1;
            end else if ((h_count >= SPRITE_X) && (h_count < SPRITE_X + SPRITE_SIZE) &&
                     (v_count >= SPRITE_Y) && (v_count < SPRITE_Y + SPRITE_SIZE)) begin
            sprite_addr <= (v_count - SPRITE_Y) * SPRITE_SIZE + (h_count - SPRITE_X);
                r_VGA_R2 <= sprite_data[7:0];    // 8 bits pour le rouge
                r_VGA_G2 <= sprite_data[15:8];   // 8 bits pour le vert
                r_VGA_B2 <= sprite_data[23:16];  // 8 bits pour le bleu
            end
            else begin
            r_VGA_R2 <= 0;   // Black background color (default)
            r_VGA_G2 <= 0;
            r_VGA_B2 <= 0;
            end
        end
    else begin
        r_VGA_R2 <= 0;   // Black background color (default)
        r_VGA_G2 <= 0;
        r_VGA_B2 <= 0;
    end
end


    // VGA register to VGA output
        assign VGA_R2 = r_VGA_R2;
        assign VGA_G2 = r_VGA_G2;
        assign VGA_B2 = r_VGA_B2;


    // Position du sprite sur l'écran
    parameter SPRITE_X = 100;              // Position X de départ du sprite
    parameter SPRITE_Y = 100;             // Position Y de départ du sprite
    parameter SPRITE_SIZE = 32;           // Taille du sprite (16x16 pixels)

    // RAM pour les données du sprite
    wire [32:0] sprite_data;
    reg [32:0] sprite_addr;
    
    // Instanciation de la RAM pour le sprite
    sprite_ram sprite_memory (
        .CLK(CLK),
        .addr(sprite_addr),
        .data_out(sprite_data)
    );




endmodule



