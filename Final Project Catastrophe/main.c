/******************************************************************************
Author:		Josh Terry
Project:	CS 2261 Final
File:		main.c
Date:		28 November 2017

******************************************************************************/



/*
                  ___           ___           ___
      ___        /\__\         /\  \         /\  \
     /\  \      /::|  |       /::\  \       /::\  \
     \:\  \    /:|:|  |      /:/\:\  \     /:/\:\  \
     /::\__\  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \
  __/:/\/__/ /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\
 /\/:/  /    \/__|:|/:/  / \/__\:\ \/__/ \:\  \ /:/  /
 \::/__/         |:/:/  /       \:\__\    \:\  /:/  /
  \:\__\         |::/  /         \/__/     \:\/:/  /
   \/__/         /:/  /                     \::/  /
                 \/__/                       \/__/

 	Welcome to Catastrophe!
 	The world is coming to an end. Cats are falling from the sky.
 	It is up to you to collect enough cheese to survive the cataclysm.
 	Go out and collect all of the cheese, then return to your cave to win!
 	Or, you know, cheat with a gun and just shoot them. :c
 	You have 3 lives. Touching a cat reduces your lives by 1.
 	Press up to jump over cats, and left and right to move left and right!
 	You have 30 seconds until the world ends by cat. Good luck!

	Start
		Select to view help
		Start to go to game
	Help
		Any button to return to start
	Game
		Arrow keys to move + jump
		A to equip/unequip gun
		B to shoot cats
		Start to pause
		Touching cats reduces lives by 1
		You have only 60 seconds and 3 lives
		Collect all 9 pieces of cheese and return home to win
		HUD in upper right
		Run out of time or lives to lose
	Pause
		Start to return to game
		Select to return to start
	Win
		Any button to return to start
	Lose
		Any button to return to start

	Extra things:
		Multiple music tracks (start, game, win, lose)
		Multiple one-off sounds (menu action, cat death, gun shoot, cheese pickup)
		Game music lines up with end of 30 second gameplay timeframe
		Highly detailed sprites and animations (Mouse idle and running, cats, custom font)
		Entertaining gameplay (multiple ways to win/lose, things to do)
		Cheat trivializes game, yet adds another element to it.
		Custom/unique art style (So much time spent. I don't draw.)
		Accurate gravity, without up/down shifting (in game.c under updatePlayer())
		Highly organized, well-commented, easily-readable, dynamic, flexible code.
		Use of 3+ backgrounds at a time
		Use of parallaxed backgrounds
		GeNEraL CoOLneSs :^)

	Bugs:
		Have been unable to find any bugs in most recent build.
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"

//Sprites
#include "spriteSheet.h"

//Menu wording backgrounds
#include "menuTitle.h"
#include "menuPause.h"
#include "menuLose.h"
#include "menuWin.h"
#include "menuHelp.h"

//Some scenic backgrounds
#include "fallingCats.h"
#include "lostCats.h"
#include "grassyBG.h"

//Backgrounds only in game
#include "mountains.h"
#include "gameBG.h"

//Sound
#include "soundProcessing.h"
#include "musicWin.h"
#include "musicGame.h"
#include "musicLose.h"
#include "musicPause.h"
#include "soundClick.h"
#include "death.h"



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
void gotoHelp();
void help();




// ============================================== DEFINITIONS =================

// States
enum {START, GAME, PAUSE, WIN, LOSE, HELP};
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
            case HELP:
            	help();
            	break;
        }
    }
}

// Initializes the GBA itself
void initialize() {
	//Load BG palette
	loadPalette(menuPausePal);

	//Load BG0 start tiles and maps.
	REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
	DMANow(3, menuTitleTiles, &CHARBLOCK[0], menuTitleTilesLen/2);
	DMANow(3, menuTitleMap, &SCREENBLOCK[30], menuTitleMapLen/2);

	//Load BG1 tiles and maps.
	REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);
	DMANow(3, grassyBGTiles, &CHARBLOCK[1], grassyBGTilesLen/2);
	DMANow(3, grassyBGMap, &SCREENBLOCK[28], grassyBGMapLen/2);

	//Load BG2 tiles and maps.
	REG_BG2CNT = BG_SIZE_TALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(26);
	DMANow(3, fallingCatsTiles, &CHARBLOCK[2], fallingCatsTilesLen/2);
	DMANow(3, fallingCatsMap, &SCREENBLOCK[26], fallingCatsMapLen/2);

	//Load sprite tiles and palette into their spaces
	DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
	DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

	//Hide all sprites
	hideSprites();

	gameOver = 0;
    playSoundA(musicPause,MUSICPAUSELEN,MUSICPAUSEFREQ, 1);

	//Enable sprites and set up background 0
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

	gotoStart();
}




// ============================================== START =======================

// Sets up start state
void gotoStart() {
	hOff = 0;
	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;
	REG_BG1VOFF = 0;
	REG_BG1HOFF = 0;
	REG_BG2HOFF = 0;
	gameWon = 0;
	gameOver = 0;

	setupSounds();
	setupInterrupts();


	//Load BG palette
	loadPalette(menuPausePal);

	//Load BG0 start tiles and maps.
	DMANow(3, menuTitleTiles, &CHARBLOCK[0], menuTitleTilesLen/2);
	DMANow(3, menuTitleMap, &SCREENBLOCK[30], menuTitleMapLen/2);

	//Load grassy background tiles and maps.
	DMANow(3, grassyBGTiles, &CHARBLOCK[1], grassyBGTilesLen/2);
	DMANow(3, grassyBGMap, &SCREENBLOCK[28], grassyBGMapLen/2);

	//Load Falling cats tiles and maps.
	DMANow(3, fallingCatsTiles, &CHARBLOCK[2], fallingCatsTilesLen/2);
	DMANow(3, fallingCatsMap, &SCREENBLOCK[26], fallingCatsMapLen/2);

	//Load sprite tiles and palette into their spaces
	DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
	DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

	//Hide all sprites
	hideSprites();

    shadowOAM[0].attr0 = 96 | ATTR0_WIDE | ATTR0_REGULAR;
    shadowOAM[0].attr1 = 200 | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(21, 19);

    DMANow(3, shadowOAM, OAM, 128*4);

	//Wait for VBlank
	waitForVBlank();

	state = START;
}

// Runs every frame during start state
void start() {

	waitForVBlank();

	vOff--;
	REG_BG2VOFF=vOff;

	if (BUTTON_PRESSED(BUTTON_START)) {

    	playSoundB(soundClick,SOUNDCLICKLEN,SOUNDCLICKFREQ, 0);
		playSoundA(musicGame,MUSICGAMELEN,MUSICGAMEFREQ, 0);

		initGame();
		gotoGame();
	} else if (BUTTON_PRESSED(BUTTON_SELECT)) {

    	playSoundB(soundClick,SOUNDCLICKLEN,SOUNDCLICKFREQ, 0);

		gotoHelp();
	}
}




// ============================================== GAME ========================

// Sets up game state
void gotoGame() {
	REG_BG0VOFF = -12;
	REG_BG1VOFF = -12;

	//Load Palette
	loadPalette(gameBGPal);

	hideSprites();

	//Load game background tiles and maps.
	DMANow(3, gameBGTiles, &CHARBLOCK[0], gameBGTilesLen/2);
	DMANow(3, gameBGMap, &SCREENBLOCK[30], gameBGMapLen/2);

	//Load mountain tiles and maps.
	DMANow(3, mountainsTiles, &CHARBLOCK[1], mountainsTilesLen/2);
	DMANow(3, mountainsMap, &SCREENBLOCK[28], mountainsMapLen/2);

	//Load Falling cats tiles and maps.
	DMANow(3, fallingCatsTiles, &CHARBLOCK[2], fallingCatsTilesLen/2);
	DMANow(3, fallingCatsMap, &SCREENBLOCK[26], fallingCatsMapLen/2);

	waitForVBlank();

	state = GAME;
}

// Runs every frame during game state
void game() {

	waitForVBlank();


	vOff--;

	REG_BG0HOFF = hOff;

	REG_BG1HOFF = hOff/2;

	REG_BG2VOFF = vOff;
	REG_BG2HOFF = hOff/3;

	updateGame();
	drawGame();
    DMANow(3, shadowOAM, OAM, 128*4);

    if (BUTTON_HELD(BUTTON_LEFT)
    	&& (player.worldCol > SCREENWIDTH/2 - player.width/2)
    	&& (player.worldCol < 768 - SCREENWIDTH/2 - player.width/2))
    	hOff -= player.cdel;
    if (BUTTON_HELD(BUTTON_RIGHT)
    	&& (player.worldCol > SCREENWIDTH/2 - player.width/2)
    	&& (player.worldCol < 768 - SCREENWIDTH/2 - player.width/2))
    	hOff += player.cdel;

    player.screenRow = player.worldRow;
    player.screenCol = player.worldCol - hOff;
    for (int i = 0; i < CATCOUNT; i++) {
    	cats[i].screenCol = cats[i].worldCol - hOff;
    }
    for (int i = 0; i < CHEESECOUNT; i++) {
    	cheese[i].screenCol = cheese[i].worldCol - hOff;
    }
    for (int i = 0; i < BULLETCOUNT; i++) {
    	bullets[i].screenCol = bullets[i].worldCol - hOff;
    }

    if (BUTTON_PRESSED(BUTTON_START)) {

    	playSoundA(musicPause,MUSICPAUSELEN,MUSICPAUSEFREQ, 1);
    	playSoundB(soundClick,SOUNDCLICKLEN,SOUNDCLICKFREQ, 0);
        gotoPause();

    } else if (gameWon) {

    	playSoundA(musicWin,MUSICWINLEN,MUSICWINFREQ, 1);
        gotoWin();

    } else if (gameOver) {

    	playSoundA(musicLose,MUSICLOSELEN,MUSICLOSEFREQ, 1);
    	playSoundB(death,DEATHLEN,DEATHFREQ, 0);
        gotoLose();
    }
}




// ============================================== PAUSE =======================

// Sets up pause state
void gotoPause() {
	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;
	REG_BG1VOFF = 0;
	REG_BG1HOFF = 0;
	REG_BG2HOFF = 0;

	//Load Palette
	loadPalette(menuPausePal);
	hideSprites();

	//Change Backgrounds
	//Load pause title thing
	DMANow(3, menuPauseTiles, &CHARBLOCK[0], menuPauseTilesLen/2);
	DMANow(3, menuPauseMap, &SCREENBLOCK[30], menuPauseMapLen/2);

	//Load grassy background tiles and maps.
	DMANow(3, grassyBGTiles, &CHARBLOCK[1], grassyBGTilesLen/2);
	DMANow(3, grassyBGMap, &SCREENBLOCK[28], grassyBGMapLen/2);

	//Load Falling cats tiles and maps.
	DMANow(3, fallingCatsTiles, &CHARBLOCK[2], fallingCatsTilesLen/2);
	DMANow(3, fallingCatsMap, &SCREENBLOCK[26], fallingCatsMapLen/2);

	waitForVBlank();

	state = PAUSE;
}

// Runs every frame during pause
void pause() {

	vOff--;
	REG_BG2VOFF=vOff;

	waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
    	playSoundB(soundClick,SOUNDCLICKLEN,SOUNDCLICKFREQ, 0);
		playSoundA(musicGame,MUSICGAMELEN,MUSICGAMEFREQ, 0);
        gotoGame();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
    	playSoundB(soundClick,SOUNDCLICKLEN,SOUNDCLICKFREQ, 0);
        gotoStart();
    }
}




// ============================================== WIN =========================

// Sets up win state
void gotoWin() {
	vOff = 0;
	hOff = 0;
	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;
	REG_BG1VOFF = 0;
	REG_BG1HOFF = 0;
	REG_BG2VOFF = 0;
	REG_BG2HOFF = 0;

	//Load Palette
	loadPalette(menuPausePal);

	//Change Background
	//Load win title thing
	DMANow(3, menuWinTiles, &CHARBLOCK[0], menuWinTilesLen/2);
	DMANow(3, menuWinMap, &SCREENBLOCK[30], menuWinMapLen/2);

	//Load grassy background tiles and maps.
	DMANow(3, grassyBGTiles, &CHARBLOCK[1], grassyBGTilesLen/2);
	DMANow(3, grassyBGMap, &SCREENBLOCK[28], grassyBGMapLen/2);

	//Load Falling cats tiles and maps.
	DMANow(3, fallingCatsTiles, &CHARBLOCK[2], fallingCatsTilesLen/2);
	DMANow(3, fallingCatsMap, &SCREENBLOCK[26], fallingCatsMapLen/2);

	waitForVBlank();
	hideSprites();

	state = WIN;
}

// Runs every frame during win state
void win() {

	vOff++;
	REG_BG2VOFF=vOff;

	waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {

    	playSoundA(musicPause,MUSICPAUSELEN,MUSICPAUSEFREQ, 1);
    	playSoundB(soundClick,SOUNDCLICKLEN,SOUNDCLICKFREQ, 0);
        gotoStart();
    }
}




// ============================================== LOSE ========================

// Sets up lose state
void gotoLose() {
	vOff = 0;
	hOff = 0;
	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;
	REG_BG1VOFF = 0;
	REG_BG1HOFF = 0;
	REG_BG2VOFF = 0;
	REG_BG2HOFF = 0;

	//Load Palette
	loadPalette(menuLosePal);

	//Change Background
	//Load win title thing
	DMANow(3, menuLoseTiles, &CHARBLOCK[0], menuLoseTilesLen/2);
	DMANow(3, menuLoseMap, &SCREENBLOCK[30], menuLoseMapLen/2);

	//Load grassy background tiles and maps.
	DMANow(3, 0, &CHARBLOCK[1], grassyBGTilesLen/2);
	DMANow(3, 0, &SCREENBLOCK[28], grassyBGMapLen/2);

	//Load Falling cats tiles and maps.
	DMANow(3, lostCatsTiles, &CHARBLOCK[2], lostCatsTilesLen/2);
	DMANow(3, lostCatsMap, &SCREENBLOCK[26], lostCatsMapLen/2);

	waitForVBlank();
	hideSprites();

	state = LOSE;
}

// Runs every frame during lose state
void lose() {

	waitForVBlank();
	vOff -= (2);
	hOff += (rand()%5 - 2);
	REG_BG2VOFF=vOff;
	REG_BG2HOFF=hOff;

    if (BUTTON_PRESSED(BUTTON_START)) {

    	playSoundA(musicPause,MUSICPAUSELEN,MUSICPAUSEFREQ, 1);
    	playSoundB(soundClick,SOUNDCLICKLEN,SOUNDCLICKFREQ, 0);
        gotoStart();
    }
}




// ============================================== HELP ========================

// Sets up help state
void gotoHelp() {

	//Load Palette
	loadPalette(menuHelpPal);
	//Change Background
	DMANow(3, menuHelpTiles, &CHARBLOCK[0], menuHelpTilesLen/2);
	DMANow(3, menuHelpMap, &SCREENBLOCK[30], menuHelpMapLen/2);

	//Load grassy background tiles and maps.
	DMANow(3, grassyBGTiles, &CHARBLOCK[1], grassyBGTilesLen/2);
	DMANow(3, grassyBGMap, &SCREENBLOCK[28], grassyBGMapLen/2);

	//Load Falling cats tiles and maps.
	DMANow(3, fallingCatsTiles, &CHARBLOCK[2], fallingCatsTilesLen/2);
	DMANow(3, fallingCatsMap, &SCREENBLOCK[26], fallingCatsMapLen/2);

	waitForVBlank();
	hideSprites();

    shadowOAM[0].attr0 = 60 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[0].attr1 = 64 | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(21, 3) | ATTR2_PALROW(1);


    shadowOAM[1].attr0 = 60 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[1].attr1 = 128 | ATTR1_LARGE;
    shadowOAM[1].attr2 = ATTR2_TILEID(21, 11) | ATTR2_PALROW(1);

    shadowOAM[2].attr0 = 116 | ATTR0_WIDE | ATTR0_REGULAR;
    shadowOAM[2].attr1 = 64 | ATTR1_LARGE;
    shadowOAM[2].attr2 = ATTR2_TILEID(28, 3) | ATTR2_PALROW(1);

    DMANow(3, shadowOAM, OAM, 128*4);

	state = HELP;
}

// Runs every frame during help state
void help() {

	vOff--;
	REG_BG2VOFF=vOff;

	waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START) |
    	BUTTON_PRESSED(BUTTON_SELECT) |
    	BUTTON_PRESSED(BUTTON_A) |
    	BUTTON_PRESSED(BUTTON_B) |
    	BUTTON_PRESSED(BUTTON_LEFT) |
    	BUTTON_PRESSED(BUTTON_RIGHT) |
    	BUTTON_PRESSED(BUTTON_DOWN) |
    	BUTTON_PRESSED(BUTTON_UP) |
    	BUTTON_PRESSED(BUTTON_L) |
    	BUTTON_PRESSED(BUTTON_R)) {

	    	playSoundB(soundClick,SOUNDCLICKLEN,SOUNDCLICKFREQ, 0);
            hideSprites();
	        gotoStart();
	}
}