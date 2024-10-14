//Frog Ranck Game
`timescale 1ns / 1ps

`include "constants.v"

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


// Color generation
    color_generation color_generation(
        .CLK(CLK),
        .player_x(player_x),
        .player_y(player_y),
        .car_x(car_x),
        .car_y(car_y),
        .car_x2(car_x2),
        .car_y2(car_y2),
        .car_x3(car_x3),
        .car_y3(car_y3),
        .car_x4(car_x4),
        .car_y4(car_y4),
        .VGA_R2(VGA_R2),
        .VGA_G2(VGA_G2),
        .VGA_B2(VGA_B2),
        .v_count(v_count),
        .h_count(h_count),
        .temp_red(temp_red),
        .temp_green(temp_green),
        .temp_blue(temp_blue),
    );

endmodule




