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
	mov	r1, #67108864
	mov	r2, #1024
	add	r0, r1, #256
	add	r2, r2, #3
	stmfd	sp!, {r3, lr}
	ldrh	ip, [r0, #48]
	strh	r2, [r1, #0]	@ movhi
	ldr	r2, .L2
	strh	ip, [r2, #0]	@ movhi
	ldr	r2, .L2+4
	mov	r1, #0	@ movhi
	strh	r1, [r2, #0]	@ movhi
	mov	r3, #32512
	ldr	r2, .L2+8
	add	r3, r3, #224
	mov	r0, r3
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L2+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L2+16
	mov	r1, #20
	str	r1, [r0, #0]
	ldr	r0, .L2+20
	str	r1, [r0, #0]
	ldr	r0, .L2+24
	str	r1, [r0, #0]
	ldr	r0, .L2+28
	str	r1, [r0, #0]
	ldr	r1, .L2+32
	mov	r3, #1
	str	r3, [r1, #0]
	ldr	r1, .L2+36
	str	r3, [r1, #0]
	ldr	r1, .L2+40
	mov	r0, #19
	str	r0, [r1, #0]
	ldr	r1, .L2+44
	mov	r0, #15
	str	r0, [r1, #0]
	ldr	r1, .L2+48
	mov	r2, #120
	str	r2, [r1, #0]
	ldr	r1, .L2+52
	str	r2, [r1, #0]
	ldr	r1, .L2+56
	str	r2, [r1, #0]
	ldr	r1, .L2+60
	str	r2, [r1, #0]
	ldr	r2, .L2+64
	str	r3, [r2, #0]
	ldr	r2, .L2+68
	str	r3, [r2, #0]
	ldr	r3, .L2+72
	mov	r2, #17
	str	r2, [r3, #0]
	ldr	r3, .L2+76
	mov	r2, #10
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	buttons
	.word	oldButtons
	.word	bgColor
	.word	fillScreen
	.word	gRow
	.word	gCol
	.word	gOldRow
	.word	gOldCol
	.word	gRDel
	.word	gCDel
	.word	gHeight
	.word	gWidth
	.word	bRow
	.word	bCol
	.word	bOldRow
	.word	bOldCol
	.word	bRDel
	.word	bCDel
	.word	bHeight
	.word	bWidth
	.size	initialize, .-initialize
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r3, .L34
	sub	sp, sp, #16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L5
	ldr	r3, .L34+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L33
.L5:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldrne	ip, .L34+8
	bne	.L8
	ldr	ip, .L34+8
	ldr	r3, [ip, #0]
	cmp	r3, #0
	ldrgt	r2, .L34+12
	ldrgt	r2, [r2, #0]
	rsbgt	r3, r2, r3
	strgt	r3, [ip, #0]
.L8:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldrne	r8, .L34+16
	bne	.L9
	ldr	r8, .L34+16
	ldr	r2, [r8, #0]
	ldr	r3, [ip, #0]
	rsb	r2, r2, #160
	cmp	r2, r3
	ldrgt	r2, .L34+12
	ldrgt	r2, [r2, #0]
	addgt	r3, r2, r3
	ldrgt	r2, .L34+8
	strgt	r3, [r2, #0]
.L9:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldrne	r9, .L34+20
	bne	.L10
	ldr	r9, .L34+20
	ldr	r3, [r9, #0]
	cmp	r3, #0
	ldrgt	r2, .L34+24
	ldrgt	r2, [r2, #0]
	rsbgt	r3, r2, r3
	strgt	r3, [r9, #0]
.L10:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldrne	sl, .L34+28
	bne	.L11
	ldr	sl, .L34+28
	ldr	r2, [sl, #0]
	ldr	r3, [r9, #0]
	rsb	r2, r2, #240
	cmp	r2, r3
	ldrgt	r2, .L34+24
	ldrgt	r2, [r2, #0]
	addgt	r3, r2, r3
	ldrgt	r2, .L34+20
	strgt	r3, [r2, #0]
.L11:
	ldr	r4, .L34+32
	ldr	r0, [r4, #0]
	cmp	r0, #0
	ldrle	r2, .L34+36
	ble	.L12
	ldr	r2, .L34+36
	ldr	r3, [r2, #0]
	add	r3, r0, r3
	cmp	r3, #159
	ldrle	r6, .L34+40
	bgt	.L12
.L13:
	ldr	r7, .L34+44
	ldr	r1, [r7, #0]
	cmp	r1, #0
	ldrle	r3, .L34+48
	ble	.L14
	ldr	r3, .L34+48
	ldr	lr, [r3, #0]
	add	lr, r1, lr
	cmp	lr, #239
	ldrle	r5, .L34+52
	bgt	.L14
.L15:
	ldr	lr, [ip, #0]
	ldr	r8, [r8, #0]
	ldr	sl, [sl, #0]
	ldr	ip, [r9, #0]
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	str	ip, [sp, #4]
	str	lr, [sp, #0]
	str	r8, [sp, #8]
	str	sl, [sp, #12]
	ldr	ip, .L34+56
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldrne	r2, [r6, #0]
	ldrne	r3, [r5, #0]
	ldr	r0, [r4, #0]
	ldr	r1, [r7, #0]
	ldreq	r2, [r6, #0]
	ldreq	r3, [r5, #0]
	rsbne	r2, r2, #0
	rsbne	r3, r3, #0
	strne	r2, [r6, #0]
	strne	r3, [r5, #0]
	add	r2, r2, r0
	add	r3, r3, r1
	str	r2, [r4, #0]
	str	r3, [r7, #0]
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L14:
	ldr	r5, .L34+52
	ldr	lr, [r5, #0]
	rsb	lr, lr, #0
	str	lr, [r5, #0]
	b	.L15
.L12:
	ldr	r6, .L34+40
	ldr	r3, [r6, #0]
	rsb	r3, r3, #0
	str	r3, [r6, #0]
	b	.L13
.L33:
	ldr	r3, .L34+60
	mov	r0, #32512
	ldrh	r2, [r3, #0]
	add	r0, r0, #224
	cmp	r2, r0
	moveq	r0, #1020
	mvneq	r2, #64512
	streqh	r2, [r3, #0]	@ movhi
	strneh	r0, [r3, #0]	@ movhi
	addeq	r0, r0, #3
	ldr	r3, .L34+64
	mov	lr, pc
	bx	r3
	b	.L5
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	bRow
	.word	bRDel
	.word	bHeight
	.word	bCol
	.word	bCDel
	.word	bWidth
	.word	gRow
	.word	gHeight
	.word	gRDel
	.word	gCol
	.word	gWidth
	.word	gCDel
	.word	collision
	.word	bgColor
	.word	fillScreen
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r6, .L37
	ldr	ip, .L37+4
	ldr	r5, .L37+8
	ldr	r8, .L37+12
	ldr	fp, .L37+16
	sub	sp, sp, #20
	ldrh	lr, [r6, #0]
	ldr	r1, [ip, #0]
	ldr	r2, [r5, #0]
	ldr	r3, [r8, #0]
	ldr	r0, [fp, #0]
	ldr	r4, .L37+20
	str	ip, [sp, #12]
	ldr	sl, .L37+24
	ldr	r9, .L37+28
	str	lr, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r1, .L37+32
	ldr	r2, .L37+36
	ldrh	lr, [r6, #0]
	ldr	r0, [r1, #0]
	ldr	r3, [r9, #0]
	ldr	r1, [r2, #0]
	ldr	r7, .L37+40
	ldr	r2, [sl, #0]
	ldr	r6, .L37+44
	str	lr, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r2, [r5, #0]
	ldr	r3, [r8, #0]
	ldr	r5, .L37+48
	ldr	r8, .L37+52
	ldr	r1, [r6, #0]
	mov	lr, #992
	ldr	r0, [r7, #0]
	str	lr, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r0, [r5, #0]
	ldr	r1, [r8, #0]
	ldr	r2, [sl, #0]
	ldr	r3, [r9, #0]
	mov	lr, #31744
	str	lr, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	ip, [sp, #12]
	ldr	r1, [r6, #0]
	ldr	r2, [r5, #0]
	str	r1, [ip, #0]
	ldr	r1, .L37+32
	ldr	r0, [r7, #0]
	ldr	r3, [r8, #0]
	str	r2, [r1, #0]
	ldr	r2, .L37+36
	str	r0, [fp, #0]
	str	r3, [r2, #0]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	bgColor
	.word	gOldCol
	.word	gHeight
	.word	gWidth
	.word	gOldRow
	.word	drawRect
	.word	bHeight
	.word	bWidth
	.word	bOldRow
	.word	bOldCol
	.word	gRow
	.word	gCol
	.word	bRow
	.word	bCol
	.size	draw, .-draw
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r7, .L41
	ldr	r4, .L41+4
	ldr	r6, .L41+8
	add	r5, r5, #256
.L40:
	ldrh	r3, [r4, #0]
	strh	r3, [r7, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	bl	update
	mov	lr, pc
	bx	r6
	bl	draw
	b	.L40
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	bgColor,2,2
	.comm	gRow,4,4
	.comm	gCol,4,4
	.comm	gOldRow,4,4
	.comm	gOldCol,4,4
	.comm	gRDel,4,4
	.comm	gCDel,4,4
	.comm	gHeight,4,4
	.comm	gWidth,4,4
	.comm	bRow,4,4
	.comm	bCol,4,4
	.comm	bOldRow,4,4
	.comm	bOldCol,4,4
	.comm	bRDel,4,4
	.comm	bCDel,4,4
	.comm	bHeight,4,4
	.comm	bWidth,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
