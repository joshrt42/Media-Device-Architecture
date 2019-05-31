# 1 "hw01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hw01.c"
# 16 "hw01.c"
void setPixel(int, int, unsigned short);
void drawTriangle(int, int, int);
void eraseTriangle(int, int, int);
void delay(int);


unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);

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

    videoBuffer[((row)*(240)+(col))] = color;
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
                0);
        }
    }
}

void delay(int n) {
    volatile int x = 0;
    for (int i = 0; i < n * 20000; i++) {
        x++;
    }
}
