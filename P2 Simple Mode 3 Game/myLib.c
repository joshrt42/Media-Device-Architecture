#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

// This sets a pixel to some color.
void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

// This draws a rectangle.
void drawRect(int row, int col, int height, int width, unsigned short color) {

    int c,r;

    for (r = row; r < row + height; r++) {
        for (c = col; c < col + width; c++) {
            setPixel(r, c, color);
        }
    }
}

// This makes an evil red ball.
void makeRedBall(int row, int col) {

    drawRect(row, col, 5, 5, RED);
}

// This makes a good green ball
void makeGreenBall(int row, int col) {

    drawRect(row, col, 5, 5, GREEN);
}

// This makes the player
void makePlayer(int row, int col) {

    drawRect(row, col, 10, 10, WHITE);
}


// This fills the screen with some color.
void fillScreen(unsigned short color) {

    for (int i = 0; i < SCREENWIDTH * SCREENHEIGHT; i++) {
        videoBuffer[i] = color;
    }
}

// This waits for VBlank, smoothing animation.
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// This checks for whether 2 rectangles are colliding.
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    if ((rowA - rowB) > (0 - heightA)
        && (rowA - rowB) < (heightB)
        && (colA - colB) > (0 - widthA)
        && (colA - colB) < (widthB)) {
        return 1;
    }
    return 0;
}