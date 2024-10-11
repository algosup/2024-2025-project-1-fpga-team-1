module frog (
   input wire SW1,         // Bas (vers le bas)
   input wire SW2,         // Haut (vers le haut)
   input wire SW3,         // Gauche
   input wire SW4,         // Droite
   input wire CLK,         // Horloge
   output wire VGA_HS,     // Signal de synchronisation horizontale
   output wire VGA_VS,     // Signal de synchronisation verticale
   output reg VGA_R2, // Sortie couleur rouge (3 bits)
   output reg VGA_G2, // Sortie couleur verte (3 bits)
   output reg VGA_B2, // Sortie couleur bleue (3 bits)
   output reg VGA_R1, // Couleur fond (3 bits)
   output reg VGA_G1,
   output reg VGA_B1
);

    // Paramètres de la résolution VGA
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

    // Paramètres du joueur
    localparam PLAYER_WIDTH = 50;   // Largeur du joueur
    localparam PLAYER_HEIGHT = 40;  // Hauteur du joueur
    localparam PLAYER_SPEED = 250000; // Vitesse de déplacement

    // Compteurs de pixel
    reg [9:0] h_count = 0;  // Compteur horizontal
    reg [9:0] v_count = 0;  // Compteur vertical

    // Position du joueur
    reg [9:0] player_x = H_DISPLAY / 2 - PLAYER_WIDTH / 2;  // Position initiale X
    reg [9:0] player_y = V_DISPLAY / 2 - PLAYER_HEIGHT / 2; // Position initiale Y

    // Compteur pour gérer la vitesse de déplacement
    reg [31:0] r_PLAYER_COUNT = 0;

    // Signaux de synchronisation VGA
    assign VGA_HS = (h_count < H_PULSE) ? 0 : 1;
    assign VGA_VS = (v_count < V_PULSE) ? 0 : 1;

    // Logique de génération de pixels
    always @(posedge CLK) begin
        // Synchronisation horizontale
        if (h_count < H_SYNC_CYCLES - 1)
            h_count <= h_count + 1;
        else begin
            h_count <= 0;
            // Synchronisation verticale
            if (v_count < V_SYNC_CYCLES - 1)
                v_count <= v_count + 1;
            else
                v_count <= 0;
        end

        // Gestion de la couleur de fond (noir)
        VGA_R1 <= 3'b11;
        VGA_G1 <= 3'b000;
        VGA_B1 <= 3'b000;

        // Vérification si le pixel doit être dessiné
        if (h_count < H_DISPLAY && v_count < V_DISPLAY) begin
            if ((h_count >= player_x) && (h_count < player_x + PLAYER_WIDTH) &&
                (v_count >= player_y) && (v_count < player_y + PLAYER_HEIGHT)) begin
                // Dessiner le joueur (couleur blanche)
                VGA_R2 <= 3'b111;
                VGA_G2 <= 3'b111;
                VGA_B2 <= 3'b111;
            end else begin
                // Pixel de fond
                VGA_R2 <= VGA_R1;
                VGA_G2 <= VGA_G1;
                VGA_B2 <= VGA_B1;
            end
        end else begin
            // En dehors de l'affichage
            VGA_R2 <= VGA_R1;
            VGA_G2 <= VGA_G1;
            VGA_B2 <= VGA_B1;
        end
    end

    // Logique de déplacement du joueur
    always @(posedge CLK) begin
        // Compteur pour gérer la vitesse de déplacement
        if (r_PLAYER_COUNT < PLAYER_SPEED) begin
            r_PLAYER_COUNT <= r_PLAYER_COUNT + 1;
        end else begin
            r_PLAYER_COUNT <= 0;

            // Déplacement basé sur les interrupteurs
            if (SW1) begin
                if (player_y < V_DISPLAY - PLAYER_HEIGHT)
                    player_y <= player_y - 1; // Bas
            end
            if (SW2) begin
                if (player_y > 0)
                    player_y <= player_y + 1; // Haut
            end
            if (SW3) begin
                if (player_x > 0)
                    player_x <= player_x - 1; // Gauche
            end
            if (SW4) begin
                if (player_x < H_DISPLAY - PLAYER_WIDTH)
                    player_x <= player_x + 1; // Droite
            end
        end
    end

endmodule
