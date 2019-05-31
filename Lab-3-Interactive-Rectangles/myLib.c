#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {

    int c,r;

    for (r = row; r < row + height; r++) {
        for (c = col; c < col + width; c++) {
            setPixel(r, c, color);
        }
    }
}

void fillScreen(unsigned short color) {

    for (int i = 0; i < SCREENWIDTH * SCREENHEIGHT; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    if ((rowA - rowB) > (0 - heightA)
        && (rowA - rowB) < (heightB)
        && (colA - colB) > (0 - widthA)
        && (colA - colB) < (widthB)) {
        return 1;
    }
    return 0;
}