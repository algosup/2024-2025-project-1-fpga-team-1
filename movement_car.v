module movement_car (
        input CLK, 
);

     
    reg [9:0] car_x = 0;        // Car position (X)
    reg [9:0] car_y = 288;      // Car position (Y)
    reg [9:0] car2_x = 0;       // Car 2 position (X)
    reg [9:0] car2_y = 320;     // Car 2 position (Y)
    reg [9:0] car3_x = 0;       // Car 3 position (X)
    reg [9:0] car3_y = 352;     // Car 3 position (Y)
    reg [9:0] car4_x = 0;       // Car 4 position (X)
    reg [9:0] car4_y = 384;     // Car 4 position (Y)


    reg [31:0] speed_count1 = 0;

    // Car movement
    always @(posedge CLK) begin
        if (speed_coun1 <  CAR_SPEED) begin
            speed_count1 <= speed_count1 + 1;
        end else if (speed_count1 >= CAR_SPEED) begin
            car_x <= car_x + 32 % H_DISPLAY;
            speed_count1 <= 0;
        end
    end

    reg [31:0] speed_count2 = 0;

    // Car 2 movement
    always @(posedge CLK) begin
        if (speed_count2 <  CAR2_SPEED) begin
            speed_count2 <= speed_count2 + 1;
        end else if (speed_count3 >= CAR2_SPEED) begin
            car2_x <= car2_x + 32 % H_DISPLAY;
            speed_count2 <= 0;
        end
    end

    reg [31:0] speed_count3 = 0;

    // Car 3 movement
    always @(posedge CLK) begin
        if (speed_count3 <  CAR3_SPEED) begin
            speed_count3 <= speed_count3 + 1;
        end else if (speed_count3 >= CAR3_SPEED) begin
            car3_x <= car3_x + 32 % H_DISPLAY;
            speed_count3 <= 0;
        end
    end

    reg [31:0] speed_count4 = 0;

    // Car 4 movement
    always @(posedge CLK) begin
        if (speed_count4 <  CAR4_SPEED) begin
            speed_count4 <= speed_count4 + 1;
        end else if (speed_count4 >= CAR4_SPEED) begin
            car4_x <= car4_x + 32 % H_DISPLAY;
            speed_count4 <= 0;
        end
    end


endmodule