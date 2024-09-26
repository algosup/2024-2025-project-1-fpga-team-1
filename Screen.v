module main(
    input wire CLK,          // Main clock
    input wire SW1,         // Reset button
    output wire VGA_HS,     // Horizontal sync signal
    output wire VGA_VS,     // Vertical sync signal
    output reg  VGA_R2,     // Red color output (3 bits)
    output reg  VGA_G2,     // Green color output (3 bits)
    output reg  VGA_B2,     // Blue color output (3 bits)
    output reg  VGA_R1,
    output reg  VGA_G1,
    output reg  VGA_B1   
);

    // Defining standard VGA resolution 640x480
    localparam H_DISPLAY = 640;  // Width of the display area
    localparam V_DISPLAY = 480;  // Height of the display area
    localparam H_FRONT = 16;
    localparam H_PULSE = 96;
    localparam H_BACK = 48;
    localparam V_FRONT = 10;
    localparam V_PULSE = 2;
    localparam V_BACK = 33;
    localparam H_SYNC_CYCLES = H_DISPLAY + H_FRONT + H_PULSE + H_BACK;
    localparam V_SYNC_CYCLES = V_DISPLAY + V_FRONT + V_PULSE + V_BACK;
    localparam RECT_WIDHT = 15 ;  // Width of the rectangle
    localparam RECT_HEIGHT = 10 ;  // Height of the rectangle

    reg [9:0] h_count = 0;  // Horizontal counter
    reg [9:0] v_count = 0;  // Vertical counter
    reg [2:0] red;          // Red color signal (3 bits)
    reg [2:0] green;        // Green color signal (3 bits)
    reg [2:0] blue;         // Blue color signal (3 bits)
    wire clk = CLK;         // Alias for the CLK input
    wire reset = SW1;       // Alias for SW1 as the reset signal

    // Horizontal and vertical counters
    always @(posedge clk) begin
        if (reset) begin
            h_count <= 0;
            v_count <= 0;
        end else begin
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
    end

    // Generating sync signals
    assign VGA_HS = (h_count >= H_DISPLAY + H_FRONT) && (h_count < H_DISPLAY + H_FRONT + H_PULSE);
    assign VGA_VS = (v_count >= V_DISPLAY + V_FRONT) && (v_count < V_DISPLAY + V_FRONT + V_PULSE);

    // Calculating X and Y positions on the screen
    wire display_area = (h_count < H_DISPLAY) && (v_count < V_DISPLAY);
  
    reg [59:0] square_x[0:59]; // X positions for each square
    reg [59:0] square_y[0:59]; // Y positions for each square

    // Initializing square positions
    initial begin
        // Assign X and Y coordinates for different rows
        square_x[0] = 50;  square_x[1] = 125; square_x[2] = 200; square_x[3] = 275;
        square_x[4] = 350; square_x[5] = 425; square_x[6] = 495; square_x[7] = 570;
        square_x[8] = 640; square_x[9] = 710;

        // All Y positions are the same to align squares in the same row
        square_y[0] = 100;  square_y[1] = 100;  square_y[2] = 100;  square_y[3] = 100;
        square_y[4] = 100;  square_y[5] = 100;  square_y[6] = 100;  square_y[7] = 100;
        square_y[8] = 100;  square_y[9] = 100;

        // Assign X and Y coordinates for the next row
        square_y[10] = 150;  square_y[11] = 150; square_y[12] = 150; square_y[13] = 150;
        square_y[14] = 150; square_y[15] = 150; square_y[16] = 150; square_y[17] = 150;
        square_y[18] = 150; square_y[19] = 150;

        // Assign coordinates for more rows following the same pattern
        square_y[20] = 200;  square_y[21] = 200; square_y[22] = 200; square_y[23] = 200;
        square_y[24] = 200; square_y[25] = 200; square_y[26] = 200; square_y[27] = 200;
        square_y[28] = 200; square_y[29] = 200;

        square_y[30] = 250; square_y[31] = 250; square_y[32] = 250; square_y[33] = 250;
        square_y[34] = 250; square_y[35] = 250; square_y[36] = 250; square_y[37] = 250;
        square_y[38] = 250; square_y[39] = 250;

        square_y[40] = 300; square_y[41] = 300; square_y[42] = 300; square_y[43] = 300;
        square_y[44] = 300; square_y[45] = 300; square_y[46] = 300; square_y[47] = 300;
        square_y[48] = 300; square_y[49] = 300;

        square_y[50] = 350; square_y[51] = 350; square_y[52] = 350; square_y[53] = 350;
        square_y[54] = 350; square_y[55] = 350; square_y[56] = 350; square_y[57] = 350;
        square_y[58] = 350; square_y[59] = 350;
    end

    // Temporary variables for colors
    reg [2:0] temp_red, temp_green, temp_blue;

    // Signals to determine if a square is active
    wire square_active[0:19];
    
    // Generating loop to check each square
    genvar i;
    generate
        for (i = 0; i < 50; i = i + 1) begin : square_check
            assign square_active[i] = (h_count >= square_x[i]) && (h_count < square_x[i] + RECT_WIDHT) &&
                                      (v_count >= square_y[i]) && (v_count < square_y[i] + RECT_HEIGHT);
        end
    endgenerate

    // Combinational block to assign colors based on the active square
    always @(posedge CLK) begin
        // Initialize default color (black background)
        temp_red = 3'b000;
        temp_green = 3'b000;
        temp_blue = 3'b000;

        // Check each square and assign a white color if active
        if (square_active[0]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111;
        end else if (square_active[1]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111;
        end
        // Add additional square checks as needed
        // ... similar else-if blocks for remaining squares
    end

    // Assigning colors to VGA outputs in the sequential block
    always @(posedge clk) begin
        if (reset) begin
            red <= 3'b000;
            green <= 3'b000;
            blue <= 3'b000;
        end else if (display_area) begin
            red <= temp_red;
            green <= temp_green;
            blue <= temp_blue;
        end
    end

    // Assigning colors to VGA outputs
    always @(posedge clk) begin
        VGA_R2 <= red[2];
        VGA_G2 <= green[2];
        VGA_B2 <= blue[2];
        VGA_R1 <= red[2];
        VGA_G1 <= green[2];
        VGA_B1 <= blue[2];
    end
endmodule