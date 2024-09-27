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
);

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

        // Si un carré est actif, afficher en blanc
        for (i = 0; i < 90; i = i + 1) begin
            if (square_active[i]) begin
                temp_red = 3'b111;
                temp_green = 3'b111;
                temp_blue = 3'b111;
            end
        end
    end

    // Logique pour dessiner le joueur
    always @(posedge CLK) begin
        if (r_PLAYER_COUNT < PLAYER_SPEED) begin
            r_PLAYER_COUNT <= r_PLAYER_COUNT + 1;
        end else begin
            r_PLAYER_COUNT <= 0;
            // Déplacer le joueur
            if (SW1 && player_y < V_DISPLAY - PLAYER_HEIGHT) begin
                player_y <= player_y - 1; // Bas
            end
            if (SW2 && player_y > 0) begin
                player_y <= player_y + 1; // Haut
            end
            if (SW3 && player_x > 0) begin
                player_x <= player_x - 1; // Gauche
            end
            if (SW4 && player_x < H_DISPLAY - PLAYER_WIDTH) begin
                player_x <= player_x + 1; // Droite
            end
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

    // Assigner les couleurs aux signaux de fond
    always @(posedge CLK) begin
        VGA_R1 <= 3'b000;  // Noir de fond
        VGA_G1 <= 3'b000;
        VGA_B1 <= 3'b000;
    end

endmodule
