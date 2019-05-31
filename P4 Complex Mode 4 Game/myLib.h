/******************************************************************************
Author:		Josh Terry
Project:	CS 2261 Homework 4
File:		myLib.h
Date:		6 September 2017

******************************************************************************/

#include <stdlib.h>
#include <stdio.h>




// ============================================== THE BASICS ==================

// Offset!
#define OFFSET(r,c,rowlen) ((r)*(rowlen)+(c))

// Display Control Register
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE4 4
#define DISP_BACKBUFFER (1<<4)
#define BG2_ENABLE (1<<10)
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Display size
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

// Video Buffer
extern unsigned short *videoBuffer;
#define FRONTBUFFER ((unsigned short *)0x6000000)
#define BACKBUFFER ((unsigned short *)0x600A000)

//Color macro
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLUEE COLOR(0,15,15)
#define WHITE COLOR(31,31,31)

// Palette
#define PALETTE ((unsigned short *)0x5000000)

// Drawing Functions
void setPixel(int row, int col, unsigned char colorIndex);
void drawRect(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen(volatile unsigned char colorIndex);
void drawImage(int row, int col, int height, int width, const unsigned short *image);
void drawFullScreenImage(const unsigned short *image);
void refreshGame();
void waitForVBlank();
void flipPage();
void loadPalette(const unsigned short *palette);




// ============================================== INPUT =======================

// Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// Button Masks
#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

// Variables for Button Macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// Button Macros
#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))




// ============================================== DMA =========================

// DMA Struct
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;

// First DMA Register Address
extern DMA *dma;

// Destination
#define DMA_DESTINATION_INCREMENT (0 << 21)
#define DMA_DESTINATION_DECREMENT (1 << 21)
#define DMA_DESTINATION_FIXED (2 << 21)

// Source
#define DMA_SOURCE_INCREMENT (0 << 23)
#define DMA_SOURCE_DECREMENT (1 << 23)
#define DMA_SOURCE_FIXED (2 << 23)

// Begin DMA
#define DMA_ON (1 << 31)

// DMA Functions
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




// ============================================== BUREAUCRACY =================

// Collision I guess
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);