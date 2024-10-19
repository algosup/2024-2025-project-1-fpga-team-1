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
    output reg S1_A,
    output reg S1_B,
    output reg S1_C,
    output reg S1_D,
    output reg S1_E,
    output reg S1_F,
    output reg S1_G,
    output reg S2_A,
    output reg S2_B,
    output reg S2_C,
    output reg S2_D,
    output reg S2_E,
    output reg S2_F,
    output reg S2_G,
    output LED1,
    output LED2,
    output LED3,
    output LED4
);

    // Speed counter
    wire [4:0] w_speed_car;

    // VGA signals
    wire [9:0] h_count, v_count;

    // Player x and y  position
    wire [9:0] player_x, player_y  ;  

    // Switches
    wire SW1, SW2, SW3, SW4;
    
    // Car x and y position
    wire [9:0] w_car_x1 ;
    wire [9:0] w_car_x2 ;
    wire [9:0] w_car_x3 ;
    wire [9:0] w_car_x4 ;
    wire [9:0] w_car_x5 ;
    wire [9:0] w_car_x6 ;
    wire [9:0] w_car_x7 ;
    wire [9:0] w_car_x8 ;

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
        .car_x1(w_car_x1),
        .car_x2(w_car_x2),
        .car_x3(w_car_x3),
        .car_x4(w_car_x4),
        .car_x5(w_car_x5),
        .car_x6(w_car_x6),
        .car_x7(w_car_x7),
        .car_x8(w_car_x8),
        .rplayer_x(player_x),
        .rplayer_y(player_y),
        .S1_A(S1_A),
        .S1_B(S1_B),
        .S1_C(S1_C),
        .S1_D(S1_D),
        .S1_E(S1_E),
        .S1_F(S1_F),
        .S1_G(S1_G),
        .S2_A(S2_A),
        .S2_B(S2_B),
        .S2_C(S2_C),
        .S2_D(S2_D),
        .S2_E(S2_E),
        .S2_F(S2_F),
        .S2_G(S2_G),
        .LED1(LED1),
        .LED2(LED2),
        .LED3(LED3),
        .LED4(LED4),
        .speed_car(w_speed_car)
    );


    // Car control module
    car_control car_control(
        .CLK(CLK),
        .car_x1(w_car_x1),
        .car_x2(w_car_x2),
        .car_x3(w_car_x3),
        .car_x4(w_car_x4),
        .car_x5(w_car_x5),
        .car_x6(w_car_x6),
        .car_x7(w_car_x7),
        .car_x8(w_car_x8),
        .speed_car(w_speed_car),
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
        .car_x5(w_car_x5),
        .car_x6(w_car_x6),
        .car_x7(w_car_x7),
        .car_x8(w_car_x8),
        .VGA_R2(VGA_R2),
        .VGA_G2(VGA_G2),
        .VGA_B2(VGA_B2),
        .v_count(v_count),
        .h_count(h_count),
    );


    
endmodule

