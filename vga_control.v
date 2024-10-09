module vga_control(
    input CLK,
    output wire VGA_HS,      // Horizontal sync signal
    output wire VGA_VS,      // Vertical sync signal
    output reg  VGA_R2,      // Red color output (3 bits)
    output reg  VGA_G2,      // Green color output (3 bits)
    output reg  VGA_B2,      // Blue color output (3 bits)
    output reg  VGA_R1,      // Background color
    output reg  VGA_G1,      // Background color
    output reg  VGA_B1,      // Background color
    output wire [9:0] h_count, // compteur horizontal
    output wire [9:0] v_count  // compteur vertical
    );

    // Horizontal and vertical counters for VGA synchronization
    always @(posedge CLK) begin
        if (h_count == H_SYNC_CYCLES - 1) begin
            h_count <= 0;
            if (v_count == V_SYNC_CYCLES - 1)
                v_count <= 0;
            else
                wv_ount <= v_count + 1;
        end else begin
            h_count <= h_count + 1;
        end
    end

    
    // VGA generation logic
    always @(posedge CLK) begin
        if (h_count < H_DISPLAY && v_count < V_DISPLAY) begin
            // Priority to player
            if ((h_count >= player_x) && (h_count < player_x + PLAYER_WIDTH) &&
                (v_count >= player_y) && (v_count < player_y + PLAYER_HEIGHT)) begin
                VGA_R2 <= 3'b000;
                VGA_G2 <= 3'b111;
                VGA_B2 <= 3'b000;
                end 
            if ((h_count >= car_x) && (h_count < car_x + CAR_WIDTH) &&
                        (v_count >= car_y) && (v_count < car_y + CAR_HEIGHT)) begin
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end 
            if ((h_count >= car2_x) && (h_count < car2_x + CAR2_WIDTH) &&
                        (v_count >= car2_y) && (v_count < car2_y + CAR2_HEIGHT)) begin
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end 
            if ((h_count >= car3_x) && (h_count < car3_x + CAR3_WIDTH) &&
                        (v_count >= car3_y) && (v_count < car3_y + CAR3_HEIGHT)) begin
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end 
            if ((h_count >= car4_x) && (h_count < car4_x + CAR4_WIDTH) &&
                        (v_count >= car4_y) && (v_count < car4_y + CAR4_HEIGHT)) begin
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end else begin
                // Draw the map in the background
                VGA_R2 <= temp_red;
                VGA_G2 <= temp_green;
                VGA_B2 <= temp_blue;
            end
        end else begin
            // Outside of display area
            VGA_R2 <= 3'b000;
            VGA_G2 <= 3'b000;
            VGA_B2 <= 3'b000;
        end
    end

    // Assign background colors to signals
    always @(posedge CLK) begin

        // Black background
        VGA_R1 <= 3'b000;  
        VGA_G1 <= 3'b000;
        VGA_B1 <= 3'b000;
    end

    // Sync signals
    assign VGA_HS = (h_count >= H_DISPLAY + H_FRONT) && (h_count < H_DISPLAY + H_FRONT + H_PULSE);
    assign VGA_VS = (v_count >= V_DISPLAY + V_FRONT) && (v_count < V_DISPLAY + V_FRONT + V_PULSE);



endmodule
