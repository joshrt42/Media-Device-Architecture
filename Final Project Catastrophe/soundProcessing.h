/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Final
File:       soundProcessing.h
Date:       28 November 2017

******************************************************************************/

//This lays out a framework for the soundProcessing.c file,
//	which handles sound and interurtps.



typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSoundA();
void muteSoundB();
void unmuteSoundA();
void unmuteSoundB();
void stopSoundA();
void stopSoundB();

void setupInterrupts();
void interruptHandler();