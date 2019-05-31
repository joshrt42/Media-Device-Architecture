# 1 "soundProcessing.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "soundProcessing.c"
# 13 "soundProcessing.c"
# 1 "soundProcessing.h" 1
# 14 "soundProcessing.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSoundA();
void muteSoundB();
void unmuteSoundA();
void unmuteSoundB();
void stopSoundA();
void stopSoundB();

void setupInterrupts();
void interruptHandler();
# 14 "soundProcessing.c" 2
# 1 "myLib.h" 1
# 16 "myLib.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 75 "myLib.h"
extern unsigned short *videoBuffer;
# 96 "myLib.h"
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
# 169 "myLib.h"
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
# 212 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 223 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 263 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 356 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 15 "soundProcessing.c" 2


void setupSounds() {

    *(volatile u16 *)0x04000084 = (1<<7);
 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;
}




void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);

        soundA.data = sound;
     soundA.length = length;
     soundA.frequency = frequency;
     soundA.isPlaying = 1;
     soundA.loops = loops;
     soundA.duration = (59.727) * soundA.length / soundA.frequency;
     soundA.vbCount = 0;
}




void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundB.data = sound;
     soundB.length = length;
     soundB.frequency = frequency;
     soundB.isPlaying = 1;
     soundB.loops = loops;
     soundB.duration = (59.727) * soundB.length / soundB.frequency;
     soundB.vbCount = 0;

}




void pauseSoundA() {

 soundA.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;
}

void pauseSoundB() {

 soundB.isPlaying = 0;
 *(volatile unsigned short*)0x4000106 = 0;
}




void unpauseSoundA() {

 soundA.isPlaying = 1;
 *(volatile unsigned short*)0x4000102 = (1<<7);
}

void unpauseSoundB() {

 soundB.isPlaying = 1;
 *(volatile unsigned short*)0x4000106 = (1<<7);
}




void stopSoundA() {

 soundA.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 dma[1].cnt = 0;
 soundA.loops = 0;
}

void stopSoundB() {

 soundB.isPlaying = 0;
 *(volatile unsigned short*)0x4000106 = 0;
 dma[2].cnt = 0;
 soundB.loops = 0;
}




void setupInterrupts() {

 *(unsigned short*)0x4000208 = 0;
 *(unsigned int*)0x3007FFC = (unsigned int)interruptHandler;
 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}




void interruptHandler() {

 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0)
 {
  if (soundA.isPlaying) {
   soundA.vbCount++;
   if (soundA.vbCount > soundA.duration) {
    if (soundA.loops) {
     playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
    } else {
     soundA.isPlaying = 0;
     dma[1].cnt = 0;
     *(volatile unsigned short*)0x4000102 = 0;
    }
   }
  }

  if (soundB.isPlaying) {
   soundB.vbCount++;
   if (soundB.vbCount > soundB.duration) {
    if (soundB.loops) {
     playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
    } else {
     soundB.isPlaying = 0;
     dma[2].cnt = 0;
     *(volatile unsigned short*)0x4000106 = 0;
    }
   }
  }

  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

 *(unsigned short*)0x4000208 = 1;
}
