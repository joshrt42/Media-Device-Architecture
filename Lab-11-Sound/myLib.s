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
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	cmp	r2, #0
	sub	sp, sp, #12
	ble	.L4
	ldr	ip, .L9
	rsb	r0, r0, r0, asl #4
	ldr	r4, [ip, #4]
	ldr	ip, [ip, #0]
	add	r1, r1, r0, asl #4
	add	r1, ip, r1, asl #1
	add	r0, r4, #36
	mov	ip, #0
	orr	r4, r3, #-2130706432
	add	r3, sp, #6
.L6:
	add	ip, ip, #1
	cmp	ip, r2
	str	r3, [r0, #0]
	str	r1, [r0, #4]
	str	r4, [r0, #8]
	add	r1, r1, #480
	bne	.L6
.L4:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L11
	ldr	r5, .L15
	rsb	r1, r1, r1, asl #4
	ldmia	r5, {r6, ip}	@ phole ldm
	add	r1, r2, r1, asl #4
	orr	r5, r4, #-2147483648
	add	ip, ip, #36
	mov	r4, r4, asl #1
	add	r1, r6, r1, asl #1
	mov	r2, #0
.L13:
	add	r2, r2, #1
	cmp	r2, r3
	str	r0, [ip, #0]
	str	r1, [ip, #4]
	add	r0, r0, r4
	str	r5, [ip, #8]
	add	r1, r1, #480
	bne	.L13
.L11:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L18
	sub	sp, sp, #8
	add	r3, sp, #8
	ldr	r2, [r1, #4]
	strh	r0, [r3, #-2]!	@ movhi
	ldr	ip, [r1, #0]
	mov	r1, #-2130706432
	add	r0, r2, #36
	add	r1, r1, #38400
	str	r3, [r2, #36]
	str	ip, [r0, #4]
	str	r1, [r0, #8]
	add	sp, sp, #8
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	mov	r3, r0, asl #3
	ldr	r0, .L23
	add	ip, r1, r1, lsr #31
	add	r3, r3, ip, asr #1
	ldr	ip, [r0, #0]
	mov	r3, r3, asl #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	andne	r1, r1, #255
	biceq	r1, r1, #255
	orrne	r2, r1, r2, asl #8
	orreq	r2, r2, r1
	strneh	r2, [ip, r3]	@ movhi
	streqh	r2, [ip, r3]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldrb	r4, [sp, #72]	@ zero_extendqisi2
	cmp	r2, #0
	str	r2, [sp, #0]
	orr	r2, r4, r4, asl #8
	str	r4, [sp, #8]
	str	r1, [sp, #12]
	strh	r2, [sp, #30]	@ movhi
	ble	.L25
	ldr	r4, [sp, #12]
	add	r8, r1, #1
	rsb	r5, r0, r0, asl #4
	add	ip, r3, r3, lsr #31
	add	r2, r1, r1, lsr #31
	mov	r5, r5, asl #3
	mov	ip, ip, asr #1
	add	r8, r8, r8, lsr #31
	add	r8, r5, r8, asr #1
	sub	r1, ip, #1
	add	r5, r5, r2, asr #1
	sub	r2, r4, #1
	mov	r8, r8, asl #1
	orr	ip, ip, #-2130706432
	orr	r1, r1, #-2130706432
	add	r2, r2, r3
	and	r9, r4, #1
	ldr	sl, .L33
	str	ip, [sp, #4]
	str	r1, [sp, #20]
	mov	r6, r0
	mov	r5, r5, asl #1
	mov	r7, r8
	mov	r4, #0
	and	fp, r3, #1
	str	r2, [sp, #16]
	b	.L30
.L27:
	ldmia	sl, {r1, r2}	@ phole ldm
	ldr	r0, [sp, #4]
	add	r3, r2, #36
	add	r1, r1, r5
	add	ip, sp, #30
	cmp	fp, #0
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	str	r0, [r3, #8]
	bne	.L32
.L29:
	ldr	r1, [sp, #0]
	add	r4, r4, #1
	cmp	r1, r4
	add	r8, r8, #240
	add	r6, r6, #1
	add	r5, r5, #240
	add	r7, r7, #240
	ble	.L25
.L30:
	cmp	r9, #0
	beq	.L27
	mov	r0, r6
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #8]
	bl	setPixel4
	cmp	fp, #0
	beq	.L28
	ldmia	sl, {r1, r2}	@ phole ldm
	add	r1, r1, r7
	add	r3, r2, #36
	add	ip, sp, #30
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	ldr	r1, [sp, #0]
	ldr	r0, [sp, #4]
	add	r4, r4, #1
	cmp	r1, r4
	str	r0, [r3, #8]
	add	r8, r8, #240
	add	r6, r6, #1
	add	r5, r5, #240
	add	r7, r7, #240
	bgt	.L30
.L25:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L32:
	mov	r0, r6
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	bl	setPixel4
	b	.L29
.L28:
	ldr	r1, [sl, #4]
	ldr	r2, [sl, #0]
	add	r3, r1, #36
	add	r2, r2, r8
	add	ip, sp, #30
	str	ip, [r1, #36]
	str	r2, [r3, #4]
	ldr	r2, [sp, #20]
	mov	r0, r6
	str	r2, [r3, #8]
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	bl	setPixel4
	b	.L29
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L36
	sub	sp, sp, #8
	add	r3, sp, #8
	ldr	r2, [r1, #4]
	orr	r0, r0, r0, asl #8
	strh	r0, [r3, #-2]!	@ movhi
	ldr	ip, [r1, #0]
	mov	r1, #-2130706432
	add	r0, r2, #36
	add	r1, r1, #19200
	str	r3, [r2, #36]
	str	ip, [r0, #4]
	str	r1, [r0, #8]
	add	sp, sp, #8
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L39
	str	r4, [sp, #-4]!
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L42:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L42
	mov	r2, #67108864
.L44:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L44
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	ldrne	r1, .L50
	ldreq	r1, .L50
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #0]
	streq	r0, [r1, #0]
	bx	lr
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
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
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
