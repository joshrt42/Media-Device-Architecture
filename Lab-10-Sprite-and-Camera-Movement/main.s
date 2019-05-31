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
	.global	initPikachu
	.type	initPikachu, %function
initPikachu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	str	r4, [sp, #-4]!
	ldr	r4, [r3, #0]
	ldr	r3, .L2+4
	ldr	ip, [r3, #0]
	ldr	r3, .L2+8
	mov	r1, #1
	mov	r2, #0
	mov	r0, #16
	add	r4, r4, #72
	add	ip, ip, #112
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	mov	r1, #3
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r4, [r3, #8]
	str	ip, [r3, #12]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r1, [r3, #48]
	str	r2, [r3, #36]
	ldmfd	sp!, {r4}
	bx	lr
.L3:
	.align	2
.L2:
	.word	vOff
	.word	hOff
	.word	pikachu
	.size	initPikachu, .-initPikachu
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
	mov	r2, #100663296
	ldr	r4, .L5+8
	mov	r6, r2
	mov	r0, #3
	ldr	r1, .L5+12
	mov	r3, #896
	mov	lr, pc
	bx	r4
	add	r2, r6, #63488
	mov	r0, #3
	ldr	r1, .L5+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	add	r2, r6, #65536
	mov	r6, #7936	@ movhi
	strh	r6, [r5, #8]	@ movhi
	ldr	r6, .L5+20
	mov	lr, #96
	str	lr, [r6, #0]
	strh	lr, [r5, #18]	@ movhi
	ldr	lr, .L5+24
	mov	ip, #9
	str	ip, [lr, #0]
	mov	r0, #3
	strh	ip, [r5, #16]	@ movhi
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
	mov	r0, #3
	ldr	r1, .L5+40
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	r4
	mov	r3, #4352	@ movhi
	strh	r3, [r5, #0]	@ movhi
	bl	initPikachu
	ldr	r3, .L5+44
	mov	r2, #0
	mov	r0, #32
	mov	r1, #50
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	mov	r2, #4
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #48]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	housePal
	.word	loadPalette
	.word	DMANow
	.word	houseTiles
	.word	houseMap
	.word	vOff
	.word	hOff
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	pokeball
	.size	initialize, .-initialize
	.align	2
	.global	initPokeball
	.type	initPokeball, %function
initPokeball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	mov	r2, #0
	mov	r0, #32
	mov	r1, #50
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	mov	r2, #4
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #48]
	bx	lr
.L9:
	.align	2
.L8:
	.word	pokeball
	.size	initPokeball, .-initPokeball
	.global	__aeabi_idivmod
	.align	2
	.global	animatePikachu
	.type	animatePikachu, %function
animatePikachu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L19
	ldr	r3, .L19+4
	ldr	r5, [r4, #32]
	smull	r2, r3, r5, r3
	mov	r2, r5, asr #31
	rsb	r3, r2, r3, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, asl #2
	cmp	r5, r3, asl #2
	mov	r3, #4
	str	r6, [r4, #40]
	str	r3, [r4, #36]
	bne	.L11
	add	r0, r4, #44
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L11:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	moveq	r3, #3
	streq	r3, [r4, #36]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	moveq	r3, #2
	streq	r3, [r4, #36]
	beq	.L16
	ldr	r3, [r4, #36]
	cmp	r3, #4
	ldr	r3, .L19
	moveq	r2, #0
	streq	r2, [r3, #44]
	streq	r6, [r3, #36]
	beq	.L10
.L16:
	add	r5, r5, #1
	str	r5, [r4, #32]
.L10:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	pikachu
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animatePikachu, .-animatePikachu
	.align	2
	.global	updatePikachu
	.type	updatePikachu, %function
updatePikachu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L22
	ldr	r3, .L64
	ldr	r4, .L64+4
	add	r1, r3, #8
	ldmia	r1, {r1, r2}	@ phole ldm
.L23:
	mov	r0, #67108864
	add	r0, r0, #256
	ldrh	r0, [r0, #48]
	tst	r0, #64
	bne	.L24
	ldr	r6, [r3, #16]
	rsb	r0, r6, r1
	mov	r5, r0, asl #8
	ldr	ip, .L64+8
	add	r7, r5, r2
	add	r7, ip, r7, asl #1
	ldrh	r7, [r7, #2]
	cmp	r7, #0
	ldr	r7, .L64
	bne	.L63
.L24:
	mov	r0, #67108864
	add	r0, r0, #256
	ldrh	r0, [r0, #48]
	tst	r0, #32
	bne	.L60
	ldr	r5, [r3, #20]
	rsb	ip, r5, #1
	add	ip, ip, r2
	ldr	r0, .L64+8
	add	r6, ip, r1, asl #8
	mov	r6, r6, asl #1
	ldrh	r6, [r0, r6]
	cmp	r6, #0
	ldr	r6, .L64
	bne	.L52
.L60:
	ldr	ip, .L64+12
.L25:
	mov	r0, #67108864
	add	r0, r0, #256
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L62
	ldr	r0, [r3, #24]
	ldr	r7, [r3, #20]
	add	r6, r0, r7
	sub	r6, r6, #1
	add	r6, r6, r2
	ldr	r5, .L64+8
	add	r8, r6, r1, asl #8
	mov	r8, r8, asl #1
	ldrh	r8, [r5, r8]
	cmp	r8, #0
	ldr	r8, .L64
	beq	.L62
	ldr	sl, [r8, #28]
	add	sl, r1, sl
	sub	sl, sl, #1
	add	r6, r6, sl, asl #8
	mov	r6, r6, asl #1
	ldrh	r5, [r5, r6]
	cmp	r5, #0
	beq	.L62
	rsb	r5, r0, #256
	cmp	r2, r5
	bge	.L62
	add	r0, r0, r0, lsr #31
	mov	r0, r0, asr #1
	rsb	r0, r0, #0
	add	r2, r2, r7
	add	r5, r0, #135
	cmp	r2, r5
	str	r2, [r8, #12]
	bgt	.L62
	add	r0, r0, #120
	cmp	r2, r0
	ldrgt	r0, [ip, #0]
	addgt	r0, r7, r0
	strgt	r0, [ip, #0]
	bgt	.L27
.L62:
	ldr	r0, [ip, #0]
.L27:
	ldr	ip, [r4, #0]
	rsb	r2, r0, r2
	rsb	r1, ip, r1
	stmia	r3, {r1, r2}	@ phole stm
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	b	animatePikachu
.L22:
	ldr	r3, .L64
	ldr	r1, [r3, #8]
	ldr	r4, [r3, #28]
	ldr	r5, [r3, #16]
	add	ip, r1, r4
	sub	ip, ip, #1
	ldr	r2, [r3, #12]
	add	ip, ip, r5
	ldr	r0, .L64+8
	add	ip, r2, ip, asl #8
	add	r6, r0, ip, asl #1
	ldrh	r6, [r6, #2]
	cmp	r6, #0
	beq	.L58
	ldr	r6, [r3, #24]
	add	ip, ip, r6
	add	r0, r0, ip, asl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L58
	rsb	r0, r4, #256
	cmp	r1, r0
	bge	.L58
	add	r4, r4, r4, lsr #31
	mov	r4, r4, asr #1
	rsb	r4, r4, #0
	add	r1, r1, r5
	add	r0, r4, #175
	cmp	r1, r0
	str	r1, [r3, #8]
	bgt	.L58
	add	r4, r4, #81
	cmp	r1, r4
	ble	.L58
	ldr	r4, .L64+4
	ldr	r0, [r4, #0]
	add	r5, r0, r5
	str	r5, [r4, #0]
	b	.L23
.L58:
	ldr	r4, .L64+4
	b	.L23
.L52:
	ldr	r7, [r6, #28]
	add	r7, r1, r7
	sub	r7, r7, #1
	add	ip, ip, r7, asl #8
	mov	ip, ip, asl #1
	ldrh	r0, [r0, ip]
	cmp	r0, #0
	beq	.L60
	cmp	r2, #1
	ble	.L60
	ldr	r0, [r6, #24]
	add	r0, r0, r0, lsr #31
	mov	r0, r0, asr #1
	rsb	r0, r0, #0
	rsb	r2, r5, r2
	add	ip, r0, #135
	cmp	r2, ip
	str	r2, [r6, #12]
	bgt	.L60
	add	r0, r0, #120
	cmp	r2, r0
	ble	.L60
	ldr	ip, .L64+12
	ldr	r0, [ip, #0]
	rsb	r5, r5, r0
	str	r5, [ip, #0]
	b	.L25
.L63:
	ldr	r8, [r7, #24]
	add	r5, r5, r8
	add	r5, r5, r2
	add	ip, ip, r5, asl #1
	ldrh	ip, [ip, #-2]
	cmp	ip, #0
	beq	.L24
	cmp	r1, #1
	ble	.L24
	ldr	r1, [r7, #28]
	add	r1, r1, r1, lsr #31
	mov	r1, r1, asr #1
	rsb	r1, r1, #0
	add	ip, r1, #175
	cmp	r0, ip
	str	r0, [r7, #8]
	bgt	.L34
	add	r1, r1, #81
	cmp	r0, r1
	ble	.L34
	ldr	r1, [r4, #0]
	rsb	r6, r6, r1
	str	r6, [r4, #0]
	mov	r1, r0
	b	.L24
.L34:
	mov	r1, r0
	b	.L24
.L65:
	.align	2
.L64:
	.word	pikachu
	.word	vOff
	.word	collisionmapBitmap
	.word	hOff
	.size	updatePikachu, .-updatePikachu
	.align	2
	.global	animatePokeball
	.type	animatePokeball, %function
animatePokeball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L68
	ldr	r3, .L68+4
	ldr	r4, [r5, #32]
	smull	r2, r3, r4, r3
	mov	r2, r4, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	cmp	r4, r3, asl #2
	bne	.L67
	add	r0, r5, #44
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	str	r1, [r5, #44]
.L67:
	add	r4, r4, #1
	str	r4, [r5, #32]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	pokeball
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animatePokeball, .-animatePokeball
	.align	2
	.global	updatePokeball
	.type	updatePokeball, %function
updatePokeball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L73
	str	r4, [sp, #-4]!
	ldr	r1, [r3, #28]
	ldr	r2, [r3, #0]
	rsb	r1, r1, #0
	cmp	r2, r1
	movlt	r2, #1
	blt	.L71
	cmp	r2, #160
	movle	r2, #0
	movgt	r2, #1
.L71:
	ldr	r1, .L73+4
	ldr	r0, [r1, #0]
	ldr	r1, .L73+8
	add	r4, r3, #8
	ldmia	r4, {r4, ip}	@ phole ldm
	ldr	r1, [r1, #0]
	rsb	r0, r0, r4
	rsb	r1, r1, ip
	str	r2, [r3, #52]
	stmia	r3, {r0, r1}	@ phole stm
	ldmfd	sp!, {r4}
	b	animatePokeball
.L74:
	.align	2
.L73:
	.word	pokeball
	.word	vOff
	.word	hOff
	.size	updatePokeball, .-updatePokeball
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	updatePikachu
	ldmfd	sp!, {r4, lr}
	b	updatePokeball
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPikachu
	.type	drawPikachu, %function
drawPikachu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L80
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #52]
	cmp	r2, #0
	bne	.L79
	ldr	r1, [r3, #4]
	ldr	r4, [r3, #44]
	ldr	ip, [r3, #36]
	mov	r1, r1, asl #23
	ldr	r2, .L80+4
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	add	r3, ip, r4, asl #5
	orr	r1, r1, #16384
	mov	r3, r3, asl #1
	strh	r0, [r2, #0]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
.L76:
	ldmfd	sp!, {r4}
	bx	lr
.L79:
	ldr	r3, .L80+4
	ldrh	r2, [r3, #0]
	orr	r2, r2, #512
	strh	r2, [r3, #0]	@ movhi
	b	.L76
.L81:
	.align	2
.L80:
	.word	pikachu
	.word	shadowOAM
	.size	drawPikachu, .-drawPikachu
	.align	2
	.global	drawPokeball
	.type	drawPokeball, %function
drawPokeball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L86
	ldr	r2, [r3, #52]
	cmp	r2, #0
	bne	.L85
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #44]
	mov	r1, r1, asl #23
	mov	ip, ip, asl #7
	ldr	r2, .L86+4
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mvn	r1, r1, lsr #6
	add	r3, ip, #8
	mvn	r1, r1, lsr #17
	orr	r3, r3, #4096
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	bx	lr
.L85:
	ldr	r3, .L86+4
	ldrh	r2, [r3, #8]
	orr	r2, r2, #512
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L87:
	.align	2
.L86:
	.word	pokeball
	.word	shadowOAM
	.size	drawPokeball, .-drawPokeball
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	drawPikachu
	bl	drawPokeball
	ldr	r3, .L89
	mov	lr, pc
	bx	r3
	ldr	r1, .L89+4
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	ip, .L89+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L89+12
	ldrh	r1, [r3, #0]
	ldr	r3, .L89+16
	ldrh	r2, [r3, #0]
	mov	r3, #67108864
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	waitForVBlank
	.word	shadowOAM
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r6, .L93
	ldr	r4, .L93+4
	add	r5, r5, #256
.L92:
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	bl	updateGame
	bl	drawGame
	b	.L92
.L94:
	.align	2
.L93:
	.word	oldButtons
	.word	buttons
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	pikachu,56,4
	.comm	pokeball,56,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
