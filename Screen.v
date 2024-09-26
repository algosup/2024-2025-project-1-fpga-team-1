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
    localparam SQUARE_SIZE = 20; // Taille des carrés
    reg [19:0] square_x[0:19]; // Positions X
    reg [19:0] square_y[0:19]; // Positions Y
    // Initialisation des positions des carrés
    initial begin
        square_x[0] = 50;  square_x[1] = 100; square_x[2] = 150; square_x[3] = 200;
        square_x[4] = 250; square_x[5] = 300; square_x[6] = 350; square_x[7] = 400;
        square_x[8] = 450; square_x[9] = 500;
        // Toutes les Y sont identiques pour aligner les carrés sur la même ligne
        square_y[0] = 50;  square_y[1] = 50;  square_y[2] = 50;  square_y[3] = 50;
        square_y[4] = 50;  square_y[5] = 50;  square_y[6] = 50;  square_y[7] = 50;
        square_y[8] = 50;  square_y[9] = 50;

       // Initialisation des positions des carrés
        square_x[10] = 50;   square_x[11] = 100; square_x[12] = 150; square_x[13] = 200;
        square_x[14] = 250;  square_x[15] = 300; square_x[16] = 350; square_x[17] = 400;
        square_x[18] = 450;  square_x[19] = 500;

        // Toutes les Y sont identiques pour aligner les carrés sur la même ligne
        square_y[10] = 100;  square_y[11] = 100;  square_y[12] = 100;  square_y[13] = 100;
        square_y[14] = 100;  square_y[15] = 100;  square_y[16] = 100;  square_y[17] = 100;
        square_y[18] = 100;  square_y[19] = 100;

    end
    // Variable temporaire pour la couleur
    reg [2:0] temp_red, temp_green, temp_blue;
    // Signaux pour déterminer si un carré est actif
    wire square_active[0:19];
    
    // Génération pour vérifier chaque carré
    genvar i;
    generate
        for (i = 0; i < 20; i = i + 1) begin : square_check
            assign square_active[i] = (h_count >= square_x[i]) && (h_count < square_x[i] + SQUARE_SIZE) &&
                                      (v_count >= square_y[i]) && (v_count < square_y[i] + SQUARE_SIZE);
        end
    endgenerate
    // Bloc combinatoire pour assigner les couleurs en fonction du carré actif
    always @(posedge CLK) begin
        // Initialiser la couleur par défaut (fond noir)
        temp_red = 3'b000;
        temp_green = 3'b000;
        temp_blue = 3'b000;
        if (square_active[0]) begin
            temp_red = 3'b111; temp_green = 3'b000; temp_blue = 3'b000; // Rouge
        end else if (square_active[1]) begin
            temp_red = 3'b000; temp_green = 3'b111; temp_blue = 3'b000; // Vert
        end else if (square_active[2]) begin
            temp_red = 3'b000; temp_green = 3'b000; temp_blue = 3'b111; // Bleu
        end else if (square_active[3]) begin
            temp_red = 3'b111; temp_green = 3'b000; temp_blue = 3'b111; // Magenta
        end else if (square_active[4]) begin
            temp_red = 3'b000; temp_green = 3'b111; temp_blue = 3'b111; // Cyan
        end else if (square_active[5]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b000; // Jaune
        end else if (square_active[6]) begin
            temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; // Blanc
        end else if (square_active[7]) begin
            temp_red = 3'b100; temp_green = 3'b010; temp_blue = 3'b000; // Orange
        end else if (square_active[8]) begin
            temp_red = 3'b010; temp_green = 3'b111; temp_blue = 3'b010; // Vert clair
        end else if (square_active[9]) begin
            temp_red = 3'b111; temp_green = 3'b010; temp_blue = 3'b010; // Rose
        end else if (square_active[10]) begin
            temp_red = 3'b111; temp_green = 3'b000; temp_blue = 3'b000; // Rouge
        end else if (square_active[11]) begin
             temp_red = 3'b000; temp_green = 3'b111; temp_blue = 3'b000; // Vert
        end else if (square_active[12]) begin
             temp_red = 3'b000; temp_green = 3'b000; temp_blue = 3'b111; // Bleu
        end else if (square_active[13]) begin
             temp_red = 3'b111; temp_green = 3'b000; temp_blue = 3'b111; // Magenta
        end else if (square_active[14]) begin
            temp_red = 3'b000; temp_green = 3'b111; temp_blue = 3'b111; // Cyan
        end else if (square_active[15]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b000; // Jaune
        end else if (square_active[16]) begin
             temp_red = 3'b111; temp_green = 3'b111; temp_blue = 3'b111; // Blanc
        end else if (square_active[17]) begin
             temp_red = 3'b100; temp_green = 3'b010; temp_blue = 3'b000; // Orange
        end else if (square_active[18]) begin
            temp_red = 3'b010; temp_green = 3'b111; temp_blue = 3'b010; // Vert clair
        end else if (square_active[19]) begin
             temp_red = 3'b111; temp_green = 3'b010; temp_blue = 3'b010; // Rose
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







