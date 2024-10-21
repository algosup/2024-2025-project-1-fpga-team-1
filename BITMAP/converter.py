from PIL import Image

def rgb_to_3bit(rgb):
    r, g, b = rgb
    r_bin = format(r>>5, '03b')
    g_bin = format(g>>5, '03b')
    b_bin = format(b>>5, '03b')
    binary_pixel = r_bin + g_bin + b_bin
    return binary_pixel 

def convert_image_to_3bit_text(image_path, output_path):
    image = Image.open(image_path)
    image = image.convert('RGB')
    width, height = image.size

    with open(output_path, 'w') as file:
        for y in range(height):
            for x in range(width):
                rgb = image.getpixel((x, y))
                bit_3 = rgb_to_3bit(rgb)
                file.write(bit_3 + ' ')
            file.write('\n')

if __name__ == "__main__":
    convert_image_to_3bit_text('path.png', 'output7.txt')