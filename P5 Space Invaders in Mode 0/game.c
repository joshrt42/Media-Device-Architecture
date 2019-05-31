/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Homework 4
File:       game.c
Date:       6 September 2017

******************************************************************************/




// ================= INCLUDE ===================

#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "sprites.h"
#include "gameBG.h"



// ================= VARS ======================

PLAYER player;
PLAYERBULLET playerBullets[PLAYERBULLETCOUNT];
ENEMYBULLET enemyBullets[ENEMYBULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];
BARRIER barriers[BARRIERCOUNT];
EXPLOSION explosion;
PEXPLOSION pExplosion;

int enemiesRemaining = ENEMYCOUNT;
int gameOver = 0;
int gameWon = 0;
int score = 0;


// ================= GAME FUNCS ================

//Initialize the game
void initGame() {

    initPlayer();
    initPlayerBullets();
    initEnemyBullets();
    initEnemies();
    initBarriers();
    initExplosion();
    initpExplosion();

    enemiesRemaining = ENEMYCOUNT;
}

//Update the game each frame
void updateGame() {

    updatePlayer();
    updateExplosion();
    updatepExplosion();

    for (u8 i = 0; i < PLAYERBULLETCOUNT; i++)
        updatePlayerBullet(&playerBullets[i]);


    for (u8 i = 0; i < ENEMYBULLETCOUNT; i++)
        updateEnemyBullet(&enemyBullets[i]);


    for (u8 i = 0; i < BARRIERCOUNT; i++)
        updateBarrier(&barriers[i]);

    for (u8 i = 0; i < ENEMYCOUNT; i++)
        updateEnemy(&enemies[i]);

    if (enemiesRemaining == 0)
        gameWon = 1;
}

//Draw the game each frame
void drawGame() {

    drawHealth();
    drawScore();
    drawPlayer();
    drawpExplosion();

    for (u8 i = 0; i < PLAYERBULLETCOUNT; i++)
        drawPlayerBullet(&playerBullets[i]);


    for (u8 i = 0; i < ENEMYBULLETCOUNT; i++)
        drawEnemyBullet(&enemyBullets[i]);

    for (u8 i = 0; i < ENEMYCOUNT; i++)
        drawEnemy(&enemies[i]);

    for (u8 i = 0; i < BARRIERCOUNT; i++)
        drawBarrier(&barriers[i]);

    drawExplosion();
}




// ================= PLAYER FUNCS ==============

//Initialize the player
void initPlayer() {
    player.col = SCREENWIDTH/2 - 5;
    player.row = 146;
    player.cdel = 2;
    player.height = 8;
    player.width = 11;
    player.active = 1;
    player.bulletTimer = 30;
    player.health = 3;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 4;
}

//Handle every-frame actions of the player
void updatePlayer() {
    if (player.active) {
        if (BUTTON_HELD(BUTTON_LEFT) && player.col > 1) {
            player.col -= player.cdel;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && player.col < SCREENWIDTH - player.width ) {
            player.col += player.cdel;
        }

        //Shoot
        if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 30) {
            firePlayerBullet();
        }

        player.bulletTimer++;

        //Detect bullet hits
        for (u8 i = 0; i < ENEMYBULLETCOUNT; i++)
            if (enemyBullets[i].active && collision(player.row, player.col, player.height, player.width, enemyBullets[i].row, enemyBullets[i].col, enemyBullets[i].height, enemyBullets[i].width)) {

                enemyBullets[i].active = 0;
                player.health--;
                shadowOAM[enemyBullets[i].spriteNo].attr0 = ATTR0_HIDE;
                if (player.health <= 0) {
                    pExplode();
                }
            }

        //Animation stuff
        if (player.aniCounter % 5 == 0) {
            player.curFrame = (player.curFrame + 1) % player.numFrames;
        }
        player.aniCounter++;

    }
}

//Draw the player
void drawPlayer() {
    //Edit first bucket of shadowOAM
    if (player.active) {
        shadowOAM[0].attr0 = player.row | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[0].attr1 = player.col | ATTR1_TINY;
        shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame, 0);
    }

}

//Draws the player's health
void drawHealth() {
    shadowOAM[45].attr0 = 8 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[45].attr1 = 210 | ATTR1_TINY;
    shadowOAM[45].attr2 = ATTR2_TILEID(6, player.health);
}

//Draws the player's score
void drawScore() {
    shadowOAM[46].attr0 = 8 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[46].attr1 = 45 | ATTR1_TINY;
    shadowOAM[46].attr2 = ATTR2_TILEID(6, score/10);

    shadowOAM[47].attr0 = 8 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[47].attr1 = 53 | ATTR1_TINY;
    shadowOAM[47].attr2 = ATTR2_TILEID(6, score%10);
}


// ================= PLAYER BULLET FUNCS ==============

//Initialize the pool of player bullets
void initPlayerBullets() {

    for (u8 i = 0; i < PLAYERBULLETCOUNT; i++) {

        playerBullets[i].height = 4;
        playerBullets[i].width = 3;
        playerBullets[i].row = player.row - 4;
        playerBullets[i].col = player.col + player.width/2;
        playerBullets[i].rdel = -3;
        playerBullets[i].active = 0;
        playerBullets[i].erased = 1;
        playerBullets[i].aniCounter = 0;
        playerBullets[i].curFrame = 0;
        playerBullets[i].numFrames = 3;
        playerBullets[i].spriteNo = 31+i;
    }
}

//Create a player bullet
void firePlayerBullet() {

    for (u8 i = 0; i < PLAYERBULLETCOUNT; i++) {
        if (!playerBullets[i].active) {

            playerBullets[i].row = player.row - 4;
            playerBullets[i].col = player.col + player.width/2;
            playerBullets[i].rdel = -3;
            playerBullets[i].active = 1;
            playerBullets[i].erased = 0;
            player.bulletTimer = 0;

            break;
        }
    }
}

//Handle every frame actions of a player bullet
void updatePlayerBullet(PLAYERBULLET* b) {

    if (b->active) {
        if (b->row + b->height >0) {
            b->row += b->rdel;
        } else {
            b->active = 0;
        }
    }

    //Animation stuff
    if (b->aniCounter % 5 == 0)
        b->curFrame = (b->curFrame + 1) % b->numFrames;
    b->aniCounter++;
}

//Draw a player bullet
void drawPlayerBullet(PLAYERBULLET* b) {

    if (b->active) {
        shadowOAM[b->spriteNo].attr0 = b->row | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[b->spriteNo].attr1 = b->col | ATTR1_TINY;
        shadowOAM[b->spriteNo].attr2 = ATTR2_TILEID(b->curFrame, 18);
    } else if (!b-> erased) {
        b->erased = 1;
    }
}




// ================= ENEMY BULLET FUNCS ==============

//Initialize the pool of enemy bullets
void initEnemyBullets() {

    for (u8 i = 0; i < ENEMYBULLETCOUNT; i++) {

        enemyBullets[i].height = 4;
        enemyBullets[i].width = 3;
        enemyBullets[i].row = 0;
        enemyBullets[i].col = 0;
        enemyBullets[i].rdel = 2;
        enemyBullets[i].active = 0;
        enemyBullets[i].erased = 1;
        enemyBullets[i].aniCounter = 0;
        enemyBullets[i].curFrame = 0;
        enemyBullets[i].numFrames = 3;
        enemyBullets[i].spriteNo = 36+i;
    }
}

//Create an enemy bullet
void fireEnemyBullet(ENEMY * enemy) {

    for (u8 i = 0; i < PLAYERBULLETCOUNT; i++) {
        if (!enemyBullets[i].active) {

            enemyBullets[i].row = enemy->row + enemy->height;
            enemyBullets[i].col = enemy->col + enemy->width/2;
            enemyBullets[i].rdel = 2;
            enemyBullets[i].active = 1;
            enemyBullets[i].erased = 0;

            break;
        }
    }
}

//Handle every frame actions of an enemy bullet
void updateEnemyBullet(ENEMYBULLET* b) {

    if (b->active) {
        if (b->row < SCREENHEIGHT) {
            b->row += b->rdel;
        } else {
            b->active = 0;
        }
    }

    //Animation stuff
    if (b->aniCounter % 5 == 0)
        b->curFrame = (b->curFrame + 1) % b->numFrames;
    b->aniCounter++;
}

//Draw an enemy bullet
void drawEnemyBullet(ENEMYBULLET* b) {

    if (b->active) {
        shadowOAM[b->spriteNo].attr0 = b->row | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[b->spriteNo].attr1 = b->col | ATTR1_TINY;
        shadowOAM[b->spriteNo].attr2 = ATTR2_TILEID(b->curFrame, 19);
    } else if (!b-> erased) {
        b->erased = 1;
    }
}




// ================= ENEMY FUNCS ===============

//Initialize the enemies
void initEnemies() {

    for (u8 i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].height = 8;
        enemies[i].row = 20 + 12 * (i / 6);
        enemies[i].rdel = 5;
        enemies[i].cdel = 1;
        enemies[i].active = 1;
        enemies[i].erased = 0;
        if (ENEMYCOUNT - i <= 6)
            enemies[i].isBottom = 1;
        if (i < 6) {
            enemies[i].width = 8;
            enemies[i].sprite = 2;
            enemies[i].col = 4 + 16 * (i % 6);
        } else if (i < 24) {
            enemies[i].width = 11;
            enemies[i].sprite = 1;
            enemies[i].col = 2 + 16 * (i % 6);
        } else if (i < 30) {
            enemies[i].width = 12;
            enemies[i].sprite = 0;
            enemies[i].col = 1 + 16 * (i % 6);
        }
        enemies[i].aniCounter = 0;
        enemies[i].curFrame = 0;
        enemies[i].numFrames = 4;
        enemies[i].spriteNo = i + 1;
    }
}

//Handle every-frame actions of enemies
void updateEnemy(ENEMY* e) {

    if (e->active) {

        if (e->spriteNo < 25)
            if (!enemies[(e->spriteNo) + 6].active)
                e->isBottom = 1;

        if (e->isBottom) {
            int shoot = rand() % 250;
            if (shoot == 1) {
                fireEnemyBullet(e);
            }
        }

        //Detect bullet hits
        for (u8 i = 0; i < PLAYERBULLETCOUNT; i++) {
            if (playerBullets[i].active && collision(e->row, e->col, e->height, e->width, playerBullets[i].row, playerBullets[i].col, playerBullets[i].height, playerBullets[i].width)) {

                playerBullets[i].active = 0;
                e->active = 0;
                shadowOAM[e->spriteNo].attr0 = ATTR0_HIDE;
                shadowOAM[playerBullets[i].spriteNo].attr0 = ATTR0_HIDE;
                enemiesRemaining--;
                score++;
                explode(e);
            }
        }

        //Game over if touch player
        if (player.active && collision(e->row, e->col, e->height, 12, player.row, player.col, player.height, player.width)) {
            player.active = 0;
            pExplode();
        }

        //Move
        e->col += e->cdel;

        //Control movement
        if(e->aniCounter/145 == 1) {
            e->cdel*=-1;
            e->aniCounter = 0;
            if (e->row < 140) {
                e->row+=e->rdel;
            } else if (player.active) {
                pExplode();
                player.active = 0;
            }
        }
    }

    //Animation stuff
    if (e->aniCounter % 20 == 0) {
        e->curFrame = (e->curFrame + 1) % e->numFrames;
    }
    e->aniCounter++;
}

//Draw an ENEMY
void drawEnemy(ENEMY* e) {
    if (e->active) {
        shadowOAM[e->spriteNo].attr0 = e->row | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[e->spriteNo].attr1 = e->col | ATTR1_TINY;
        shadowOAM[e->spriteNo].attr2 = ATTR2_TILEID(e->curFrame, 2 + (e->sprite)*2);
    } else if (!e->erased) {
        e->erased = 1;
    }
}





// ================= BARRIER FUNCS ===============

//Initialize the barriers
void initBarriers() {

    for (int i = 0; i < BARRIERCOUNT; i++) {

        barriers[i].row = 125;
        barriers[i].col = 36 + i * 50;
        barriers[i].height = 8;
        barriers[i].width = 16;
        barriers[i].health = 3;
        barriers[i].active = 1;
        barriers[i].curFrame = 0;
        barriers[i].spriteNo = 41 + i;
    }
}

//updates Barriers
void updateBarrier(BARRIER * b) {

    for (u8 j = 0; j < PLAYERBULLETCOUNT; j++) {
        if (playerBullets[j].active
            && b->active
            && collision(b->row, b->col, b->height, b->width, playerBullets[j].row, playerBullets[j].col, playerBullets[j].height, playerBullets[j].width)) {

            playerBullets[j].active = 0;
                shadowOAM[playerBullets[j].spriteNo].attr0 = ATTR0_HIDE;

            if (b->health > 0) {
                b->health--;
                b->curFrame++;
            }
            else {
                b->active = 0;
                shadowOAM[b->spriteNo].attr0 = ATTR0_HIDE;
            }
        }
    }

    for (u8 j = 0; j < ENEMYBULLETCOUNT; j++) {
        if (enemyBullets[j].active
            && b->active
            && collision(b->row, b->col, b->height, b->width, enemyBullets[j].row, enemyBullets[j].col, enemyBullets[j].height, enemyBullets[j].width)) {

            enemyBullets[j].active = 0;
                shadowOAM[enemyBullets[j].spriteNo].attr0 = ATTR0_HIDE;

            if (b->health > 0) {
                b->health--;
                b->curFrame++;
            }
            else {
                b->active = 0;
                shadowOAM[b->spriteNo].attr0 = ATTR0_HIDE;
            }
        }
    }

}

//draws Barriers
void drawBarrier(BARRIER* b) {
    if (b->active) {
        shadowOAM[b->spriteNo].attr0 = b->row | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[b->spriteNo].attr1 = b->col | ATTR1_TINY;
        shadowOAM[b->spriteNo].attr2 = ATTR2_TILEID(b->curFrame, 8);
    }
}





// ================= EXPLOSION FUNCS ===============

//Initialize the barriers
void initExplosion() {
    explosion.row = 0;
    explosion.col = 0;
    explosion.height = 8;
    explosion.width = 16;
    explosion.active = 0;
    explosion.aniCounter = 0;
    explosion.curFrame = 0;
    explosion.numFrames = 4;
    explosion.spriteNo = 48;
}

//Called when an enemy is killed
void explode(ENEMY * e) {
    explosion.row = e->row;
    explosion.col = e->col;
    explosion.active = 1;
    explosion.aniCounter = 0;
    explosion.curFrame = 0;
}

//Called every frame to update explosion's data
void updateExplosion() {
    if (explosion.active) {
        explosion.aniCounter++;
        explosion.curFrame = explosion.aniCounter/4;
    }
    if (explosion.curFrame >= explosion.numFrames) {
        explosion.active = 0;
        shadowOAM[explosion.spriteNo].attr0 = ATTR0_HIDE;
    }
}

//Called every frame to draw the explosion.
void drawExplosion() {
    if (explosion.active) {
        shadowOAM[explosion.spriteNo].attr0 = explosion.row | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[explosion.spriteNo].attr1 = explosion.col | ATTR1_TINY;
        shadowOAM[explosion.spriteNo].attr2 = ATTR2_TILEID(explosion.curFrame, 16);
    }
}





// ================= EXPLOSION FUNCS ===============

//Initialize the barriers
void initpExplosion() {
    pExplosion.row = 0;
    pExplosion.col = 0;
    pExplosion.height = 8;
    pExplosion.width = 16;
    pExplosion.active = 0;
    pExplosion.aniCounter = 0;
    pExplosion.curFrame = 0;
    pExplosion.numFrames = 4;
    pExplosion.spriteNo = 49;
}

//Called when an enemy is killed
void pExplode() {
    pExplosion.row = player.row;
    pExplosion.col = player.col;
    pExplosion.active = 1;
    pExplosion.aniCounter = 0;
    pExplosion.curFrame = 0;
    player.active = 0;
    shadowOAM[0].attr0 = ATTR0_HIDE;
}

//Called every frame to update explosion's data
void updatepExplosion() {
    if (pExplosion.active) {
        pExplosion.aniCounter++;
        pExplosion.curFrame = pExplosion.aniCounter/20;
    }
    if (pExplosion.curFrame >= pExplosion.numFrames * 2) {
        pExplosion.active = 0;
        shadowOAM[pExplosion.spriteNo].attr0 = ATTR0_HIDE;
        gameOver = 1;
    }
}

//Called every frame to draw the explosion.
void drawpExplosion() {
    if (pExplosion.active) {
        shadowOAM[pExplosion.spriteNo].attr0 = pExplosion.row | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[pExplosion.spriteNo].attr1 = pExplosion.col | ATTR1_TINY;
        shadowOAM[pExplosion.spriteNo].attr2 = ATTR2_TILEID(pExplosion.curFrame, 14);
    }
}