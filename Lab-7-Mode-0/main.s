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
	@ args = 0, pretend = 0, frame = 2048
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r3, #256	@ movhi
	mov	r9, #67108864
	mov	r4, #8064	@ movhi
	sub	sp, sp, #2048
	sub	sp, sp, #4
	ldr	r0, .L2
	strh	r3, [r9, #0]	@ movhi
	strh	r4, [r9, #8]	@ movhi
	ldr	r3, .L2+4
	mov	r4, #2048
	mov	r7, #-2147483648
	mov	lr, pc
	bx	r3
	mov	fp, #1	@ movhi
	mov	r2, r4
	mov	r1, #0
	ldr	r3, .L2+8
	add	r4, sp, r4
	mov	r0, sp
	mov	r7, r7, asr #20
	mov	lr, pc
	bx	r3
	strh	fp, [r4, r7]	@ movhi
	mov	fp, #2	@ movhi
	strh	fp, [sp, #2]	@ movhi
	mov	r4, #4	@ movhi
	mov	fp, #5	@ movhi
	mov	sl, #1024
	strh	r4, [sp, #6]	@ movhi
	strh	fp, [sp, #8]	@ movhi
	mov	r4, #6	@ movhi
	mov	fp, #7	@ movhi
	mov	r6, #-2130706432
	mov	lr, #9
	mov	r6, r6, asr #20
	strh	r4, [sp, #10]	@ movhi
	strh	fp, [sp, #12]	@ movhi
	add	r4, sp, #2048
	strh	fp, [sp, #132]	@ movhi
	mvn	r5, #2016
	add	fp, sl, #7
	strh	lr, [r4, r6]	@ movhi
	strh	fp, [sp, #136]	@ movhi
	mov	r6, #10	@ movhi
	mov	fp, #10	@ movhi
	sub	r5, r5, #13
	mov	ip, #8
	strh	r6, [r4, r5]	@ movhi
	strh	fp, [sp, #198]	@ movhi
	mov	r4, #6	@ movhi
	add	fp, sp, #256
	add	r6, sl, #6
	strh	ip, [sp, #14]	@ movhi
	strh	ip, [sp, #134]	@ movhi
	strh	r4, [sp, #140]	@ movhi
	strh	r6, [sp, #142]	@ movhi
	strh	lr, [sp, #196]	@ movhi
	strh	lr, [sp, #200]	@ movhi
	strh	ip, [fp, #6]	@ movhi
	mov	lr, #2048
	mov	r4, #3072
	mov	r6, #2048
	mov	ip, #3072
	mov	r8, #3
	add	lr, lr, #6
	add	ip, ip, #7
	add	r4, r4, #6
	add	r6, r6, #7
	mov	r0, r8
	mov	r2, #100663296
	mov	r3, #1152
	ldr	r1, .L2+12
	strh	lr, [sp, #204]	@ movhi
	strh	r4, [sp, #206]	@ movhi
	strh	ip, [fp, #8]	@ movhi
	ldr	r4, .L2+16
	strh	r8, [sp, #4]	@ movhi
	strh	r6, [fp, #4]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r1, sp
	add	r2, r2, #63488
	mov	r3, sl
	mov	r0, r8
	mov	lr, pc
	bx	r4
	ldr	r1, .L2+20
	mov	r3, #0
	add	r9, r9, #256
	ldrh	r2, [r9, #48]
	str	r3, [r1, #0]
	ldr	r1, .L2+24
	str	r3, [r1, #0]
	ldr	r3, .L2+28
	strh	r2, [r3, #0]	@ movhi
	add	sp, sp, #4
	add	sp, sp, #2048
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	lab07Pal
	.word	loadPalette
	.word	memset
	.word	lab07Tiles
	.word	DMANow
	.word	hOff
	.word	vOff
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldreq	r5, .L13
	ldreq	r3, [r5, #0]
	addeq	r3, r3, #1
	streq	r3, [r5, #0]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	ldrne	r5, .L13
	tst	r3, #128
	ldreq	r3, [r5, #0]
	subeq	r3, r3, #1
	streq	r3, [r5, #0]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r4, .L13+4
	ldreq	r3, [r4, #0]
	subeq	r3, r3, #1
	streq	r3, [r4, #0]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	ldrne	r4, .L13+4
	tst	r3, #32
	ldreq	r3, [r4, #0]
	addeq	r3, r3, #1
	streq	r3, [r4, #0]
	ldr	r3, .L13+8
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5, #0]
	ldrh	r2, [r4, #0]
	mov	r3, #67108864
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	vOff
	.word	hOff
	.word	waitForVBlank
	.size	game, .-game
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
	ldr	r6, .L18
	ldr	r4, .L18+4
	add	r5, r5, #256
.L16:
	bl	game
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L16
.L19:
	.align	2
.L18:
	.word	oldButtons
	.word	buttons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	hOff,4,4
	.comm	vOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
