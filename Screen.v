module main(
    input wire CLK,          // Horloge principale
    input wire SW1,         // Bouton de réinitialisation
    output wire VGA_HS,     // Signal de synchronisation horizontale
    output wire VGA_VS,     // Signal de synchronisation verticale
    output reg  VGA_R2,     // Sortie couleur rouge (3 bits)
    output reg  VGA_G2,     // Sortie couleur verte (3 bits)
    output reg  VGA_B2,
    output reg  VGA_R1,
    output reg  VGA_G1,
    output reg  VGA_B1
);
    // Définition des résolutions standards VGA 640x480
    localparam H_DISPLAY = 640;  // Largeur de la zone d'affichage
    localparam V_DISPLAY = 480;  // Hauteur de la zone d'affichage
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
    localparam PLAYER_WIDHT = 50 ; // Width of the player
    localparam PLAYER_HEIGHT = 30; // height of the rectangle
    reg [9:0] h_count = 0;  // Compteur horizontal
    reg [9:0] v_count = 0;  // Compteur vertical
    reg [2:0] red;          // Signal couleur rouge (3 bits)
    reg [2:0] green;        // Signal couleur verte (3 bits)
    reg [2:0] blue;         // Signal couleur bleue (3 bits)
    wire clk = CLK;         // Alias pour l'entrée CLK
    wire reset = SW1;       // Alias pour SW1 comme signal de réinitialisation
    // Compteurs horizontaux et verticaux
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
    // Génération des signaux de synchronisation
    assign VGA_HS = (h_count >= H_DISPLAY + H_FRONT) && (h_count < H_DISPLAY + H_FRONT + H_PULSE);
    assign VGA_VS = (v_count >= V_DISPLAY + V_FRONT) && (v_count < V_DISPLAY + V_FRONT + V_PULSE);
    // Calcul des positions X et Y sur l'écran
    wire display_area = (h_count < H_DISPLAY) && (v_count < V_DISPLAY);
    // Position et taille des carrés
    reg [19:0] square_x[0:99]; // Positions X
    reg [19:0] square_y[0:99]; // Positions Y
    // Initialisation des positions des carrés
    initial begin
        square_x[0] = 10;   square_x[1] = 45;   square_x[2] = 80;   square_x[3] = 115;
        square_x[4] = 150;  square_x[5] = 185;  square_x[6] = 220;  square_x[7] = 255;
        square_x[8] = 290;  square_x[9] = 325; square_x[10] = 360; square_x[11] = 395; 
        square_x[12] = 430; square_x[13] = 465;  square_x[14] = 500;  square_x[15] = 535; 
        square_x[16] = 570; square_x[17] = 605; 
        
        square_x[18] = 10; square_x[19] = 45;
        square_x[20] = 80; square_x[21] = 115; square_x[22] = 150; square_x[23] = 185;
        square_x[24] = 220; square_x[25] = 255; square_x[26] = 290;  square_x[27] = 325;
        square_x[28] = 360;  square_x[29] = 395; square_x[30] = 430; square_x[31] = 465; square_x[32] = 500; 
        square_x[33] = 535; square_x[34] = 570; square_x[35] = 605;
        
        square_x[36] = 10; square_x[37] = 45;
        square_x[38] = 80; square_x[39] = 115; 
        
        square_x[40] = 150;  square_x[41] = 185; 
        square_x[42] = 220; square_x[43] = 255; square_x[44] = 290; square_x[45] = 325; 
        square_x[46] = 360; square_x[47] = 395; square_x[48] = 430; square_x[49] = 465;

        square_x[50] = 500; square_x[51] = 535; square_x[52] = 570;  square_x[53] = 605;
        square_x[54] = 10;   square_x[55] = 45;   square_x[53] = 80;   square_x[54] = 115;
        square_x[55] = 150;  square_x[56] = 185;  square_x[57] = 220;  square_x[58] = 255;
        square_x[59] = 290;  square_x[60] = 325;  square_x[61] = 360; square_x[61] = 395; 
        square_x[62] = 430; square_x[63] = 465; square_x[64] = 500; square_x[65] = 535; 
        square_x[66] = 570; square_x[67] = 605;

        square_x[68] = 10;   square_x[69] = 45;   square_x[70] = 80;   square_x[71] = 115;
        square_x[72] = 150;  square_x[73] = 185;  square_x[74] = 220;  square_x[75] = 255;
        square_x[76] = 290;  square_x[77] = 325;  square_x[78] = 360; square_x[79] = 395; 
        square_x[80] = 430; square_x[81] = 465; square_x[82] = 500; square_x[82] = 535; 
        square_x[83] = 570; square_x[84] = 605;

        

        // Toutes les Y sont identiques pour aligner les carrés sur la même ligne
        square_y[0] = 100;  square_y[1] = 100;  square_y[2] = 100;  square_y[3] = 100;
        square_y[4] = 100;  square_y[5] = 100;  square_y[6] = 100;  square_y[7] = 100;
        square_y[8] = 100;  square_y[9] = 100;   square_y[10] = 100; square_y[11] = 100; 
        square_y[12] = 100; square_y[13] = 100; square_y[14] = 100;  square_y[15] = 100; 
        square_y[16] = 100; square_y[17] = 100;
        
        square_y[18] = 175;  square_y[19] = 175;
        square_y[20] = 175; square_y[21] = 175; square_y[22] = 175;  square_y[23] = 175;
        square_y[24] = 175; square_y[25] = 175; square_y[26] = 175;  square_y[27] = 175;
        square_y[28] = 175; square_y[29] = 175;
                
        square_y[30] = 175;  square_y[31] = 175;  square_y[32] = 175;  square_y[33] = 175;
        square_y[34] = 175;  square_y[35] = 175;  square_y[36] = 250;  square_y[37] = 250;
        square_y[38] = 250;  square_y[39] = 250;   square_y[40] = 250; square_y[41] = 250; 
        square_y[42] = 250; square_y[43] = 250; square_y[44] = 250;  square_y[45] = 250; 
        square_y[46] = 250; square_y[47] = 250; square_y[48] = 250;  square_y[49] = 250;

        square_y[50] = 250;  square_y[51] = 250;  square_y[52] = 250;  square_y[53] = 250;
        square_y[54] = 325;  square_y[55] = 325;  square_y[56] = 325; square_y[57] = 325; 
        square_y[58] = 325; square_y[59] = 325; square_y[60] = 325;  square_y[61] = 325; 
        square_y[62] = 325; square_y[63] = 325; square_y[64] = 325;

        square_y[65] = 325;  square_y[66] = 325;  square_y[67] = 325;  square_y[68] = 400;
        square_y[69] = 400;  square_y[70] = 400;   square_y[71] = 400; square_y[72] = 400; 
        square_y[73] = 400; square_y[74] = 400; square_y[75] = 400;  square_y[76] = 400; 
        square_y[77] = 400; square_y[78] = 400; square_y[79] = 400;  square_y[80] = 400; 
        square_y[81] = 400; square_y[82] = 400; square_y[83] = 400; square_y[84] = 400;

        
    end
    // Variable temporaire pour la couleur
    reg [2:0] temp_red, temp_green, temp_blue;
    // Signaux pour déterminer si un carré est actif
    wire square_active[0:99];
    
    // Génération pour vérifier chaque carré
    genvar i;
    generate
        for (i = 0; i < 90; i = i + 1) begin : square_check
            assign square_active[i] = (h_count >= square_x[i]) && (h_count < square_x[i] + RECT_WIDHT) &&
                                      (v_count >= square_y[i]) && (v_count < square_y[i] + RECT_HEIGHT);
        end
    endgenerate
    // Bloc combinatoire pour assigner les couleurs en fonction du carré actif
     always @(posedge CLK) begin
        // Initialiser la couleur par défaut (fond noir)
        temp_red = 3'b000;
        temp_green = 3'b000;
        temp_blue = 3'b000;
        if (square_active[0]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[1]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[2]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[3]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111;
        end else if (square_active[4]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[5]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[6]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[7]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[8]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[9]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[10]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[11]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[12]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[13]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[14]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111;
        end else if (square_active[15]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[16]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[17]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[18]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[19]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[20]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[21]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[22]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[23]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[24]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[25]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[26]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[27]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[28]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[29]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[29]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[30]) begin 
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[31]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[32]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[33]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111;
        end else if (square_active[34]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[35]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[36]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[37]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[38]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[39]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[40]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[41]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[42]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[43]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[44]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111;
        end else if (square_active[45]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[46]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[47]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[48]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[49]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[50]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[51]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[52]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[53]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[54]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[55]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[56]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[57]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[58]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[59]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[60]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[61]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[62]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[63]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[64]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[65]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[66]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[67]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[68]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[69]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[70]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[71]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[72]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[73]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[74]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[75]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[76]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[77]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[78]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[79]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[80]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[81]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[82]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[83]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end else if (square_active[84]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; 
        end 
    end


    // Assignation des couleurs aux sorties VGA dans le bloc séquentiel
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
    // Assignation des couleurs aux sorties VGA
    always @(posedge clk) begin
        VGA_R2 <= red[2];
        VGA_G2 <= green[2];
        VGA_B2 <= blue[2];
        VGA_R1 <= red[2];
        VGA_G1 <= green[2];
        VGA_B1 <= blue[2];
    end
endmodule