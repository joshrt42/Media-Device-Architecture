// JOSH TERRY
// CS 2261 - SPRING 2017
// HOMEWORK 3 - SIMPLE MODE 3 GAME
// MYLIB.H

#ifndef MY_LIB_H
#define MY_LIB_H




// ============== DEFINITIONS ===============

//offset macro
#define OFFSET(r,c,rowlen) ((r)*(rowlen)+(c))

//Display Control Register
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

//Scan line counter
#define SCANLINECOUNTER (*(volatile unsigned short *) 0x4000006)

//Screen dimension constants
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

//Video Buffer
extern unsigned short *videoBuffer;

//Color macro
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define WHITE COLOR(31,31,31)

//Drawing Functions
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);
void drawImage(int row, int col, int height, int width, const unsigned short *image);
void drawImageHFlip(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage(const unsigned short *image);
void drawGameBG(const unsigned short *image);
void waitForVBlank();




// ================= INPUT ==================

// Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// Button Masks
#define BUTTON_A        (1<<0)
#define BUTTON_B        (1<<1)
#define BUTTON_SELECT   (1<<2)
#define BUTTON_START    (1<<3)
#define BUTTON_RIGHT    (1<<4)
#define BUTTON_LEFT     (1<<5)
#define BUTTON_UP       (1<<6)
#define BUTTON_DOWN     (1<<7)
#define BUTTON_R        (1<<8)
#define BUTTON_L        (1<<9)

// Variables for Button Macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// Button Macros
#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))




// ================== DMA ===================

//DMA Struct
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;

//First DMA Register Address
extern DMA *dma;

//Destination Adjustment
#define DMA_DESTINATION_INCREMENT (0 << 21)
#define DMA_DESTINATION_DECREMENT (1 << 21)
#define DMA_DESTINATION_FIXED (2 << 21)
#define DMA_DESTINATION_RESET (3 << 21)

//Source Adjustment
#define DMA_SOURCE_INCREMENT (0 << 23)
#define DMA_SOURCE_DECREMENT (1 << 23)
#define DMA_SOURCE_FIXED (2 << 23)

//Begin DMA
#define DMA_ON (1 << 31)

//DMA Functions
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




// ============ OTHER FUNCTIONS =============

//Collision
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);

#endif