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
    
    // Car x and y position
    wire [9:0] w_car_x1 ;
    wire [9:0] w_car_x2 ;
    wire [9:0] w_car_x3 ;
    wire [9:0] w_car_x4 ;

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

    // Car control module
    car_control car_control(
        .CLK(CLK),
        .car_x1(w_car_x1),
        .car_x2(w_car_x2),
        .car_x3(w_car_x3),
        .car_x4(w_car_x4),
    );
   
    // Color generation
    color_generation color_generation(
        .CLK(CLK),
        .player_x(player_x),
        .player_y(player_y),
        .car_x1(w_car_x1),
        .car_x2(w_car_x2),
        .car_x3(w_car_x3),
        .car_x4(w_car_x4),
        .VGA_R2(VGA_R2),
        .VGA_G2(VGA_G2),
        .VGA_B2(VGA_B2),
        .v_count(v_count),
        .h_count(h_count),
        .temp_red(temp_red),
        .temp_green(temp_green),
        .temp_blue(temp_blue),
    );

    // // Collision detection module
    // wire collision_signal;

    // collision_detector cd(
    //     .player_x(player_x),
    //     .player_y(player_y),
    //     .car_x1(w_car_x1),
    //     .car_x2(w_car_x2),
    //     .car_x3(w_car_x3),
    //     .car_x4(w_car_x4),
    //     .collision(collision_signal)
    // );

    // always @(posedge CLK) begin
    //     // If collision detected, reset player position
    //     if (collision_signal) begin
    //         r_player_x <= H_DISPLAY / 2 ;
    //         r_player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
    //     end
    // end

    // reg r_player_x ;
    // reg r_player_y ;

    // assign player_x = r_player_x;
    // assign player_y = r_player_y;
    
endmodule




