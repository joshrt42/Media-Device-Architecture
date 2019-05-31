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
	mov	r0, #32512
	stmfd	sp!, {r3, lr}
	add	r0, r0, #224
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+4
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	fillScreen
	.word	state
	.size	gotoStart, .-gotoStart
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
	b	gotoStart
	.size	initialize, .-initialize
	.align	2
	.global	gotoGame
	.type	gotoGame, %function
gotoGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #0
	ldr	r3, .L6
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+4
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	fillScreen
	.word	state
	.size	gotoGame, .-gotoGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L12
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L8
	ldr	r3, .L12+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L11
.L8:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L11:
	ldr	r3, .L12+8
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoGame
.L13:
	.align	2
.L12:
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	initGame
	.size	start, .-start
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L19
	ldrh	r3, [r4, #0]
	tst	r3, #8
	beq	.L15
	ldr	r2, .L19+4
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L17
.L15:
	tst	r3, #4
	beq	.L14
	ldr	r3, .L19+4
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L18
.L14:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L18:
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L17:
	bl	gotoGame
	ldrh	r3, [r4, #0]
	b	.L15
.L20:
	.align	2
.L19:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	gotoPause
	.type	gotoPause, %function
gotoPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #15808
	stmfd	sp!, {r3, lr}
	add	r0, r0, #47
	ldr	r3, .L22
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+4
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	fillScreen
	.word	state
	.size	gotoPause, .-gotoPause
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L26+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	gotoStart
.L27:
	.align	2
.L26:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	gotoWin
	.type	gotoWin, %function
gotoWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #992
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+4
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	fillScreen
	.word	state
	.size	gotoWin, .-gotoWin
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L33+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	gotoStart
.L34:
	.align	2
.L33:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	gotoLose
	.type	gotoLose, %function
gotoLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #31
	ldr	r3, .L36
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+4
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	fillScreen
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
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+4
	ldr	r3, .L45+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	tst	r3, #8
	beq	.L39
	ldr	r3, .L45+16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L42
.L39:
	ldr	r3, .L45+20
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L43
.L40:
	ldrh	r3, [r4, #0]
	tst	r3, #2
	beq	.L38
	ldr	r3, .L45+16
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L44
.L38:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L44:
	ldmfd	sp!, {r4, lr}
	b	gotoLose
.L43:
	bl	gotoWin
	b	.L40
.L42:
	bl	gotoPause
	b	.L39
.L46:
	.align	2
.L45:
	.word	updateGame
	.word	oldButtons
	.word	waitForVBlank
	.word	drawGame
	.word	buttons
	.word	ballsRemaining
	.size	game, .-game
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
	ldr	r4, .L59
	ldr	r7, .L59+4
	ldr	r6, .L59+8
	add	r5, r5, #256
.L58:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L49:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L49
.L55:
	.word	.L50
	.word	.L51
	.word	.L52
	.word	.L53
	.word	.L54
.L54:
	bl	lose
	b	.L58
.L53:
	bl	win
	b	.L58
.L52:
	bl	pause
	b	.L58
.L51:
	bl	game
	b	.L58
.L50:
	bl	start
	b	.L58
.L60:
	.align	2
.L59:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
