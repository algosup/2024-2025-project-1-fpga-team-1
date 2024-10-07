module (
    input CLK,
    input SW1, // Up
    input SW2, // Down
    input SW3, // Left
    input SW4, // Right
);
    reg [31:0] speed_count = 0; // Speed counter

    // Player movement
    always @(posedge CLK) begin
        if (speed_count < PLAYER_SPEED) begin
            speed_count <= speed_count + 1;
        end
        if (SW1 && player_y > 0 && speed_count == PLAYER_SPEED) begin
            player_y <= player_y - 32; // Up 
            speed_count <= 0;
        end
        if (SW2 && player_y < V_DISPLAY - PLAYER_HEIGHT && speed_count == PLAYER_SPEED)begin
         player_y <= player_y + 32; // Down 
         speed_count <= 0;
         end
        if (SW3 && player_x > 0 && speed_count == PLAYER_SPEED)begin
         player_x <= player_x - 32; // Left
         speed_count <= 0;
        end
        if (SW4 && player_x < H_DISPLAY - PLAYER_WIDTH && speed_count == PLAYER_SPEED)begin
         player_x <= player_x + 32; // Right 
         speed_count <= 0;
        end
        if (((player_x >= car_x && player_x <= car_x + CAR_WIDTH) || player_x + PLAYER_WIDTH >= car_x && player_x + PLAYER_WIDTH <= car_x + CAR_WIDTH && player_y == car_y)) begin
        player_x <= (H_DISPLAY / 2) - (PLAYER_WIDTH / 2);
        player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
        end
        if (((player_x >= car2_x && player_x <= car2_x + CAR2_WIDTH) || player_x + PLAYER_WIDTH >= car2_x && player_x + PLAYER_WIDTH <= car2_x + CAR2_WIDTH && player_y == car2_y)) begin
        player_x <= (H_DISPLAY / 2) - (PLAYER_WIDTH / 2);
        player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
        end
        if (((player_x >= car3_x && player_x <= car3_x + CAR3_WIDTH) || player_x + PLAYER_WIDTH >= car3_x && player_x + PLAYER_WIDTH <= car3_x + CAR3_WIDTH && player_y == car3_y)) begin
        player_x <= (H_DISPLAY / 2) - (PLAYER_WIDTH / 2);
        player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
        end
        if (((player_x >= car4_x && player_x <= car4_x + CAR4_WIDTH) || player_x + PLAYER_WIDTH >= car4_x && player_x + PLAYER_WIDTH <= car4_x + CAR4_WIDTH && player_y == car4_y)) begin
        player_x <= (H_DISPLAY / 2) - (PLAYER_WIDTH / 2);
        player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
        end



    end


endmodule