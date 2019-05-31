#include "myLib.h"

// Prototypes
void initialize();
void update();
void draw();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Background Variables
unsigned short bgColor;

//Red Balls 1-3 Vars
int rb1Row;
int rb1Col;
int rb1OldRow;
int rb1OldCol;
int rb1RDel;
int rb1CDel;

int rb2Row;
int rb2Col;
int rb2OldRow;
int rb2OldCol;
int rb2RDel;
int rb2CDel;

int rb3Row;
int rb3Col;
int rb3OldRow;
int rb3OldCol;
int rb3RDel;
int rb3CDel;

//Green Ball Vars
int gbRow;
int gbCol;
int gbOldRow;
int gbOldCol;
int gbRDel;
int gbCDel;

//Player Vars
int playerRow;
int playerCol;
int playerOldRow;
int playerOldCol;
int playerRDel;
int playerCDel;

int main() {

	initialize();

	while(1) {

		oldButtons = buttons;
		buttons = BUTTONS;

		update();
		waitForVBlank();
		draw();
	}
}

// Sets up the display and the game objects
void initialize() {

	REG_DISPCTL = MODE3 | BG2_ENABLE;

	//initialize button variables
	buttons = BUTTONS;
	oldButtons = 0;

	// Initialize background
	bgColor = BLACK;
	fillScreen(BLACK);

	// Initialize the red balls
	rb1Row = 20;
	rb1Col = 20;
	rb1OldRow = rb1Row;
	rb1OldCol = rb1Col;
	rb1CDel = 2;
	rb1RDel = 3;

	//Second red ball to initialize
	rb2Row = 135;
	rb2Col = 20;
	rb2OldRow = rb1Row;
	rb2OldCol = rb1Col;
	rb2CDel = 3;
	rb2RDel = 2;

	//JFC why did I not use structs
	rb3Row = 20;
	rb3Col = 215;
	rb3OldRow = rb1Row;
	rb3OldCol = rb1Col;
	rb3CDel = 1.5;
	rb3RDel = 2.5;

	//Initialize the green ball
	gbRow = 135;
	gbCol = 215;
	gbOldRow = gbRow;
	gbOldCol = gbCol;
	gbRDel = 2.5;
	gbCDel = 1.5;

	//Initialize the player
	playerRow = 75;
	playerCol = 115;
	playerOldRow = playerRow;
	playerOldCol = playerCol;
	playerRDel = 1.5;
	playerCDel = 1.5;
}

// Performs all of the game's calculations
void update() {

	//Move an object with the buttons pressed
	if (BUTTON_HELD(BUTTON_UP) && playerRow > 0) {
		playerRow -= playerRDel;
	}
	if (BUTTON_HELD(BUTTON_DOWN) && playerRow < SCREENHEIGHT - 10) {
		playerRow += playerRDel;
	}
	if (BUTTON_HELD(BUTTON_LEFT) && playerCol > 0) {
		playerCol -= playerCDel;
	}
	if (BUTTON_HELD(BUTTON_RIGHT) && playerCol < SCREENWIDTH - 10) {
		playerCol += playerCDel;
	}

	// Bounce rb1 off the walls
	if (rb1Row <= 0 || rb1Row + 5 - 1 >= SCREENHEIGHT - 1)
		rb1RDel *= -1;
	if (rb1Col <= 0 || rb1Col + 5 - 1 >= SCREENWIDTH - 1)
		rb1CDel *= -1;

	// Bounce rb2 off the walls
	if (rb2Row <= 0 || rb2Row + 5 - 1 >= SCREENHEIGHT - 1)
		rb2RDel *= -1;
	if (rb2Col <= 0 || rb2Col + 5 - 1 >= SCREENWIDTH - 1)
		rb2CDel *= -1;

	// Bounce rb3 off the walls
	if (rb3Row <= 0 || rb3Row + 5 - 1 >= SCREENHEIGHT - 1)
		rb3RDel *= -1;
	if (rb3Col <= 0 || rb3Col + 5 - 1 >= SCREENWIDTH - 1)
		rb3CDel *= -1;

	// Bounce gb off the walls
	if (gbRow <= 0 || gbRow + 5 - 1 >= SCREENHEIGHT - 1)
		gbRDel *= -1;
	if (gbCol <= 0 || gbCol + 5 - 1 >= SCREENWIDTH - 1)
		gbCDel *= -1;

	//Check for rb1 player collision
	if (collision(rb1Row, rb1Col, 5, 5,
				  playerRow, playerCol, 10, 10)){
		while(1) {
			fillScreen(RED);
		}
	}

	//Check for rb2 player collision
	if (collision(rb2Row, rb2Col, 5, 5,
				  playerRow, playerCol, 10, 10)){
		while(1) {
			fillScreen(RED);
		}
	}

	//Check for rb3 player collision
	if (collision(rb3Row, rb3Col, 5, 5,
				  playerRow, playerCol, 10, 10)){
		while(1) {
			fillScreen(RED);
		}
	}

	//Check for gb player collision
	if (collision(gbRow, gbCol, 5, 5,
				  playerRow, playerCol, 10, 10)){
		while(1) {
			fillScreen(GREEN);
		}
	}

	//update positions
	rb1Row += rb1RDel;
	rb1Col += rb1CDel;
	rb2Row += rb2RDel;
	rb2Col += rb2CDel;
	rb3Row += rb3RDel;
	rb3Col += rb3CDel;
	gbRow += gbRDel;
	gbCol += gbCDel;
}

// Performs all of the writing to the screen
void draw() {

	// Erase the previous locations
	drawRect(rb1OldRow, rb1OldCol, 5, 5, bgColor);
	drawRect(rb2OldRow, rb2OldCol, 5, 5, bgColor);
	drawRect(rb3OldRow, rb3OldCol, 5, 5, bgColor);
	drawRect(gbOldRow, gbOldCol, 5, 5, bgColor);
	drawRect(playerOldRow, playerOldCol, 10, 10, bgColor);

	// Draw the new locations
	makeRedBall(rb1Row, rb1Col);
	makeRedBall(rb2Row, rb2Col);
	makeRedBall(rb3Row, rb3Col);
	makeGreenBall(gbRow, gbCol);
	makePlayer(playerRow, playerCol);

	// Update old variables
	rb1OldRow = rb1Row;
	rb1OldCol = rb1Col;
	rb2OldRow = rb2Row;
	rb2OldCol = rb2Col;
	rb3OldRow = rb3Row;
	rb3OldCol = rb3Col;
	gbOldRow = gbRow;
	gbOldCol = gbCol;
	playerOldRow = playerRow;
	playerOldCol = playerCol;
}