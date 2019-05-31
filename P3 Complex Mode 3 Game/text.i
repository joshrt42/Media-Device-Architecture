# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"





# 1 "myLib.h" 1
# 27 "myLib.h"
extern unsigned short *videoBuffer;






void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);
void drawImage(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage(const unsigned short *image);
void waitForVBlank();
# 61 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 73 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 97 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);






int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 7 "text.c" 2
# 1 "text.h" 1






void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 8 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 9 "text.c" 2


void drawChar(int row, int col, char ch, unsigned short color) {

    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[ch*48 + ((r)*(6)+(c))]) {
                setPixel(row + r, col + c, color);
            }
        }
    }
}


void drawString(int row, int col, char *str, unsigned short color) {

    while (*str != '\0') {
        drawChar(row, col, *str, color);
        str++;
        col += 6;
    }
}
