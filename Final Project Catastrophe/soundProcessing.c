/******************************************************************************
Author:     Josh Terry
Project:    CS 2261 Final
File:       soundProcessing.c
Date:       28 November 2017

******************************************************************************/

//This contains functions that handle sound and interrupts



#include "soundProcessing.h"
#include "myLib.h"

//Sets up the sound handlers
void setupSounds() {

    REG_SOUNDCNT_X = SND_ENABLED;
	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}



//Plays sound A
void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM0CNT = 0;

        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundA.data = sound;
    	soundA.length = length;
    	soundA.frequency = frequency;
    	soundA.isPlaying = 1;
    	soundA.loops = loops;
    	soundA.duration = VBLANK_FREQ * soundA.length / soundA.frequency;
    	soundA.vbCount = 0;
}



//Plays sound B
void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;

        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        soundB.data = sound;
    	soundB.length = length;
    	soundB.frequency = frequency;
    	soundB.isPlaying = 1;
    	soundB.loops = loops;
    	soundB.duration = VBLANK_FREQ * soundB.length / soundB.frequency;
    	soundB.vbCount = 0;

}



//Pauses sound A and sound B, respectively
void pauseSoundA() {

	soundA.isPlaying = 0;
	REG_TM0CNT = 0;
}

void pauseSoundB() {

	soundB.isPlaying = 0;
	REG_TM1CNT = 0;
}



//Unpauses sound A and sound B, respectively
void unpauseSoundA() {

	soundA.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;
}

void unpauseSoundB() {

	soundB.isPlaying = 1;
	REG_TM1CNT = TIMER_ON;
}



//Stops sound A and sound B, respectively
void stopSoundA() {

	soundA.isPlaying = 0;
	REG_TM0CNT = 0;
	dma[1].cnt = 0;
	soundA.loops = 0;
}

void stopSoundB() {

	soundB.isPlaying = 0;
	REG_TM1CNT = 0;
	dma[2].cnt = 0;
	soundB.loops = 0;
}



//Sets up interrupt handler
void setupInterrupts() {

	REG_IME = 0;
	REG_INTERRUPT = (unsigned int)interruptHandler;
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}



//Handles interrupts!
void interruptHandler() {

	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		if (soundA.isPlaying) {
			soundA.vbCount++;
			if (soundA.vbCount > soundA.duration) {
				if (soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				} else {
					soundA.isPlaying = 0;
					dma[1].cnt = 0;
					REG_TM0CNT = 0;
				}
			}
		}

		if (soundB.isPlaying) {
			soundB.vbCount++;
			if (soundB.vbCount > soundB.duration) {
				if (soundB.loops) {
					playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
				} else {
					soundB.isPlaying = 0;
					dma[2].cnt = 0;
					REG_TM1CNT = 0;
				}
			}
		}

		REG_IF = INT_VBLANK;
	}

	REG_IME = 1;
}