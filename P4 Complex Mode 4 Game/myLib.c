/******************************************************************************
Author:		Josh Terry
Project:	CS 2261 Homework 4
File:		myLib.c
Date:		6 September 2017

******************************************************************************/

#include "myLib.h"
#include "refresher.h"




// ============================================== DEFINITIONS =================

// Temp variable for a thing
volatile unsigned short count = 240;

// Pointer to start of videoBuffer
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// Pointer to start of DMA
DMA *dma = (DMA *)0x40000B0;

// Sets a pixel to a color
void setPixel(int row, int col, unsigned char colorIndex) {

	unsigned short offset = OFFSET(row, col, SCREENWIDTH)/2;

	if (col & 1) {
		videoBuffer[offset] &= 0x00FF;
		videoBuffer[offset] |= (colorIndex<<8);
	} else {
		videoBuffer[offset] &= 0xFF00;
		videoBuffer[offset] |= colorIndex;
	}
}

// Draws a rectangle of color and size at location
void drawRect(int row, int col, int height, int width, volatile unsigned char colorIndex) {

    volatile unsigned short color = (colorIndex<<8) | colorIndex;
    if (col & 1){
        if (width & 1) {
            //odd col, odd width.
            for (int i = 0; i < height; i++) {
                setPixel(row + i, col, colorIndex);
                if (width > 1)
                    DMANow(3, &color, &videoBuffer[OFFSET(row + i, col + 1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
            }
        } else {
            //odd col, even width.
            for (int i = 0; i < height; i++) {
                setPixel(row + i, col, colorIndex);
                setPixel(row + i, col + width - 1, colorIndex);
                if (width > 2)
                    DMANow(3, &color, &videoBuffer[OFFSET(row + i, col + 1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | (width-1)/2);
            }
        }
    } else {
        if (width & 1) {
            //even col, odd width.
            for (int i = 0; i < height; i++) {
                setPixel(row + i, col + width - 1, colorIndex);
                if (width > 1)
                    DMANow(3, &color, &videoBuffer[OFFSET(row+i, col, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
            }
        } else {
            //even col, even width.
            for (int i = 0; i < height; i++) {
                DMANow(3, &color, &videoBuffer[OFFSET(row + i, col, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
            }
        }
    }
}

// Fills the screen with a color
void fillScreen(volatile unsigned char colorIndex) {

	volatile unsigned short color = (colorIndex<<8) | colorIndex;
	DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT / 2));
}

// Draws image of size at location
void drawImage(int row, int col, int height, int width, const unsigned short *image) {

    col = 2 * (col/2);
    for (int r = 0; r < height; r++){
        DMANow(3, image + (r*width/2), &videoBuffer[OFFSET(row + r, col, SCREENWIDTH)/2], width/2);
    }
}

// Draws a full screen image.
void drawFullScreenImage(const unsigned short *image) {

	DMANow(3, image, videoBuffer, (SCREENWIDTH * SCREENHEIGHT / 2));
}

// Waits until VBlank starts
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Loads palette
void loadPalette(const unsigned short *palette) {

	DMANow(3, palette, PALETTE, 256);
}

// Setup and do a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

	dma[channel].cnt = 0;
	dma[channel].src = src;
	dma[channel].dst = dst;
	dma[channel].cnt = cnt | DMA_ON;
}

// Detects collisions
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

	return rowA < rowB + heightB - 1
		&& rowA + heightA - 1 > rowB
		&& colA < colB + widthB - 1
		&& colA + widthA - 1 > colB;
}

// Draws background during gameplay to make wave effect
void refreshGame() {

	DMANow(3, refresherBitmap, &videoBuffer[OFFSET(24, count, SCREENWIDTH)/2], 240 * 108/2);

	count--;

	if (count <1)
		count = 240;
}
