# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
void loadPalette(const unsigned short * palette);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 158 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 201 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 252 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 3 "main.c" 2
# 1 "house.h" 1
# 22 "house.h"
extern const unsigned short houseTiles[896];


extern const unsigned short houseMap[1024];


extern const unsigned short housePal[256];
# 4 "main.c" 2

# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[65536];
# 6 "main.c" 2

void initialize();
void initPikachu();
void initPokeball();
void updateGame();
void updatePikachu();
void updatePokeball();
void animatePikachu();
void animatePokeball();
void drawGame();
void drawPikachu();
void drawPokeball();

unsigned short buttons;
unsigned short oldButtons;

int hOff;
int vOff;

OBJ_ATTR shadowOAM[128];




ANISPRITE pikachu;
ANISPRITE pokeball;

enum {PIKAFRONT, PIKABACK, PIKARIGHT, PIKALEFT, PIKAIDLE};

int main() {

 initialize();

 while(1) {

  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);

        updateGame();
        drawGame();
 }
}


void initialize() {


    loadPalette(housePal);
    DMANow(3, houseTiles, &((charblock *)0x6000000)[0], 1792/2);
    DMANow(3, houseMap, &((screenblock *)0x6000000)[31], 2048/2);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((31)<<8) | (0<<14);
    vOff = 96;
    hOff = 9;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;


    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);





    initPikachu();
    initPokeball();
}


void initPikachu() {

    pikachu.width = 16;
    pikachu.height = 16;
    pikachu.rdel = 1;
    pikachu.cdel = 1;
    pikachu.worldRow = 160/2-pikachu.width/2 + vOff;
    pikachu.worldCol = 240/2-pikachu.height/2 + hOff;
    pikachu.aniCounter = 0;
    pikachu.curFrame = 0;
    pikachu.numFrames = 3;
    pikachu.aniState = PIKAFRONT;
}


void initPokeball() {

    pokeball.width = 32;
    pokeball.height = 32;
    pokeball.worldRow = 50;
    pokeball.worldCol = 50;
    pokeball.aniCounter = 0;
    pokeball.curFrame = 0;
    pokeball.numFrames = 4;
}


void updateGame() {
    updatePikachu();
    updatePokeball();
}


void updatePikachu() {






    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))
         && collisionmapBitmap[((pikachu.worldRow + pikachu.height - 1 + pikachu.rdel)*(256)+(pikachu.worldCol + 1))]
         && collisionmapBitmap[((pikachu.worldRow + pikachu.height - 1 + pikachu.rdel)*(256)+(pikachu.worldCol + pikachu.width - 1))]
         && pikachu.worldRow < 256 - pikachu.height){
        pikachu.worldRow += pikachu.rdel;
        if (pikachu.worldRow < 256 - 160/2 - pikachu.height/2 && pikachu.worldRow > 160/2 - pikachu.height/2 + 1)
            vOff += pikachu.rdel;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))
         && collisionmapBitmap[((pikachu.worldRow - pikachu.rdel)*(256)+(pikachu.worldCol + 1))]
         && collisionmapBitmap[((pikachu.worldRow - pikachu.rdel)*(256)+(pikachu.worldCol + pikachu.width - 1))]
         && pikachu.worldRow > 1){
        pikachu.worldRow -= pikachu.rdel;
        if (pikachu.worldRow < 256 - 160/2 - pikachu.height/2 && pikachu.worldRow > 160/2 - pikachu.height/2 + 1)
            vOff -= pikachu.rdel;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))
         && collisionmapBitmap[((pikachu.worldRow)*(256)+(pikachu.worldCol + 1 - pikachu.cdel))]
         && collisionmapBitmap[((pikachu.worldRow + pikachu.height - 1)*(256)+(pikachu.worldCol + 1 - pikachu.cdel))]
         && pikachu.worldCol > 1){
        pikachu.worldCol -= pikachu.cdel;
        if (pikachu.worldCol < 256 - 240/2 - pikachu.width/2 && pikachu.worldCol > 240/2 - pikachu.width/2)
            hOff -= pikachu.cdel;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))
         && collisionmapBitmap[((pikachu.worldRow)*(256)+(pikachu.worldCol + pikachu.width - 1 + pikachu.cdel))]
         && collisionmapBitmap[((pikachu.worldRow + pikachu.height - 1)*(256)+(pikachu.worldCol + pikachu.width - 1 + pikachu.cdel))]
         && pikachu.worldCol < 256 - pikachu.width){
        pikachu.worldCol += pikachu.cdel;
        if (pikachu.worldCol < 256 - 240/2 - pikachu.width/2 && pikachu.worldCol > 240/2 - pikachu.width/2)
            hOff += pikachu.cdel;
    }
# 160 "main.c"
    pikachu.screenRow = pikachu.worldRow - vOff;
    pikachu.screenCol = pikachu.worldCol - hOff;


    animatePikachu();
}


void updatePokeball() {


    pokeball.hide = (pokeball.screenRow < -pokeball.height || pokeball.screenRow > 160) ? 1 : 0;



    pokeball.screenRow = pokeball.worldRow - vOff;
    pokeball.screenCol = pokeball.worldCol - hOff;


    animatePokeball();
}


void animatePikachu() {


    pikachu.prevAniState = pikachu.aniState;
    pikachu.aniState = PIKAIDLE;


    if(pikachu.aniCounter % 20 == 0) {
        pikachu.curFrame = (pikachu.curFrame + 1) % pikachu.numFrames;
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))))
        pikachu.aniState = PIKABACK;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))))
        pikachu.aniState = PIKAFRONT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))))
        pikachu.aniState = PIKALEFT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))))
        pikachu.aniState = PIKARIGHT;


    if (pikachu.aniState == PIKAIDLE) {
        pikachu.curFrame = 0;
        pikachu.aniState = pikachu.prevAniState;
    } else {
        pikachu.aniCounter++;
    }
}


void animatePokeball() {


    if(pokeball.aniCounter % 20 == 0) {
        pokeball.curFrame = (pokeball.curFrame + 1) % pokeball.numFrames;
    }
    pokeball.aniCounter++;
}


void drawGame() {
    drawPikachu();
    drawPokeball();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}


void drawPikachu() {

    if (pikachu.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & pikachu.screenRow) | (0<<13) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & pikachu.screenCol) | (1<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((pikachu.curFrame * 2)*32+(pikachu.aniState * 2));
    }
}


void drawPokeball() {

    if(pokeball.hide) {
        shadowOAM[1].attr0 |= (2<<8);
    } else {
        shadowOAM[1].attr0 = (pokeball.screenRow & 0xFF) | (0<<13) | (0<<14);
        shadowOAM[1].attr1 = (pokeball.screenCol & 0x1FF) | (2<<14);
        shadowOAM[1].attr2 = ((1)<<12) | ((pokeball.curFrame * 4)*32+(8));
    }
}
