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
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, #0
	str	r4, [r2, #0]
	str	r4, [r2, #4]
	ldr	r2, .L2+4
	str	r4, [r2, #0]
	ldr	r2, .L2+8
	str	r4, [r2, #0]
	ldr	r2, .L2+12
	mov	r3, #67108864
	str	r4, [r2, #0]
	ldr	r0, .L2+16
	strh	r4, [r3, #18]	@ movhi
	strh	r4, [r3, #16]	@ movhi
	ldr	r3, .L2+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L2+24
	mov	r6, #100663296
	mov	r0, #3
	ldr	r1, .L2+28
	mov	r2, #100663296
	mov	r3, #2496
	mov	lr, pc
	bx	r5
	add	r2, r6, #57344
	mov	r0, #3
	ldr	r1, .L2+32
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	add	r2, r6, #16384
	mov	r0, #3
	ldr	r1, .L2+36
	mov	r3, #32
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L2+40
	add	r2, r6, #49152
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r3, .L2+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+48
	str	r4, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	gameOver
	.word	gameWon
	.word	score
	.word	start0Pal
	.word	loadPalette
	.word	DMANow
	.word	start0Tiles
	.word	start0Map
	.word	linesTiles
	.word	linesMap
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
	mov	ip, #7168	@ movhi
	ldr	r4, .L5+8
	strh	ip, [r6, #8]	@ movhi
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L5+12
	mov	r3, #2496
	mov	lr, pc
	bx	r4
	add	r2, r5, #57344
	mov	r0, #3
	ldr	r1, .L5+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	ip, #6144
	add	ip, ip, #4
	strh	ip, [r6, #10]	@ movhi
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L5+20
	mov	r3, #32
	mov	lr, pc
	bx	r4
	add	r2, r5, #49152
	mov	r0, #3
	ldr	r1, .L5+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L5+28
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L5+32
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L5+36
	mov	lr, pc
	bx	r3
	mov	r3, #4864	@ movhi
	strh	r3, [r6, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	b	gotoStart
.L6:
	.align	2
.L5:
	.word	start0Pal
	.word	loadPalette
	.word	DMANow
	.word	start0Tiles
	.word	start0Map
	.word	linesTiles
	.word	linesMap
	.word	spritesTiles
	.word	spritesPal
	.word	hideSprites
	.size	initialize, .-initialize
	.align	2
	.global	gotoGame
	.type	gotoGame, %function
gotoGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r2, .L8+4
	ldr	r1, [r3, #4]
	smull	r0, r2, r1, r2
	sub	r2, r2, r1, asr #31
	mov	r2, r2, asl #16
	ldrh	r1, [r3, #0]
	mov	r4, #67108864
	mov	r2, r2, lsr #16
	mov	r3, #0
	strh	r1, [r4, #18]	@ movhi
	ldr	r0, .L8+8
	strh	r2, [r4, #16]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	mov	r6, #100663296
	mov	ip, #56320
	strh	ip, [r4, #8]	@ movhi
	ldr	r5, .L8+16
	mov	r0, #3
	ldr	r1, .L8+20
	mov	r2, r6
	mov	r3, #544
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L8+24
	add	r2, r6, #57344
	mov	r3, #4096
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L8+28
	add	r2, r6, #16384
	mov	r3, #272
	mov	lr, pc
	bx	r5
	add	r2, r6, #49152
	mov	r0, #3
	ldr	r1, .L8+32
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r3, .L8+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+40
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.word	1431655766
	.word	gameBGPal
	.word	loadPalette
	.word	DMANow
	.word	gameBGTiles
	.word	gameBGMap
	.word	hudTiles
	.word	hudMap
	.word	waitForVBlank
	.word	state
	.size	gotoGame, .-gotoGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L14
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L14+4
	ldr	r1, [r2, #0]
	ldr	r0, .L14+8
	add	r3, r1, #1
	cmp	r3, #0
	movge	r1, r3
	addlt	r1, r1, #8
	ldrh	r0, [r0, #0]
	mov	r1, r1, asl #13
	str	r3, [r2, #0]
	mov	r1, r1, lsr #16
	mov	r3, #67108864
	tst	r0, #8
	strh	r1, [r3, #22]	@ movhi
	beq	.L10
	ldr	r3, .L14+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L13
.L10:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L13:
	ldr	r3, .L14+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoGame
.L15:
	.align	2
.L14:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
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
	mov	r5, #100663296
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L17
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L17+8
	mov	r0, #3
	ldr	r1, .L17+12
	mov	r2, r5
	mov	r3, #1824
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L17+16
	add	r2, r5, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L17+20
	add	r2, r5, #16384
	mov	r3, #32
	mov	lr, pc
	bx	r4
	add	r2, r5, #49152
	mov	r0, #3
	ldr	r1, .L17+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+36
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	pausePal
	.word	loadPalette
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	linesTiles
	.word	linesMap
	.word	waitForVBlank
	.word	hideSprites
	.word	state
	.size	gotoPause, .-gotoPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L24
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L24+4
	ldr	r1, [r2, #0]
	ldr	r0, .L24+8
	add	r3, r1, #1
	cmp	r3, #0
	movge	r1, r3
	addlt	r1, r1, #8
	ldrh	r0, [r0, #0]
	mov	r1, r1, asl #13
	str	r3, [r2, #0]
	mov	r1, r1, lsr #16
	mov	r3, #67108864
	tst	r0, #8
	strh	r1, [r3, #22]	@ movhi
	beq	.L20
	ldr	r3, .L24+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L22
.L20:
	tst	r0, #4
	beq	.L19
	ldr	r3, .L24+12
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L23
.L19:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L23:
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L22:
	ldmfd	sp!, {r4, lr}
	b	gotoGame
.L25:
	.align	2
.L24:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	gotoWin
	.type	gotoWin, %function
gotoWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #0
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L27
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+8
	mov	r0, #3
	ldr	r1, .L27+12
	mov	r2, r5
	mov	r3, #1680
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L27+16
	add	r2, r5, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L27+20
	add	r2, r5, #16384
	mov	r3, #32
	mov	lr, pc
	bx	r4
	add	r2, r5, #49152
	mov	r0, #3
	ldr	r1, .L27+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+36
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	winPal
	.word	loadPalette
	.word	DMANow
	.word	winTiles
	.word	winMap
	.word	linesTiles
	.word	linesMap
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
	ldr	r3, .L32
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L32+4
	ldr	r1, [r2, #0]
	ldr	r0, .L32+8
	add	r3, r1, #1
	cmp	r3, #0
	movge	r1, r3
	addlt	r1, r1, #8
	ldrh	r0, [r0, #0]
	mov	r1, r1, asl #13
	str	r3, [r2, #0]
	mov	r1, r1, lsr #16
	mov	r3, #67108864
	tst	r0, #8
	strh	r1, [r3, #22]	@ movhi
	beq	.L29
	ldr	r3, .L32+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L31
.L29:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L31:
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L33:
	.align	2
.L32:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	gotoLose
	.type	gotoLose, %function
gotoLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #0
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L35
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L35+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+8
	mov	r0, #3
	ldr	r1, .L35+12
	mov	r2, r5
	mov	r3, #1952
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L35+16
	add	r2, r5, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L35+20
	add	r2, r5, #16384
	mov	r3, #32
	mov	lr, pc
	bx	r4
	add	r2, r5, #49152
	mov	r0, #3
	ldr	r1, .L35+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L35+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+36
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	losePal
	.word	loadPalette
	.word	DMANow
	.word	loseTiles
	.word	loseMap
	.word	linesTiles
	.word	linesMap
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
	ldr	r3, .L47
	mov	lr, pc
	bx	r3
	ldr	r4, .L47+4
	ldr	r3, .L47+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+12
	mov	lr, pc
	bx	r3
	ldr	ip, [r4, #0]
	sub	ip, ip, #1
	mov	lr, ip, asl #16
	str	ip, [r4, #0]
	mov	lr, lr, lsr #16
	mov	ip, #67108864
	mov	r2, #117440512
	mov	r3, #512
	strh	lr, [ip, #18]	@ movhi
	mov	r0, #3
	ldr	r1, .L47+16
	ldr	ip, .L47+20
	mov	lr, pc
	bx	ip
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L38
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
.L39:
	ldr	r2, .L47+24
	smull	r1, r2, r3, r2
	mov	r3, r3, asr #31
	rsb	r3, r3, r2, asr #1
	ldr	r2, .L47+28
	ldrh	r2, [r2, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	tst	r2, #8
	mov	r2, #67108864
	strh	r3, [r2, #16]	@ movhi
	beq	.L41
	ldr	r3, .L47+32
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L44
.L41:
	ldr	r3, .L47+36
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L45
	ldr	r3, .L47+40
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L46
	ldmfd	sp!, {r4, lr}
	bx	lr
.L38:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r3, [r4, #4]
	subeq	r3, r3, #1
	ldrne	r3, [r4, #4]
	streq	r3, [r4, #4]
	b	.L39
.L46:
	ldmfd	sp!, {r4, lr}
	b	gotoLose
.L44:
	ldmfd	sp!, {r4, lr}
	b	gotoPause
.L45:
	ldmfd	sp!, {r4, lr}
	b	gotoWin
.L48:
	.align	2
.L47:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	updateGame
	.word	drawGame
	.word	shadowOAM
	.word	DMANow
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	gameWon
	.word	gameOver
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L52+4
	ldr	r1, [r2, #0]
	ldr	r0, .L52+8
	add	r3, r1, #1
	cmp	r3, #0
	movge	r1, r3
	addlt	r1, r1, #8
	ldrh	r0, [r0, #0]
	mov	r1, r1, asl #13
	str	r3, [r2, #0]
	mov	r1, r1, lsr #16
	mov	r3, #67108864
	tst	r0, #8
	strh	r1, [r3, #22]	@ movhi
	beq	.L49
	ldr	r3, .L52+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L51
.L49:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L51:
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
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
	ldr	r4, .L66
	ldr	r7, .L66+4
	ldr	r6, .L66+8
	add	r5, r5, #256
.L65:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L56:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L56
.L62:
	.word	.L57
	.word	.L58
	.word	.L59
	.word	.L60
	.word	.L61
.L61:
	bl	lose
	b	.L65
.L60:
	bl	win
	b	.L65
.L59:
	bl	pause
	b	.L65
.L58:
	bl	game
	b	.L65
.L57:
	bl	start
	b	.L65
.L67:
	.align	2
.L66:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	hOff
	.global	vOff
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
