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
	.word	titleScreenBitmap
	.word	drawFullScreenImage
	.word	gameOver
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
	str	lr, [sp, #-4]!
	ldr	r3, .L6
	sub	sp, sp, #12
	ldr	r0, .L6+4
	mov	lr, pc
	bx	r3
	mov	ip, #0
	mov	r0, #143
	mov	r1, #3
	mov	r2, #12
	mov	r3, #120
	str	ip, [sp, #0]
	ldr	ip, .L6+8
	mov	lr, pc
	bx	ip
	mov	r3, #32512
	ldr	r2, .L6+12
	add	r3, r3, #255
	mov	r0, #145
	mov	r1, #5
	ldr	ip, .L6+16
	mov	lr, pc
	bx	ip
	ldr	r3, .L6+20
	mov	r2, #1
	str	r2, [r3, #0]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	drawFullScreenImage
	.word	background1Bitmap
	.word	drawRect
	.word	.LANCHOR0
	.word	drawString
	.word	state
	.size	gotoGame, .-gotoGame
	.global	__aeabi_idivmod
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L14
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+8
	ldrh	r4, [r3, #0]
	ldr	r3, .L14+12
	mov	r1, r4
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+16
	umull	r2, r4, r3, r4
	mov	r1, r1, asl #16
	mov	r1, r1, lsr #16
	ldr	r5, .L14+20
	cmp	r1, r4, lsr #3
	strh	r1, [r5, #0]	@ movhi
	bls	.L9
	ldr	r0, .L14+24
	ldr	r3, .L14+28
	mov	lr, pc
	bx	r3
.L10:
	ldr	r3, .L14+32
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L8
	ldr	r3, .L14+36
	ldrh	r3, [r3, #0]
	ands	r3, r3, #8
	beq	.L13
.L8:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L9:
	ldr	r3, .L14+28
	ldr	r0, .L14+40
	mov	lr, pc
	bx	r3
	b	.L10
.L13:
	strh	r3, [r5, #0]	@ movhi
	bl	gotoGame
	ldr	r3, .L14+44
	mov	lr, pc
	bx	r3
	b	.L8
.L15:
	.align	2
.L14:
	.word	waitForVBlank
	.word	rand
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.word	-858993459
	.word	timer
	.word	titleScreen2Bitmap
	.word	drawFullScreenImage
	.word	oldButtons
	.word	buttons
	.word	titleScreenBitmap
	.word	initGame
	.size	start, .-start
	.align	2
	.global	gotoPause
	.type	gotoPause, %function
gotoPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L17
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+8
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	pause1Bitmap
	.word	drawFullScreenImage
	.word	state
	.size	gotoPause, .-gotoPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+8
	ldrh	r4, [r3, #0]
	ldr	r3, .L28+12
	mov	r1, r4
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+16
	umull	r2, r3, r4, r3
	mov	r1, r1, asl #16
	mov	r1, r1, lsr #16
	cmp	r1, r3, lsr #3
	ldr	r3, .L28+20
	strh	r1, [r3, #0]	@ movhi
	bcc	.L24
	cmp	r4, r1
	bhi	.L25
.L21:
	ldr	r3, .L28+24
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L22
	ldr	r2, .L28+28
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L26
.L22:
	tst	r3, #4
	beq	.L19
	ldr	r3, .L28+28
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L27
.L19:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L27:
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L24:
	ldr	r3, .L28+32
	ldr	r0, .L28+36
	mov	lr, pc
	bx	r3
	b	.L21
.L25:
	ldr	r3, .L28+32
	ldr	r0, .L28+40
	mov	lr, pc
	bx	r3
	b	.L21
.L26:
	ldmfd	sp!, {r4, lr}
	b	gotoGame
.L29:
	.align	2
.L28:
	.word	waitForVBlank
	.word	rand
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.word	-858993459
	.word	timer
	.word	oldButtons
	.word	buttons
	.word	drawFullScreenImage
	.word	pause1Bitmap
	.word	pause2Bitmap
	.size	pause, .-pause
	.align	2
	.global	gotoWin
	.type	gotoWin, %function
gotoWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L31
	ldr	r3, .L31+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+8
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	winBitmap
	.word	drawFullScreenImage
	.word	state
	.size	gotoWin, .-gotoWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L36
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L33
	ldr	r3, .L36+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L35
.L33:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L35:
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L37:
	.align	2
.L36:
	.word	waitForVBlank
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
	stmfd	sp!, {r3, lr}
	ldr	r0, .L39
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+8
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	loseBitmap
	.word	drawFullScreenImage
	.word	state
	.size	gotoLose, .-gotoLose
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L54
	sub	sp, sp, #12
	ldr	r3, .L54+4
	mov	lr, pc
	bx	r3
	ldr	r1, .L54+8
	ldr	r2, [r4, #0]
	ldr	r3, .L54+12
	ldr	r0, .L54+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+28
	ldrh	r5, [r3, #0]
	ldr	r3, .L54+32
	mov	r1, r5
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+36
	umull	r0, r3, r5, r3
	mov	r1, r1, asl #16
	mov	r1, r1, lsr #16
	cmp	r1, r3, lsr #1
	ldr	r3, .L54+40
	strh	r1, [r3, #0]	@ movhi
	bcc	.L48
	ldr	r3, .L54+44
	mov	r2, r5, asl #1
	smull	r0, r3, r2, r3
	cmp	r1, r3
	blt	.L49
	cmp	r5, r1
	bhi	.L50
.L43:
	ldr	r3, .L54+48
	mov	lr, pc
	bx	r3
	mov	ip, #0
	mov	r0, #143
	mov	r1, #106
	mov	r2, #12
	mov	r3, #13
	str	ip, [sp, #0]
	ldr	ip, .L54+52
	mov	lr, pc
	bx	ip
	mov	r3, #32512
	add	r3, r3, #255
	mov	r0, #145
	mov	r1, #107
	ldr	r2, .L54+16
	ldr	ip, .L54+56
	mov	lr, pc
	bx	ip
	ldr	r3, .L54+60
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L45
	ldr	r3, .L54+64
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L51
.L45:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	beq	.L52
	ldr	r3, .L54+68
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L53
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L53:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	b	gotoLose
.L48:
	ldr	r0, .L54+72
	ldr	r3, .L54+76
	mov	lr, pc
	bx	r3
	b	.L43
.L49:
	ldr	r0, .L54+80
	ldr	r3, .L54+76
	mov	lr, pc
	bx	r3
	b	.L43
.L50:
	ldr	r0, .L54+84
	ldr	r3, .L54+76
	mov	lr, pc
	bx	r3
	b	.L43
.L51:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	b	gotoPause
.L52:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	b	gotoWin
.L55:
	.align	2
.L54:
	.word	enemiesRemaining
	.word	updateGame
	.word	.LC1
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	rand
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.word	-1431655765
	.word	timer
	.word	1431655766
	.word	drawGame
	.word	drawRect
	.word	drawString
	.word	oldButtons
	.word	buttons
	.word	gameOver
	.word	background1Bitmap
	.word	drawGameBG
	.word	background2Bitmap
	.word	background3Bitmap
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L59
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L59+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L58
.L56:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L58:
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L60:
	.align	2
.L59:
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
	ldr	r4, .L73
	ldr	r7, .L73+4
	ldr	r6, .L73+8
	add	r5, r5, #256
.L72:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L63:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L63
.L69:
	.word	.L64
	.word	.L65
	.word	.L66
	.word	.L67
	.word	.L68
.L68:
	bl	lose
	b	.L72
.L67:
	bl	win
	b	.L72
.L66:
	bl	pause
	b	.L72
.L65:
	bl	game
	b	.L72
.L64:
	bl	start
	b	.L72
.L74:
	.align	2
.L73:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	refresh
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	buffer,41,4
	.comm	timer,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.ascii	"Dead Remaining: \000\000"
	.data
	.align	1
	.set	.LANCHOR1,. + 0
	.type	refresh, %object
	.size	refresh, 2
refresh:
	.short	60
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"%d\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
