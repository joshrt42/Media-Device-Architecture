#include "myLib.h"
#include "furtherTrees.h"
#include "trees.h"

// Prototypes
void initialize();
void game();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Horizontal Offset
unsigned short hOff;


int main() {

    initialize();

    while(1) {

        game();

        oldButtons = buttons;
        buttons = BUTTONS;
	}
}

// Initialize the game on first launch
void initialize() {

    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE;

    loadPalette(furtherTreesPal);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
      DMANow(3, furtherTreesTiles, &CHARBLOCK[0], furtherTreesTilesLen/2);
      DMANow(3, furtherTreesMap, &SCREENBLOCK[31], furtherTreesMapLen/2);

    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);
      DMANow(3, treesTiles, &CHARBLOCK[1], treesTilesLen/2);
      DMANow(3, treesMap, &SCREENBLOCK[29], treesMapLen/2);

    hOff = 0;

    buttons = BUTTONS;
}

// Update game each frame
void game() {

    // Scroll the background
    if(BUTTON_HELD(BUTTON_LEFT)) {
        hOff--;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        hOff++;
    }

    waitForVBlank();

    // Update the offset registers with the actual offsets
    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff/5;
}