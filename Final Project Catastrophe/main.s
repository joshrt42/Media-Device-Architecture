	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	gotoStart
	.type	gotoStart, %function
gotoStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L2
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r4, #0
	str	r4, [r2, #0]
	ldr	r2, .L2+4
	str	r4, [r2, #0]
	ldr	r2, .L2+8
	mov	r3, #67108864
	str	r4, [r2, #0]
	strh	r4, [r3, #18]	@ movhi
	strh	r4, [r3, #16]	@ movhi
	strh	r4, [r3, #22]	@ movhi
	strh	r4, [r3, #20]	@ movhi
	strh	r4, [r3, #24]	@ movhi
	ldr	r3, .L2+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	ldr	r0, .L2+20
	ldr	r3, .L2+24
	ldr	r5, .L2+28
	mov	lr, pc
	bx	r3
	mov	r6, #100663296
	mov	r0, #3
	ldr	r1, .L2+32
	mov	r2, #100663296
	mov	r3, #2800
	mov	lr, pc
	bx	r5
	add	r2, r6, #61440
	mov	r0, #3
	ldr	r1, .L2+36
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	add	r2, r6, #16384
	mov	r0, #3
	ldr	r1, .L2+40
	mov	r3, #2720
	mov	lr, pc
	bx	r5
	add	r2, r6, #57344
	mov	r0, #3
	ldr	r1, .L2+44
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	mov	r3, #4928
	add	r2, r6, #32768
	mov	r0, #3
	ldr	r1, .L2+48
	add	r3, r3, #48
	mov	lr, pc
	bx	r5
	add	r2, r6, #53248
	mov	r0, #3
	ldr	r1, .L2+52
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	add	r2, r6, #65536
	mov	r0, #3
	ldr	r1, .L2+56
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L2+60
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L2+64
	mov	lr, pc
	bx	r3
	ldr	ip, .L2+68
	mov	r7, #16384
	mvn	r6, #16128
	mov	lr, #688
	add	lr, lr, #3
	mov	r0, #3
	mov	r1, ip
	mov	r2, #117440512
	mov	r3, #512
	add	r7, r7, #96
	sub	r6, r6, #55
	strh	r7, [ip, #0]	@ movhi
	strh	r6, [ip, #2]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r3, .L2+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+76
	str	r4, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	gameWon
	.word	gameOver
	.word	setupSounds
	.word	setupInterrupts
	.word	menuPausePal
	.word	loadPalette
	.word	DMANow
	.word	menuTitleTiles
	.word	menuTitleMap
	.word	grassyBGTiles
	.word	grassyBGMap
	.word	fallingCatsTiles
	.word	fallingCatsMap
	.word	spriteSheetTiles
	.word	spriteSheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	gotoStart, .-gotoStart
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L5
	ldr	r3, .L5+4
	mov	lr, pc
	bx	r3
	mov	r5, #100663296
	mov	r6, #67108864
	mov	ip, #24064	@ movhi
	ldr	r4, .L5+8
	strh	ip, [r6, #8]	@ movhi
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L5+12
	mov	r3, #2800
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L5+16
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	ip, #23552
	add	ip, ip, #4
	strh	ip, [r6, #10]	@ movhi
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L5+20
	mov	r3, #2720
	mov	lr, pc
	bx	r4
	add	r2, r5, #57344
	mov	r0, #3
	ldr	r1, .L5+24
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mvn	ip, #25856
	sub	ip, ip, #247
	mov	r3, #4928
	strh	ip, [r6, #12]	@ movhi
	add	r2, r5, #32768
	mov	r0, #3
	ldr	r1, .L5+28
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #53248
	mov	r0, #3
	ldr	r1, .L5+32
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L5+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L5+40
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L5+44
	mov	lr, pc
	bx	r3
	ldr	ip, .L5+48
	mov	r1, #729088
	mov	lr, #0
	add	r1, r1, #3648
	mov	r2, #11008
	str	lr, [ip, #0]
	ldr	r0, .L5+52
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L5+56
	mov	lr, pc
	bx	ip
	mov	r3, #5888	@ movhi
	strh	r3, [r6, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	b	gotoStart
.L6:
	.align	2
.L5:
	.word	menuPausePal
	.word	loadPalette
	.word	DMANow
	.word	menuTitleTiles
	.word	menuTitleMap
	.word	grassyBGTiles
	.word	grassyBGMap
	.word	fallingCatsTiles
	.word	fallingCatsMap
	.word	spriteSheetTiles
	.word	spriteSheetPal
	.word	hideSprites
	.word	gameOver
	.word	musicPause
	.word	playSoundA
	.size	initialize, .-initialize
	.align	2
	.global	gotoGame
	.type	gotoGame, %function
gotoGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mvn	r2, #11
	mov	r3, #67108864
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L8
	strh	r2, [r3, #22]	@ movhi
	ldr	r3, .L8+4
	mov	r5, #100663296
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+8
	ldr	r4, .L8+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L8+16
	mov	r2, r5
	mov	r3, #784
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L8+20
	add	r2, r5, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L8+24
	add	r2, r5, #16384
	mov	r3, #3088
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L8+28
	add	r2, r5, #57344
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #4928
	mov	r0, #3
	ldr	r1, .L8+32
	add	r2, r5, #32768
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #53248
	mov	r0, #3
	ldr	r1, .L8+36
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+44
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	gameBGPal
	.word	loadPalette
	.word	hideSprites
	.word	DMANow
	.word	gameBGTiles
	.word	gameBGMap
	.word	mountainsTiles
	.word	mountainsMap
	.word	fallingCatsTiles
	.word	fallingCatsMap
	.word	waitForVBlank
	.word	state
	.size	gotoGame, .-gotoGame
	.align	2
	.global	gotoPause
	.type	gotoPause, %function
gotoPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #0
	mov	r3, #67108864
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L11
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	ldr	r3, .L11+4
	mov	r5, #100663296
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+8
	ldr	r4, .L11+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L11+16
	mov	r2, r5
	mov	r3, #3040
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L11+20
	add	r2, r5, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L11+24
	add	r2, r5, #16384
	mov	r3, #2720
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L11+28
	add	r2, r5, #57344
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #4928
	mov	r0, #3
	ldr	r1, .L11+32
	add	r2, r5, #32768
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #53248
	mov	r0, #3
	ldr	r1, .L11+36
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L11+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+44
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	menuPausePal
	.word	loadPalette
	.word	hideSprites
	.word	DMANow
	.word	menuPauseTiles
	.word	menuPauseMap
	.word	grassyBGTiles
	.word	grassyBGMap
	.word	fallingCatsTiles
	.word	fallingCatsMap
	.word	waitForVBlank
	.word	state
	.size	gotoPause, .-gotoPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	stmfd	sp!, {r4, lr}
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	mov	r1, r2, asl #16
	mov	r1, r1, lsr #16
	str	r2, [r3, #4]
	mov	r3, #67108864
	strh	r1, [r3, #26]	@ movhi
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L14
	ldr	r2, .L19+12
	ldrh	r4, [r2, #0]
	ands	r4, r4, #8
	beq	.L17
.L14:
	tst	r3, #4
	beq	.L13
	ldr	r3, .L19+12
	ldrh	r3, [r3, #0]
	ands	r3, r3, #4
	beq	.L18
.L13:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L18:
	mov	r1, #11520
	mov	r2, #11008
	ldr	r0, .L19+16
	add	r1, r1, #56
	add	r2, r2, #17
	ldr	ip, .L19+20
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L17:
	mov	r1, #11520
	mov	r2, #11008
	mov	r3, r4
	ldr	r0, .L19+16
	add	r1, r1, #56
	add	r2, r2, #17
	ldr	ip, .L19+20
	mov	lr, pc
	bx	ip
	mov	r1, #339968
	add	r1, r1, #2368
	mov	r2, #11008
	ldr	r0, .L19+24
	add	r1, r1, #12
	add	r2, r2, #17
	mov	r3, r4
	ldr	ip, .L19+28
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	gotoGame
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	soundClick
	.word	playSoundB
	.word	musicGame
	.word	playSoundA
	.size	pause, .-pause
	.align	2
	.global	gotoWin
	.type	gotoWin, %function
gotoWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L22
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #67108864
	mov	r3, #0
	strh	r3, [r2, #18]	@ movhi
	mov	r5, #100663296
	strh	r3, [r2, #16]	@ movhi
	ldr	r0, .L22+4
	strh	r3, [r2, #22]	@ movhi
	str	r3, [r1, #4]
	strh	r3, [r2, #20]	@ movhi
	str	r3, [r1, #0]
	strh	r3, [r2, #26]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	ldr	r3, .L22+8
	ldr	r4, .L22+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L22+16
	mov	r2, r5
	mov	r3, #3536
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L22+20
	add	r2, r5, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L22+24
	add	r2, r5, #16384
	mov	r3, #2720
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L22+28
	add	r2, r5, #57344
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #4928
	mov	r0, #3
	ldr	r1, .L22+32
	add	r2, r5, #32768
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #53248
	mov	r0, #3
	ldr	r1, .L22+36
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+48
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	menuPausePal
	.word	loadPalette
	.word	DMANow
	.word	menuWinTiles
	.word	menuWinMap
	.word	grassyBGTiles
	.word	grassyBGMap
	.word	fallingCatsTiles
	.word	fallingCatsMap
	.word	waitForVBlank
	.word	hideSprites
	.word	state
	.size	gotoWin, .-gotoWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	stmfd	sp!, {r4, lr}
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	mov	r1, r2, asl #16
	mov	r1, r1, lsr #16
	str	r2, [r3, #4]
	mov	r3, #67108864
	strh	r1, [r3, #26]	@ movhi
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L24
	ldr	r3, .L27+12
	ldrh	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L26
.L24:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L26:
	mov	r1, #729088
	add	r1, r1, #3648
	mov	r2, #11008
	ldr	r0, .L27+16
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L27+20
	mov	lr, pc
	bx	ip
	mov	r1, #11520
	mov	r2, #11008
	ldr	r0, .L27+24
	add	r1, r1, #56
	add	r2, r2, #17
	mov	r3, r4
	ldr	ip, .L27+28
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	musicPause
	.word	playSoundA
	.word	soundClick
	.word	playSoundB
	.size	win, .-win
	.align	2
	.global	gotoLose
	.type	gotoLose, %function
gotoLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L30
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r4, #0
	strh	r4, [r3, #18]	@ movhi
	mov	r6, #100663296
	strh	r4, [r3, #16]	@ movhi
	ldr	r0, .L30+4
	strh	r4, [r3, #22]	@ movhi
	str	r4, [r2, #4]
	strh	r4, [r3, #20]	@ movhi
	str	r4, [r2, #0]
	strh	r4, [r3, #26]	@ movhi
	strh	r4, [r3, #24]	@ movhi
	ldr	r3, .L30+8
	ldr	r5, .L30+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L30+16
	mov	r2, r6
	mov	r3, #2896
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L30+20
	add	r2, r6, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	mov	r0, #3
	mov	r1, r4
	add	r2, r6, #16384
	mov	r3, #2720
	mov	lr, pc
	bx	r5
	mov	r0, #3
	mov	r1, r4
	add	r2, r6, #57344
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L30+24
	add	r2, r6, #32768
	mov	r3, #720
	mov	lr, pc
	bx	r5
	add	r2, r6, #53248
	mov	r0, #3
	ldr	r1, .L30+28
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	ldr	r3, .L30+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+40
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.word	menuLosePal
	.word	loadPalette
	.word	DMANow
	.word	menuLoseTiles
	.word	menuLoseMap
	.word	lostCatsTiles
	.word	lostCatsMap
	.word	waitForVBlank
	.word	hideSprites
	.word	state
	.size	gotoLose, .-gotoLose
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L54
	ldr	r3, .L54+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	ldr	r0, .L54+8
	smull	r2, r0, r3, r0
	ldr	r1, [r4, #4]
	add	lr, r3, r3, lsr #31
	sub	r1, r1, #1
	sub	r0, r0, r3, asr #31
	mov	ip, r1, asl #16
	mov	r3, r3, asl #16
	mov	lr, lr, asl #15
	mov	r0, r0, asl #16
	mov	r2, #67108864
	mov	lr, lr, lsr #16
	mov	ip, ip, lsr #16
	mov	r0, r0, lsr #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #16]	@ movhi
	str	r1, [r4, #4]
	ldr	r3, .L54+12
	strh	lr, [r2, #20]	@ movhi
	strh	ip, [r2, #26]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L54+20
	mov	r2, #117440512
	ldr	ip, .L54+24
	mov	lr, pc
	bx	ip
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L33
	ldr	r1, .L54+28
	ldr	r2, [r4, #0]
	ldr	r0, [r1, #0]
.L34:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L37
	ldr	r3, [r1, #28]
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	rsb	r3, r3, #0
	add	ip, r3, #120
	cmp	ip, r0
	bge	.L50
	add	r3, r3, #644
	add	r3, r3, #3
	cmp	r3, r0
	blt	.L50
	ldr	r3, .L54+28
	ldr	r3, [r3, #16]
	add	r2, r2, r3
	str	r2, [r4, #0]
.L37:
	ldr	ip, [r1, #4]
	ldr	r3, .L54+32
	rsb	r0, r2, r0
	str	ip, [r1, #12]
	str	r0, [r1, #8]
	add	r0, r3, #384
.L40:
	ldr	r1, [r3, #0]
	rsb	r1, r2, r1
	str	r1, [r3, #8]
	add	r3, r3, #64
	cmp	r3, r0
	bne	.L40
	ldr	r3, .L54+36
	add	r0, r3, #324
.L41:
	ldr	r1, [r3, #8]
	rsb	r1, r2, r1
	str	r1, [r3, #12]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L41
	ldr	r3, .L54+40
	add	r0, r3, #180
.L42:
	ldr	r1, [r3, #8]
	rsb	r1, r2, r1
	str	r1, [r3, #12]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L42
	ldr	r3, .L54+44
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L43
	ldr	r3, .L54+48
	ldrh	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L51
.L43:
	ldr	r3, .L54+52
	ldr	r4, [r3, #0]
	cmp	r4, #0
	bne	.L52
	ldr	r3, .L54+56
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L53
	ldmfd	sp!, {r4, lr}
	bx	lr
.L33:
	ldr	r1, .L54+28
	ldr	r3, [r1, #28]
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	ldr	r0, [r1, #0]
	rsb	r3, r3, #0
	add	r2, r3, #120
	cmp	r0, r2
	ble	.L49
	add	r3, r3, #644
	add	r3, r3, #3
	cmp	r3, r0
	blt	.L49
	ldr	r2, [r4, #0]
	ldr	r3, [r1, #16]
	rsb	r2, r3, r2
	str	r2, [r4, #0]
	b	.L34
.L53:
	mov	r1, #1736704
	add	r1, r1, #13696
	mov	r2, #11008
	ldr	r0, .L54+60
	add	r1, r1, #62
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L54+64
	mov	lr, pc
	bx	ip
	mov	r1, #323584
	mov	r2, #44032
	ldr	r0, .L54+68
	add	r1, r1, #572
	add	r2, r2, #68
	mov	r3, r4
	ldr	ip, .L54+72
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	gotoLose
.L50:
	ldr	r2, [r4, #0]
	b	.L37
.L49:
	ldr	r2, [r4, #0]
	b	.L34
.L51:
	mov	r1, #729088
	add	r1, r1, #3648
	mov	r2, #11008
	ldr	r0, .L54+76
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L54+64
	mov	lr, pc
	bx	ip
	mov	r1, #11520
	mov	r2, #11008
	ldr	r0, .L54+80
	add	r1, r1, #56
	add	r2, r2, #17
	mov	r3, r4
	ldr	ip, .L54+72
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	gotoPause
.L52:
	mov	r1, #585728
	mov	r2, #11008
	ldr	r0, .L54+84
	add	r1, r1, #2272
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L54+64
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	gotoWin
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	1431655766
	.word	updateGame
	.word	drawGame
	.word	shadowOAM
	.word	DMANow
	.word	player
	.word	cats+4
	.word	cheese
	.word	bullets
	.word	oldButtons
	.word	buttons
	.word	gameWon
	.word	gameOver
	.word	musicLose
	.word	playSoundA
	.word	death
	.word	playSoundB
	.word	musicPause
	.word	soundClick
	.word	musicWin
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L59
	ldr	r3, .L59+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	sub	r3, r3, #2
	str	r3, [r4, #4]
	ldr	r3, .L59+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+12
	smull	r2, r3, r0, r3
	mov	r1, r0, asr #31
	rsb	r3, r1, r3, asr #1
	ldr	r2, [r4, #0]
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	ldr	r3, .L59+16
	sub	r2, r2, #2
	add	r0, r2, r0
	ldrh	ip, [r3, #0]
	ldrh	r1, [r4, #4]
	mov	r2, r0, asl #16
	mov	r3, #67108864
	mov	r2, r2, lsr #16
	tst	ip, #8
	strh	r1, [r3, #26]	@ movhi
	str	r0, [r4, #0]
	strh	r2, [r3, #24]	@ movhi
	beq	.L56
	ldr	r3, .L59+20
	ldrh	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L58
.L56:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L58:
	mov	r1, #729088
	add	r1, r1, #3648
	mov	r2, #11008
	ldr	r0, .L59+24
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L59+28
	mov	lr, pc
	bx	ip
	mov	r1, #11520
	mov	r2, #11008
	ldr	r0, .L59+32
	add	r1, r1, #56
	add	r2, r2, #17
	mov	r3, r4
	ldr	ip, .L59+36
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L60:
	.align	2
.L59:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	rand
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	musicPause
	.word	playSoundA
	.word	soundClick
	.word	playSoundB
	.size	lose, .-lose
	.align	2
	.global	gotoHelp
	.type	gotoHelp, %function
gotoHelp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r0, .L62
	mov	r5, #100663296
	ldr	r3, .L62+4
	ldr	r4, .L62+8
	mov	lr, pc
	bx	r3
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L62+12
	mov	r3, #336
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L62+16
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L62+20
	mov	r3, #2720
	mov	lr, pc
	bx	r4
	add	r2, r5, #57344
	mov	r0, #3
	ldr	r1, .L62+24
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #4928
	add	r2, r5, #32768
	mov	r0, #3
	ldr	r1, .L62+28
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #53248
	mov	r0, #3
	ldr	r1, .L62+32
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+40
	mov	lr, pc
	bx	r3
	ldr	ip, .L62+44
	mov	r7, #4736
	mov	lr, #0
	mov	r6, #-2130706432
	mov	r5, #16384
	mov	r8, #4992
	sub	lr, lr, #16320
	mov	sl, #60
	add	r9, r7, #35
	mov	r2, #117440512
	mov	r3, #512
	mov	r6, r6, asr #17
	add	r7, r7, #43
	add	r5, r5, #116
	add	r8, r8, #3
	mov	r0, #3
	mov	r1, ip
	strh	sl, [ip, #0]	@ movhi
	strh	lr, [ip, #2]	@ movhi
	strh	r9, [ip, #4]	@ movhi
	strh	sl, [ip, #8]	@ movhi
	strh	r6, [ip, #10]	@ movhi
	strh	r7, [ip, #12]	@ movhi
	strh	r5, [ip, #16]	@ movhi
	strh	lr, [ip, #18]	@ movhi
	strh	r8, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+48
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	menuHelpPal
	.word	loadPalette
	.word	DMANow
	.word	menuHelpTiles
	.word	menuHelpMap
	.word	grassyBGTiles
	.word	grassyBGMap
	.word	fallingCatsTiles
	.word	fallingCatsMap
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	gotoHelp, .-gotoHelp
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L69
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	ldr	r1, .L69+8
	ldr	r2, [r3, #4]
	ldrh	r1, [r1, #0]
	sub	r2, r2, #1
	mov	r0, r2, asl #16
	mov	r0, r0, lsr #16
	str	r2, [r3, #4]
	tst	r1, #8
	mov	r3, #67108864
	strh	r0, [r3, #26]	@ movhi
	beq	.L65
	ldr	r3, .L69+12
	ldrh	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L67
.L65:
	tst	r1, #4
	beq	.L64
	ldr	r3, .L69+12
	ldrh	r3, [r3, #0]
	ands	r3, r3, #4
	beq	.L68
.L64:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L68:
	mov	r1, #11520
	mov	r2, #11008
	ldr	r0, .L69+16
	add	r1, r1, #56
	add	r2, r2, #17
	ldr	ip, .L69+20
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	gotoHelp
.L67:
	mov	r1, #11520
	mov	r2, #11008
	mov	r3, r4
	ldr	r0, .L69+16
	add	r1, r1, #56
	add	r2, r2, #17
	ldr	ip, .L69+20
	mov	lr, pc
	bx	ip
	mov	r1, #339968
	add	r1, r1, #2368
	mov	r2, #11008
	ldr	r0, .L69+24
	add	r1, r1, #12
	add	r2, r2, #17
	mov	r3, r4
	ldr	ip, .L69+28
	mov	lr, pc
	bx	ip
	ldr	r3, .L69+32
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoGame
.L70:
	.align	2
.L69:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	soundClick
	.word	playSoundB
	.word	musicGame
	.word	playSoundA
	.word	initGame
	.size	start, .-start
	.align	2
	.global	help
	.type	help, %function
help:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L94
	stmfd	sp!, {r4, lr}
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	mov	r1, r2, asl #16
	str	r2, [r3, #4]
	mov	r1, r1, lsr #16
	mov	r3, #67108864
	strh	r1, [r3, #26]	@ movhi
	ldr	r3, .L94+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+8
	ldrh	r3, [r3, #0]
	ands	r2, r3, #8
	beq	.L72
	ldr	r2, .L94+12
	ldrh	r2, [r2, #0]
	tst	r2, #8
	movne	r2, #0
	moveq	r2, #1
.L72:
	ands	ip, r3, #4
	beq	.L73
	ldr	r1, .L94+12
	ldrh	r1, [r1, #0]
	tst	r1, #4
	movne	ip, #0
	moveq	ip, #1
.L73:
	ands	r0, r3, #1
	orr	ip, ip, r2
	beq	.L74
	ldr	r2, .L94+12
	ldrh	r2, [r2, #0]
	tst	r2, #1
	movne	r0, #0
	moveq	r0, #1
.L74:
	ands	r1, r3, #2
	orr	r0, r0, ip
	beq	.L75
	ldr	r2, .L94+12
	ldrh	r2, [r2, #0]
	tst	r2, #2
	movne	r1, #0
	moveq	r1, #1
.L75:
	ands	r2, r3, #32
	orr	r1, r0, r1
	beq	.L76
	ldr	r2, .L94+12
	ldrh	r2, [r2, #0]
	tst	r2, #32
	movne	r2, #0
	moveq	r2, #1
.L76:
	ands	ip, r3, #16
	orr	r2, r1, r2
	beq	.L77
	ldr	r1, .L94+12
	ldrh	r1, [r1, #0]
	tst	r1, #16
	movne	ip, #0
	moveq	ip, #1
.L77:
	ands	r0, r3, #128
	orr	ip, r2, ip
	beq	.L78
	ldr	r2, .L94+12
	ldrh	r2, [r2, #0]
	tst	r2, #128
	movne	r0, #0
	moveq	r0, #1
.L78:
	ands	r1, r3, #64
	orr	r0, ip, r0
	beq	.L79
	ldr	r2, .L94+12
	ldrh	r2, [r2, #0]
	tst	r2, #64
	movne	r1, #0
	moveq	r1, #1
.L79:
	ands	r2, r3, #512
	orr	r1, r0, r1
	beq	.L80
	ldr	r2, .L94+12
	ldrh	r2, [r2, #0]
	tst	r2, #512
	movne	r2, #0
	moveq	r2, #1
.L80:
	ands	r3, r3, #256
	orr	r2, r1, r2
	beq	.L81
	ldr	r3, .L94+12
	ldrh	r3, [r3, #0]
	tst	r3, #256
	movne	r3, #0
	moveq	r3, #1
.L81:
	orrs	r2, r2, r3
	bne	.L93
	ldmfd	sp!, {r4, lr}
	bx	lr
.L93:
	mov	r1, #11520
	mov	r2, #11008
	ldr	r0, .L94+16
	add	r1, r1, #56
	add	r2, r2, #17
	ldr	ip, .L94+20
	mov	r3, #0
	mov	lr, pc
	bx	ip
	ldr	r3, .L94+24
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	soundClick
	.word	playSoundB
	.word	hideSprites
	.size	help, .-help
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r4, .L109
	ldr	r7, .L109+4
	ldr	r6, .L109+8
	add	r5, r5, #256
.L108:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L98:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L98
.L105:
	.word	.L99
	.word	.L100
	.word	.L101
	.word	.L102
	.word	.L103
	.word	.L104
.L104:
	bl	help
	b	.L108
.L103:
	bl	lose
	b	.L108
.L102:
	bl	win
	b	.L108
.L101:
	bl	pause
	b	.L108
.L100:
	bl	game
	b	.L108
.L99:
	bl	start
	b	.L108
.L110:
	.align	2
.L109:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	hOff
	.global	vOff
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	state,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
