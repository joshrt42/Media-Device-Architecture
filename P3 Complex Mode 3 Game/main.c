// JOSH TERRY
// CS 2261 - SPRING 2017
// HOMEWORK 3 - SIMPLE MODE 3 GAME
// MAIN.C

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"




// =========== BACKGROUND IMAGES ============

#include "titleScreen.h"
#include "titleScreen2.h"
#include "background1.h"
#include "background2.h"
#include "background3.h"
#include "pause1.h"
#include "pause2.h"
#include "win.h"
#include "lose.h"




// =============== PROTOTYPES ===============

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




// ========= STATES, VARS, DEFS, ETC ========

enum {START, GAME, PAUSE, WIN, LOSE};
int state;

enum {LEFT, RIGHT};

unsigned short buttons;
unsigned short oldButtons;

char buffer[41];

unsigned short timer;
unsigned short refresh = 60;

int main() {

    initialize();

    while(1) {

        //Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        //State machine
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




// =============== SET UP GBA ===============

void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    gotoStart();
}




// =========== SET UP START STATE ===========

void gotoStart() {

    //Draw the initial start screen
    drawFullScreenImage(titleScreenBitmap);
    gameOver = 0;

    state = START;
}




// ============ RUN DURING START ============

void start() {

    //Lock framerate to 60 fps
    waitForVBlank();

    timer = rand() % refresh;
    if (timer > refresh/10)
        drawFullScreenImage(titleScreen2Bitmap);
    else
        drawFullScreenImage(titleScreenBitmap);

    //If you press start, start the game.
    if (BUTTON_PRESSED(BUTTON_START)) {
        timer = 0;
        gotoGame();
        initGame();
    }
}




// =========== SET UP GAME STATE ============

void gotoGame() {

    //Draw game background's first frame
    drawFullScreenImage(background1Bitmap);

    drawRect(143, 3, 12, 120, 0);
    drawString(145, 5, "Dead Remaining: \0", WHITE);

    state = GAME;
}




// ============ RUN DURING GAME =============

void game() {

    updateGame();

    //Update buffer string with current enemies remaining
    sprintf(buffer, "%d", enemiesRemaining);

    waitForVBlank();

    //cycle game backgrounds randomly
    timer = rand() % refresh;
    if (timer < refresh/3)
        drawGameBG(background1Bitmap);
    else if (timer < refresh*2/3)
        drawGameBG(background2Bitmap);
    else if (timer < refresh)
        drawGameBG(background3Bitmap);

    drawGame();

    drawRect(143, 106, 12, 13, 0);
    drawString(145, 107, buffer, WHITE);

    //State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        gotoPause();
    else if (enemiesRemaining == 0)
        gotoWin();
    else if (gameOver)
        gotoLose();
}




// =========== SET UP PAUSE STATE ===========

void gotoPause() {

    //Draw pause screen's first frame
    drawFullScreenImage(pause1Bitmap);

    state = PAUSE;
}




// ============ RUN DURING PAUSE ============

void pause() {

    // Lock framerate to 60 fps
    waitForVBlank();

    //Redraw pause occasionally to make it look flickery
    timer = rand() % refresh;
    if (timer < refresh/10)
        drawFullScreenImage(pause1Bitmap);
    else if (timer < refresh)
        drawFullScreenImage(pause2Bitmap);

    // If you press start, resume the game.
    if (BUTTON_PRESSED(BUTTON_START)){
        gotoGame();
    }
    // If you press select, exit to main menu.
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        gotoStart();
}




// ============ SET UP WIN PHASE ============

void gotoWin() {

    //Draw win screen
    drawFullScreenImage(winBitmap);

    state = WIN;
}




// ============= RUN DURING WIN =============

void win() {

    //Lock fps to 60
    waitForVBlank();

    //State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        gotoStart();
}




// =========== SET UP LOSE STATE ============

void gotoLose() {

    //Draw lose screen
    drawFullScreenImage(loseBitmap);

    state = LOSE;
}




// ============ RUN DURING LOSE =============

void lose() {

    //Lock fps to 60
    waitForVBlank();

    //State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        gotoStart();
}