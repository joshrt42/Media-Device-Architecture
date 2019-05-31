#include "myLib.h"
#include "spritesheet.h"
#include "house.h"
// TODO 2.0: Include the collision map
#include "collisionmap.h"

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

#define MAPHEIGHT 256
#define MAPWIDTH 256

ANISPRITE pikachu;
ANISPRITE pokeball;

enum {PIKAFRONT, PIKABACK, PIKARIGHT, PIKALEFT, PIKAIDLE};

int main() {

	initialize();

	while(1) {

		oldButtons = buttons;
		buttons = BUTTONS;

        updateGame();
        drawGame();
	}
}

// Initialize game values at launch
void initialize() {

    // Load the house into background 0
    loadPalette(housePal);
    DMANow(3, houseTiles, &CHARBLOCK[0], houseTilesLen/2);
    DMANow(3, houseMap, &SCREENBLOCK[31], houseMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    vOff = 96;
    hOff = 9;
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    // Load the spritesheet
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // Notice: We don't DMA the collision map anywhere!
    // The collision map is just stored in "static memory"
    // (aka, it's just hardcoded in the collisionmap.c file)

    initPikachu();
    initPokeball();
}

// Initialize values for pikachu
void initPikachu() {

    pikachu.width = 16;
    pikachu.height = 16;
    pikachu.rdel = 1;
    pikachu.cdel = 1;
    pikachu.worldRow = 160/2-pikachu.width/2 + vOff;  // Puts it in the middle of the screen in the world
    pikachu.worldCol = 240/2-pikachu.height/2 + hOff; // Puts it in the middle of the screen in the world
    pikachu.aniCounter = 0;
    pikachu.curFrame = 0;
    pikachu.numFrames = 3;
    pikachu.aniState = PIKAFRONT;
}

// Initialize values for the pokeball
void initPokeball() {

    pokeball.width = 32;
    pokeball.height = 32;
    pokeball.worldRow = 50;
    pokeball.worldCol = 50;
    pokeball.aniCounter = 0;
    pokeball.curFrame = 0;
    pokeball.numFrames = 4;
}

// Update the game logic
void updateGame() {
    updatePikachu();
    updatePokeball();
}

// Update the pikachu character
void updatePikachu() {

    // TODO 2.2: READ THIS COMMENT BLOCK ENTIRELY
    // For each direction, you need to check the collision map based on where pikachu will be after the move
    // If the collision map is white, then you want to update pikachu's world position.
    // You also want to update hOff or vOff, but only if pikachu is at the center of the screen
    // Make sure you run the example to see when the screen does and doesn't move!
    if (BUTTON_HELD(BUTTON_DOWN)
         && collisionmapBitmap[OFFSET(pikachu.worldRow + pikachu.height - 1 + pikachu.rdel, pikachu.worldCol + 1, 256)]
         && collisionmapBitmap[OFFSET(pikachu.worldRow + pikachu.height - 1 + pikachu.rdel, pikachu.worldCol + pikachu.width - 1, 256)]
         && pikachu.worldRow < 256 - pikachu.height){
        pikachu.worldRow += pikachu.rdel;
        if (pikachu.worldRow < 256 - SCREENHEIGHT/2 - pikachu.height/2 && pikachu.worldRow > SCREENHEIGHT/2 - pikachu.height/2 + 1)
            vOff += pikachu.rdel;
    }
    if (BUTTON_HELD(BUTTON_UP)
         && collisionmapBitmap[OFFSET(pikachu.worldRow - pikachu.rdel, pikachu.worldCol + 1, 256)]
         && collisionmapBitmap[OFFSET(pikachu.worldRow - pikachu.rdel, pikachu.worldCol + pikachu.width - 1, 256)]
         && pikachu.worldRow > 1){
        pikachu.worldRow -= pikachu.rdel;
        if (pikachu.worldRow < 256 - SCREENHEIGHT/2 - pikachu.height/2 && pikachu.worldRow > SCREENHEIGHT/2 - pikachu.height/2 + 1)
            vOff -= pikachu.rdel;
    }
    if (BUTTON_HELD(BUTTON_LEFT)
         && collisionmapBitmap[OFFSET(pikachu.worldRow, pikachu.worldCol + 1 - pikachu.cdel, 256)]
         && collisionmapBitmap[OFFSET(pikachu.worldRow + pikachu.height - 1, pikachu.worldCol + 1 - pikachu.cdel, 256)]
         && pikachu.worldCol > 1){
        pikachu.worldCol -= pikachu.cdel;
        if (pikachu.worldCol < 256 - SCREENWIDTH/2 - pikachu.width/2 && pikachu.worldCol > SCREENWIDTH/2 - pikachu.width/2)
            hOff -= pikachu.cdel;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)
         && collisionmapBitmap[OFFSET(pikachu.worldRow, pikachu.worldCol + pikachu.width - 1 + pikachu.cdel, 256)]
         && collisionmapBitmap[OFFSET(pikachu.worldRow + pikachu.height - 1, pikachu.worldCol + pikachu.width - 1 + pikachu.cdel, 256)]
         && pikachu.worldCol < 256 - pikachu.width){
        pikachu.worldCol += pikachu.cdel;
        if (pikachu.worldCol < 256 - SCREENWIDTH/2 - pikachu.width/2 && pikachu.worldCol > SCREENWIDTH/2 - pikachu.width/2)
            hOff += pikachu.cdel;
    }
    // TODO 2.3: Now get it working, in the following order:
    //           1. Pikachu moving
    //           2. The correct camera movements (complete the TODO 3.0 and 3.1 first)
    //           3. The correct collision map checking




    // TODO 3.0: Calculate pikachu screenrow and screencol
    pikachu.screenRow = pikachu.worldRow - vOff;
    pikachu.screenCol = pikachu.worldCol - hOff;


    animatePikachu();
}

// Update the pokeball
void updatePokeball() {

    //We only have to check if the row is off screen because it won't go off screen left or right
    pokeball.hide = (pokeball.screenRow < -pokeball.height || pokeball.screenRow > 160) ? 1 : 0;

    // TODO 3.1: Calculate pokeball screenrow and screencol
    // (this will be the same as doing it for pikachu)
    pokeball.screenRow = pokeball.worldRow - vOff;
    pokeball.screenCol = pokeball.worldCol - hOff;


    animatePokeball();
}

// Animate pikachu
void animatePikachu() {

    // Set previous state to current state (if not idle) then reset pikachu's state to idle
    pikachu.prevAniState = pikachu.aniState;
    pikachu.aniState = PIKAIDLE;

    // Change the animation frame every 20 frames of gameplay
    if(pikachu.aniCounter % 20 == 0) {
        pikachu.curFrame = (pikachu.curFrame + 1) % pikachu.numFrames;
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP))
        pikachu.aniState = PIKABACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        pikachu.aniState = PIKAFRONT;
    if(BUTTON_HELD(BUTTON_LEFT))
        pikachu.aniState = PIKALEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        pikachu.aniState = PIKARIGHT;

    // If the pikachu aniState is idle, frame is pikachu standing
    if (pikachu.aniState == PIKAIDLE) {
        pikachu.curFrame = 0;
        pikachu.aniState = pikachu.prevAniState;
    } else {
        pikachu.aniCounter++;
    }
}

// Animate the pokeball
void animatePokeball() {

    // Animate the pokeball
    if(pokeball.aniCounter % 20 == 0) {
        pokeball.curFrame = (pokeball.curFrame + 1) % pokeball.numFrames;
    }
    pokeball.aniCounter++;
}

// Update the shadowOAM for the sprites
void drawGame() {
    drawPikachu();
    drawPokeball();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Draw pikachu
void drawPikachu() {

    if (pikachu.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & pikachu.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & pikachu.screenCol) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(pikachu.curFrame * 2, pikachu.aniState * 2);
    }
}

// Draw the pokeball
void drawPokeball() {

    if(pokeball.hide) {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[1].attr0 = (pokeball.screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (pokeball.screenCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[1].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(pokeball.curFrame * 4, 8);
    }
}