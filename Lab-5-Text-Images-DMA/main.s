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
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L2
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L2+8
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L2+12
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	BillBitmap
	.word	drawFullscreenImage
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1024
	add	r3, r3, #3
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #0
	ldr	r3, .L6
	mov	lr, pc
	bx	r3
	mov	r3, #32512
	ldr	r2, .L6+4
	add	r3, r3, #255
	mov	r0, #145
	mov	r1, #5
	ldr	ip, .L6+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L6+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	fillScreen
	.word	.LANCHOR0
	.word	drawString
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L12
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
	ldr	r3, .L12+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L8
	ldr	r3, .L12+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L11
.L8:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L11:
	ldr	r0, [r4, #0]
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	b	.L8
.L13:
	.align	2
.L12:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #15808
	stmfd	sp!, {r3, lr}
	add	r0, r0, #47
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	ldr	r2, .L15+4
	mov	r3, #0
	mov	r0, #76
	mov	r1, #106
	ldr	ip, .L15+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L15+12
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	fillScreen
	.word	.LANCHOR0+20
	.word	drawString
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L18
	ldr	r2, .L22+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L20
.L18:
	tst	r3, #4
	beq	.L17
	ldr	r3, .L22+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L21
.L17:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L21:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L20:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L23:
	.align	2
.L22:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #992
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r2, .L25+4
	mov	r3, #0
	mov	r0, #76
	mov	r1, #110
	ldr	ip, .L25+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L25+12
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	fillScreen
	.word	.LANCHOR0+28
	.word	drawString
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L30
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L30+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L29
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L29:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L31:
	.align	2
.L30:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #31
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	ldr	r2, .L33+4
	mov	r3, #0
	mov	r0, #76
	mov	r1, #108
	ldr	ip, .L33+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L33+12
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	fillScreen
	.word	.LANCHOR0+36
	.word	drawString
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L42
	sub	sp, sp, #8
	ldr	r3, .L42+4
	mov	lr, pc
	bx	r3
	ldr	r1, .L42+8
	ldr	r2, [r4, #0]
	ldr	r3, .L42+12
	ldr	r0, .L42+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	mov	r2, #8
	mov	ip, #0
	mov	r3, r2
	mov	r0, #145
	mov	r1, #107
	str	ip, [sp, #0]
	ldr	ip, .L42+28
	mov	lr, pc
	bx	ip
	mov	r3, #32512
	add	r3, r3, #255
	mov	r0, #145
	mov	r1, #107
	ldr	r2, .L42+16
	ldr	ip, .L42+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L42+36
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L42+40
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L39
.L36:
	ldr	r2, [r4, #0]
	cmp	r2, #0
	beq	.L40
	tst	r3, #2
	beq	.L35
	ldr	r3, .L42+40
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L41
.L35:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L41:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	b	goToLose
.L39:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L40:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	b	goToWin
.L43:
	.align	2
.L42:
	.word	ballsRemaining
	.word	updateGame
	.word	.LC4
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawGame
	.word	drawRect
	.word	drawString
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L47+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L46
.L44:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L46:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L48:
	.align	2
.L47:
	.word	waitForVBlank
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
	ldr	r4, .L61
	ldr	r7, .L61+4
	ldr	r6, .L61+8
	add	r5, r5, #256
.L60:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L51:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L51
.L57:
	.word	.L52
	.word	.L53
	.word	.L54
	.word	.L55
	.word	.L56
.L56:
	bl	lose
	b	.L60
.L55:
	bl	win
	b	.L60
.L54:
	bl	pause
	b	.L60
.L53:
	bl	game
	b	.L60
.L52:
	bl	start
	b	.L60
.L62:
	.align	2
.L61:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.comm	buffer,41,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.ascii	"Balls Remaining: \000\000"
	.space	1
.LC1:
	.ascii	"Pause\000\000"
	.space	1
.LC2:
	.ascii	"Win\000\000"
	.space	3
.LC3:
	.ascii	"Lose\000\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC4:
	.ascii	"%d\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
