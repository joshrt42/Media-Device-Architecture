// JOSH TERRY
// CS 2261 - SPRING 2017
// HOMEWORK 3 - SIMPLE MODE 3 GAME
// MYLIB.C

#include "myLib.h"




// ============== DEFINITIONS ===============

//The start of video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

//The start of DMA registers
DMA * dma = (DMA *)0x40000B0;




// ========= PIXEL SETTING METHODS ==========

//Set a pixel on the screen
void setPixel(int row, int col, unsigned short color) {

    videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

//Draw a rectangle of color at location and size
void drawRect(int row, int col, int height, int width, unsigned short color) {

    volatile unsigned short c = color;
    for (int r = 0; r < height; r++) {
        DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, SCREENWIDTH)], width);
    }
}

//Fill entire screen with a single color
void fillScreen(unsigned short color) {

    volatile unsigned short c = color;
    DMANow(3, &c, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}




// ========= IMAGE DRAWING METHODS ==========

//Draws image of size at location on screen
void drawImage(int row, int col, int height, int width, const unsigned short *image) {

    for (int r = 0; r < height; r++) {
        dma[3].cnt = 0;
        dma[3].src = &image[r*width];
        dma[3].dst = &videoBuffer[OFFSET(row + r, col, SCREENWIDTH)];
        dma[3].cnt = width | DMA_ON;
    }
}

//Draws horizontally flipped image of size at location on screen
void drawImageHFlip(int row, int col, int height, int width, const unsigned short *image) {

    for (int r = 0; r < height; r++) {
        dma[3].cnt = 0;
        dma[3].src = &image[r*width + width - 1];
        dma[3].dst = &videoBuffer[OFFSET(row + r, col, SCREENWIDTH)];
        dma[3].cnt = width | DMA_SOURCE_DECREMENT | DMA_ON;
    }
}

//Fill entire screen with image
void drawFullScreenImage(const unsigned short *image) {

    dma[3].cnt = 0;
    dma[3].src = image;
    dma[3].dst = videoBuffer;
    dma[3].cnt = (SCREENWIDTH * SCREENHEIGHT) | DMA_ON;
}

//Draw game background
void drawGameBG(const unsigned short *image) {

    dma[3].cnt = 0;
    dma[3].src = image;
    dma[3].dst = videoBuffer;
    dma[3].cnt = (SCREENWIDTH * 140) | DMA_ON;
}




// ========= BUREAUCRATIC FUNCTIONS =========

//Pause execution until VBlank begins
void waitForVBlank() {

    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

//Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_SOURCE_FIXED | DMA_ON;
}

//Detect collisions
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1
        && rowB < rowA + heightA - 1
        && colA < colB + widthB - 1
        && colB < colA + widthA - 1;
}