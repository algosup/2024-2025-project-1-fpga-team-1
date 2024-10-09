`timescale 1ns / 1ps

module main(
    input wire CLK,          // Horloge principale
    input wire SW1,         // haut 
    input wire SW2,         // bas 
    input wire SW3,         // Gauche
    input wire SW4,         // Droite
    output wire VGA_HS,     // Signal de synchronisation horizontale
    output wire VGA_VS,     // Signal de synchronisation verticale
    output reg  VGA_R2,     // Sortie couleur rouge (3 bits)
    output reg  VGA_G2,     // Sortie couleur verte (3 bits)
    output reg  VGA_B2,     // Sortie couleur bleue (3 bits)
    output reg  VGA_R1,     // Couleur de fond
    output reg  VGA_G1,     // Couleur de fond
    output reg  VGA_B1      // Couleur de fond
>>>>>>> parent of 80f2ab7 (add a good movement and one car):Screen.v
);
    
    // Positions of the squares on the map
    reg [9:0] square_x[0:89]; // X positions
    reg [9:0] square_y[0:89]; // Y positions

    // Paramètres VGA et rectangle
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
    localparam RECT_WIDTH = 17;   // Largeur des rectangles
    localparam RECT_HEIGHT = 10;  // Hauteur des rectangles

    // Paramètres du joueur
    localparam PLAYER_WIDTH = 30;
    localparam PLAYER_HEIGHT = 50;
    localparam PLAYER_SPEED = 250000;

    reg [9:0] h_count = 0;  // Compteur horizontal
    reg [9:0] v_count = 0;  // Compteur vertical
    reg [9:0] player_x = H_DISPLAY / 2 - PLAYER_WIDTH / 2;  // Position du joueur
    reg [9:0] player_y = V_DISPLAY / 2 - PLAYER_HEIGHT / 2;

    reg [31:0] r_PLAYER_COUNT = 0;


    // Compteurs horizontaux et verticaux pour la synchronisation VGA
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

    // Signaux de synchronisation
    assign VGA_HS = (h_count >= H_DISPLAY + H_FRONT) && (h_count < H_DISPLAY + H_FRONT + H_PULSE);
    assign VGA_VS = (v_count >= V_DISPLAY + V_FRONT) && (v_count < V_DISPLAY + V_FRONT + V_PULSE);

    // Position des rectangles sur la carte
    reg [9:0] square_x[0:89]; // Positions X
    reg [9:0] square_y[0:89]; // Positions Y

    // Initialisation des positions
    integer i;
    initial begin
        for (i = 0; i < 90; i = i + 1) begin
            square_x[i] = 10 + (i % 18) * 35;
            square_y[i] = 100 + (i / 18) * 75;
        end
    end

    // Signaux pour les carrés actifs
    wire square_active[0:89];
    generate
        genvar idx;
        for (idx = 0; idx < 90; idx = idx + 1) begin : square_check
            assign square_active[idx] = (h_count >= square_x[idx]) && (h_count < square_x[idx] + RECT_WIDTH) &&
                                        (v_count >= square_y[idx]) && (v_count < square_y[idx] + RECT_HEIGHT);
        end
    endgenerate

    // Affichage des couleurs des carrés (blanc)
    reg [2:0] temp_red, temp_green, temp_blue;

    always @(posedge CLK) begin
        temp_red = 3'b000;
        temp_green = 3'b000;
        temp_blue = 3'b000;

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
        for (i = 0; i < 90; i = i + 1) begin : square_active_gen
            assign square_active[i] = (h_count >= square_x[i]) && (h_count < square_x[i] + RECT_WIDTH) &&
                                      (v_count >= square_y[i]) && (v_count < square_y[i] + RECT_HEIGHT);
        end

        if (SW1 && player_y > 0 && speed_count == PLAYER_SPEED) begin
            player_y <= player_y - 32; // Haut
            speed_count <= 0;
        end
        if (SW2 && player_y < V_DISPLAY - PLAYER_HEIGHT && speed_count == PLAYER_SPEED)begin
         player_y <= player_y + 32; // Bas
         speed_count <= 0;
         end
        if (SW3 && player_x > 0 && speed_count == PLAYER_SPEED)begin
         player_x <= player_x - 32; // Gauche
         speed_count <= 0;
        end
        if (SW4 && player_x < H_DISPLAY - PLAYER_WIDTH && speed_count == PLAYER_SPEED)begin
         player_x <= player_x + 32; // Droite
         speed_count <= 0;
        end
    reg [31:0] speed_count2 = 0;
    always @(posedge CLK) begin
        if (speed_count2 <  CAR_SPEED) begin
            speed_count2 <= speed_count2 + 1;
        end else if (speed_count2 >= CAR_SPEED) begin
            car_x <= car_x + 32 % H_DISPLAY;
            speed_count2 <= 0;
        end
    end

    // Logique de génération VGA
    always @(posedge CLK) begin
            if (h_count < H_DISPLAY && v_count < V_DISPLAY) begin
                // Priorité au joueur
                if ((h_count >= player_x) && (h_count < player_x + PLAYER_WIDTH) &&
                    (v_count >= player_y) && (v_count < player_y + PLAYER_HEIGHT)) begin
                    // Dessiner le joueur (couleur blanche)
                    VGA_R2 <= 3'b000;
                    VGA_G2 <= 3'b111;
                    VGA_B2 <= 3'b000;
                end else begin
                    // Dessiner la carte en arrière-plan
                    VGA_R2 <= temp_red;
                    VGA_G2 <= temp_green;
                    VGA_B2 <= temp_blue;
                end
            end else begin
                // En dehors de l'affichage
                VGA_R2 <= 3'b000;
                VGA_G2 <= 3'b000;
                VGA_B2 <= 3'b000;
            end
        end



endmodule
