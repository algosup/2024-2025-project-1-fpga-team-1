// In this file we instantiate the sprite memory.


module sprite_ram (
    input wire CLK,                 // Clock
    input wire [$clog2(1024)-1:0] addr,          // number of adress needed to access pixels in the sprite
    output reg [8:0] data_out       // 9 bits by pixel (RGB 3 bits each)
);

    // Sprite memory of 1024 pixels of 9 bits each
    reg [8:0] sprite_mem [0:1024];

    initial begin
        // Inilialize sprite memory of the file
        $readmemh("sprite_data.mem", sprite_mem);
    end

    always @(posedge CLK) begin
        data_out <= sprite_mem[addr];
    end
endmodule
