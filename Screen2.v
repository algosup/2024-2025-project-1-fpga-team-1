module vga_display(
    input wire CLK,          // Horloge principale
    input wire SW1,         // Bouton de réinitialisation
    output wire VGA_HS,     // Signal de synchronisation horizontale
    output wire VGA_VS,     // Signal de synchronisation verticale
    output reg  VGA_R2,     // Sortie couleur rouge (3 bits)
    output reg  VGA_G2,     // Sortie couleur verte (3 bits)
    output reg  VGA_B2,
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

    reg [9:0] h_count = 0;  // Compteur horizontal (de 0 à H_SYNC_CYCLES)
    reg [9:0] v_count = 0;  // Compteur vertical (de 0 à V_SYNC_CYCLES)

    reg [2:0] red;          // Signal couleur rouge (3 bits)
    reg [2:0] green;        // Signal couleur verte (3 bits)
    reg [2:0] blue;         // Signal couleur bleue (3 bits)

    wire clk = CLK;         // Alias for CLK input wire
    wire reset = SW1;       // Alias for SW1 as reset signal

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

    // Position des carrés au centre de l'écran
    wire square_area1 = (h_count >= 100 && h_count < 120) && (v_count >= 100 && v_count < 120); // Carré 1
    wire square_area2 = (h_count >= 140 && h_count < 160) && (v_count >= 100 && v_count < 120); // Carré 2
    wire square_area3 = (h_count >= 200 && h_count < 220) && (v_count >= 100 && v_count < 120); // Carré 3

    // Couleurs des carrés (rouge, vert, bleu) et du fond (noir)
    always @(posedge clk) begin
        if (reset) begin
            red <= 3'b000;
            green <= 3'b000;
            blue <= 3'b000;
        end else if (display_area) begin
            if (square_area1) begin
                // Carré 1 (Rouge)
                red <= 3'b111;
                green <= 3'b000;
                blue <= 3'b000;
            end else if (square_area2) begin
                // Carré 2 (Vert)
                red <= 3'b000;
                green <= 3'b111;
                blue <= 3'b000;
            end else if (square_area3) begin
                // Carré 3 (Bleu)
                red <= 3'b000;
                green <= 3'b000;
                blue <= 3'b111;
            end else begin
                // Fond noir
                red <= 3'b000;
                green <= 3'b000;
                blue <= 3'b000;
            end
        end
    end

    // Assignation des couleurs aux sorties VGA
    always @(posedge clk) begin
        VGA_R2 <= red[2];
        VGA_G2 <= green[2];
        VGA_B2 <= blue[2];
    end

endmodule
