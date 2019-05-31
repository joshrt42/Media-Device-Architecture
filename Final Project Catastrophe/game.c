/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Final
File:       game.c
Date:       28 November 2017

******************************************************************************/




// ================= INCLUDE ===================

#include <stdlib.h>
#include "soundProcessing.h"
#include "spriteSheet.h"
#include "myLib.h"
#include "game.h"
#include "soundCat.h"
#include "cheeseCollected.h"
#include "soundGun.h"



// ================= VARS ======================

PLAYER player;
CAT cats[];
CHEESE cheese[];
BULLET bullets[];

int gameOver = 0;
int gameWon = 0;
int timeRemaining = 30;
int timeRemainingCounter = 0;
int cheeseRemaining = CHEESECOUNT;
int enemiesRemaining = CATCOUNT;



// ================= OAM INDICES ===============
int gunOAM = 0;
int cheeseOAM = 2;
int enemyOAM = 21;
int timeOAM = 46;
int healthOAM = 51;
int cheeseRemOAM = 54;
int bulletOAM = 11;
int playerOAM = 20;
int eRemOAM = 56;



// ================= GAME FUNCS ================

//Initialize the game
void initGame() {

    initPlayer();
    initCats();
    initCheese();
    initBullets();

    gameOver = 0;
    gameWon = 0;
    timeRemaining = 30;
    timeRemainingCounter = 0;
    cheeseRemaining = CHEESECOUNT;
    enemiesRemaining = CATCOUNT;
}

//Update the game each frame
void updateGame() {

    updatePlayer();

    for (u8 i = 0; i < CATCOUNT; i++)
        updateCat(&cats[i]);

    for (u8 i = 0; i < CHEESECOUNT; i++)
        updateCheese(&cheese[i]);

    for (u8 i = 0; i < BULLETCOUNT; i++)
        updateBullet(&bullets[i]);

    if (timeRemainingCounter++ > 59) {
        if (timeRemaining <= 0) {
            gameOver = 1;
        }
        timeRemainingCounter = 0;
        timeRemaining -= 1;
    }

    if (cheeseRemaining == 0 && player.worldCol < 24 && player.worldRow > 110) {
        gameWon = 1;
    }
}

//Draw the game each frame
void drawGame() {

    drawHealth();
    drawTime();
    drawCheeseRemaining();
    drawEnemiesRemaining();
    if (player.hasGun)
        drawGun();
    drawPlayer();


    for (u8 i = 0; i < CHEESECOUNT; i++)
        drawCheese(&cheese[i]);

    for (u8 i = 0; i < CATCOUNT; i++) {
        drawCat(&cats[i]);
    }

    for (u8 i = 0; i < BULLETCOUNT; i++)
        drawBullet(&bullets[i]);
}




// ================= PLAYER FUNCS ==============

//Initialize the player
void initPlayer() {
    player.worldCol = 16;
    player.worldRow = 135;
    player.screenRow = player.worldRow;
    player.screenCol = player.worldCol;
    player.cdel = 1;
    player.rdel = 0;
    player.height = 16;
    player.width = 16;
    player.active = 1;
    player.health = 3;
    player.aniCounter = 0;
    player.aniState = 0;
    player.curFrame = 0;
    player.numFrames = 13;
    player.facing = 0;
    player.cheeseCount = 0;
    player.hasGun = 0;
}

//Handle every-frame actions of the player
void updatePlayer() {
    if (player.active) {

        //Control movement
        if (BUTTON_PRESSED(BUTTON_RIGHT) || BUTTON_PRESSED(BUTTON_LEFT))
            player.curFrame = 0;
        if (BUTTON_HELD(BUTTON_LEFT) && player.worldCol > -1) {
            player.facing = 0;
            player.worldCol -= player.cdel;
            player.numFrames = 7;
            player.aniState = 1;
            if (player.aniCounter % 3 == 0) {
                player.curFrame = (player.curFrame + 1) % player.numFrames;
            }
            player.aniCounter++;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && player.worldCol < 768 - player.width ) {
            player.facing = 1;
            player.worldCol += player.cdel;
            player.numFrames = 7;
            player.aniState = 1;
            if (player.aniCounter % 3 == 0) {
                player.curFrame = (player.curFrame + 1) % player.numFrames;
            }
            player.aniCounter++;
        } else {
            player.numFrames = 7;
            player.aniState = 0;
            if (player.aniCounter % 12 == 0) {
                player.curFrame = (player.curFrame + 1) % player.numFrames;
            }
            player.aniCounter++;
        }

        if (BUTTON_HELD(BUTTON_UP) && player.worldRow > 134) {
            player.rdel = -44;
        }

        if (player.rdel < 0) {
            player.worldRow += player.rdel/7;
            player.rdel+=2;
        } else if (player.rdel == 0 && player.worldRow != 135) {
            player.rdel+=2;
        } else if (player.rdel > 0) {
            if (player.worldRow < 134) {
                player.worldRow += player.rdel/7;
                player.rdel+=2;
            } else {
                player.worldRow = 135;
                player.rdel = 0;
            }
        }

        if (BUTTON_PRESSED(BUTTON_A)) {
            if (player.hasGun) {
                player.hasGun = 0;
                shadowOAM[gunOAM].attr0 |= ATTR0_HIDE;
            }
            else {
                player.hasGun = 1;
            }
        }
        if (BUTTON_PRESSED(BUTTON_B) && player.hasGun) {
            playSoundB(soundGun,SOUNDGUNLEN,SOUNDGUNFREQ, 0);
            fireBullet();
        }
        if (player.health < 1)
            gameOver = 1;
    }
}

//Draw the player
void drawPlayer() {
    //Edit first bucket of shadowOAM
    if (player.active) {
        shadowOAM[playerOAM].attr0 = (player.screenRow & ROWMASK) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[playerOAM].attr1 = (player.screenCol & COLMASK) | ATTR1_SMALL;
        if (player.facing)
            shadowOAM[playerOAM].attr1 |= ATTR1_HFLIP;
        shadowOAM[playerOAM].attr2 = ATTR2_TILEID(player.curFrame*2, 2*player.aniState);
    }
}

//Draws the player's health
void drawHealth() {
    if (player.active) {
        shadowOAM[healthOAM + 1].attr0 = 8 | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[healthOAM + 1].attr1 = (SCREENWIDTH - 20) | ATTR1_TINY;
        shadowOAM[healthOAM + 1].attr2 = ATTR2_TILEID(10, 4);

        shadowOAM[healthOAM].attr0 = 8 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[healthOAM].attr1 = (SCREENWIDTH - 8) | ATTR1_TINY;
        shadowOAM[healthOAM].attr2 = ATTR2_TILEID(player.health, 4);
    }
}

//Draws the player's time remaining
void drawTime() {
    shadowOAM[timeOAM].attr0 = 0 | ATTR0_WIDE | ATTR0_REGULAR;
    shadowOAM[timeOAM].attr1 = (SCREENWIDTH - 20) | ATTR1_TINY;
    shadowOAM[timeOAM].attr2 = ATTR2_TILEID(11, 4);

    shadowOAM[timeOAM + 1].attr0 = 0 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[timeOAM + 1].attr1 = (SCREENWIDTH - 8) | ATTR1_TINY;
    shadowOAM[timeOAM + 1].attr2 = ATTR2_TILEID(timeRemaining/10, 4);

    shadowOAM[timeOAM + 2].attr0 = 0 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[timeOAM + 2].attr1 = (SCREENWIDTH - 4) | ATTR1_TINY;
    shadowOAM[timeOAM + 2].attr2 = ATTR2_TILEID(timeRemaining%10, 4);
}

//Draws A gun
void drawGun() {
    shadowOAM[gunOAM].attr0 = ((player.screenRow+8) & ROWMASK) | ATTR0_SQUARE | ATTR0_REGULAR;
    if (player.facing) {
        shadowOAM[gunOAM].attr1 = ((player.screenCol+12) & COLMASK) | ATTR1_TINY;
    } else {
        shadowOAM[gunOAM].attr1 = ((player.screenCol-4) & COLMASK) | ATTR1_TINY | ATTR1_HFLIP;
    }
    shadowOAM[gunOAM].attr2 = ATTR2_TILEID(16, 4);
}

//Draws the number of enemies remaining
void drawEnemiesRemaining() {
    if (player.active) {
        shadowOAM[eRemOAM + 1].attr0 = 16 | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[eRemOAM + 1].attr1 = (SCREENWIDTH - 20) | ATTR1_TINY;
        shadowOAM[eRemOAM + 1].attr2 = ATTR2_TILEID(17, 4);

        shadowOAM[eRemOAM].attr0 = 16 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[eRemOAM].attr1 = (SCREENWIDTH - 8) | ATTR1_TINY;
        shadowOAM[eRemOAM].attr2 = ATTR2_TILEID(enemiesRemaining, 4);
    }
}




// ================= CAT FUNCS ===============

//Initialize the cats
void initCats() {

    for (u8 i = 0; i < CATCOUNT; i++) {
        cats[i].worldRow = player.worldRow-16;
        cats[i].worldCol = 100 + rand() % (360);
        cats[i].screenRow = cats[i].worldRow;
        cats[i].screenCol = cats[i].worldCol;
        cats[i].rdel = 0;
        cats[i].cdel = 1;
        cats[i].height = 24;
        cats[i].width = 32;
        cats[i].active = 1;
        cats[i].aniCounter = rand();
        cats[i].curFrame = 0;
        cats[i].numFrames = 5;
        cats[i].spriteNo = i % 3;
        cats[i].catNo = i;
        cats[i].hide = 0;
        if (i < CATCOUNT/2)
            cats[i].facing = 0;
        else
            cats[i].facing = 1;
    }
}

//Handle every-frame actions of cats
void updateCat(CAT* e) {
    if (e->active) {
        if (e->facing) {
            e->worldCol += e->cdel;
            if (e->worldCol >= 768 - e->width/2) {
                e->facing = 0;
            }
        } else {
            e->worldCol -= e->cdel;
            if (e->worldCol <= 0 - e->width/2) {
                e->facing = 1;
            }
        }
        if (e->aniCounter % 7 == 0) {
            e->curFrame = (e->curFrame + 1) % e->numFrames;
        }
        e->aniCounter++;
        if (collision(player.screenRow, player.screenCol, player.height, player.width,
            e->screenRow+12, e->screenCol + 6, e->height, e->width - 12)) {
            e->active = 0;
            player.health--;
            playSoundB(soundCat,SOUNDCATLEN,SOUNDCATFREQ, 0);
            shadowOAM[enemyOAM + e->catNo].attr0 |= ATTR0_HIDE;
            enemiesRemaining--;
        }

        for (int i = 0; i < BULLETCOUNT; i++) {
            if (bullets[i].active && collision(e->screenRow, e->screenCol + 4, e->height + 32, e->width - 8,
                bullets[i].screenRow - 1, bullets[i].screenCol, bullets[i].height + 2, bullets[i].width)) {

                bullets[i].active = 0;
                e->active = 0;

                playSoundB(soundCat,SOUNDCATLEN,SOUNDCATFREQ, 0);
                shadowOAM[enemyOAM + e->catNo].attr0 |= ATTR0_HIDE;
                shadowOAM[bulletOAM+ bullets[i].bulletNo].attr0 |= ATTR0_HIDE;
                enemiesRemaining--;
            }
        }

        e->hide = (e->screenCol < - e->width || e->screenCol > 240) ? 1 : 0;
    }
}

//Draw a cat
void drawCat(CAT* e) {
    if (e->hide) {
        shadowOAM[enemyOAM + e->catNo].attr0 |= ATTR0_HIDE;
    } else if (e->active) {
        shadowOAM[enemyOAM + e->catNo].attr0 = (e->screenRow & ROWMASK) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemyOAM + e->catNo].attr1 = (e->screenCol & COLMASK) | ATTR1_MEDIUM;
        if (e->facing)
            shadowOAM[enemyOAM + e->catNo].attr1 |= ATTR1_HFLIP;
        shadowOAM[enemyOAM + e->catNo].attr2 = ATTR2_TILEID(e->curFrame * 4, 6+((e->spriteNo)*4))
            | ATTR2_PALROW(e->spriteNo + 1);
    }
}




// ================= CAT FUNCS ===============

//Initialize the cheese
void initCheese() {

    for (u8 i = 0; i < CHEESECOUNT; i++) {
        cheese[i].worldRow = player.worldRow - rand()%60;
        cheese[i].screenRow = cheese[i].worldRow;
        cheese[i].worldCol = 32 + i * 90;
        cheese[i].screenCol = cheese[i].worldCol;
        cheese[i].height = 10;
        cheese[i].width = 14;
        cheese[i].active = 1;
        cheese[i].hide = 0;
        cheese[i].cheeseNo = i;
    }
}

//Handle every-frame actions of cheese
void updateCheese(CHEESE* c) {
    if (c->active) {
        if (collision(player.screenRow, player.screenCol, player.height, player.width,
            c->screenRow, c->screenCol, c->height, c->width)) {
            c->active = 0;
            playSoundB(cheeseCollected,CHEESECOLLECTEDLEN,CHEESECOLLECTEDFREQ, 0);
            player.cheeseCount++;
            cheeseRemaining--;
            shadowOAM[cheeseOAM + c->cheeseNo].attr0 |= ATTR0_HIDE;
        }

        c->hide = (c->screenCol < - c->width || c->screenCol > 240) ? 1 : 0;
    }
}

//Draw a cheese
void drawCheese(CHEESE* c) {
    if (c->hide) {
        shadowOAM[cheeseOAM + c->cheeseNo].attr0 |= ATTR0_HIDE;
    } else if (c->active) {
        shadowOAM[cheeseOAM + c->cheeseNo].attr0 = (c->screenRow & ROWMASK) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[cheeseOAM + c->cheeseNo].attr1 = (c->screenCol & COLMASK) | ATTR1_SMALL;
        shadowOAM[cheeseOAM + c->cheeseNo].attr2 = ATTR2_TILEID(13, 4)
            | ATTR2_PALROW(4);
    }
}

void drawCheeseRemaining() {

    if (cheeseRemaining > 0) {
        shadowOAM[cheeseRemOAM].attr0 = 24 | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[cheeseRemOAM].attr1 = (SCREENWIDTH - 20) | ATTR1_TINY;
        shadowOAM[cheeseRemOAM].attr2 = ATTR2_TILEID(12, 4);

        shadowOAM[cheeseRemOAM + 1].attr0 = 24 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[cheeseRemOAM + 1].attr1 = (SCREENWIDTH - 8) | ATTR1_TINY;
        shadowOAM[cheeseRemOAM + 1].attr2 = ATTR2_TILEID(cheeseRemaining, 4);
    } else {
        shadowOAM[cheeseRemOAM].attr0 = 24 | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[cheeseRemOAM].attr1 = (SCREENWIDTH - 20) | ATTR1_TINY;
        shadowOAM[cheeseRemOAM].attr2 = ATTR2_TILEID(16 + ((timeRemainingCounter+4) % 4), 2);

        shadowOAM[cheeseRemOAM + 1].attr0 |= ATTR0_HIDE;
    }
}




// ================= BULLET FUNCS ==============

//Initialize the pool of bullets
void initBullets() {

    for (int i = 0; i < BULLETCOUNT; i++) {

        bullets[i].height = 1;
        bullets[i].width = 2;
        bullets[i].worldRow = player.worldRow + (player.height/2);
        bullets[i].worldCol = 0;
        bullets[i].screenRow = bullets[i].worldRow;
        bullets[i].screenCol = bullets[i].worldCol;
        bullets[i].cdel = 0;
        bullets[i].active = 0;
        bullets[i].bulletNo = i;
    }
}

//Create a bullet
void fireBullet() {

    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {

            bullets[i].worldRow = player.worldRow + player.height/2;
            if (player.facing) {
                bullets[i].cdel = 3;
                bullets[i].worldCol = player.worldCol + player.width;
                bullets[i].screenCol = player.screenCol + player.width;
            } else {
                bullets[i].cdel = -3;
                bullets[i].worldCol = player.worldCol;
                bullets[i].screenCol = player.screenCol;
            }
            bullets[i].screenRow = bullets[i].worldRow;
            bullets[i].active = 1;

            break;
        }
    }
}

//Handle every frame actions of a bullet
void updateBullet(BULLET* b) {

    if (b->active) {
        b->worldCol += b->cdel;
        if (b->screenCol < 0 || b->screenCol>240) {
            b->active = 0;
            shadowOAM[bulletOAM+b->bulletNo].attr0 |= ATTR0_HIDE;
        }
    }
}

//Draw a bullet
void drawBullet(BULLET* b) {

    if (b->active) {
        shadowOAM[bulletOAM+b->bulletNo].attr0 = (b->screenRow & ROWMASK) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[bulletOAM+b->bulletNo].attr1 = (b->screenCol & COLMASK) | ATTR1_TINY;
        shadowOAM[bulletOAM+b->bulletNo].attr2 = ATTR2_TILEID(15, 4);
    }
}