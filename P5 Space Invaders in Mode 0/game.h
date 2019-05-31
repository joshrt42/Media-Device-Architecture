/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Homework 4
File:       game.h
Date:       6 September 2017

******************************************************************************/




// ================ STRUCTS =================

// Player Struct
typedef struct {
    int col;
    int row;
    int oldCol;
    int cdel;
    int height;
    int width;
    int active;
    int bulletTimer;
    int health;
    int aniCounter;
    int curFrame;
    int numFrames;
} PLAYER;

// playerBullet Struct
typedef struct {
    int row;
    int col;
    int oldRow;
    int rdel;
    int height;
    int width;
    int active;
    int erased;
    int aniCounter;
    int curFrame;
    int numFrames;
    int spriteNo;
} PLAYERBULLET;

// enemyBullet Struct
typedef struct {
    int row;
    int col;
    int oldRow;
    int rdel;
    int height;
    int width;
    int active;
    int erased;
    int aniCounter;
    int curFrame;
    int numFrames;
    int spriteNo;
} ENEMYBULLET;

// Enemy Struct
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
    u8 isBottom;
    u8 sprite;
    int aniCounter;
    int curFrame;
    int numFrames;
    int spriteNo;
} ENEMY;

// Barrier struct
typedef struct {
    int row;
    int col;
    int height;
    int width;
    int health;
    int active;
    int curFrame;
    int spriteNo;
} BARRIER;

// Explosion struct
typedef struct {
    int row;
    int col;
    int height;
    int width;
    int active;
    int aniCounter;
    int curFrame;
    int numFrames;
    int spriteNo;
} EXPLOSION;


// Explosion struct
typedef struct {
    int row;
    int col;
    int height;
    int width;
    int active;
    int aniCounter;
    int curFrame;
    int numFrames;
    int spriteNo;
} PEXPLOSION;


// ================== VARS ==================

#define PLAYERBULLETCOUNT 5
#define ENEMYBULLETCOUNT 5
#define ENEMYCOUNT 30
#define BARRIERCOUNT 4

extern PLAYER player;
extern PLAYERBULLET playerBullets[PLAYERBULLETCOUNT];
extern ENEMYBULLET enemyBullets[ENEMYBULLETCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern BARRIER barriers[BARRIERCOUNT];
extern EXPLOSION explosion;
extern PEXPLOSION pExplosion;
extern int enemiesRemaining;
extern int gameOver;
extern int gameWon;
extern int score;



// ============== PROTOTYPES ================

void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();
void drawHealth();
void drawScore();

void initPlayerBullets();
void firePlayerBullet();
void updatePlayerBullet(PLAYERBULLET *);
void drawPlayerBullet(PLAYERBULLET *);

void initEnemyBullets();
void fireEnemyBullet();
void updateEnemyBullet(ENEMYBULLET *);
void drawEnemyBullet(ENEMYBULLET *);

void initEnemies();
void updateEnemy(ENEMY *);
void drawEnemy(ENEMY *);
void switchDirection(ENEMY *);

void initBarriers();
void updateBarrier(BARRIER *);
void drawBarrier(BARRIER *);

void initExplosion();
void explode(ENEMY *);
void updateExplosion();
void drawExplosion();

void initpExplosion();
void pExplode();
void updatepExplosion();
void drawpExplosion();