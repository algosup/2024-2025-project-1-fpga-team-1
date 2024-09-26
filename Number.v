module CLOCK (
    input wire CLK,        // Horloge du système
    output reg S1_A,       // Segment a
    output reg S1_B,       // Segment b
    output reg S1_C,       // Segment c
    output reg S1_D,       // Segment d
    output reg S1_E,       // Segment e
    output reg S1_F,       // Segment f
    output reg S1_G,       // Segment g
    output reg S2_A,       // Segment a pour le deuxième afficheur
    output reg S2_B,       // Segment b pour le deuxième afficheur
    output reg S2_C,       // Segment c pour le deuxième afficheur
    output reg S2_D,       // Segment d pour le deuxième afficheur
    output reg S2_E,       // Segment e pour le deuxième afficheur
    output reg S2_F,       // Segment f pour le deuxième afficheur
    output reg S2_G        // Segment g pour le deuxième afficheur
);

    reg [3:0] count_1 = 0;  // Compteur 1 sur 4 bits pour aller de 0 à 9
    reg [3:0] count_2 = 0; // Compteur 2 sur 4 bits pour aller de 0 à 9
    reg [23:0] counter = 0;  // Compteur interne pour la base de temps (24 bits)
    reg [23:0] max = 25000000;  // Valeur limite du compteur pour ralentir l'affichage (ajuster selon fréquence d'horloge)

    always @(posedge CLK) begin
        if (counter == max) begin
            counter <= 0;  // Remet le compteur interne à zéro
            if (count_2 == 9) begin 
                count_2 <= 0;               
                if (count_1 == 9) begin
                    count_1 <= 0;
                end
                else begin
                    count_1 = count_1 + 1; 
                end
            end
            else begin
                count_2 = count_2 + 1;
            end
        end
        counter = counter + 1;
    end

    always @(*) begin
        // Réinitialisation des segments à vide par défaut
        {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1111111;  // Afficheur 1 vide
        {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1111111;  // Afficheur 2 vide

        // Affichage sur le premier afficheur (S1)
        case (count_1)
            4'b0000: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0000001;  // 0
            4'b0001: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1001111;  // 1
            4'b0010: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0010010;  // 2
            4'b0011: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0000110;  // 3
            4'b0100: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1001100;  // 4
            4'b0101: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0100100;  // 5
            4'b0110: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0100000;  // 6
            4'b0111: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0001111;  // 7
            4'b1000: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0000000;  // 8
            4'b1001: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b0000100;  // 9
            default: {S1_A, S1_B, S1_C, S1_D, S1_E, S1_F, S1_G} = 7'b1111111;  // Affichage vide par défaut
        endcase

        // Affichage sur le deuxième afficheur (S2) (même valeur que S1)
        case (count_2)
            4'b0000: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000001;  // 0
            4'b0001: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1001111;  // 1
            4'b0010: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0010010;  // 2
            4'b0011: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000110;  // 3
            4'b0100: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1001100;  // 4
            4'b0101: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0100100;  // 5
            4'b0110: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0100000;  // 6
            4'b0111: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0001111;  // 7
            4'b1000: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000000;  // 8
            4'b1001: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b0000100;  // 9
            default: {S2_A, S2_B, S2_C, S2_D, S2_E, S2_F, S2_G} = 7'b1111111;  // Affichage vide par défaut
        endcase
    end
endmodule