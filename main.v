//Frog Ranck Game
`timescale 1ns / 1ps

`include "constant.v"

module main(
    input  CLK,         // Clock
    input  SW1,         // Up
    input  SW2,         // Down
    input  SW3,         // Left
    input  SW4,         // Right
    output  VGA_HS,     // HSYNC
    output  VGA_VS,     // VSYNC
    output  VGA_R2,     // VGA Red
    output  VGA_G2,     // VGA Green
    output  VGA_B2,     // VGA Blue
);

    // VGA signals
    wire [9:0] h_count, v_count;
    reg VGA_R2, VGA_G2, VGA_B2;

    // Player x and y  position
    wire [9:0] player_x, player_y  ;  

    // Car x and y positions
    reg [9:0] car_x = 200; 
    reg [9:0] car_y = 320;    
    reg [9:0] car_x2 = 400;     
    reg [9:0] car_y2 = 384 - CAR_HEIGHT;   
    reg [9:0] car_x3 = 508;         
    reg [9:0] car_y3 = 416 - CAR_HEIGHT;
    reg [9:0] car_x4 = 600;
    reg [9:0] car_y4 = 448 - CAR_HEIGHT;


    // VGA control module
    vga_control vga_control(
        .CLK(CLK),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .v_count(v_count),
        .h_count(h_count)
    );


    // Player control module
    player_control player_control(
        .CLK(CLK),
        .SW1(SW1),
        .SW2(SW2),
        .SW3(SW3),
        .SW4(SW4),
        .rplayer_x(player_x),
        .rplayer_y(player_y)
    );


    

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

    reg [2:0] temp_red, temp_green, temp_blue;
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


    reg [31:0] speed_count1 = 0;
    reg [31:0] speed_count2 = 0;

    // Car movement speed
    always @(posedge CLK) begin
        if (speed_count1 < CAR_SPEED) begin
            speed_count1 <= speed_count1 + 1;
        end else if (speed_count1 >= CAR_SPEED) begin
            car_x <= car_x + 32 % H_DISPLAY;
            car_x3 <= car_x3 + 20 % H_DISPLAY;
            speed_count1 <= 0;
        end
        if (speed_count2 < CAR_SPEED) begin
            speed_count2 <= speed_count2 + 1;
        end else if (speed_count2 >= CAR_SPEED) begin
            car_x4 <= car_x4 + 32 % H_DISPLAY;
            car_x2 <= car_x2 + 20 % H_DISPLAY;
            speed_count2 <= 0;
        end    
    end



    // Generation of VGA for player movement 
    always @(posedge CLK) begin
        if (h_count < H_DISPLAY && v_count < V_DISPLAY) begin
            if ((h_count >= player_x) && (h_count < player_x + PLAYER_WIDTH) &&
                (v_count >= player_y) && (v_count < player_y + PLAYER_HEIGHT)) begin
                VGA_R2 <= 0;   // Green (Player)
                VGA_G2 <= 1;
                VGA_B2 <= 0;
            end else if ((h_count >= car_x) && (h_count < car_x + CAR_WIDTH) &&
                        (v_count >= car_y) && (v_count < car_y + CAR_HEIGHT)) begin
                VGA_R2 <= 1;   // Red (Car_1)
                VGA_G2 <= 0;
                VGA_B2 <= 0;
            end else if ((h_count >= car_x2) && (h_count < car_x2 + CAR_WIDTH) &&
                        (v_count >= car_y2) && (v_count < car_y2 + CAR_HEIGHT)) begin
                VGA_R2 <= 1;   // Red (Car_2)
                VGA_G2 <= 0;
                VGA_B2 <= 0;
            end else if ((h_count >= car_x3) && (h_count < car_x3 + CAR_WIDTH) &&
                        (v_count >= car_y3) && (v_count < car_y3 + CAR_HEIGHT)) begin
                VGA_R2 <= 1;   // Red (Car_3)
                VGA_G2 <= 0;
                VGA_B2 <= 0;
            end else if ((h_count >= car_x4) && (h_count < car_x4 + CAR_WIDTH) &&
                        (v_count >= car_y4) && (v_count < car_y4 + CAR_HEIGHT)) begin
                VGA_R2 <= 1;   // Red (Car_4)
                VGA_G2 <= 0;
                VGA_B2 <= 0;
            end else begin
                VGA_R2 <= temp_red;
                VGA_G2 <= temp_green;
                VGA_B2 <= temp_blue;
            end
        end else begin
            VGA_R2 <= 0;
            VGA_G2 <= 0;
            VGA_B2 <= 0;
        end
    end

// VGA register to VGA output
assign VGA_R = VGA_R2;
assign VGA_G = VGA_G2;
assign VGA_B = VGA_B2;

endmodule




