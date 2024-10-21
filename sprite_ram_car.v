// In this file we instantiate the car sprite memory.


module sprite_ram_car
#( parameter 
    MEM_FILE="sprite_car.mem" // File with the sprite frog
) (
    input wire CLK,                 // Clock
    input wire [10:0] addr,          // number of adress needed to access pixels in the sprite
    output reg [8:0] data_out       // 9 bits by pixel (RGB 3 bits each)
);

    // Sprite memory of 1152 pixels of 9 bits each
    reg [8:0] sprite_mem [1151:0];

    initial begin
        // Inilialize sprite memory of the file
        $readmemb(MEM_FILE, sprite_mem);
    end

    always @(posedge CLK) begin
        data_out <= sprite_mem[addr];
    end
endmodule
