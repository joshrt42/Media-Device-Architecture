// GBA Video Registers and Flags
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(r, c, rowlen) ((r)*(rowlen)+(c))

// Predefined colors
#define BLACK 0

// Function Prototypes
void setPixel(int, int, unsigned short);
void drawTriangle(int, int, int);
void eraseTriangle(int, int, int);
void delay(int);

// Global Variables
unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    while(1) {

    eraseTriangle(30, 110, 60);
    drawTriangle(45, 30, 30);
    delay(9);

    eraseTriangle(45, 30, 30);
    drawTriangle(38, 63, 45);
    delay(9);

    eraseTriangle(38, 63, 45);
    drawTriangle(30, 110, 60);
    delay(9);

    }
}



void setPixel(int row, int col, unsigned short color) {

    videoBuffer[OFFSET(row,col,240)] = color;
}

void drawTriangle(int row, int col, int size) {

    int x,y;

    for (x = 0; x < size; x++) {
        for (y = 0; y < x; y++) {
            if (y < 3 || x > size - 4 || x < y + 5) {
                setPixel(((x + row) % 160), ((y + col) % 240),
                    (31 - ((31*x)/(size))) + (31 << 10) + (31 << 5));
            } else if (y % 4 == 0) {
                setPixel(((x + row) % 160), ((y + col) % 240),
                    (((x * 31) / size)) + (((x * 31) / size) << 10));
            } else if (x % 3 == 0) {
                setPixel(((x + row) % 160), ((y + col) % 240),
                    (((x * 31) / size)) + (((x * 31) / size) << 10));
            }
        }
    }
}

void eraseTriangle(int row, int col, int size) {

    int x,y;

    for (x = 0; x < size; x++) {
        for (y = 0; y < x; y++) {
            setPixel(((x + row) % 160), ((y + col) % 240),
                BLACK);
        }
    }
}

void delay(int n) {
    volatile int x = 0;
    for (int i = 0; i < n * 20000; i++) {
        x++;
    }
}