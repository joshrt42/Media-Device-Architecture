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
	.file	"hw01.c"
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
	.global	__aeabi_idiv
	.align	2
	.global	drawTriangle
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	subs	r7, r2, #0
	sub	sp, sp, #28
	str	r1, [sp, #20]
	ble	.L4
	mov	r6, #0
	ldr	r3, .L17
	add	r6, r6, #1
	add	r0, r0, #1
	mov	r1, #31
	sub	r2, r7, #3
	cmp	r6, r7
	str	r0, [sp, #12]
	ldr	r9, [r3, #0]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	beq	.L4
.L16:
	ldr	ip, .L17+4
	ldr	r2, .L17+8
	ldr	sl, [sp, #12]
	smull	r1, sl, ip, sl
	smull	ip, r3, r2, r6
	ldr	r1, [sp, #12]
	sub	r3, r3, r6, asr #31
	mov	r2, r1, asr #31
	rsb	sl, r2, sl, asr #6
	add	r3, r3, r3, asl #1
	rsb	r3, r3, r6
	add	sl, sl, sl, asl #2
	sub	sl, r1, sl, asl #5
	str	r3, [sp, #16]
	ldr	r3, [sp, #8]
	rsb	sl, sl, sl, asl #4
	mov	sl, sl, asl #4
	rsb	r8, r3, #0
	ldr	r4, [sp, #20]
	mov	r5, #0
	b	.L11
.L15:
	ldr	ip, [sp, #4]
	cmp	ip, r6
	add	r2, r5, #4
	ble	.L7
	cmp	r6, r2
	ble	.L7
	tst	r5, #3
	ldr	r0, [sp, #8]
	mov	r1, r7
	bne	.L10
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	ldr	ip, .L17+16
	smull	r1, r2, ip, r4
	mov	r3, r4, asr #31
	add	r2, r2, r4
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, asl #4
	mov	r0, r0, asl #16
	sub	r3, r4, r3, asl #4
	mov	r0, r0, lsr #16
	add	r3, r3, sl
	mov	r3, r3, asl #1
	add	r0, r0, r0, asl #10
	strh	r0, [r9, r3]	@ movhi
.L9:
	add	r5, r5, #1
	cmp	r5, r6
	add	r4, r4, #1
	bge	.L14
.L11:
	cmp	r5, #2
	mov	r3, r4, asr #31
	mov	r0, r8
	mov	r1, r7
	bgt	.L15
.L7:
	ldr	lr, .L17+16
	smull	ip, r2, lr, r4
	add	r2, r2, r4
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, asl #4
	ldr	r2, .L17+12
	sub	fp, r4, r3, asl #4
	mov	lr, pc
	bx	r2
	add	fp, fp, sl
	add	r0, r0, #32512
	add	r5, r5, #1
	mov	fp, fp, asl #1
	add	r0, r0, #255
	cmp	r5, r6
	strh	r0, [r9, fp]	@ movhi
	add	r4, r4, #1
	blt	.L11
.L14:
	add	r2, sp, #8
	ldmia	r2, {r2, r3}	@ phole ldm
	add	r6, r6, #1
	add	r2, r2, #31
	add	r3, r3, #1
	cmp	r6, r7
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	bne	.L16
.L4:
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L10:
	ldr	r2, [sp, #16]
	cmp	r2, #0
	ldr	r0, [sp, #8]
	mov	r1, r7
	bne	.L9
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	ldr	ip, .L17+16
	smull	r1, r2, ip, r4
	mov	r3, r4, asr #31
	add	r2, r2, r4
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r3, r4, r3, asl #4
	mov	r2, r0, asl #16
	mov	r2, r2, lsr #16
	add	r3, r3, sl
	mov	r3, r3, asl #1
	add	r2, r2, r2, asl #10
	strh	r2, [r9, r3]	@ movhi
	b	.L9
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	1717986919
	.word	1431655766
	.word	__aeabi_idiv
	.word	-2004318071
	.size	drawTriangle, .-drawTriangle
	.align	2
	.global	eraseTriangle
	.type	eraseTriangle, %function
eraseTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl}
	ble	.L19
	mov	r5, #0
	ldr	r3, .L25
	add	r5, r5, #1
	cmp	r5, r2
	ldr	r8, [r3, #0]
	ldr	sl, .L25+4
	ldr	r7, .L25+8
	beq	.L19
.L24:
	add	r3, r5, r0
	smull	r9, r4, sl, r3
	mov	ip, r3, asr #31
	rsb	ip, ip, r4, asr #6
	add	ip, ip, ip, asl #2
	sub	r3, r3, ip, asl #5
	rsb	r3, r3, r3, asl #4
	mov	r6, r3, asl #4
	mov	ip, #0
.L22:
	add	r3, ip, r1
	smull	r9, r4, r7, r3
	mov	r9, r3, asr #31
	add	r4, r4, r3
	rsb	r4, r9, r4, asr #7
	rsb	r4, r4, r4, asl #4
	sub	r3, r3, r4, asl #4
	add	r3, r3, r6
	add	ip, ip, #1
	mov	r3, r3, asl #1
	mov	r4, #0	@ movhi
	cmp	ip, r5
	strh	r4, [r8, r3]	@ movhi
	blt	.L22
	add	r5, r5, #1
	cmp	r5, r2
	bne	.L24
.L19:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	1717986919
	.word	-2004318071
	.size	eraseTriangle, .-eraseTriangle
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #1024
	add	r3, r3, #3
	mov	r2, #67108864
	sub	sp, sp, #8
	strh	r3, [r2, #0]	@ movhi
	mov	r6, #0
.L31:
	mov	r0, #30
	mov	r1, #110
	mov	r2, #60
	bl	eraseTriangle
	mov	r1, #30
	mov	r0, #45
	mov	r2, r1
	bl	drawTriangle
	mov	r5, #179200
	str	r6, [sp, #4]
	add	r5, r5, #800
.L28:
	ldr	r3, [sp, #4]
	subs	r5, r5, #1
	add	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L28
	mov	r1, #30
	mov	r2, r1
	mov	r0, #45
	bl	eraseTriangle
	mov	r0, #38
	mov	r1, #63
	mov	r2, #45
	bl	drawTriangle
	mov	r4, #179200
	str	r5, [sp, #4]
	add	r4, r4, #800
.L29:
	ldr	r3, [sp, #4]
	subs	r4, r4, #1
	add	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L29
	mov	r0, #38
	mov	r1, #63
	mov	r2, #45
	bl	eraseTriangle
	mov	r0, #30
	mov	r1, #110
	mov	r2, #60
	bl	drawTriangle
	mov	r3, #179200
	str	r4, [sp, #4]
	add	r3, r3, #800
.L30:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L30
	b	.L31
	.size	main, .-main
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r0, r0, asl #5
	add	r0, r0, r1, asl #2
	add	r0, r0, r0, asl #2
	mov	r3, #0
	mov	r1, r0, asl #5
	sub	sp, sp, #8
	cmp	r1, r3
	str	r3, [sp, #4]
	ble	.L35
.L37:
	ldr	r2, [sp, #4]
	add	r3, r3, #1
	add	r2, r2, #1
	cmp	r3, r1
	str	r2, [sp, #4]
	bne	.L37
.L35:
	add	sp, sp, #8
	bx	lr
	.size	delay, .-delay
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
