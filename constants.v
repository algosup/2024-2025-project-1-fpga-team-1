    // In this file we define all the constants that we will use in the game
    // This way we can easily change the game parameters without having to change the code
    // This file is included in all the modules that need to use the constants    
    
    
    
    
    
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
    parameter CAR_CLOCK = 12500000/32;

    parameter CAR_1_SPEED = 4;
    parameter CAR_2_SPEED = 4;
    parameter CAR_3_SPEED = 4;
    parameter CAR_4_SPEED = 4;


    // Wood parameters
    parameter WOOD_WIDTH = 40;
    parameter WOOD_HEIGHT = 32;
    parameter WOOD_SPEED = 12500000/2;



    // Car parameters
    parameter CAR_Y1 = 384;            
    parameter CAR_Y2 = 352;   
    parameter CAR_Y3 = 288; 
    parameter CAR_Y4 = 256; 
    parameter CAR_Y5 = 192;
    parameter CAR_Y6 = 160;
    parameter CAR_Y7 = 96;
    parameter CAR_Y8 = 64;

    parameter CAR_X1 = 200;
    parameter CAR_X2 = 400;   
    parameter CAR_X3 = 508;  
    parameter CAR_X4 = 600;
    parameter CAR_X5= 200/2;
    parameter CAR_X6 = 400/2;   
    parameter CAR_X7 = 508/2;  
    parameter CAR_X8 = 600/2;



    // Safe Zone
    parameter SAFE_Y = 0;
    parameter SAFE_Y2 = 416;
    parameter SAFE_Y3 = 224;
    parameter SAFE_X = 0;
    parameter SAFE_WIDTH = 640;
    parameter SAFE_HEIGHT = 64;


