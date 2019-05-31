/******************************************************************************
Author:		Josh Terry
Project:	CS 2261 Homework 5
File:		main.c
Date:		13 November 2017

******************************************************************************/



/*
TODOS!!!
Start
	Press start takes you to game
Game
	array of enemies
	enemies
		row
		isActive
		isBottom
		if isBottom, shoot

Pause
	Pause state. Change background and hide all sprites
Win
	If no more enemies or kill boss
	gameWon = 1
Lose
	If player runs out of hp
	If enemies get too low
	gameOver = 1
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "sprites.h"

//Backgrounds
#include "gameBG.h"
#include "start0.h"
#include "lines.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "hud.h"



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

// Some visual things
int hOff = 0;
int vOff = 0;

// ShadowOAM
OBJ_ATTR shadowOAM[128];



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
	//Load BG palette and tiles and maps into appropriate places
	loadPalette(start0Pal);

	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	DMANow(3, start0Tiles, &CHARBLOCK[0], start0TilesLen/2);
	DMANow(3, start0Map, &SCREENBLOCK[28], start0MapLen/2);

	REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(24);
	DMANow(3, linesTiles, &CHARBLOCK[1], linesTilesLen/2);
	DMANow(3, linesMap, &SCREENBLOCK[24], linesMapLen/2);

	//Load sprite tiles and palette into their spaces
	DMANow(3, spritesTiles, &CHARBLOCK[4], spritesTilesLen/2);
	DMANow(3, spritesPal, SPRITEPALETTE, 256);

	//Hide all sprites
	hideSprites();

	//Enable sprites and set up background 0
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	gotoStart();
}




// ============================================== START =======================

// Sets up start state
void gotoStart() {
	vOff = 0;
	hOff = 0;
	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;
	gameOver = 0;
	gameWon = 0;
	score = 0;

    loadPalette(start0Pal);

	//Change Background
	//Display menu text
	DMANow(3, start0Tiles, &CHARBLOCK[0], start0TilesLen/2);
	DMANow(3, start0Map, &SCREENBLOCK[28], start0MapLen/2);

	//Display moving lines
	DMANow(3, linesTiles, &CHARBLOCK[1], linesTilesLen/2);
	DMANow(3, linesMap, &SCREENBLOCK[24], linesMapLen/2);

	//Wait for VBlank
	waitForVBlank();

	state = START;
}

// Runs every frame during start state
void start() {

	waitForVBlank();
	vOff++;
	REG_BG1VOFF = vOff/8;

	if (BUTTON_PRESSED(BUTTON_START)) {

		initGame();
		gotoGame();
	}
}




// ============================================== GAME ========================

// Sets up game state
void gotoGame() {
	REG_BG0VOFF = vOff;
	REG_BG0HOFF = hOff/3;
	REG_BG1VOFF = 0;
	REG_BG1HOFF = 0;
    loadPalette(gameBGPal);

	REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	DMANow(3, gameBGTiles, &CHARBLOCK[0], gameBGTilesLen/2);
	DMANow(3, gameBGMap, &SCREENBLOCK[28], gameBGMapLen/2);

	DMANow(3, hudTiles, &CHARBLOCK[1], hudTilesLen/2);
	DMANow(3, hudMap, &SCREENBLOCK[24], hudMapLen/2);

	waitForVBlank();

	state = GAME;
}

// Runs every frame during game state
void game() {

	waitForVBlank();

	updateGame();
	drawGame();

	vOff--;
	REG_BG0VOFF = vOff;
    DMANow(3, shadowOAM, OAM, 128*4);

    if(BUTTON_HELD(BUTTON_RIGHT))
    	hOff++;
    else if (BUTTON_HELD(BUTTON_LEFT))
    	hOff--;
	REG_BG0HOFF = hOff/5;


    if (BUTTON_PRESSED(BUTTON_START))
        gotoPause();
    else if (gameWon)
        gotoWin();
    else if (gameOver)
        gotoLose();
}




// ============================================== PAUSE =======================

// Sets up pause state
void gotoPause() {
	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;
    loadPalette(pausePal);

	DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
	DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen/2);

	DMANow(3, linesTiles, &CHARBLOCK[1], linesTilesLen/2);
	DMANow(3, linesMap, &SCREENBLOCK[24], linesMapLen/2);

	waitForVBlank();
	hideSprites();

	state = PAUSE;
}

// Runs every frame during pause
void pause() {

	waitForVBlank();
	vOff++;
	REG_BG1VOFF = vOff/8;

    if (BUTTON_PRESSED(BUTTON_START))
        gotoGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        gotoStart();
}




// ============================================== WIN =========================

// Sets up win state
void gotoWin() {
	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;
    loadPalette(winPal);


	DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
	DMANow(3, winMap, &SCREENBLOCK[28], winMapLen/2);

	DMANow(3, linesTiles, &CHARBLOCK[1], linesTilesLen/2);
	DMANow(3, linesMap, &SCREENBLOCK[24], linesMapLen/2);

	waitForVBlank();
	hideSprites();

	state = WIN;
}

// Runs every frame during win state
void win() {

	waitForVBlank();
	vOff++;
	REG_BG1VOFF = vOff/8;

    if (BUTTON_PRESSED(BUTTON_START))
        gotoStart();
}




// ============================================== LOSE ========================

// Sets up lose state
void gotoLose() {
	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;
    loadPalette(losePal);


	DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
	DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen/2);

	DMANow(3, linesTiles, &CHARBLOCK[1], linesTilesLen/2);
	DMANow(3, linesMap, &SCREENBLOCK[24], linesMapLen/2);

	waitForVBlank();
	hideSprites();

	state = LOSE;
}

// Runs every frame during lose state
void lose() {

	waitForVBlank();
	vOff++;
	REG_BG1VOFF = vOff/8;

    if (BUTTON_PRESSED(BUTTON_START))
        gotoStart();
}