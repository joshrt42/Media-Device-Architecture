/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Homework 5
File:       myLib.c
Date:       13 November 2017

******************************************************************************/

#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

void loadPalette(const unsigned short *palette) {

    DMANow(3, palette, PALETTE, 256);
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}

// Hides all sprites in the shadowOAM
void hideSprites() {
    for (unsigned char x = 0; x < 128; x++) {
        shadowOAM[x].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128*4);
}