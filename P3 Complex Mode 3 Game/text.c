// JOSH TERRY
// CS 2261 - SPRING 2017
// HOMEWORK 3 - SIMPLE MODE 3 GAME
// TEXT.C

#include "myLib.h"
#include "text.h"
#include "font.h"

//Draws the specified character at the specified location
void drawChar(int row, int col, char ch, unsigned short color) {

    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[ch*48 + OFFSET(r, c, 6)]) {
                setPixel(row + r, col + c, color);
            }
        }
    }
}

//Draws the specified string at the specified location
void drawString(int row, int col, char *str, unsigned short color) {

    while (*str != '\0') {
        drawChar(row, col, *str, color);
        str++;
        col += 6;
    }
}