// *******************************************************************
//
// Constants File for the Game "Frog Rank"
//
// Description: In this file, we define all the constants
// used in the game. This allows to easily modify the parameters
// of the game without having to change the source code in the different modules.
// This file is included in all modules requiring the use
// of these constants.
//
// The parameters defined here include the characteristics of the VGA display,
// the dimensions and speed of the player, cars, as well as
// the initial positions and dimensions of the different areas of the game
// such as roads, grass and ground.
//
// **********************************************************************
    
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


    // Player parameters
    parameter PLAYER_WIDTH = 32;
    parameter PLAYER_HEIGHT = 32;
    parameter PLAYER_SPEED = 12500000/4;

    // Car parameters
    parameter CAR_WIDTH = 40;
    parameter CAR_HEIGHT = 32;
    parameter CAR_CLOCK = 12500000/128;

    parameter CAR_1_SPEED = 1;
    parameter CAR_2_SPEED = 1;
    parameter CAR_3_SPEED = 1;
    parameter CAR_4_SPEED = 1;

    // Car parameters for the 6 cars
    parameter CAR_Y1 = 384;            
    parameter CAR_Y2 = 352;   
    parameter CAR_Y3 = 288; 
    parameter CAR_Y4 = 256; 
    parameter CAR_Y5 = 192;
    parameter CAR_Y6 = 160;

    parameter CAR_X1 = 200;
    parameter CAR_X2 = 400;   
    parameter CAR_X3 = 508;  
    parameter CAR_X4 = 600;
    parameter CAR_X5= 200/2;
    parameter CAR_X6 = 400/2;   




    // Safe Zone
    parameter SAFE_Y = 0;
    parameter SAFE_Y2 = 416;
    parameter SAFE_Y3 = 224;
    parameter SAFE_X = 0;
    parameter SAFE_WIDTH = 640;
    parameter SAFE_HEIGHT = 64;

    // Road
    parameter ROAD_x1 = 0;
    parameter ROAD_y1 = 64;

    parameter ROAD_x2 = 0;
    parameter ROAD_y2 = 160;

    parameter ROAD_x3 = 0;
    parameter ROAD_y3 = 256;

    parameter ROAD_x4 = 0;
    parameter ROAD_y4 = 352;

    parameter ROAD_width = 640;
    parameter ROAD_height = 64;



    // GRASS
    parameter GRASS_x1 = 0;
    parameter GRASS_Y1 = 128;

    parameter GRASS_x2 = 0;
    parameter GRASS_Y2 = 224;

    
    parameter GRASS_x3 = 0;
    parameter GRASS_Y3 = 320;

    parameter GRASS_width = 640;
    parameter GRASS_height = 32;

    // GROUND
    parameter GROUND_x1 = 0;
    parameter GROUND_Y1 = 0;

    parameter GROUND_x2 = 0;
    parameter GROUND_Y2 = 416;

    parameter GROUND_width = 640;
    parameter GROUND_height = 64;



