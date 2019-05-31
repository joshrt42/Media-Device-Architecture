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
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L2
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	ip, #56320
	mov	r3, #4800
	strh	ip, [r5, #8]	@ movhi
	ldr	r4, .L2+8
	mov	r0, #3
	ldr	r1, .L2+12
	mov	r2, #100663296
	add	r3, r3, #48
	mov	r6, #100663296
	mov	lr, pc
	bx	r4
	add	r2, r6, #57344
	mov	r0, #3
	ldr	r1, .L2+16
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	add	r2, r6, #65536
	mov	r0, #3
	ldr	r1, .L2+20
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L2+24
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+32
	mov	r0, #1
	add	r2, r5, #256
	ldrh	r4, [r2, #48]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	mov	r0, #72
	str	r0, [r3, #0]
	mov	r0, #112
	mov	r2, #0
	str	r0, [r3, #4]
	mov	ip, #16
	mov	r0, #3
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r2, [r3, #28]
	ldr	r3, .L2+36
	ldr	r1, .L2+40
	strh	r4, [r3, #0]	@ movhi
	mov	r3, #100
	str	r3, [r1, #4]
	mov	r3, #4352	@ movhi
	str	r2, [r1, #0]
	strh	r3, [r5, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	bgPal
	.word	loadPalette
	.word	DMANow
	.word	bgTiles
	.word	bgMap
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	hideSprites
	.word	pikachu
	.word	buttons
	.word	.LANCHOR0
	.size	initialize, .-initialize
	.global	__aeabi_idivmod
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L17
	mov	r6, #67108864
	bl	initialize
	ldr	r5, .L17+4
	ldr	r8, .L17+8
	ldr	sl, .L17+12
	ldr	r9, .L17+16
	mov	r7, r4
	add	r6, r6, #256
	b	.L14
.L16:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L12
	ldr	r3, [r7, #32]
	mov	r1, #0
	str	r1, [r7, #36]
	str	r3, [r7, #28]
.L13:
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	ldrh	r1, [r4, #0]
	orr	r2, r2, #16384
	mov	r3, r3, asl #1
	strh	r1, [r8, #0]	@ movhi
	strh	r2, [r8, #2]	@ movhi
	strh	r3, [r8, #4]	@ movhi
	mov	lr, pc
	bx	sl
	ldr	r1, .L17+8
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r9
	ldrh	r1, [r5, #0]
	ldrh	r2, [r5, #4]
	mov	r3, #67108864
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
.L14:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	ldr	fp, [r4, #24]
	strne	r3, [r7, #32]
	ldr	r3, .L17+20
	movne	r1, #4
	strne	r1, [r7, #28]
	smull	r1, r2, r3, fp
	mov	r3, fp, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	cmp	fp, r3, asl #2
	bne	.L6
	add	r0, r7, #36
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r2, .L17+24
	mov	lr, pc
	bx	r2
	str	r1, [r7, #36]
.L6:
	ldrh	r3, [r6, #48]
	tst	r3, #64
	ldreq	r3, [r5, #4]
	subeq	r3, r3, #1
	streq	r3, [r5, #4]
	ldrh	r3, [r6, #48]
	moveq	r1, #1
	streq	r1, [r4, #28]
	ands	r3, r3, #128
	ldreq	r2, [r5, #4]
	streq	r3, [r4, #28]
	ldrh	r3, [r6, #48]
	addeq	r2, r2, #1
	streq	r2, [r5, #4]
	tst	r3, #32
	ldreq	r3, [r5, #0]
	subeq	r3, r3, #1
	streq	r3, [r5, #0]
	ldrh	r3, [r6, #48]
	moveq	r2, #3
	streq	r2, [r4, #28]
	tst	r3, #16
	bne	.L16
	ldr	r3, [r5, #0]
	mov	r2, #2
	add	r3, r3, #1
	str	r2, [r4, #28]
	str	r3, [r5, #0]
	mov	r3, r2
.L12:
	ldr	r1, [r4, #36]
	add	fp, fp, #1
	str	fp, [r4, #24]
	mov	r1, r1, asl #5
	b	.L13
.L18:
	.align	2
.L17:
	.word	pikachu
	.word	.LANCHOR0
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	1717986919
	.word	__aeabi_idivmod
	.size	main, .-main
	.global	hOff
	.global	vOff
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	pikachu,44,4
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
