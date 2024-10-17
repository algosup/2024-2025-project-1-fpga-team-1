/* module sprite_ram (
    input wire CLK,                 // Horloge
    input wire [7:0] addr,          // Adresse de la RAM (8 bits pour 256 pixels)
    output reg [7:0] data_out       // Données de sortie (8 bits pour chaque pixel)
);

    // Mémoire pour le sprite (16x16 = 256 octets, 8 bits par pixel)
    reg [7:0] sprite_mem [0:255];

    initial begin
        // Chargement du sprite (ici exemple avec des valeurs arbitraires)
        $readmemh("sprite_data.mem", sprite_mem);
    end

    always @(posedge CLK) begin
        data_out <= sprite_mem[addr];
    end
endmodule
