`include "constants.v"
module car_control (
    input CLK,         // Clock
    output [9:0] car_x1, car_x2, car_x3, car_x4 // Car positions
);

    reg [31:0] speed_count1 = 0;
    reg [31:0] speed_count2 = 0;

    // Initial car positions
    reg [9:0] r_car_x1 = CAR_X1;
    reg [9:0] r_car_x2 = CAR_X2;
    reg [9:0] r_car_x3 = CAR_X3;
    reg [9:0] r_car_x4 = CAR_X4;

    // Car movement speed
    always @(posedge CLK) begin
        if (speed_count1 < CAR_SPEED) begin
            speed_count1 <= speed_count1 + 1;
        end else if (speed_count1 >= CAR_SPEED) begin
            r_car_x1 <= r_car_x1 + 1 ;
            r_car_x2 <= r_car_x2 + 1 ;
            r_car_x4 <= r_car_x4 + 1 ;
            r_car_x3 <= r_car_x3 + 1 ;
            speed_count1 <= 0;
        end
        // if (speed_count2 < CAR_SPEED) begin
        //     speed_count2 <= speed_count2 + 1;
        // end else if (speed_count2 >= CAR_SPEED) begin
        //     r_car_x4 <= r_car_x4 + 1 % H_DISPLAY;
        //     r_car_x3 <= r_car_x3 + 1 % H_DISPLAY;
        //     speed_count2 <= 0;
        // end    
    end

    // Car positions
    assign car_x1 = r_car_x1;
    assign car_x2 = r_car_x2;
    assign car_x3 = r_car_x3;
    assign car_x4 = r_car_x4;

endmodule