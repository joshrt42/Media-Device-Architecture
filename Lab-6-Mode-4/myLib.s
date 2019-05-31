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
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	tst	r1, #1
	bne	.L8
	rsb	r0, r0, r0, asl #4
	ldr	r3, .L9
	mov	r0, r0, asl #3
	add	r1, r1, r1, lsr #31
	ldr	r3, [r3, #0]
	add	r1, r0, r1, asr #1
	mov	r1, r1, asl #1
	ldrh	r0, [r3, r1]
	bic	r0, r0, #255
	orr	r2, r2, r0
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L8:
	rsb	r0, r0, r0, asl #4
	ldr	r3, .L9
	mov	r0, r0, asl #3
	add	r1, r1, r1, lsr #31
	ldr	r3, [r3, #0]
	add	r1, r0, r1, asr #1
	mov	r1, r1, asl #1
	ldrb	r0, [r3, r1]	@ zero_extendqisi2
	orr	r2, r0, r2, asl #8
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawRect4, .-drawRect4
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L13:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L13
	mov	r2, #67108864
.L15:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L15
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
	ldreq	r2, .L21
	ldrne	r1, .L21
	addne	r2, r2, #40960
	moveq	r1, #100663296
	strne	r2, [r1, #0]
	streq	r1, [r2, #0]
	eor	r3, r3, #16
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bx	lr
.L22:
	.align	2
.L21:
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
	ldr	ip, .L24
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
.L25:
	.align	2
.L24:
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
	.global	drawFullscreenImage4
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L28
	ldr	r2, [r3, #0]
	mov	r1, r0
	mov	r3, #19200
	mov	r0, #3
	b	DMANow
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	drawFullscreenImage3
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L31
	ldr	r2, [r3, #0]
	mov	r1, r0
	mov	r3, #38400
	mov	r0, #3
	b	DMANow
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mul	r3, r2, r3
	add	r1, r1, r1, lsr #31
	ldr	r2, .L34
	rsb	r0, r0, r0, asl #4
	bic	r1, r1, #1
	add	r1, r1, r0, asl #4
	ldr	r2, [r2, #0]
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	ldr	r1, [sp, #0]
	mov	r0, #3
	mov	r2, r2, lsr #1
	b	DMANow
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	subs	sl, r2, #0
	mov	r8, r3
	ble	.L36
	rsb	r0, r0, r0, asl #4
	add	r6, r1, r0, asl #4
	ldr	r7, .L40
	ldr	r5, [sp, #32]
	mov	r6, r6, asl #1
	mov	r9, r3, asl #1
	mov	r4, #0
.L38:
	ldr	r2, [r7, #0]
	mov	r1, r5
	add	r2, r2, r6
	mov	r0, #3
	mov	r3, r8
	add	r4, r4, #1
	bl	DMANow
	cmp	sl, r4
	add	r6, r6, #480
	add	r5, r5, r9
	bgt	.L38
.L36:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
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
	ldr	r2, .L43
	strh	r3, [r1, #-2]!	@ movhi
	mov	r3, #16777216
	mov	r0, #3
	ldr	r2, [r2, #0]
	add	r3, r3, #38400
	bl	DMANow
	add	sp, sp, #20
	ldr	lr, [sp], #4
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r2, .L46
	sub	sp, sp, #12
	add	r1, sp, #8
	mov	r3, #16777216
	strh	r0, [r1, #-2]!	@ movhi
	ldr	r2, [r2, #0]
	mov	r0, #3
	add	r3, r3, #38400
	bl	DMANow
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L47:
	.align	2
.L46:
	.word	.LANCHOR0
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	subs	r8, r2, #0
	ble	.L48
	rsb	r0, r0, r0, asl #4
	add	r5, r1, r0, asl #4
	ldr	r7, .L52
	orr	sl, r3, #16777216
	mov	r5, r5, asl #1
	mov	r4, #0
	add	r6, sp, #32
.L50:
	ldr	r2, [r7, #0]
	mov	r0, #3
	add	r2, r2, r5
	mov	r1, r6
	mov	r3, sl
	add	r4, r4, #1
	bl	DMANow
	cmp	r8, r4
	add	r5, r5, #480
	bgt	.L50
.L48:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
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
	ble	.L58
	sub	r0, r0, #1
	add	r2, r0, r2
	cmp	ip, r2
	blt	.L59
.L58:
	mov	r0, #0
.L55:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L59:
	ldr	r2, [sp, #20]
	sub	r0, r4, #1
	add	r2, r0, r2
	cmp	r2, r1
	ble	.L58
	sub	r0, r1, #1
	add	r0, r0, r3
	cmp	r4, r0
	movge	r0, #0
	movlt	r0, #1
	b	.L55
	.size	collision, .-collision
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
	.ident	"GCC: (devkitARM release 31) 4.5.0"
