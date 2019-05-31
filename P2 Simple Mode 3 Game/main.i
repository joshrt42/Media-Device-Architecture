# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 39 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void makeRedBall(int row, int col);
void makeGreenBall(int row, int col);
void makePlayer(int row, int col);
void eraseBall(int row, int col);
void fillScreen(unsigned short color);


void waitForVBlank();
# 69 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 80 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2


void initialize();
void update();
void draw();


unsigned short buttons;
unsigned short oldButtons;


unsigned short bgColor;


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


int gbRow;
int gbCol;
int gbOldRow;
int gbOldCol;
int gbRDel;
int gbCDel;


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
  buttons = (*(volatile unsigned short *)0x04000130);

  update();
  waitForVBlank();
  draw();
 }
}


void initialize() {

 (*(unsigned short *)0x4000000) = 3 | (1<<10);


 buttons = (*(volatile unsigned short *)0x04000130);
 oldButtons = 0;


 bgColor = 0;
 fillScreen(0);


 rb1Row = 20;
 rb1Col = 20;
 rb1OldRow = rb1Row;
 rb1OldCol = rb1Col;
 rb1CDel = 2;
 rb1RDel = 3;


 rb2Row = 135;
 rb2Col = 20;
 rb2OldRow = rb1Row;
 rb2OldCol = rb1Col;
 rb2CDel = 3;
 rb2RDel = 2;


 rb3Row = 20;
 rb3Col = 215;
 rb3OldRow = rb1Row;
 rb3OldCol = rb1Col;
 rb3CDel = 1.5;
 rb3RDel = 2.5;


 gbRow = 135;
 gbCol = 215;
 gbOldRow = gbRow;
 gbOldCol = gbCol;
 gbRDel = 2.5;
 gbCDel = 1.5;


 playerRow = 75;
 playerCol = 115;
 playerOldRow = playerRow;
 playerOldCol = playerCol;
 playerRDel = 1.5;
 playerCDel = 1.5;
}


void update() {


 if ((~(*(volatile unsigned short *)0x04000130) & ((1<<6))) && playerRow > 0) {
  playerRow -= playerRDel;
 }
 if ((~(*(volatile unsigned short *)0x04000130) & ((1<<7))) && playerRow < 160 - 10) {
  playerRow += playerRDel;
 }
 if ((~(*(volatile unsigned short *)0x04000130) & ((1<<5))) && playerCol > 0) {
  playerCol -= playerCDel;
 }
 if ((~(*(volatile unsigned short *)0x04000130) & ((1<<4))) && playerCol < 240 - 10) {
  playerCol += playerCDel;
 }


 if (rb1Row <= 0 || rb1Row + 5 - 1 >= 160 - 1)
  rb1RDel *= -1;
 if (rb1Col <= 0 || rb1Col + 5 - 1 >= 240 - 1)
  rb1CDel *= -1;


 if (rb2Row <= 0 || rb2Row + 5 - 1 >= 160 - 1)
  rb2RDel *= -1;
 if (rb2Col <= 0 || rb2Col + 5 - 1 >= 240 - 1)
  rb2CDel *= -1;


 if (rb3Row <= 0 || rb3Row + 5 - 1 >= 160 - 1)
  rb3RDel *= -1;
 if (rb3Col <= 0 || rb3Col + 5 - 1 >= 240 - 1)
  rb3CDel *= -1;


 if (gbRow <= 0 || gbRow + 5 - 1 >= 160 - 1)
  gbRDel *= -1;
 if (gbCol <= 0 || gbCol + 5 - 1 >= 240 - 1)
  gbCDel *= -1;


 if (collision(rb1Row, rb1Col, 5, 5,
      playerRow, playerCol, 10, 10)){
  while(1) {
   fillScreen(((31) | (0)<<5 | (0)<<10));
  }
 }


 if (collision(rb2Row, rb2Col, 5, 5,
      playerRow, playerCol, 10, 10)){
  while(1) {
   fillScreen(((31) | (0)<<5 | (0)<<10));
  }
 }


 if (collision(rb3Row, rb3Col, 5, 5,
      playerRow, playerCol, 10, 10)){
  while(1) {
   fillScreen(((31) | (0)<<5 | (0)<<10));
  }
 }


 if (collision(gbRow, gbCol, 5, 5,
      playerRow, playerCol, 10, 10)){
  while(1) {
   fillScreen(((0) | (31)<<5 | (0)<<10));
  }
 }


 rb1Row += rb1RDel;
 rb1Col += rb1CDel;
 rb2Row += rb2RDel;
 rb2Col += rb2CDel;
 rb3Row += rb3RDel;
 rb3Col += rb3CDel;
 gbRow += gbRDel;
 gbCol += gbCDel;
}


void draw() {


 drawRect(rb1OldRow, rb1OldCol, 5, 5, bgColor);
 drawRect(rb2OldRow, rb2OldCol, 5, 5, bgColor);
 drawRect(rb3OldRow, rb3OldCol, 5, 5, bgColor);
 drawRect(gbOldRow, gbOldCol, 5, 5, bgColor);
 drawRect(playerOldRow, playerOldCol, 10, 10, bgColor);


 makeRedBall(rb1Row, rb1Col);
 makeRedBall(rb2Row, rb2Col);
 makeRedBall(rb3Row, rb3Col);
 makeGreenBall(gbRow, gbCol);
 makePlayer(playerRow, playerCol);


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
