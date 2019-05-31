// TODO 2.0: Make the player struct as per the instructions
// Player Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int bulletTimer;
} PLAYER;

// TODO 3.0: Make the bullet struct
// Bullet Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BULLET;

// Ball Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BALL;

// Constants
#define BULLETCOUNT 5
#define BALLCOUNT 5

// Variables
// UNCOMMENT 2.0
extern PLAYER player;
// UNCOMMENT 3.0
extern BULLET bullets[BULLETCOUNT];
// UNCOMMENT 4.0
extern BALL balls[BALLCOUNT];
extern int ballsRemaining;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();
// UNCOMMENT 2.3
void initPlayer();
void updatePlayer();
void drawPlayer();
// UNCOMMENT 3.3
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
// UNCOMMENT 4.1
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);