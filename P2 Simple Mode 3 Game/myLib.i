# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 39 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void makeRedBall(int row, int col);
void makeGreenBall(int row, int col);
void makePlayer(int row, int col);
void eraseBall(int row, int col);
void fillScreen(unsigned short color);


void waitForVBlank();
# 69 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 80 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;


void setPixel(int row, int col, unsigned short color) {

 videoBuffer[((row)*(240)+(col))] = color;
}


void drawRect(int row, int col, int height, int width, unsigned short color) {

    int c,r;

    for (r = row; r < row + height; r++) {
        for (c = col; c < col + width; c++) {
            setPixel(r, c, color);
        }
    }
}


void makeRedBall(int row, int col) {

    drawRect(row, col, 5, 5, ((31) | (0)<<5 | (0)<<10));
}


void makeGreenBall(int row, int col) {

    drawRect(row, col, 5, 5, ((0) | (31)<<5 | (0)<<10));
}


void makePlayer(int row, int col) {

    drawRect(row, col, 10, 10, ((31) | (31)<<5 | (31)<<10));
}



void fillScreen(unsigned short color) {

    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}


void waitForVBlank() {

 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
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
