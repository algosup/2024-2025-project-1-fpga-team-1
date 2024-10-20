// In this file we define the colors of the player, the cars, the map and the background
// This way we can easily change the colors of the game without having to change the code
// In this file we instantiate the sprite memory and we define the position of the sprite on the screen

`include "constants.v"

module color_generation 
(
    input CLK,         // Clock
    input [9:0] player_x, player_y, car_x1, car_x2, car_x3, car_x4, car_x5, car_x6, car_x7, car_x8, // Player and car positions
    input VGA_R2, VGA_G2, VGA_B2, VGA_R0, VGA_R1, VGA_G0, VGA_G1, VGA_G2, VGA_B0, VGA_B1,    // VGA colors
    input [9:0] h_count, v_count, // VGA positions
);


    // sprite for the frog
    wire [8:0] sprite_data_frog;
    reg  [9:0] sprite_addr_frog;

    // sprite for the car
    wire [8:0] sprite_data_car;
    reg  [10:0] sprite_addr_car;

    // sprite for the road
    wire [8:0] sprite_data_road;
    reg  [9:0] sprite_addr_road;

    // Background color
    reg [9:0] r_background = 9'b000000000; 

    // VGA colors
    reg [8:0] r_VGA;    


    // Generation of VGA for player movement 
    always @(posedge CLK) begin   
        if (h_count < H_DISPLAY && v_count < V_DISPLAY) begin
            if(((h_count >= SAFE_X)  && (h_count < SAFE_X  + SAFE_WIDTH))     && 
              (((v_count >= SAFE_Y)  && (v_count < SAFE_Y  + SAFE_HEIGHT))    || 
               ((v_count >= SAFE_Y2) && (v_count < SAFE_Y2 + SAFE_HEIGHT))    || 
               ((v_count >= SAFE_Y3) && (v_count < SAFE_Y3 + SAFE_HEIGHT/2))))  begin
                r_background <= 9'b111111111;   // White (Safe zone)
            end else if ((h_count >= ROAD_x1) && (h_count < ROAD_x1 + ROAD_width) &&
                    (v_count >= ROAD_y1) && (v_count < ROAD_y1 + ROAD_height)) begin
                sprite_addr_road <= (v_count - ROAD_y1) * 32 + (h_count - ROAD_x1);
                    r_background <= sprite_data_road;
            end else if ((h_count >= ROAD_x2) && (h_count < ROAD_x2 + ROAD_width) &&
                    (v_count >= ROAD_y2) && (v_count < ROAD_y2 + ROAD_height)) begin
                sprite_addr_road <= (v_count - ROAD_y2) * 32 + (h_count - ROAD_x2);
                    r_background <= sprite_data_road;
            end else if ((h_count >= ROAD_x3) && (h_count < ROAD_x3 + ROAD_width) &&
                    (v_count >= ROAD_y3) && (v_count < ROAD_y3 + ROAD_height)) begin
                sprite_addr_road <= (v_count - ROAD_y3) * 32 + (h_count - ROAD_x3);
                    r_background <= sprite_data_road;
            end else if ((h_count >= ROAD_x4) && (h_count < ROAD_x4 + ROAD_width) &&
                    (v_count >= ROAD_y4) && (v_count < ROAD_y4 + ROAD_height)) begin
                sprite_addr_road <= (v_count - ROAD_y4) * 32 + (h_count - ROAD_x4);
                    r_background <= sprite_data_road;
            end else begin
                r_background <= 9'b000000000;   // Black (Background)
            end
            r_VGA <= r_background;
            if ((h_count >= player_x) && (h_count < player_x + PLAYER_WIDTH) &&
                (v_count >= player_y) && (v_count < player_y + PLAYER_HEIGHT)) begin
                sprite_addr_frog <= (v_count - player_y) * 32 + (h_count - player_x);
                if (sprite_data_frog != 9'b000000000)
                    r_VGA <= sprite_data_frog;
            end else if ((h_count >= car_x1) && (h_count < car_x1 + CAR_WIDTH) &&
                (v_count >= CAR_Y1) && (v_count < CAR_Y1 + CAR_HEIGHT)) begin
                sprite_addr_car <= (v_count - CAR_Y1) * 36 + (36-(h_count - car_x1));
                if (sprite_data_car != 9'b000000000)
                    r_VGA <= sprite_data_car;
            end else if ((h_count >= car_x2) && (h_count < car_x2 + CAR_WIDTH) &&
                (v_count >= CAR_Y2) && (v_count < CAR_Y2 + CAR_HEIGHT)) begin
                sprite_addr_car <= (v_count - CAR_Y2) * 36 + (h_count - car_x2);
                if (sprite_data_car != 9'b000000000)
                    r_VGA <= sprite_data_car;
            end else if ((h_count >= car_x3) && (h_count < car_x3 + CAR_WIDTH) &&
                (v_count >= CAR_Y3) && (v_count < CAR_Y3 + CAR_HEIGHT)) begin
                sprite_addr_car <= (v_count - CAR_Y3) * 36 + (36-(h_count - car_x3));
                if (sprite_data_car != 9'b000000000)
                    r_VGA <= sprite_data_car;
            end else if ((h_count >= car_x4) && (h_count < car_x4 + CAR_WIDTH) &&
                (v_count >= CAR_Y4) && (v_count < CAR_Y4 + CAR_HEIGHT)) begin
                sprite_addr_car <= (v_count - CAR_Y4) * 36 + (h_count - car_x4);
                if (sprite_data_car != 9'b000000000)
                    r_VGA <= sprite_data_car;
            end else if ((h_count >= car_x5) && (h_count < car_x5 + CAR_WIDTH) &&
                (v_count >= CAR_Y5) && (v_count < CAR_Y5 + CAR_HEIGHT)) begin
                sprite_addr_car <= (v_count - CAR_Y4) * 36 + (h_count - car_x4);
                if (sprite_data_car != 9'b000000000)
                    r_VGA <= sprite_data_car;
            end else if ((h_count >= car_x6) && (h_count < car_x6 + CAR_WIDTH) &&
                (v_count >= CAR_Y6) && (v_count < CAR_Y6 + CAR_HEIGHT)) begin
                sprite_addr_car <= (v_count - CAR_Y4) * 36 + (h_count - car_x4);
                if (sprite_data_car != 9'b000000000)
                    r_VGA <= sprite_data_car;
            end else if ((h_count >= car_x7) && (h_count < car_x7 + CAR_WIDTH) &&
                (v_count >= CAR_Y7) && (v_count < CAR_Y7 + CAR_HEIGHT)) begin
                sprite_addr_car <= (v_count - CAR_Y4) * 36 + (h_count - car_x4);
                if (sprite_data_car != 9'b000000000)
                    r_VGA <= sprite_data_car;
            end else if ((h_count >= car_x8) && (h_count < car_x8 + CAR_WIDTH) &&
                (v_count >= CAR_Y8) && (v_count < CAR_Y8 + CAR_HEIGHT)) begin
                sprite_addr_car <= (v_count - CAR_Y4) * 36 + (h_count - car_x4);
                if (sprite_data_car != 9'b000000000)
                    r_VGA <= sprite_data_car;
            end 
        end
        else begin
        r_VGA <= 9'b000000000;
        end
    end


    // VGA register to VGA output
        assign VGA_R0 = r_VGA[0];
        assign VGA_R1 = r_VGA[1];
        assign VGA_R2 = r_VGA[2];
        assign VGA_G0 = r_VGA[3];
        assign VGA_G1 = r_VGA[4];
        assign VGA_G2 = r_VGA[5];
        assign VGA_B0 = r_VGA[6];
        assign VGA_B1 = r_VGA[7];
        assign VGA_B2 = r_VGA[8];
    
    // Instanciation of the frog sprite memory
    sprite_ram_frog sprite_frog (
        .CLK(CLK),
        .addr(sprite_addr_frog),
        .data_out(sprite_data_frog)
    );

    // Instanciation of the car sprite memory
    sprite_ram_car sprite_car (
        .CLK(CLK),
        .addr(sprite_addr_car),
        .data_out(sprite_data_car)
    );
    
    // Instanciation of the car sprite memory
    sprite_ram_road sprite_road (
        .CLK(CLK),
        .addr(sprite_addr_road),
        .data_out(sprite_data_road)
    );

    endmodule



