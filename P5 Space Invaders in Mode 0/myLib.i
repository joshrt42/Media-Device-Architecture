# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 9 "myLib.c"
# 1 "myLib.h" 1
# 13 "myLib.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 70 "myLib.h"
extern unsigned short *videoBuffer;
# 79 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;




void waitForVBlank();
void loadPalette(const unsigned short * palette);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 138 "myLib.h"
void hideSprites();
# 159 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 170 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 210 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 10 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void waitForVBlank() {

 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}

void loadPalette(const unsigned short *palette) {

    DMANow(3, palette, ((unsigned short *)0x5000000), 256);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}


void hideSprites() {
    for (unsigned char x = 0; x < 128; x++) {
        shadowOAM[x].attr0 = (2<<8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}
