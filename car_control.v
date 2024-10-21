// In this file we define the position of the cars on the screen
// We add the speed of the cars to the position of the cars
// And we add a speed_car parameter to increase the speed of the cars level by level

`include "constants.v"

module car_control (
    input CLK,         // Clock
    output [9:0] car_x1, car_x2, car_x3, car_x4, car_x5, car_x6, car_x7, car_x8, // Car positions
    input [4:0] speed_car, // Car speed
);

    reg [18:0] speed_count1 = 0;
    reg [18:0] speed_count2 = 0;

    // Initial car positions
    reg [9:0] r_car_x1 = CAR_X1;
    reg [9:0] r_car_x2 = CAR_X2;
    reg [9:0] r_car_x3 = CAR_X3;
    reg [9:0] r_car_x4 = CAR_X4;
    reg [9:0] r_car_x5 = CAR_X5;
    reg [9:0] r_car_x6 = CAR_X6;
    // reg [9:0] r_car_x7 = CAR_X7;
    // reg [9:0] r_car_x8 = CAR_X8;


    // Car movement speed
    always @(posedge CLK) begin
        if (speed_count1 < CAR_CLOCK) begin
            speed_count1 <= speed_count1 + 1;
        end else begin
            r_car_x1 <= r_car_x1 + CAR_1_SPEED + speed_car;
            r_car_x2 <= r_car_x2 - CAR_2_SPEED - speed_car;
            r_car_x3 <= r_car_x3 + CAR_4_SPEED + speed_car;
            r_car_x4 <= r_car_x4 - CAR_3_SPEED - speed_car;
            r_car_x5 <= r_car_x5 + CAR_1_SPEED + speed_car;
            r_car_x6 <= r_car_x6 - CAR_2_SPEED - speed_car;
            // r_car_x7 <= r_car_x7 + CAR_3_SPEED + speed_car;
            // r_car_x8 <= r_car_x8 - CAR_4_SPEED - speed_car;
            speed_count1 <= 0;
        end
    end

    // Car positions
    assign car_x1 = r_car_x1;
    assign car_x2 = r_car_x2;
    assign car_x3 = r_car_x3;
    assign car_x4 = r_car_x4;
    assign car_x5 = r_car_x5;
    assign car_x6 = r_car_x6;
    assign car_x7 = r_car_x7;
    assign car_x8 = r_car_x8;

endmodule