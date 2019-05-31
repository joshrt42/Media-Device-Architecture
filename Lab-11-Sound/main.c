#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "TitleSong.h"
#include "GameSong.h"
#include "space01.h"
#include "space02.h"
#include "space03.h"
#include "space04.h"
#include "space05.h"
#include "space06.h"
#include "space07.h"
#include "StartSFX.h"

#define NUMOBJS 5

MOVOBJ objs[NUMOBJS];
int size = 5;

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

void initialize();
void update();
void draw();

#define STARTSCREEN 0
#define GAMESCREEN 1
#define LOSESCREEN 2
#define WINSCREEN 3
#define PAUSESCREEN 4

int state;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();

void start();
void game();
void pause();
void win();
void lose();

int randomSeed = 0;

unsigned int buttons;
unsigned int oldButtons;

const unsigned char* spaceSound;
int* spaceSoundLen;
int spaceSoundToPlay = 0;

unsigned short scanLineCounter;
char fpsbuffer[30];

#define BLACKINDEX 0
#define REDINDEX 1
#define BLUEINDEX 2
#define GREENINDEX 3
#define WHITEINDEX 4

int main()
{
	REG_DISPCTL = MODE4 | BG2_ENABLE;

	buttons = BUTTONS;

	state = STARTSCREEN;

	//TODO: CALL SETUP FUNCTIONS HERE
	// REMEMBER, WE HAVE TO SET UP INTERRUPTS AND SOUNDS
	setupSounds();
	setupInterrupts();
	PALETTE[BLACKINDEX] = BLACK;
	PALETTE[REDINDEX] = RED;
	PALETTE[BLUEINDEX] = BLUE;
	PALETTE[GREENINDEX] = GREEN;
	PALETTE[WHITEINDEX] = WHITE;

    playSoundA(TitleSong,TITLESONGLEN,TITLESONGFREQ, 1);

	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;

		fillScreen4(BLACKINDEX);

		switch(state)
		{
			case STARTSCREEN:
				start();
				break;
			case GAMESCREEN:
				game();
				break;
			case PAUSESCREEN:
				pause();
				break;
			case WINSCREEN:
				win();
				break;
			case LOSESCREEN:
				lose();
				break;
		}

		waitForVblank();
		flipPage();
	}

	return 0;
}

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM0CNT = 0;

        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        //TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values (excluding priority)
        soundA.data = sound;
    	soundA.length = length;
    	soundA.frequency = frequency;
    	soundA.isPlaying = 1;
    	soundA.loops = loops;
    	soundA.duration = VBLANK_FREQ * soundA.length / soundA.frequency;
    	soundA.vbCount = 0;
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;

        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        // TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundB.data = sound;
    	soundB.length = length;
    	soundB.frequency = frequency;
    	soundB.isPlaying = 1;
    	soundB.loops = loops;
    	soundB.duration = VBLANK_FREQ * soundB.length / soundB.frequency;
    	soundB.vbCount = 0;

}

void pauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
	REG_TM1CNT = 0;
	REG_TM0CNT = 0;
}

void unpauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 1;
	soundB.isPlaying = 1;
	REG_TM1CNT = TIMER_ON;
	REG_TM0CNT = TIMER_ON;
}

void stopSound()
{
    // TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
	REG_TM1CNT = 0;
	REG_TM0CNT = 0;
	dma[1].cnt = 0;
	dma[2].cnt = 0;
	soundA.loops = 0;
	soundB.loops = 0;
}

void setupInterrupts()
{
	REG_IME = 0;
	// TODO: SET UP THE INTERRUPT HANDLER HERE
	// HINT: THERE IS A REGISTER THAT NEEDS TO POINT TO A INTERRUPT FUNCTION
	// HINT: THAT INTERRUPT FUNCTION HAS TO BE CAST TO SOMETHING...
	REG_INTERRUPT = (unsigned int)interruptHandler;
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		//TODO: FINISH THIS FUNCTION
		// This should be where you determine if a sound if finished or not
		if (soundA.isPlaying) {
			soundA.vbCount++;
			if (soundA.vbCount > soundA.duration) {
				if (soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				} else {
					soundA.isPlaying = 0;
					dma[1].cnt = 0;
					REG_TM0CNT = 0;
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
					REG_TM1CNT = 0;
				}
			}
		}

		REG_IF = INT_VBLANK;
	}

	REG_IME = 1;
}

void start()
{

	drawString4(50,50, "START SCREEN", WHITEINDEX);
	drawString4(70,50, "Press START to begin", WHITEINDEX);
	randomSeed++;

	if(BUTTON_PRESSED(BUTTON_START))
	{
		//TODO: PLAY GAMESCREEN MUSIC AND STARTSFX SOUND HERE
		playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);
		playSoundB(StartSFX, STARTSFXLEN, STARTSFXFREQ, 0);
		state = GAMESCREEN;

		srand(randomSeed);
		initialize();
	}
}

void game()
{
	drawString4(50,50, "GAME SCREEN", BLUEINDEX);
	drawString4(70,50, "Press START to pause", BLUEINDEX);
    drawString4(90,50, "Press SELECT to return", BLUEINDEX);

	if(BUTTON_HELD(BUTTON_L))
	{
		size--;
	}
	if(BUTTON_HELD(BUTTON_R))
	{
		size++;
	}

	update();

	draw();

	if(BUTTON_PRESSED(BUTTON_START))
	{
        // TODO: PAUSE MUSIC HERE
		pauseSound();
		state = PAUSESCREEN;
	}
    if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		// TODO: STOP ALL SOUNDS HERE AND GO TO SPLASH
		// Restart the title song
		stopSound();
		playSoundA(TitleSong, TITLESONGLEN, TITLESONGFREQ, 1);
		state = STARTSCREEN;
	}

    if(BUTTON_PRESSED(BUTTON_B))
	{
		// TODO Call stopSounds here
		stopSound();
	}

    if(BUTTON_PRESSED(BUTTON_A))
	{
		spaceSoundToPlay = rand()%7;
		switch(spaceSoundToPlay) {
			case 0:
				spaceSound = space01;
				spaceSoundLen = &_space01len;
				break;
			case 1:
				spaceSound = space02;
				spaceSoundLen = &_space02len;
				break;
			case 2:
				spaceSound = space03;
				spaceSoundLen = &_space03len;
				break;
			case 3:
				spaceSound = space04;
				spaceSoundLen = &_space04len;
				break;
			case 4:
				spaceSound = space05;
				spaceSoundLen = &_space05len;
				break;
			case 5:
				spaceSound = space06;
				spaceSoundLen = &_space06len;
				break;
			case 6:
				spaceSound = space07;
				spaceSoundLen = &_space07len;
				break;
		}

		//TODO: PLAY 'spaceSound' HERE
		//Choose SPACE01FREQ for the frequency
		playSoundB(spaceSound, *spaceSoundLen, SPACE01FREQ, 0);
	}

}

void pause()
{
	drawString4(50,50, "PAUSE SCREEN", GREENINDEX);
    drawString4(70,50, "Press START to return", GREENINDEX);
    if(BUTTON_PRESSED(BUTTON_START))
	{
		//TODO: UNPAUSE SOUND HERE
		unpauseSound();
		state = GAMESCREEN;
	}
}

void win()
{
	drawString4(50,50, "WIN SCREEN", GREENINDEX);
}

void lose()
{
	drawString4(50,50, "LOSE SCREEN", REDINDEX);

}

void initialize()
{
	int dels[ ] = {-2, -1, 1, 2};

	int i;
	for(i = 0; i < NUMOBJS; i++)
	{
		objs[i].size = size;

		objs[i].row = rand()%(160-objs[i].size);
		objs[i].col = rand()%(240-objs[i].size);

		objs[i].color = rand()%WHITEINDEX + 1;

		objs[i].rdel = dels[rand()%4];
		objs[i].cdel = dels[rand()%4];
	}
}

void update()
{
	int i;
	for(i=0; i<NUMOBJS; i++)
	{

		objs[i].row += objs[i].rdel;
		objs[i].col += objs[i].cdel;

		objs[i].size = size;

		if(objs[i].row<0)
		{
			objs[i].row = 0;
			objs[i].rdel = -objs[i].rdel;
		}
		if(objs[i].row>159-objs[i].size)
		{
			objs[i].row = 159-objs[i].size;
			objs[i].rdel = -objs[i].rdel;
		}
		if(objs[i].col < 0)
		{
			objs[i].col = 0;
			objs[i].cdel = -objs[i].cdel;
		}
		if(objs[i].col > 239-objs[i].size)
		{
			objs[i].col = 239-objs[i].size;
			objs[i].cdel= -objs[i].cdel;
		}
	}
}

void draw()
{
	int i;
	for(i=0; i < NUMOBJS; i++)
	{
		drawRect4(objs[i].row, objs[i].col, objs[i].size, objs[i].size, objs[i].color);
	}

	sprintf(fpsbuffer, "%d", soundA.vbCount);
	drawString4(10,10, fpsbuffer, WHITEINDEX);

}

