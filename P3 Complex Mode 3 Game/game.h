// JOSH TERRY
// CS 2261 - SPRING 2017
// HOMEWORK 3 - SIMPLE MODE 3 GAME
// GAME.H




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
    int facing;
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
    int cdel;
    int height;
    int width;
    int active;
    int erased;
    int facing;
} ENEMY;




// ================== VARS ==================

#define BULLETCOUNT 1
#define ENEMYCOUNT 20

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