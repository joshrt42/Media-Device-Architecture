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
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	add	r2, r2, r0
	cmp	r0, r2
	ldrh	r5, [sp, #12]
	bge	.L4
	ldr	ip, .L12
	rsb	r6, r0, r0, asl #4
	add	r6, r1, r6, asl #4
	ldr	ip, [ip, #0]
	sub	r6, r6, #1
	add	r4, r3, r1
	add	r6, ip, r6, asl #1
.L6:
	cmp	r4, r1
	movgt	ip, r6
	movgt	r3, r1
	ble	.L8
.L7:
	add	r3, r3, #1
	cmp	r4, r3
	strh	r5, [ip, #2]!	@ movhi
	bgt	.L7
.L8:
	add	r0, r0, #1
	cmp	r0, r2
	add	r6, r6, #480
	blt	.L6
.L4:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, #0
.L15:
	strh	r0, [r3, r2]	@ movhi
	add	r2, r2, #2
	cmp	r2, #76800
	bne	.L15
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L20:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L20
	mov	r2, #67108864
.L22:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L22
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #0]
	rsb	r2, r2, #0
	rsb	ip, ip, r0
	cmp	ip, r2
	ble	.L28
	ldr	r2, [sp, #8]
	cmp	ip, r2
	bge	.L28
	ldr	r0, [sp, #4]
	rsb	r3, r3, #0
	rsb	r1, r0, r1
	cmp	r1, r3
	ble	.L29
	ldr	r0, [sp, #12]
	cmp	r1, r0
	movge	r0, #0
	movlt	r0, #1
	bx	lr
.L28:
	mov	r0, #0
	bx	lr
.L29:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
