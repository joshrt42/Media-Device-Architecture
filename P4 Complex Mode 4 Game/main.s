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
	ldr	r0, .L2+8
	ldr	r3, .L2+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L2+24
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L2+28
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	start1Pal
	.word	loadPalette
	.word	start1Bitmap
	.word	drawFullScreenImage
	.word	waitForVBlank
	.word	flipPage
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
	mov	r3, #1040
	add	r3, r3, #4
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
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r7, .L6
	ldr	r5, .L6+4
	mov	r0, r7
	ldr	r6, .L6+8
	mov	lr, pc
	bx	r6
	ldr	r4, .L6+12
	mov	r1, #5
	mov	r2, r5
	mov	r0, #145
	mov	r3, #255
	mov	lr, pc
	bx	r4
	ldr	r3, .L6+16
	mov	lr, pc
	bx	r3
	mov	r0, r7
	mov	lr, pc
	bx	r6
	mov	r2, r5
	mov	r3, #255
	mov	r0, #145
	mov	r1, #5
	mov	lr, pc
	bx	r4
	ldr	r3, .L6+20
	mov	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, .L6+24
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	gamebgBitmap
	.word	.LANCHOR0
	.word	drawFullScreenImage
	.word	drawString
	.word	flipPage
	.word	frame
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
	stmfd	sp!, {r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	ldr	r4, .L16+4
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	ldrb	r1, [r4, #0]	@ zero_extendqisi2
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	ldrb	r3, [r4, #0]	@ zero_extendqisi2
	ldr	r2, .L16+20
	and	r3, r3, #255
	umull	r0, r3, r2, r3
	cmp	r1, r3, lsr #1
	blt	.L14
	ldrb	r3, [r4, #0]	@ zero_extendqisi2
	ldr	r2, .L16+24
	mov	r3, r3, asl #1
	smull	r0, r3, r2, r3
	cmp	r1, r3
	blt	.L15
	ldr	r0, .L16+28
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
.L10:
	ldr	r3, .L16+36
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L8
	ldr	r3, .L16+40
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bne	.L8
	bl	gotoGame
	ldr	r3, .L16+44
	mov	lr, pc
	bx	r3
.L8:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L15:
	ldr	r0, .L16+48
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
	b	.L10
.L14:
	ldr	r0, .L16+52
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
	b	.L10
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	.LANCHOR1
	.word	flipPage
	.word	rand
	.word	__aeabi_idivmod
	.word	-1431655765
	.word	1431655766
	.word	start3Bitmap
	.word	drawFullScreenImage
	.word	oldButtons
	.word	buttons
	.word	initGame
	.word	start2Bitmap
	.word	start1Bitmap
	.size	start, .-start
	.align	2
	.global	gotoPause
	.type	gotoPause, %function
gotoPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L19
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+16
	mov	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, .L19+20
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	pause1Bitmap
	.word	drawFullScreenImage
	.word	waitForVBlank
	.word	flipPage
	.word	frame
	.word	state
	.size	gotoPause, .-gotoPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r4, .L28+4
	ldrb	r6, [r4, #0]	@ zero_extendqisi2
	mov	r7, r0
	ldr	r3, .L28+8
	and	r6, r6, #255
	mov	lr, pc
	bx	r3
	mov	r0, r7
	mov	r1, r6
	ldr	r3, .L28+12
	mov	lr, pc
	bx	r3
	ldrb	r5, [r4, #0]	@ zero_extendqisi2
	and	r5, r5, #255
	cmp	r1, r5, lsr #1
	bge	.L22
	ldr	r0, .L28+16
	ldr	r3, .L28+20
	mov	lr, pc
	bx	r3
.L23:
	ldr	r3, .L28+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+28
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L24
	ldr	r2, .L28+32
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L26
.L24:
	tst	r3, #4
	beq	.L25
	ldr	r3, .L28+32
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L27
.L25:
	ldrb	r3, [r4, #0]	@ zero_extendqisi2
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L22:
	ldr	r0, .L28+36
	ldr	r3, .L28+20
	mov	lr, pc
	bx	r3
	b	.L23
.L27:
	bl	gotoStart
	b	.L25
.L26:
	bl	gotoGame
	b	.L25
.L29:
	.align	2
.L28:
	.word	rand
	.word	.LANCHOR1
	.word	flipPage
	.word	__aeabi_idivmod
	.word	pause1Bitmap
	.word	drawFullScreenImage
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+16
	mov	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, .L31+20
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	winBitmap
	.word	drawFullScreenImage
	.word	waitForVBlank
	.word	flipPage
	.word	frame
	.word	state
	.size	gotoWin, .-gotoWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L34
	ldr	r3, .L37+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L36
.L34:
	ldr	r3, .L37+12
	ldr	r1, .L37+16
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldrb	r0, [r1, #0]	@ zero_extendqisi2
	and	r2, r2, #255
	add	r1, r2, #1
	cmp	r2, r0
	and	r1, r1, #255
	movhi	r2, #0
	strb	r1, [r3, #0]
	strhib	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L36:
	bl	gotoStart
	b	.L34
.L38:
	.align	2
.L37:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	frame
	.word	.LANCHOR1
	.size	win, .-win
	.align	2
	.global	gotoLose
	.type	gotoLose, %function
gotoLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L40
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+16
	mov	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, .L40+20
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	loseBitmap
	.word	drawFullScreenImage
	.word	waitForVBlank
	.word	flipPage
	.word	frame
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
	ldr	r4, .L50
	sub	sp, sp, #8
	ldr	r1, .L50+4
	ldr	r2, [r4, #0]
	ldr	r3, .L50+8
	ldr	r0, .L50+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+24
	mov	lr, pc
	bx	r3
	ldr	ip, .L50+28
	mov	r0, #145
	mov	r1, #73
	mov	r2, #8
	mov	r3, #12
	str	ip, [sp, #0]
	ldr	ip, .L50+32
	mov	lr, pc
	bx	ip
	mov	r0, #145
	mov	r1, #72
	ldr	r2, .L50+12
	ldr	ip, .L50+36
	mov	r3, #255
	mov	lr, pc
	bx	ip
	ldr	r3, .L50+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+48
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L43
	ldr	r3, .L50+52
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L47
.L43:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ble	.L48
	ldr	r3, .L50+56
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L49
.L44:
	ldr	r3, .L50+60
	ldr	r1, .L50+64
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldrb	r0, [r1, #0]	@ zero_extendqisi2
	and	r2, r2, #255
	add	r1, r2, #1
	and	r1, r1, #255
	cmp	r2, r0
	strb	r1, [r3, #0]
	bls	.L42
	ldr	r2, .L50+68
	ldr	r1, [r2, #0]
	add	r1, r1, #1
	str	r1, [r2, #0]
	mov	r2, #0
	strb	r2, [r3, #0]
.L42:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L49:
	bl	gotoLose
	b	.L44
.L47:
	bl	gotoPause
	b	.L44
.L48:
	bl	gotoWin
	b	.L44
.L51:
	.align	2
.L50:
	.word	enemiesRemaining
	.word	.LC1
	.word	sprintf
	.word	buffer
	.word	updateGame
	.word	refreshGame
	.word	drawGame
	.word	blueBitmap
	.word	drawImage
	.word	drawString
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	gameOver
	.word	frame
	.word	.LANCHOR1
	.word	score
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L53
	ldr	r3, .L56+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L55
.L53:
	ldr	r3, .L56+12
	ldr	r1, .L56+16
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldrb	r0, [r1, #0]	@ zero_extendqisi2
	and	r2, r2, #255
	add	r1, r2, #1
	cmp	r2, r0
	and	r1, r1, #255
	movhi	r2, #0
	strb	r1, [r3, #0]
	strhib	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L55:
	bl	gotoStart
	b	.L53
.L57:
	.align	2
.L56:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	frame
	.word	.LANCHOR1
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
	ldr	r4, .L70
	ldr	r7, .L70+4
	ldr	r6, .L70+8
	add	r5, r5, #256
.L69:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L60:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L60
.L66:
	.word	.L61
	.word	.L62
	.word	.L63
	.word	.L64
	.word	.L65
.L65:
	bl	lose
	b	.L69
.L64:
	bl	win
	b	.L69
.L63:
	bl	pause
	b	.L69
.L62:
	bl	game
	b	.L69
.L61:
	bl	start
	b	.L69
.L71:
	.align	2
.L70:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	frameCap
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	buffer,41,4
	.comm	frame,1,1
	.comm	score,4,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.ascii	"Virii left:\000\000"
	.data
	.set	.LANCHOR1,. + 0
	.type	frameCap, %object
	.size	frameCap, 1
frameCap:
	.byte	120
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"%d\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
