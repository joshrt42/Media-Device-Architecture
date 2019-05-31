#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.3: Add your state and state transition function prototypes here
void start();
void gotoStart();
void game();
void gotoGame();
void pause();
void gotoPause();
void win();
void gotoWin();
void lose();
void gotoLose();

// States
// TODO 1.0: Make the state enum and state variable
int state;
enum{START, GAME, PAUSE, WIN, LOSE};


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        // TODO 1.1: Make the state machine here
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

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.4: Call your gotoStart function here
    gotoStart();
}

// TODO 1.2: Make your state and state transition functions
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        seed++;
        initGame();
        gotoGame();
    }
}

void gotoStart() {
    fillScreen(CYAN);
    state = START;
}

void game() {

    updateGame();
    waitForVBlank();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        gotoPause();
    }
    // if (BUTTON_PRESSED(BUTTON_A)) {
    //     gotoWin();
    // }
    if (ballsRemaining == 0) {
        gotoWin();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        gotoLose();
    }
}

void gotoGame() {
    fillScreen(BLACK);
    state = GAME;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        gotoGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        gotoStart();
    }
}

void gotoPause() {
    fillScreen(GRAY);
    state = PAUSE;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        gotoStart();
    }
}

void gotoWin() {
    fillScreen(GREEN);
    state = WIN;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        gotoStart();
    }
}

void gotoLose() {
    fillScreen(RED);
    state = LOSE;
}