/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Homework 4
File:       game.c
Date:       6 September 2017

******************************************************************************/




// ================= INCLUDE ===================

#include "myLib.h"
#include "game.h"

#include "player.h"
#include "enemy.h"




// ================= VARS ======================

PLAYER player;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];

int enemiesRemaining;
int gameOver = 0;

int playerHeight = 12;
int playerWidth = 24;

int enemyHeight = 24;
int enemyWidth = 36;

int screenbound = 24;

int rem = 0;



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

    rem = 0;
    for (int i = 0; i < ENEMYCOUNT; i++) {
        updateEnemy(&enemies[i]);
        if (enemies[i].active)
            rem++;
    }
    enemiesRemaining = rem;
}

//Draw the game each frame
void drawGame() {

    for (int i = 0; i < BULLETCOUNT; i++)
        drawBullet(&bullets[i]);

    for (int i = 0; i < ENEMYCOUNT; i++)
        drawEnemy(&enemies[i]);

    drawPlayer();
}




// ================= PLAYER FUNCS ==============

//Initialize the player
void initPlayer() {
    player.row = (SCREENHEIGHT/2)-(playerHeight/2);
    player.col = 20;
    player.oldRow = player.row;
    player.oldCol = player.col;
    player.rdel = 2;
    player.cdel = 2;
    player.height = playerHeight;
    player.width = playerWidth;
    player.bulletTimer = 10;
}

//Handle every-frame actions of the player
void updatePlayer() {

    //move up and down
    if (BUTTON_HELD(BUTTON_UP) && player.row > screenbound + 2) {
        player.row -= player.rdel;
    } else if (BUTTON_HELD(BUTTON_DOWN) && player.row < SCREENHEIGHT - screenbound - player.height - 4) {
        player.row += player.rdel;
    }
    if (BUTTON_HELD(BUTTON_LEFT) && player.col > 2) {
        player.col -= player.cdel;
    } else if (BUTTON_HELD(BUTTON_RIGHT) && player.col < SCREENWIDTH - player.width - 10) {
        player.col += player.cdel;
    }

    //Shoot
    if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 10) {
        fireBullet();
    }

    player.bulletTimer++;
}

//Draw the player
void drawPlayer() {

    drawImage(player.row, player.col, player.height, player.width, playerBitmap);
}




// ================= BULLET FUNCS ==============

//Initialize the pool of bullets
void initBullets() {

    for (int i = 0; i < BULLETCOUNT; i++) {

        bullets[i].height = 3;
        bullets[i].width = 5;
        bullets[i].row = player.row + (playerHeight/2);
        bullets[i].col = 0;
        bullets[i].oldRow = player.row;
        bullets[i].oldCol = player.col;
        bullets[i].cdel = 3;
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
            bullets[i].cdel = 3;
            bullets[i].active = 1;
            bullets[i].erased = 0;
            player.bulletTimer = 0;

            break;
        }
    }
}

//Handle every frame actions of a bullet
void updateBullet(BULLET* b) {

    if (b->active) {
        if (b->col + b->width < SCREENWIDTH - 5) {
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
        enemies[i].height = enemyHeight;
        enemies[i].width = enemyWidth;
        enemies[i].row = 26 + (rand() % 76);
        enemies[i].col = SCREENWIDTH - enemyWidth;
        enemies[i].oldRow = player.row;
        enemies[i].oldCol = player.col;
        if (i < ENEMYCOUNT/2)
            enemies[i].rdel = 1;
        else
            enemies[i].rdel = -1;
        enemies[i].cdel = -1;
        enemies[i].active = 1;
        enemies[i].erased = 0;
    }
}

//Handle every-frame actions of enemies
void updateEnemy(ENEMY* e) {

    if (e->active) {

        if ((e->row < 26) || (e->row > (SCREENHEIGHT - 29 - e->height)))
            e->rdel *= -1;
        e->row += e->rdel;

        e->col += e->cdel;
        if (e->col < 0) {
            e->col = 240;
        }

        int i = rand() % 100;
        if ((i < 1) && e->col < 220 && e->col > 50)
            e->col += (10-rand()%20);

        for (int i = 0; i < BULLETCOUNT; i++) {
            if (bullets[i].active && collision(e->row, e->col, e->height, e->width, bullets[i].row + 1, bullets[i].col + 5, 1, 1)) {

                bullets[i].active = 0;
                e->active = 0;
            }
        }

        if (collision(e->row, e->col, e->height, 12, player.row, player.col, player.height, player.width))
            gameOver = 1;
    }
}

//Draw an ENEMY
void drawEnemy(ENEMY* e) {
    if (e->active) {
        drawImage(e->row, e->col, e->height, e->width, enemyBitmap);
    } else if (!e->erased) {
        e->erased = 1;
    }
    e->oldRow = e->row;
    e->oldCol = e->col;
}