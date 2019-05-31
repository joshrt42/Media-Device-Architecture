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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	add	r0, r0, r0, lsr #31
	mov	r0, r0, asl #15
	tst	r1, #1
	mov	r0, r0, lsr #16
	bne	.L5
	ldr	r3, .L6
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	ldrh	r1, [r3, r0]
	bic	r1, r1, #255
	orr	r2, r2, r1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L5:
	ldr	r3, .L6
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	ldrb	r1, [r3, r0]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #8
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L9:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L9
	mov	r2, #67108864
.L11:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L11
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3, #0]
	tst	r3, #16
	movne	r2, #100663296
	ldreq	r2, .L17
	ldrne	r1, .L17
	addne	r2, r2, #40960
	moveq	r1, #100663296
	strne	r2, [r1, #0]
	streq	r1, [r2, #0]
	eor	r3, r3, #16
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L20
	stmfd	sp!, {r4, r5}
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	mov	r5, #0
	str	r5, [r4, #8]
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	mov	r2, #83886080
	mov	r0, #3
	mov	r3, #256
	b	DMANow
	.size	loadPalette, .-loadPalette
	.align	2
	.global	drawFullScreenImage
	.type	drawFullScreenImage, %function
drawFullScreenImage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	ldr	r2, [r3, #0]
	mov	r1, r0
	mov	r3, #19200
	mov	r0, #3
	b	DMANow
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.size	drawFullScreenImage, .-drawFullScreenImage
	.align	2
	.global	drawImage
	.type	drawImage, %function
drawImage:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	r1, r1, r1, lsr #31
	subs	sl, r2, #0
	mov	r8, r3
	ldr	fp, [sp, #40]
	bic	r1, r1, #1
	ble	.L26
	add	r9, r3, r3, lsr #31
	rsb	r0, r0, r0, asl #4
	mov	r4, #0
	ldr	r7, .L30
	mov	r9, r9, asr #1
	add	r5, r1, r0, asl #4
	mov	r6, r4
.L28:
	add	r1, r4, r4, lsr #31
	add	r3, r5, r5, lsr #31
	ldr	r2, [r7, #0]
	bic	r3, r3, #1
	bic	r1, r1, #1
	add	r2, r2, r3
	mov	r0, #3
	add	r1, fp, r1
	mov	r3, r9
	add	r6, r6, #1
	bl	DMANow
	cmp	sl, r6
	add	r4, r4, r8
	add	r5, r5, #240
	bgt	.L28
.L26:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.size	drawImage, .-drawImage
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	add	r1, sp, #16
	orr	r3, r3, r2, asl #8
	ldr	r2, .L33
	strh	r3, [r1, #-2]!	@ movhi
	mov	r3, #16777216
	mov	r0, #3
	ldr	r2, [r2, #0]
	add	r3, r3, #19200
	bl	DMANow
	add	sp, sp, #20
	ldr	lr, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	ldrb	r4, [sp, #56]	@ zero_extendqisi2
	ldrb	ip, [sp, #56]	@ zero_extendqisi2
	ands	r6, r1, #1
	orr	ip, ip, r4, asl #8
	mov	sl, r1
	mov	r8, r0
	mov	r5, r2
	mov	r4, r3
	strh	ip, [sp, #14]	@ movhi
	beq	.L36
	ands	r6, r3, #1
	beq	.L53
	cmp	r2, #0
	ble	.L35
	rsb	r7, r0, r0, asl #4
	mov	fp, r3, asr #1
	add	r7, r1, r7, asl #4
	ldr	r9, .L55
	orr	fp, fp, #16777216
	add	r7, r7, #1
	mov	r6, #0
.L41:
	add	r0, r6, r8
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r1, sl
	bl	setPixel
	add	r2, r7, r7, lsr #31
	cmp	r4, #1
	add	r6, r6, #1
	bic	r2, r2, #1
	mov	r0, #3
	add	r1, sp, #14
	mov	r3, fp
	ldrgt	ip, [r9, #0]
	addgt	r2, ip, r2
	blgt	DMANow
.L40:
	cmp	r5, r6
	add	r7, r7, #240
	bgt	.L41
.L35:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L36:
	ands	r3, r3, #1
	beq	.L54
	cmp	r2, #0
	ble	.L35
	mov	r3, r4, asr #1
	orr	r3, r3, #16777216
	sub	fp, r1, #1
	rsb	r7, r0, r0, asl #4
	ldr	r9, .L55
	str	r3, [sp, #4]
	add	fp, fp, r4
	add	r7, r1, r7, asl #4
	add	sl, sp, #14
.L47:
	add	r0, r6, r8
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r1, fp
	bl	setPixel
	add	r2, r7, r7, lsr #31
	cmp	r4, #1
	add	r6, r6, #1
	bic	r2, r2, #1
	mov	r0, #3
	mov	r1, sl
	ldr	r3, [sp, #4]
	ldrgt	ip, [r9, #0]
	addgt	r2, ip, r2
	blgt	DMANow
.L46:
	cmp	r5, r6
	add	r7, r7, #240
	bgt	.L47
	b	.L35
.L54:
	cmp	r2, #0
	ble	.L35
	add	r4, r4, r4, lsr #31
	mov	r9, r4, asr #1
	rsb	r8, r0, r0, asl #4
	ldr	r6, .L55
	orr	r9, r9, #16777216
	add	sl, r1, r8, asl #4
	mov	r4, r3
	add	r7, sp, #14
.L48:
	add	r3, sl, sl, lsr #31
	ldr	r2, [r6, #0]
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	mov	r1, r7
	mov	r3, r9
	add	r4, r4, #1
	bl	DMANow
	cmp	r5, r4
	add	sl, sl, #240
	bgt	.L48
	b	.L35
.L53:
	cmp	r2, #0
	ble	.L35
	sub	r3, r3, #1
	rsb	r9, r0, r0, asl #4
	mov	r3, r3, asr #1
	sub	fp, r1, #1
	add	r9, r1, r9, asl #4
	orr	r3, r3, #16777216
	add	fp, fp, r4
	str	r3, [sp, #4]
	add	r9, r9, #1
	b	.L43
.L42:
	cmp	r5, r6
	add	r9, r9, #240
	ble	.L35
.L43:
	add	r7, r6, r8
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r0, r7
	mov	r1, sl
	bl	setPixel
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r0, r7
	mov	r1, fp
	bl	setPixel
	cmp	r4, #2
	add	r6, r6, #1
	ble	.L42
	ldr	r1, .L55
	add	r3, r9, r9, lsr #31
	ldr	r2, [r1, #0]
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	add	r1, sp, #14
	ldr	r3, [sp, #4]
	bl	DMANow
	b	.L42
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	ip, [sp, #8]
	ldr	r5, [sp, #16]
	sub	r4, ip, #1
	add	r4, r4, r5
	cmp	r4, r0
	ldr	r4, [sp, #12]
	ble	.L61
	sub	r0, r0, #1
	add	r2, r0, r2
	cmp	ip, r2
	blt	.L62
.L61:
	mov	r0, #0
.L58:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L62:
	ldr	r2, [sp, #20]
	sub	r0, r4, #1
	add	r2, r0, r2
	cmp	r2, r1
	ble	.L61
	sub	r0, r1, #1
	add	r0, r0, r3
	cmp	r4, r0
	movge	r0, #0
	movlt	r0, #1
	b	.L58
	.size	collision, .-collision
	.align	2
	.global	refreshGame
	.type	refreshGame, %function
refreshGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L65
	ldrh	r2, [r4, #8]
	ldr	ip, [r4, #0]
	add	r2, r2, #5760
	mov	r2, r2, asr #1
	mov	r3, #12928
	add	r3, r3, #32
	mov	r0, #3
	ldr	r1, .L65+4
	add	r2, ip, r2, asl #1
	bl	DMANow
	ldrh	r3, [r4, #8]
	sub	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #8]	@ movhi
	ldrh	r3, [r4, #8]
	cmp	r3, #0
	moveq	r3, #240	@ movhi
	streqh	r3, [r4, #8]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
	.word	refresherBitmap
	.size	refreshGame, .-refreshGame
	.global	count
	.global	videoBuffer
	.global	dma
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	count, %object
	.size	count, 2
count:
	.short	240
	.ident	"GCC: (devkitARM release 31) 4.5.0"
