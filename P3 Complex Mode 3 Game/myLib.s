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
	.size	setPixel, .-setPixel
	.align	2
	.global	drawImage
	.type	drawImage, %function
drawImage:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6}
	ble	.L4
	ldr	r4, .L9
	rsb	r0, r0, r0, asl #4
	ldmia	r4, {r4, ip}	@ phole ldm
	add	r1, r1, r0, asl #4
	orr	r6, r3, #-2147483648
	mov	r0, #0
	mov	r5, r3, asl #1
	ldr	r3, [sp, #12]
	add	r1, r4, r1, asl #1
	add	ip, ip, #36
	mov	r4, r0
.L6:
	add	r0, r0, #1
	cmp	r0, r2
	str	r4, [ip, #8]
	str	r3, [ip, #0]
	str	r1, [ip, #4]
	add	r3, r3, r5
	str	r6, [ip, #8]
	add	r1, r1, #480
	bne	.L6
.L4:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	drawImage, .-drawImage
	.align	2
	.global	drawImageHFlip
	.type	drawImageHFlip, %function
drawImageHFlip:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6, r7}
	ble	.L11
	ldr	r4, .L15
	rsb	r0, r0, r0, asl #4
	ldr	ip, [r4, #4]
	orr	r6, r3, #-2147483648
	ldr	r4, [r4, #0]
	sub	r7, r3, #1
	mov	r5, r3, asl #1
	ldr	r3, [sp, #16]
	add	r1, r1, r0, asl #4
	mov	r0, #0
	add	r1, r4, r1, asl #1
	add	ip, ip, #36
	orr	r6, r6, #8388608
	add	r3, r3, r7, asl #1
	mov	r4, r0
.L13:
	add	r0, r0, #1
	cmp	r0, r2
	str	r4, [ip, #8]
	str	r3, [ip, #0]
	str	r1, [ip, #4]
	add	r3, r3, r5
	str	r6, [ip, #8]
	add	r1, r1, #480
	bne	.L13
.L11:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	drawImageHFlip, .-drawImageHFlip
	.align	2
	.global	drawFullScreenImage
	.type	drawFullScreenImage, %function
drawFullScreenImage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L18
	str	r4, [sp, #-4]!
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #0]
	mov	r2, #-2147483648
	add	r3, r1, #36
	add	r2, r2, #38400
	mov	r4, #0
	str	r4, [r3, #8]
	str	r0, [r1, #36]
	str	ip, [r3, #4]
	str	r2, [r3, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	drawFullScreenImage, .-drawFullScreenImage
	.align	2
	.global	drawGameBG
	.type	drawGameBG, %function
drawGameBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L21
	str	r4, [sp, #-4]!
	mov	r3, #-2147483648
	ldr	r1, [r2, #4]
	ldr	ip, [r2, #0]
	add	r3, r3, #33536
	add	r2, r1, #36
	add	r3, r3, #64
	mov	r4, #0
	str	r4, [r2, #8]
	str	r0, [r1, #36]
	str	ip, [r2, #4]
	str	r3, [r2, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	drawGameBG, .-drawGameBG
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L24:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L24
	mov	r2, #67108864
.L26:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L26
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L30
	stmfd	sp!, {r4, r5}
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2130706432
	mov	r5, #0
	str	r5, [r4, #8]
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L33
	sub	sp, sp, #12
	add	r1, sp, #8
	strh	r0, [r1, #-2]!	@ movhi
	ldr	r2, [r3, #0]
	mov	r0, #3
	mov	r3, #38400
	bl	DMANow
	add	sp, sp, #12
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
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #12
	ldrh	ip, [sp, #40]
	subs	r8, r2, #0
	mov	r6, r3
	strh	ip, [sp, #6]	@ movhi
	ble	.L35
	rsb	r0, r0, r0, asl #4
	add	r5, r1, r0, asl #4
	ldr	r7, .L39
	mov	r5, r5, asl #1
	mov	r4, #0
	add	sl, sp, #6
.L37:
	ldr	r2, [r7, #0]
	mov	r0, #3
	add	r2, r2, r5
	mov	r1, sl
	mov	r3, r6
	add	r4, r4, #1
	bl	DMANow
	cmp	r8, r4
	add	r5, r5, #480
	bgt	.L37
.L35:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L40:
	.align	2
.L39:
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
	ble	.L45
	sub	r0, r0, #1
	add	r2, r0, r2
	cmp	ip, r2
	blt	.L46
.L45:
	mov	r0, #0
.L42:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L46:
	ldr	r2, [sp, #20]
	sub	r0, r4, #1
	add	r2, r0, r2
	cmp	r2, r1
	ble	.L45
	sub	r0, r1, #1
	add	r0, r0, r3
	cmp	r4, r0
	movge	r0, #0
	movlt	r0, #1
	b	.L42
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
