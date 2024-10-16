    // Display VGA parameters
    parameter H_DISPLAY = 640;
    parameter V_DISPLAY = 480;
    parameter H_FRONT = 16;
    parameter H_PULSE = 96;
    parameter H_BACK = 48;
    parameter V_FRONT = 10;
    parameter V_PULSE = 2;
    parameter V_BACK = 33;
    parameter H_SYNC_CYCLES = H_DISPLAY + H_FRONT + H_PULSE + H_BACK;
    parameter V_SYNC_CYCLES = V_DISPLAY + V_FRONT + V_PULSE + V_BACK;

    // Maps parameters
    parameter RECT_WIDTH = 17;
    parameter RECT_HEIGHT = 2;


    // Player parameters
    parameter PLAYER_WIDTH = 32;
    parameter PLAYER_HEIGHT = 32;
    parameter PLAYER_SPEED = 12500000/4;

    // Car parameters
    parameter CAR_WIDTH = 40;
    parameter CAR_HEIGHT = 32;
    parameter CAR_CLOCK = 12500000/64;

    parameter CAR_1_SPEED = 2;
    parameter CAR_2_SPEED = 2;
    parameter CAR_3_SPEED = 3;
    parameter CAR_4_SPEED = 2;


    // Wood parameters
    parameter WOOD_WIDTH = 40;
    parameter WOOD_HEIGHT = 32;
    parameter WOOD_SPEED = 12500000/2;



    // Car parameters
    parameter CAR_Y1 = 320;
    parameter CAR_Y2 = 384 - CAR_HEIGHT;   
    parameter CAR_Y3 = 416 - CAR_HEIGHT;  
    parameter CAR_Y4 = 448 - CAR_HEIGHT;
    parameter CAR_X1 = 200;
    parameter CAR_X2 = 400;   
    parameter CAR_X3 = 508;  
    parameter CAR_X4 = 600;


    parameter CAR_Y5 = 320/2;
    parameter CAR_Y6 = 384/2;   
    parameter CAR_Y7 = 416/2;  
    parameter CAR_Y8 = 448/2;
    parameter CAR_X5= 200/2;
    parameter CAR_X6 = 400/2;   
    parameter CAR_X7 = 508/2;  
    parameter CAR_X8 = 600/2;



    // Safe Zone
    parameter SAFE_Y = 0;
    parameter SAFE_Y2 = 448;
    parameter SAFE_Y3 = 256;
    parameter SAFE_X = 0;
    parameter SAFE_WIDTH = 640;
    parameter SAFE_HEIGHT = 32;


