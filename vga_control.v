// ***********************************************************************
//
// VGA Control Module
//
// Description: In this file, we define the VGA parameters to
// display the game on the screen. We define the horizontal and
// vertical counters to generate the HSYNC and VSYNC signals needed to control
// the VGA display.
//
// *************************************************************************

`include "constants.v"

module vga_control(
    input wire CLK,         // Clock
    output wire VGA_HS,     // HSYNC
    output wire VGA_VS,      // VSYNC
    output wire [9:0] v_count, h_count // Vertical and Horizontal counters
);
    
    reg [9:0] r_h_count = 0;    // Horizontar counter
    reg [9:0] r_v_count = 0;    // Verticar counter
    
    
    
    // VGA signals generation
    always @(posedge CLK) begin
        if (r_h_count == H_SYNC_CYCLES - 1) begin
            r_h_count <= 0;
            if (r_v_count == V_SYNC_CYCLES - 1)
                r_v_count <= 0;
            else
                r_v_count <= r_v_count + 1;
        end else begin
            r_h_count <= r_h_count + 1;
        end
    end

    // VGA signals
    assign VGA_HS = (r_h_count >= H_DISPLAY + H_FRONT) && (r_h_count < H_DISPLAY + H_FRONT + H_PULSE);
    assign VGA_VS = (r_v_count >= V_DISPLAY + V_FRONT) && (r_v_count < V_DISPLAY + V_FRONT + V_PULSE);

    // VGA counters
    assign v_count = r_v_count;
    assign h_count = r_h_count;


endmodule
