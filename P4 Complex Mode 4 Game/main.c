/******************************************************************************
Author:		Josh Terry
Project:	CS 2261 Homework 4
File:		main.c
Date:		6 September 2017

******************************************************************************/



/*
TODOS!!!
Images
	start x2
	game  x4
	pause x2
	win   x2
	lose  x2
	player image
	enemy images
Palette
Draw horizontal section of image in mylib to better refresh horizontal placement in game

plot: Character moving left to right in cave, vaporwave space ship dodging bars and enemy ships.
shoot enemy ships to score points
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "start1.h"
#include "start2.h"
#include "start3.h"
#include "pause1.h"
#include "pause2.h"
#include "lose.h"
#include "win.h"
#include "gamebg.h"
#include "refresher.h"
#include "blue.h"



// ============================================== PROTOTYPES ==================

void initialize();
void gotoStart();
void start();
void gotoGame();
void game();
void gotoPause();
void pause();
void gotoWin();
void win();
void gotoLose();
void lose();




// ============================================== DEFINITIONS =================

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Text Buffer
char buffer[41];

// Some stuff to keep track of frames and animations
volatile char frame;
volatile char frameCap = 120;

// Player score or frames lasted
volatile unsigned int score;




// ============================================== MAIN ========================

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

// Initializes the GBA itself
void initialize() {

	REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
	gotoStart();
}




// ============================================== START =======================

// Sets up start state
void gotoStart() {

	loadPalette(start1Pal);
	drawFullScreenImage(start1Bitmap);

	waitForVBlank();
	flipPage();
	gameOver = 0;
	state = START;
}

// Runs every frame during start state
void start() {

	waitForVBlank();
	flipPage();

	//TODO: animate background
	int frame = rand() % frameCap;

	if (frame < frameCap / 3) {
		drawFullScreenImage(start1Bitmap);
	} else if (frame < 2*frameCap/3) {
		drawFullScreenImage(start2Bitmap);
	} else {
		drawFullScreenImage(start3Bitmap);
	}

	if (BUTTON_PRESSED(BUTTON_START)) {
		gotoGame();
		initGame();
	}
}




// ============================================== GAME ========================

// Sets up game state
void gotoGame() {

	drawFullScreenImage(gamebgBitmap);
    drawString(145, 5, "Virii left:\0", WHITE);
	flipPage();
	drawFullScreenImage(gamebgBitmap);
    drawString(145, 5, "Virii left:\0", WHITE);

	frame = 0;
	state = GAME;
}

// Runs every frame during game state
void game() {

    sprintf(buffer, "%d", enemiesRemaining);

	updateGame();
	refreshGame();
	drawGame();

	drawImage(145, 73, 8, 12, blueBitmap);
    drawString(145, 72, buffer, WHITE);

	waitForVBlank();
	flipPage();

    if (BUTTON_PRESSED(BUTTON_START))
        gotoPause();
    else if (enemiesRemaining < 1)
        gotoWin();
    else if (gameOver)
        gotoLose();

	if (frame++ > frameCap) {
		score++;
		frame = 0;
	}
}




// ============================================== PAUSE =======================

// Sets up pause state
void gotoPause() {

	//TODO: actually draw background
	drawFullScreenImage(pause1Bitmap);

	waitForVBlank();
	flipPage();

	frame = 0;
	state = PAUSE;
}

// Runs every frame during pause
void pause() {

	//TODO: actually draw and animate background else if (frame < 2*frameCap/3) {
	int frame = rand() % frameCap;
	flipPage();

	if (frame < frameCap / 2) {
		drawFullScreenImage(pause1Bitmap);
	} else {
		drawFullScreenImage(pause2Bitmap);
	}

	waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        gotoGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        gotoStart();

	if (frame++ > frameCap)
		frame = 0;
}




// ============================================== WIN =========================

// Sets up win state
void gotoWin() {

	drawFullScreenImage(winBitmap);

	waitForVBlank();
	flipPage();

	frame = 0;
	state = WIN;
}

// Runs every frame during win state
void win() {

	waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        gotoStart();

	if (frame++ > frameCap)
		frame = 0;
}




// ============================================== LOSE ========================

// Sets up lose state
void gotoLose() {

	drawFullScreenImage(loseBitmap);

	waitForVBlank();
	flipPage();

	frame = 0;
	state = LOSE;
}

// Runs every frame during lose state
void lose() {

	waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        gotoStart();

	if (frame++ > frameCap)
		frame = 0;
}