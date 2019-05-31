// JOSH TERRY
// CS 2261 - SPRING 2017
// HOMEWORK 3 - SIMPLE MODE 3 GAME
// GAME.C




// ================= INCLUDE ===================

#include <stdlib.h>
#include "myLib.h"
#include "game.h"

#include "skeleton.h"
#include "player.h"




// ================= VARS ======================

PLAYER player;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];
int enemiesRemaining;
int gameOver = 0;




// ================= GAME FUNCS ================

//Initialize the game
void initGame() {

    initPlayer();
    initBullets();
    initEnemies();

    enemiesRemaining = ENEMYCOUNT;
}

//Update the game each frame
void updateGame() {

    updatePlayer();

    for (int i = 0; i < BULLETCOUNT; i++)
        updateBullet(&bullets[i]);

    for (int i = 0; i < ENEMYCOUNT; i++)
        updateEnemy(&enemies[i]);
}

//Draw the game each frame
void drawGame() {

    drawPlayer();

    for (int i = 0; i < BULLETCOUNT; i++)
        drawBullet(&bullets[i]);

    for (int i = 0; i < ENEMYCOUNT; i++)
        drawEnemy(&enemies[i]);
}




// ================= PLAYER FUNCS ==============

//Initialize the player
void initPlayer() {
    player.row = 110;
    player.col = 20;
    player.oldRow = player.row;
    player.oldCol = player.col;
    player.rdel = 0;
    player.cdel = 2;
    player.height = 24;
    player.width = 12;
    player.bulletTimer = 20;
    player.facing = 1;
}

//Handle every-frame actions of the player
void updatePlayer() {

    //Move
    if (BUTTON_HELD(BUTTON_LEFT) && player.col >= player.cdel) {
        player.col -= player.cdel;
        player.facing = 0;
    } else if (BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width - 1 < SCREENWIDTH - player.cdel) {
        player.col += player.cdel;
        player.facing = 1;
    }

    //Jump
    if (BUTTON_PRESSED(BUTTON_UP) && player.row > 105) {
        player.rdel = -9;
    }

    //Update height
    if (player.row < 110 || player.rdel < 0) {
        player.row += player.rdel;
        player.rdel += 1;
        player.cdel = 5;
    } else {
        player.cdel = 2;
    }

    //Shoot
    if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 20) {
        fireBullet();
    }

    player.bulletTimer++;
}

//Draw the player
void drawPlayer() {

    if (player.facing)
        drawImage(player.row, player.col, player.height, player.width, playerBitmap);
    else
        drawImageHFlip(player.row, player.col, player.height, player.width, playerBitmap);
}




// ================= BULLET FUNCS ==============

//Initialize the pool of bullets
void initBullets() {

    for (int i = 0; i < BULLETCOUNT; i++) {

        bullets[i].height = 1;
        bullets[i].width = 2;
        bullets[i].row = -bullets[i].height;
        bullets[i].col = 0;
        bullets[i].oldRow = player.row;
        bullets[i].oldCol = player.col;
        bullets[i].cdel = 4;
        bullets[i].color = WHITE;
        bullets[i].active = 0;
        bullets[i].erased = 1;
    }
}

//Create a bullet
void fireBullet() {

    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {

            bullets[i].row = player.row + player.height/2 - 2;
            bullets[i].col = player.col + player.width/2;
            if (player.facing) {
                bullets[i].cdel = 5;
            } else {
                bullets[i].cdel = -5;
            }
            bullets[i].active = 1;
            bullets[i].erased = 0;

            break;
        }
    }
}

//Handle every frame actions of a bullet
void updateBullet(BULLET* b) {

    if (b->active) {
        if (b->col + b->width < SCREENWIDTH - 5
        && b->col > 5) {
            b->col += b->cdel;
        } else {
            b->active = 0;
        }
    }
}

//Draw a bullet
void drawBullet(BULLET* b) {

    if (b->active) {
        drawRect(b->row, b->col, b->height, b->width, b->color);
    } else if (!b-> erased) {
        b->erased = 1;
    }
    b->oldRow = b->row;
    b->oldCol = b->col;
}




// ================= ENEMY FUNCS ===============

//Initialize the enemies
void initEnemies() {

    for (int i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].height = 24;
        enemies[i].width = 12;
        enemies[i].row = 110;
        enemies[i].col = rand() % 100 + 118;
        enemies[i].oldRow = player.row;
        enemies[i].oldCol = player.col;
        if (enemies[i].col > player.col) {
            enemies[i].cdel = -1;
        } else {
            enemies[i].cdel = 1;
        }
        enemies[i].active = 1;
        enemies[i].erased = 0;
    }
}

//Handle every-frame actions of enemies
void updateEnemy(ENEMY* e) {

    if (e->active) {

        int r = rand() % 2;
        if (r > 0)
            if (e->col > player.col) {
                e->col += e->cdel;
            } else {
                e->col -= e->cdel;
            }

        for (int i = 0; i < BULLETCOUNT; i++) {
            if (bullets[i].active && collision(e->row, e->col, e->height, e->width, bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {

                bullets[i].active = 0;
                e->active = 0;

                enemiesRemaining--;
            }
        }

        if (collision(e->row, e->col, e->height, e->width, player.row, player.col, player.height, player.width))
            gameOver = 1;
    }
}

//Draw an ENEMY
void drawEnemy(ENEMY* e) {
    if (e->active) {
        if (e->col > player.col)
            drawImage(e->row, e->col, e->height, e->width, skeletonBitmap);
        else
            drawImageHFlip(e->row, e->col, e->height, e->width, skeletonBitmap);
    } else if (!e->erased) {
        e->erased = 1;
    }
    e->oldRow = e->row;
    e->oldCol = e->col;
}