#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"

// TODO 5.5: Include the .h file for the Bill image
#include "Bill.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Text Buffer
char buffer[41];

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

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {

    // TODO 5.6: Replace this line with drawing the fullscreen Bill image
    //fillScreen(CYAN);
    drawFullscreenImage(BillBitmap);
    state = START;

    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {

    fillScreen(BLACK);

    // TODO 3.0: Write "Balls Remaining: " in a free area=
    drawString(145, 5, "Balls Remaining: \0", WHITE);


    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();

    // TODO 3.1: Update the buffer string with the current balls remaining
    sprintf(buffer, "%d",ballsRemaining);


    waitForVBlank();
    drawGame();

    // TODO 3.2: Erase the old number and write the new one
    drawRect(145, 107, 8, 8, BLACK);
    drawString(145, 107, buffer, WHITE);



    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    else if (ballsRemaining == 0)
        goToWin();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();
}

// Sets up the pause state
void goToPause() {

    fillScreen(GRAY);

    // TODO 1.1: Draw a capital P somewhere on the screen
    // drawChar(76, 117, 'P', BLACK);
    // TODO 2.1: Remove the previous call to drawChar and write "Pause"
    drawString(76, 106, "Pause\0", BLACK);

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    fillScreen(GREEN);

    // TODO 2.2: Write "Win" to the screen
    drawString(76, 110, "Win\0", BLACK);


    state = WIN;
}

// Runs every frame of the win state
void win() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    fillScreen(RED);

    // TODO 2.3: Write "Lose" to the screen
    drawString(76, 108, "Lose\0", BLACK);

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}