# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"





# 1 "myLib.h" 1
# 30 "myLib.h"
extern unsigned short *videoBuffer;






void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);
void drawImage(int row, int col, int height, int width, const unsigned short *image);
void drawImageHFlip(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage(const unsigned short *image);
void drawGameBG(const unsigned short *image);
void waitForVBlank();
# 67 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 80 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 104 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);







int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 7 "myLib.c" 2







unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA * dma = (DMA *)0x40000B0;







void setPixel(int row, int col, unsigned short color) {

    videoBuffer[((row)*(240)+(col))] = color;
}


void drawRect(int row, int col, int height, int width, unsigned short color) {

    volatile unsigned short c = color;
    for (int r = 0; r < height; r++) {
        DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], width);
    }
}


void fillScreen(unsigned short color) {

    volatile unsigned short c = color;
    DMANow(3, &c, videoBuffer, 240 * 160);
}







void drawImage(int row, int col, int height, int width, const unsigned short *image) {

    for (int r = 0; r < height; r++) {
        dma[3].cnt = 0;
        dma[3].src = &image[r*width];
        dma[3].dst = &videoBuffer[((row + r)*(240)+(col))];
        dma[3].cnt = width | (1 << 31);
    }
}


void drawImageHFlip(int row, int col, int height, int width, const unsigned short *image) {

    for (int r = 0; r < height; r++) {
        dma[3].cnt = 0;
        dma[3].src = &image[r*width + width - 1];
        dma[3].dst = &videoBuffer[((row + r)*(240)+(col))];
        dma[3].cnt = width | (1 << 23) | (1 << 31);
    }
}


void drawFullScreenImage(const unsigned short *image) {

    dma[3].cnt = 0;
    dma[3].src = image;
    dma[3].dst = videoBuffer;
    dma[3].cnt = (240 * 160) | (1 << 31);
}


void drawGameBG(const unsigned short *image) {

    dma[3].cnt = 0;
    dma[3].src = image;
    dma[3].dst = videoBuffer;
    dma[3].cnt = (240 * 140) | (1 << 31);
}







void waitForVBlank() {

    while ((*(volatile unsigned short *) 0x4000006) > 160);
    while ((*(volatile unsigned short *) 0x4000006) < 160);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | (2 << 23) | (1 << 31);
}


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1
        && rowB < rowA + heightA - 1
        && colA < colB + widthB - 1
        && colB < colA + widthA - 1;
}
