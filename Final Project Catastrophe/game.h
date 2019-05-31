/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Final project
File:       game.h
Date:       28 November 2017

******************************************************************************/




// ================ STRUCTS =================

// Player Struct
typedef struct {
    int worldCol;
    int worldRow;
    int screenCol;
    int screenRow;
    int cdel;
    int rdel;
    int height;
    int width;
    int active;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int facing;
    int health;
    int cheeseCount;
    int hasGun;
} PLAYER;

// Enemy Struct
typedef struct {
    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
    int rdel;
    int cdel;
    int height;
    int width;
    int active;
    int aniCounter;
    int curFrame;
    int numFrames;
    int spriteNo;
    int facing;
    int catNo;
    int hide;
} CAT;

//Cheese Struct
typedef struct {
    int worldRow;
    int screenRow;
    int worldCol;
    int screenCol;
    int height;
    int width;
    int active;
    int hide;
    int cheeseNo;
} CHEESE;

//Bullet Struct
typedef struct {
    int worldRow;
    int screenRow;
    int worldCol;
    int screenCol;
    int cdel;
    int height;
    int width;
    int active;
    int bulletNo;
} BULLET;

// ================== VARS ==================

#define BULLETCOUNT 5
#define CATCOUNT 6
#define CHEESECOUNT 9

extern PLAYER player;
extern CAT cats[CATCOUNT];
extern CHEESE cheese[CHEESECOUNT];
extern BULLET bullets[BULLETCOUNT];
extern int cheeseRemaining;
extern int enemiesRemaining;
extern int timeRemaining;
extern int timeRemainingCounter;
extern int gameOver;
extern int gameWon;
extern int playerOAM;
extern int itemOAM;
extern int attackOAM;
extern int catAttackOAM;
extern int enemyOAM;
extern int timeOAM;
extern int healthOAM;
extern int bulletOAM;
extern int gunOAM;
extern int eRemOAM;



// ============== PROTOTYPES ================

void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();
void drawHealth();
void drawTime();
void drawGun();
void drawEnemiesRemaining();

void initCats();
void updateCat(CAT *);
void drawCat(CAT *);

void initCheese();
void updateCheese(CHEESE *);
void drawCheese(CHEESE *);
void drawCheeseRemaining();

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);