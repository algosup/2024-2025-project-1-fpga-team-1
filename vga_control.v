
module vga_control(
    input CLK,
    output wire VGA_HS_r,      // Horizontal sync signal
    output wire VGA_VS_r,      // Vertical sync signal
    output wire VGA_R2_r, // Red color output (3 bits)
    output wire VGA_G2_r, // Green color output (3 bits)
    output wire VGA_B2_r, // Blue color output (3 bits)
    output wire VGA_R1_r, // Background color
    output wire VGA_G1_r, // Background color
    output wire VGA_B1_r, // Background color
    output wire [9:0] h_count_r,      // horizontal counters
    output wire [9:0] v_count_r,        // vertical counters 
    output wire [2:0] temp_red_r, temp_green_r, temp_blue_r     // color signals
);

    // Internal registers
    reg [9:0] h_count_reg;
    reg [9:0] v_count_reg;
    reg [2:0] VGA_R2_reg;
    reg [2:0] VGA_G2_reg;
    reg [2:0] VGA_B2_reg;
    reg [2:0] VGA_R1_reg;
    reg [2:0] VGA_G1_reg;
    reg [2:0] VGA_B1_reg;
    reg [2:0] VGA_HS_reg;
    reg [2:0] VGA_VS_reg;


    // Assign internal registers to output ports
    assign h_count_r = h_count_reg;
    assign v_count_r = v_count_reg;

    // VGA synchronization parameters
    assign VGA_R2_r = VGA_R2_reg;
    assign VGA_G2_r = VGA_G2_reg;
    assign VGA_B2_r = VGA_B2_reg;
    assign VGA_R1_r = VGA_R1_reg;
    assign VGA_G1_r = VGA_G1_reg;
    assign VGA_B1_r = VGA_B1_reg;
    assign VGA_HS_r = VGA_HS_reg;
    assign VGA_VS_r = VGA_VS_reg;


    // Horizontal and vertical counters for VGA synchronization
    always @(posedge CLK) begin
        if (h_count_reg == H_SYNC_CYCLES - 1) begin
            h_count_reg <= 0;
            if (v_count_reg == V_SYNC_CYCLES - 1)
                v_count_reg <= 0;
            else
                v_count_reg <= v_count_reg + 1;
        end else begin
            h_count_reg <= h_count_reg + 1;
        end
    end

    
    // VGA generation logic
    always @(posedge CLK) begin
        if (h_count_reg < H_DISPLAY && v_count_reg < V_DISPLAY) begin
            // Priority to player
            if ((h_count_reg >= player_x) && (h_count_reg < player_x + PLAYER_WIDTH) &&
                (v_count_reg >= player_y) && (v_count_reg < player_y + PLAYER_HEIGHT)) begin
                VGA_R2_reg <= 3'b000;
                VGA_G2_reg <= 3'b111;
                VGA_B2_reg <= 3'b000;
                end 
            if ((h_count_reg >= car_x) && (h_count_reg < car_x + CAR_WIDTH) &&
                (v_count_reg >= car_y) && (v_count_reg < car_y + CAR_HEIGHT)) begin
                VGA_R2_reg <= 3'b111;
                VGA_G2_reg <= 3'b000;
                VGA_B2_reg <= 3'b000;
            end 
            if ((h_count_reg >= car2_x) && (h_count_reg < car2_x + CAR2_WIDTH) &&
                (v_count_reg >= car2_y) && (v_count_reg < car2_y + CAR2_HEIGHT)) begin
                VGA_R2_reg <= 3'b111;
                VGA_G2_reg <= 3'b000;
                VGA_B2_reg <= 3'b000;
            end 
            if ((h_count_reg >= car3_x) && (h_count_reg < car3_x + CAR3_WIDTH) &&
                (v_count_reg >= car3_y) && (v_count_reg < car3_y + CAR3_HEIGHT)) begin
                VGA_R2_reg <= 3'b111;
                VGA_G2_reg <= 3'b000;
                VGA_B2_reg <= 3'b000;
            end 
            if ((h_count_reg >= car4_x) && (h_count_reg < car4_x + CAR4_WIDTH) &&
                (v_count_reg >= car4_y) && (v_count_reg < car4_y + CAR4_HEIGHT)) begin
                VGA_R2_reg <= 3'b111;
                VGA_G2_reg <= 3'b000;
                VGA_B2_reg <= 3'b000;
            end else begin
                // Draw the map in the background
                VGA_R2_reg <= temp_red_r;
                VGA_G2_reg <= temp_green_r;
                VGA_B2_reg <= temp_blue_r;
            end
        end else begin
            // Outside of display area
            VGA_R2_reg <= 3'b000;
            VGA_G2_reg <= 3'b000;
            VGA_B2_reg <= 3'b000;
        end
    end

    

    // Assign background colors to signals
    always @(posedge CLK) begin
        // Black background
        VGA_R1_reg <= 3'b000;  
        VGA_G1_reg <= 3'b000;
        VGA_B1_reg <= 3'b000;
    end

    // Sync signals
    assign VGA_HS_reg = (h_count_reg >= H_DISPLAY + H_FRONT) && (h_count_reg < H_DISPLAY + H_FRONT + H_PULSE);
    assign VGA_VS_reg = (v_count_reg >= V_DISPLAY + V_FRONT) && (v_count_reg < V_DISPLAY + V_FRONT + V_PULSE);



endmodule
