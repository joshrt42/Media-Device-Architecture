/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Homework 4
File:       game.h
Date:       6 September 2017

******************************************************************************/




// ================ STRUCTS =================

//Player Struct
typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rdel;
    int cdel;
    int height;
    int width;
    int bulletTimer;
} PLAYER;

//Bullet Struct
typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int cdel;
    int height;
    int width;
    int active;
    int erased;
    unsigned short color;
} BULLET;

//Enemy Struct
typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rdel;
    int cdel;
    int height;
    int width;
    int active;
    int erased;
} ENEMY;




// ================== VARS ==================

#define BULLETCOUNT 5
#define ENEMYCOUNT 15

extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern int enemiesRemaining;
extern int gameOver;




// ============== PROTOTYPES ================

void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);

void initEnemies();
void updateEnemy(ENEMY *);
void drawEnemy(ENEMY *);