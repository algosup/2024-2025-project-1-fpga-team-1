    
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
    parameter RECT_WIDTH = 17;
    parameter RECT_HEIGHT = 2;

    parameter PLAYER_WIDTH = 32;
    parameter PLAYER_HEIGHT = 32;
    parameter PLAYER_SPEED = 12500000/2;

    parameter CAR_WIDTH = 40;
    parameter CAR_HEIGHT = 32;
    parameter CAR_SPEED = 12500000/2;