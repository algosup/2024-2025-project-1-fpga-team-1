`timescale 1ns / 1ps

module main(
    input wire CLK,
    input wire SW1,
    input wire SW2,
    input wire SW3,
    input wire SW4,
    output wire VGA_HS,
    output wire VGA_VS,
    output reg  VGA_R2,
    output reg  VGA_G2,
    output reg  VGA_B2,
    output reg  VGA_R1,
    output reg  VGA_G1,
    output reg  VGA_B1
);

    localparam H_DISPLAY = 640;
    localparam V_DISPLAY = 480;
    localparam H_FRONT = 16;
    localparam H_PULSE = 96;
    localparam H_BACK = 48;
    localparam V_FRONT = 10;
    localparam V_PULSE = 2;
    localparam V_BACK = 33;
    localparam H_SYNC_CYCLES = H_DISPLAY + H_FRONT + H_PULSE + H_BACK;
    localparam V_SYNC_CYCLES = V_DISPLAY + V_FRONT + V_PULSE + V_BACK;
    localparam RECT_WIDTH = 17;
    localparam RECT_HEIGHT = 2;

    localparam PLAYER_WIDTH = 32;
    localparam PLAYER_HEIGHT = 32;
    localparam PLAYER_SPEED = 12500000/2;

    localparam CAR_WIDTH = 40;
    localparam CAR_HEIGHT = 32;
    localparam CAR_SPEED = 12500000/2;

    reg [9:0] h_count = 0;
    reg [9:0] v_count = 0;
    reg [9:0] player_x = H_DISPLAY / 2 - PLAYER_WIDTH / 2;
    reg [9:0] player_y = V_DISPLAY - PLAYER_HEIGHT - 32;
    reg [9:0] car_x = 200;
    reg [9:0] car_y = 320;
    reg [9:0] car_x2 = 0;
    reg [9:0] car_y2 = 384;
    reg [9:0] car_x3 = 508;
    reg [9:0] car_y3 = 416;
    reg [9:0] car_x4 = 600;
    reg [9:0] car_y4 = 448;

    always @(posedge CLK) begin
        if (h_count == H_SYNC_CYCLES - 1) begin
            h_count <= 0;
            if (v_count == V_SYNC_CYCLES - 1)
                v_count <= 0;
            else
                v_count <= v_count + 1;
        end else begin
            h_count <= h_count + 1;
        end
    end

    assign VGA_HS = (h_count >= H_DISPLAY + H_FRONT) && (h_count < H_DISPLAY + H_FRONT + H_PULSE);
    assign VGA_VS = (v_count >= V_DISPLAY + V_FRONT) && (v_count < V_DISPLAY + V_FRONT + V_PULSE);

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

    genvar i;
    generate
        for (i = 0; i < 90; i = i + 1) begin : square_active_gen
            assign square_active[i] = (h_count >= square_x[i]) && (h_count < square_x[i] + RECT_WIDTH) &&
                                      (v_count >= square_y[i]) && (v_count < square_y[i] + RECT_HEIGHT);
        end
    endgenerate

    reg [2:0] temp_red, temp_green, temp_blue;
    reg [89:0] square_active;

    always @(posedge CLK) begin
        temp_red = 3'b000;
        temp_green = 3'b000;
        temp_blue = 3'b000;

        if (square_active) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
    end

    reg [31:0] speed_count = 0;
    always @(posedge CLK) begin
        if (speed_count < PLAYER_SPEED) begin
            speed_count <= speed_count + 1;
        end
        if (SW1 && player_y > 0 && speed_count == PLAYER_SPEED) begin
            player_y <= player_y - 32;
            speed_count <= 0;
        end
        if (SW2 && player_y < V_DISPLAY - PLAYER_HEIGHT && speed_count == PLAYER_SPEED)begin
            player_y <= player_y + 32;
            speed_count <= 0;
        end
        if (SW3 && player_x > 0 && speed_count == PLAYER_SPEED)begin
            player_x <= player_x - 32;
            speed_count <= 0;
        end
        if (SW4 && player_x < H_DISPLAY - PLAYER_WIDTH && speed_count == PLAYER_SPEED)begin
            player_x <= player_x + 32;
            speed_count <= 0;
        end
        if (((player_x >= car_x && player_x <= car_x + CAR_WIDTH) || player_x + PLAYER_WIDTH >= car_x && player_x + PLAYER_WIDTH <= car_x + CAR_WIDTH && player_y == car_y)) begin
            player_x <= (H_DISPLAY / 2) - (PLAYER_WIDTH / 2);
            player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
        end
        if (((player_x >= car_x2 && player_x <= car_x2 + CAR_WIDTH) || player_x + PLAYER_WIDTH >= car_x2 && player_x + PLAYER_WIDTH <= car_x2 + CAR_WIDTH && player_y == car_y2)) begin
            player_x <= (H_DISPLAY / 2) - (PLAYER_WIDTH / 2);
            player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
        end
        if (((player_x >= car_x3 && player_x <= car_x3 + CAR_WIDTH) || player_x + PLAYER_WIDTH >= car_x3 && player_x + PLAYER_WIDTH <= car_x3 + CAR_WIDTH && player_y == car_y3)) begin
            player_x <= (H_DISPLAY / 2) - (PLAYER_WIDTH / 2);
            player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
        end
        if (((player_x >= car_x4 && player_x <= car_x4 + CAR_WIDTH) || player_x + PLAYER_WIDTH >= car_x4 && player_x + PLAYER_WIDTH <= car_x4 + CAR_WIDTH && player_y == car_y4)) begin
            player_x <= (H_DISPLAY / 2) - (PLAYER_WIDTH / 2);
            player_y <= V_DISPLAY - PLAYER_HEIGHT - 32;
        end
    end

    reg [31:0] speed_count1 = 0;
    always @(posedge CLK) begin
        if (speed_count1 < CAR_SPEED) begin
            speed_count1 <= speed_count1 + 1;
        end else if (speed_count1 >= CAR_SPEED) begin
            car_x <= car_x + 32 % H_DISPLAY; // Faire avancer la voiture 1
            car_x3 <= car_x3 + 32 % H_DISPLAY; // Faire avancer la voiture 3
            speed_count1 <= 0;
        end
    end

    reg [31:0] speed_count2 = 0;
    always @(posedge CLK) begin
        if (speed_count2 < CAR_SPEED) begin
            speed_count2 <= speed_count2 + 1;
        end else if (speed_count2 >= CAR_SPEED) begin
            car_x2 <= car_x2 + 20 % H_DISPLAY;
            speed_count2 <= 0;
        end else if (speed_count2 < CAR_SPEED) begin
            speed_count2 <= speed_count2 + 1;
        end else if (speed_count2 >= CAR_SPEED) begin
            car_x <= car_x + 32 % H_DISPLAY;
            speed_count2 <= 0;
        end
    end

    always @(posedge CLK) begin
        if (h_count < H_DISPLAY && v_count < V_DISPLAY) begin
            if ((h_count >= player_x) && (h_count < player_x + PLAYER_WIDTH) &&
                (v_count >= player_y) && (v_count < player_y + PLAYER_HEIGHT)) begin
                VGA_R2 <= 3'b000;
                VGA_G2 <= 3'b111;
                VGA_B2 <= 3'b000;
            end else if ((h_count >= car_x) && (h_count < car_x + CAR_WIDTH) &&
                        (v_count >= car_y) && (v_count < car_y + CAR_HEIGHT)) begin
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end else if ((h_count >= car_x2) && (h_count < car_x2 + CAR_WIDTH) &&
                        (v_count >= car_y2) && (v_count < car_y2 + CAR_HEIGHT)) begin
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end else if ((h_count >= car_x3) && (h_count < car_x3 + CAR_WIDTH) &&
                        (v_count >= car_y3) && (v_count < car_y3 + CAR_HEIGHT)) begin
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end else if ((h_count >= car_x4) && (h_count < car_x4 + CAR_WIDTH) &&
                        (v_count >= car_y4) && (v_count < car_y4 + CAR_HEIGHT)) begin
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end else begin
                VGA_R2 <= temp_red;
                VGA_G2 <= temp_green;
                VGA_B2 <= temp_blue;
            end
        end else begin
            VGA_R2 <= 3'b000;
            VGA_G2 <= 3'b000;
            VGA_B2 <= 3'b000;
        end
    end

    always @(posedge CLK) begin
        VGA_R1 <= 3'b000;
        VGA_G1 <= 3'b000;
        VGA_B1 <= 3'b000;
    end

endmodule
