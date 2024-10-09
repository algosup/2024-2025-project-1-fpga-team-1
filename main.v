`timescale 1ns / 1ps

`include "constants.v"


module main (
    input wire CLK,          // Main clock
    input wire SW1,          // Up
    input wire SW2,          // Down
    input wire SW3,          // Left
    input wire SW4,          // Right
    output wire VGA_HS,      // Horizontal sync signal
    output wire VGA_VS,      // Vertical sync signal
    output reg  VGA_R2,      // Red color output (3 bits)
    output reg  VGA_G2,      // Green color output (3 bits)
    output reg  VGA_B2,      // Blue color output (3 bits)
    output reg  VGA_R1,      // Background color
    output reg  VGA_G1,      // Background color
    output reg  VGA_B1       // Background color
);
    
wire [9:0] w_hcount ; // Vertical counter
wire [9:0] w_vcount ; // Horizontal counter

wire w_SW1, w_SW2, w_SW3, w_SW4;        // Debounced switches
    
movement_car movement_car_inst (
    .CLK(CLK),
    // .car_x(car_x),
    // .car_y(car_y),
    // .car2_x(car2_x),
    // .car2_y(car2_y),
    // .car3_x(car3_x),
    // .car3_y(car3_y),
    // .car4_x(car4_x),
    // .car4_y(car4_y),
    // .speed_count1(speed_count1)
);

localparam DEBOUNCE_LIMIT = 25000;    // 1 ms debounce filter

debounce_SW #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_SW1_inst (
    .CLK(CLK), 
    .SW(SW1),
    .SW_debounced(w_SW1));

debounce_SW #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_SW2_inst (
    .CLK(CLK), 
    .SW(SW2),
    .SW_debounced(w_SW2));

debounce_SW #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_SW3_inst (
    .CLK(CLK), 
    .SW(SW3),
    .SW_debounced(w_SW3));

debounce_SW #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_SW4_inst (
    .CLK(CLK), 
    .SW(SW4),
    .SW_debounced(w_SW4));
  

maps maps_inst (
    .CLK(CLK),
    .h_count(w_hcount),
    .v_count(w_vcount),
);


movement_player movement_player_inst (
    .CLK(CLK),
    .SW1(w_SW1),
    .SW2(w_SW2),
    .SW3(w_SW3),
    .SW4(w_SW4)
);

vga_control vga_control_inst (
    .CLK(CLK),
    .h_count(w_hcount),
    .v_count(w_vcount),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .VGA_R2(VGA_R2),
    .VGA_G2(VGA_G2),
    .VGA_B2(VGA_B2),
    .VGA_R1(VGA_R1),
    .VGA_G1(VGA_G1),
    .VGA_B1(VGA_B1)
);

assign h_count = w_hcount;
assign v_count = w_vcount;


endmodule

