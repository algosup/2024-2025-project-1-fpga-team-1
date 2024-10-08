module maps (
    input CLk,
);

    reg [9:0] h_count = 0;  // Horizontal counter
    reg [9:0] v_count = 0;  // Vertical counter

    
    // Positions of the squares on the map
    reg [9:0] square_x[0:89]; // X positions
    reg [9:0] square_y[0:89]; // Y positions


    // Initialization of positions - manual values for each square
    initial begin
        // Assignments for the first row
        square_x[0] = 10;    square_y[0] = 286;
        square_x[1] = 45;    square_y[1] = 286;
        square_x[2] = 80;    square_y[2] = 286;
        square_x[3] = 115;   square_y[3] = 286;
        square_x[4] = 150;   square_y[4] = 286;
        square_x[5] = 185;   square_y[5] = 286;
        square_x[6] = 220;   square_y[6] = 286;
        square_x[7] = 255;   square_y[7] = 286;
        square_x[8] = 290;   square_y[8] = 286;
        square_x[9] = 325;   square_y[9] = 286;
        square_x[10] = 360;  square_y[10] = 286;
        square_x[11] = 395;  square_y[11] = 286;
        square_x[12] = 430;  square_y[12] = 286;
        square_x[13] = 465;  square_y[13] = 286;
        square_x[14] = 500;  square_y[14] = 286;
        square_x[15] = 535;  square_y[15] = 286;
        square_x[16] = 570;  square_y[16] = 286;
        square_x[17] = 605;  square_y[17] = 286;

        // Assignments for the second row
        square_x[18] = 10;   square_y[18] = 318;
        square_x[19] = 45;   square_y[19] = 318;
        square_x[20] = 80;   square_y[20] = 318;
        square_x[21] = 115;  square_y[21] = 318;
        square_x[22] = 150;  square_y[22] = 318;
        square_x[23] = 185;  square_y[23] = 318;
        square_x[24] = 220;  square_y[24] = 318;
        square_x[25] = 255;  square_y[25] = 318;
        square_x[26] = 290;  square_y[26] = 318;
        square_x[27] = 325;  square_y[27] = 318;
        square_x[28] = 360;  square_y[28] = 318;
        square_x[29] = 395;  square_y[29] = 318;
        square_x[30] = 430;  square_y[30] = 318;
        square_x[31] = 465;  square_y[31] = 318;
        square_x[32] = 500;  square_y[32] = 318;
        square_x[33] = 535;  square_y[33] = 318;
        square_x[34] = 570;  square_y[34] = 318;
        square_x[35] = 605;  square_y[35] = 318;

        // Assignments for the third row
        square_x[36] = 10;   square_y[36] = 350;
        square_x[37] = 45;   square_y[37] = 350;
        square_x[38] = 80;   square_y[38] = 350;
        square_x[39] = 115;  square_y[39] = 350;
        square_x[40] = 150;  square_y[40] = 350;
        square_x[41] = 185;  square_y[41] = 350;
        square_x[42] = 220;  square_y[42] = 350;
        square_x[43] = 255;  square_y[43] = 350;
        square_x[44] = 290;  square_y[44] = 350;
        square_x[45] = 325;  square_y[45] = 350;
        square_x[46] = 360;  square_y[46] = 350;
        square_x[47] = 395;  square_y[47] = 350;
        square_x[48] = 430;  square_y[48] = 350;
        square_x[49] = 465;  square_y[49] = 350;
        square_x[50] = 500;  square_y[50] = 350;
        square_x[51] = 535;  square_y[51] = 350;
        square_x[52] = 570;  square_y[52] = 350;
        square_x[53] = 605;  square_y[53] = 350;

        // Assignments for the fourth row
        square_x[54] = 10;   square_y[54] = 382;
        square_x[55] = 45;   square_y[55] = 382;
        square_x[56] = 80;   square_y[56] = 382;
        square_x[57] = 115;  square_y[57] = 382;
        square_x[58] = 150;  square_y[58] = 382;
        square_x[59] = 185;  square_y[59] = 382;
        square_x[60] = 220;  square_y[60] = 382;
        square_x[61] = 255;  square_y[61] = 382;
        square_x[62] = 290;  square_y[62] = 382;
        square_x[63] = 325;  square_y[63] = 382;
        square_x[64] = 360;  square_y[64] = 382;
        square_x[65] = 395;  square_y[65] = 382;
        square_x[66] = 430;  square_y[66] = 382;
        square_x[67] = 465;  square_y[67] = 382;
        square_x[68] = 500;  square_y[68] = 382;
        square_x[69] = 535;  square_y[69] = 382;
        square_x[70] = 570;  square_y[70] = 382;
        square_x[71] = 605;  square_y[71] = 382;
 

        // Assignments for the fifth row
         square_x[72] = 10;   square_y[72] = 414;
        square_x[73] = 45;   square_y[73] = 414;
        square_x[74] = 80;   square_y[74] = 414;
        square_x[75] = 115;  square_y[75] = 414;
        square_x[76] = 150;  square_y[76] = 414;
        square_x[77] = 185;  square_y[77] = 414;
        square_x[78] = 220;  square_y[78] = 414;
        square_x[79] = 255;  square_y[79] = 414;
        square_x[80] = 290;  square_y[80] = 414;
        square_x[81] = 325;  square_y[81] = 414;
        square_x[82] = 360;  square_y[82] = 414;
        square_x[83] = 395;  square_y[83] = 414;
        square_x[84] = 430;  square_y[84] = 414;
        square_x[85] = 465;  square_y[85] = 414;
        square_x[86] = 500;  square_y[86] = 414;
        square_x[87] = 535;  square_y[87] = 414;
        square_x[88] = 570;  square_y[88] = 414;
        square_x[89] = 605;  square_y[89] = 414;
    end

    // Signals for active squares, individually assigned
    wire square_active[0:89];

    // Display square colours (white)
    reg [2:0] temp_red, temp_green, temp_blue;

    always @(posedge CLK) begin
        temp_red = 3'b000;
        temp_green = 3'b000;
        temp_blue = 3'b000;

        //  Assign colours for each square
        if (square_active[0]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end else if (square_active[1]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        // Continue for all the squares until you reach square_active[89].
        else if (square_active[2]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[3]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[4]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[5]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[6]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[7]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[8]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[9]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[10]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[11]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[12]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[13]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[14]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[15]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[16]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[17]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[18]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[19]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[20]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[21]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[22]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[23]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[24]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[25]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[26]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[27]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[28]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[29]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[30]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[31]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[32]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[33]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[34]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[35]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[36]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[37]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[38]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[39]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[40]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[41]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[42]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[43]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[44]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[45]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[46]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[47]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[48]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[49]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[50]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[51]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[52]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[53]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[54]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[55]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[56]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[57]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[58]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[59]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[60]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[61]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[62]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[63]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[64]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[65]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[66]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[67]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[68]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[69]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[70]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[71]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[72]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[73]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[74]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[75]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[76]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[77]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[78]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[79]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[80]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[81]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[82]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[83]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[84]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[85]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[86]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[87]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[88]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
        else if (square_active[89]) begin
            temp_red = 3'b111;
            temp_green = 3'b111;
            temp_blue = 3'b111;
        end
    end

    
    genvar i;
    generate
        for (i = 0; i < 90; i = i + 1) begin : square_active_gen
            assign square_active[i] = (h_count >= square_x[i]) && (h_count < square_x[i] + RECT_WIDTH) &&
                                      (v_count >= square_y[i]) && (v_count < square_y[i] + RECT_HEIGHT);
        end
    endgenerate






endmodule


    