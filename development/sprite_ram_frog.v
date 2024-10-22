// ***********************************************************************
//
// Sprite memory module for frog
//
// Description: In this file, we instantiate the memory of the sprites
// of the frog. This memory stores the pixel data for the display
// of the frog in the game. Each pixel is represented by 9 bits (3 bits
// for each RGB component). The file containing the sprite of the frog
// is loaded into this memory.
//
// *************************************************************************

module sprite_ram_frog
#( parameter 
    MEM_FILE="sprite_frog.mem" // File with the sprite frog
) (
    input wire CLK,                 // Clock
    input wire [9:0] addr,          // number of adress needed to access pixels in the sprite
    output reg [8:0] data_out       // 9 bits by pixel (RGB 3 bits each)
);

    // Sprite memory of 1024 pixels of 9 bits each
    reg [8:0] sprite_mem [1023:0];

    initial begin
        // Inilialize sprite memory of the file
        $readmemb(MEM_FILE, sprite_mem);
    end

    always @(posedge CLK) begin
        data_out <= sprite_mem[addr];
    end
endmodule
