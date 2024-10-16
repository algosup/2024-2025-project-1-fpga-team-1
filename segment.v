/*`include "constants.v"

module segment (
    input wire CLK,
    input INC,  
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
);
    reg [3:0] units = 4'b0000;
    reg [3:0] tens = 4'b0000;

    always @(posedge CLK) begin
        if (INC == 1) begin
            if (units == 4'b1001) begin
                units <= 4'b0000;
                if (tens != 4'b1001) begin
                    tens <= tens + 1;
                end
            end else begin
                units <= units + 1;
            end
        end
    end
    always @(posedge CLK) begin
        {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1111111;
        {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1111111;
        case (tens)
            4'b0000: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0000001;
            4'b0001: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1001111;
            4'b0010: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0010010;
            4'b0011: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0000110;
            4'b0100: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1001100;
            4'b0101: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0100100;
            4'b0110: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0100000;
            default: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1111111;
        endcase
        case (units)
            4'b0000: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000001;
            4'b0001: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1001111;
            4'b0010: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0010010;
            4'b0011: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000110;
            4'b0100: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1001100;
            4'b0101: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0100100;
            4'b0110: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0100000;
            4'b0111: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0001111;
            4'b1000: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000000;
            4'b1001: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000100;
            default: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1111111;
        endcase
    end
endmodule






