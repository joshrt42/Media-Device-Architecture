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
	.global	makeRedBall
	.type	makeRedBall, %function
makeRedBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	sub	r0, r0, #1
	add	r0, r3, r0, asl #1
	mov	r1, #5
.L15:
	mov	r2, r0
	mov	r3, #5
.L16:
	mov	ip, #31	@ movhi
	subs	r3, r3, #1
	strh	ip, [r2, #2]!	@ movhi
	bne	.L16
	subs	r1, r1, #1
	add	r0, r0, #480
	bne	.L15
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	makeRedBall, .-makeRedBall
	.align	2
	.global	makeGreenBall
	.type	makeGreenBall, %function
makeGreenBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	sub	r0, r0, #1
	add	r0, r3, r0, asl #1
	mov	r1, #5
.L22:
	mov	r2, r0
	mov	r3, #5
.L23:
	mov	ip, #992	@ movhi
	subs	r3, r3, #1
	strh	ip, [r2, #2]!	@ movhi
	bne	.L23
	subs	r1, r1, #1
	add	r0, r0, #480
	bne	.L22
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.size	makeGreenBall, .-makeGreenBall
	.align	2
	.global	makePlayer
	.type	makePlayer, %function
makePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	rsb	r0, r0, r0, asl #4
	add	r1, r1, r0, asl #4
	ldr	r3, [r3, #0]
	sub	ip, r1, #1
	add	ip, r3, ip, asl #1
	mov	r0, #10
	mvn	r1, #32768
.L29:
	mov	r2, ip
	mov	r3, #10
.L30:
	subs	r3, r3, #1
	strh	r1, [r2, #2]!	@ movhi
	bne	.L30
	subs	r0, r0, #1
	add	ip, ip, #480
	bne	.L29
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	makePlayer, .-makePlayer
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L38
	ldr	r3, [r3, #0]
	mov	r2, #0
.L36:
	strh	r0, [r3, r2]	@ movhi
	add	r2, r2, #2
	cmp	r2, #76800
	bne	.L36
	bx	lr
.L39:
	.align	2
.L38:
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
.L41:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L41
	mov	r2, #67108864
.L43:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L43
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
	ble	.L49
	ldr	r2, [sp, #8]
	cmp	ip, r2
	bge	.L49
	ldr	r0, [sp, #4]
	rsb	r3, r3, #0
	rsb	r1, r0, r1
	cmp	r1, r3
	ble	.L50
	ldr	r0, [sp, #12]
	cmp	r1, r0
	movge	r0, #0
	movlt	r0, #1
	bx	lr
.L49:
	mov	r0, #0
	bx	lr
.L50:
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
