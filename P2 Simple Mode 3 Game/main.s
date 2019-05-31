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
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldrh	ip, [r0, #48]
	strh	r2, [r1, #0]	@ movhi
	ldr	r2, .L2
	strh	ip, [r2, #0]	@ movhi
	ldr	r2, .L2+4
	mov	r3, #0
	strh	r3, [r2, #0]	@ movhi
	ldr	r2, .L2+8
	mov	r0, r3
	strh	r3, [r2, #0]	@ movhi
	ldr	r7, .L2+12
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	mov	r3, #20
	str	r3, [r7, #0]
	ldr	r7, .L2+20
	str	r3, [r7, #0]
	ldr	r7, .L2+24
	str	r3, [r7, #0]
	ldr	r7, .L2+28
	str	r3, [r7, #0]
	ldr	r7, .L2+32
	mov	r1, #2
	str	r1, [r7, #0]
	ldr	r7, .L2+36
	mov	r6, #3
	str	r6, [r7, #0]
	ldr	r7, .L2+40
	mov	ip, #135
	str	ip, [r7, #0]
	ldr	r7, .L2+44
	str	r3, [r7, #0]
	ldr	r7, .L2+48
	str	r3, [r7, #0]
	ldr	r7, .L2+52
	str	r3, [r7, #0]
	ldr	r7, .L2+56
	str	r6, [r7, #0]
	ldr	r6, .L2+60
	str	r1, [r6, #0]
	ldr	r6, .L2+64
	str	r3, [r6, #0]
	ldr	r6, .L2+68
	mov	r0, #215
	str	r0, [r6, #0]
	ldr	r6, .L2+72
	str	r3, [r6, #0]
	ldr	r6, .L2+76
	str	r3, [r6, #0]
	ldr	r3, .L2+80
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L2+84
	str	r1, [r3, #0]
	ldr	r3, .L2+88
	str	ip, [r3, #0]
	ldr	r3, .L2+92
	str	r0, [r3, #0]
	ldr	r3, .L2+96
	str	ip, [r3, #0]
	ldr	r3, .L2+100
	str	r0, [r3, #0]
	ldr	r3, .L2+104
	str	r1, [r3, #0]
	ldr	r3, .L2+108
	str	r2, [r3, #0]
	ldr	r3, .L2+112
	mov	r5, #75
	str	r5, [r3, #0]
	ldr	r3, .L2+116
	mov	r4, #115
	str	r4, [r3, #0]
	ldr	r3, .L2+120
	str	r5, [r3, #0]
	ldr	r3, .L2+124
	str	r4, [r3, #0]
	ldr	r3, .L2+128
	str	r2, [r3, #0]
	ldr	r3, .L2+132
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	buttons
	.word	oldButtons
	.word	bgColor
	.word	rb1Row
	.word	fillScreen
	.word	rb1Col
	.word	rb1OldRow
	.word	rb1OldCol
	.word	rb1CDel
	.word	rb1RDel
	.word	rb2Row
	.word	rb2Col
	.word	rb2OldRow
	.word	rb2OldCol
	.word	rb2CDel
	.word	rb2RDel
	.word	rb3Row
	.word	rb3Col
	.word	rb3OldRow
	.word	rb3OldCol
	.word	rb3CDel
	.word	rb3RDel
	.word	gbRow
	.word	gbCol
	.word	gbOldRow
	.word	gbOldCol
	.word	gbRDel
	.word	gbCDel
	.word	playerRow
	.word	playerCol
	.word	playerOldRow
	.word	playerOldCol
	.word	playerRDel
	.word	playerCDel
	.size	initialize, .-initialize
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r3, #67108864
	add	r3, r3, #256
	sub	sp, sp, #68
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldrne	r2, .L46
	bne	.L5
	ldr	r2, .L46
	ldr	r3, [r2, #0]
	cmp	r3, #0
	ldrgt	r1, .L46+4
	ldrgt	r1, [r1, #0]
	rsbgt	r3, r1, r3
	strgt	r3, [r2, #0]
.L5:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L6
	ldr	r3, [r2, #0]
	cmp	r3, #149
	ldrle	r1, .L46+4
	ldrle	r1, [r1, #0]
	addle	r3, r1, r3
	ldrle	r1, .L46
	strle	r3, [r1, #0]
.L6:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldrne	r3, .L46+8
	bne	.L7
	ldr	r3, .L46+8
	ldr	r1, [r3, #0]
	cmp	r1, #0
	ldrgt	r0, .L46+12
	ldrgt	r0, [r0, #0]
	rsbgt	r1, r0, r1
	strgt	r1, [r3, #0]
.L7:
	mov	r1, #67108864
	add	r1, r1, #256
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L8
	ldr	r1, [r3, #0]
	cmp	r1, #229
	ldrle	r0, .L46+12
	ldrle	r0, [r0, #0]
	addle	r1, r0, r1
	ldrle	r0, .L46+8
	strle	r1, [r0, #0]
.L8:
	ldr	r1, .L46+16
	ldr	r0, [r1, #0]
	sub	r1, r0, #1
	cmp	r1, #153
	ldrhi	r5, .L46+20
	ldr	r4, .L46+24
	ldrhi	r1, [r5, #0]
	ldr	lr, [r4, #0]
	rsbhi	r1, r1, #0
	strhi	r1, [r5, #0]
	sub	r1, lr, #1
	ldrls	r5, .L46+20
	cmp	r1, #233
	ldrhi	r8, .L46+28
	ldrhi	r1, [r8, #0]
	ldr	ip, .L46+32
	rsbhi	r1, r1, #0
	strhi	r1, [r8, #0]
	ldr	r1, [ip, #0]
	sub	r1, r1, #1
	ldrls	r8, .L46+28
	cmp	r1, #153
	ldrhi	sl, .L46+36
	ldrhi	r1, [sl, #0]
	ldr	r6, .L46+40
	rsbhi	r1, r1, #0
	strhi	r1, [sl, #0]
	ldr	r1, [r6, #0]
	sub	r1, r1, #1
	ldrls	sl, .L46+36
	cmp	r1, #233
	ldrhi	r9, .L46+44
	ldrhi	r1, [r9, #0]
	ldr	r4, .L46+48
	rsbhi	r1, r1, #0
	strhi	r1, [r9, #0]
	ldr	r1, [r4, #0]
	sub	r1, r1, #1
	ldrls	r9, .L46+44
	cmp	r1, #153
	ldrhi	fp, .L46+52
	ldrhi	r1, [fp, #0]
	ldr	r6, .L46+56
	rsbhi	r1, r1, #0
	strhi	r1, [fp, #0]
	ldr	r1, [r6, #0]
	sub	r1, r1, #1
	ldrls	fp, .L46+52
	cmp	r1, #233
	ldrhi	r4, .L46+60
	ldrhi	r1, [r4, #0]
	ldrls	r1, .L46+60
	ldr	r6, .L46+64
	rsbhi	r1, r1, #0
	strhi	r1, [r4, #0]
	strls	r1, [sp, #60]
	ldr	r1, [r6, #0]
	sub	r1, r1, #1
	strhi	r4, [sp, #60]
	cmp	r1, #153
	ldrhi	r4, .L46+68
	ldrhi	r1, [r4, #0]
	ldrls	r1, .L46+68
	ldr	r6, .L46+72
	rsbhi	r1, r1, #0
	strhi	r1, [r4, #0]
	strls	r1, [sp, #56]
	ldr	r1, [r6, #0]
	sub	r1, r1, #1
	strhi	r4, [sp, #56]
	cmp	r1, #233
	ldrhi	r4, .L46+76
	ldrhi	r1, [r4, #0]
	ldrls	r1, .L46+76
	rsbhi	r1, r1, #0
	ldr	r6, [r2, #0]
	ldr	r7, [r3, #0]
	strhi	r1, [r4, #0]
	strhi	r4, [sp, #52]
	mov	r2, #5
	mov	r4, #10
	strls	r1, [sp, #52]
	str	r6, [sp, #0]
	mov	r1, lr
	str	r7, [sp, #4]
	ldr	r6, .L46+80
	str	ip, [sp, #28]
	mov	r3, r2
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldr	r7, .L46
	ldr	r6, .L46+8
	ldr	ip, [sp, #28]
	beq	.L17
	ldr	r4, .L46+84
.L18:
	mov	r0, #31
	mov	lr, pc
	bx	r4
	b	.L18
.L17:
	ldr	lr, [r7, #0]
	ldr	r0, [ip, #0]
	ldr	ip, .L46+40
	ldr	r1, [ip, #0]
	str	lr, [sp, #0]
	ldr	lr, [r6, #0]
	mov	r2, #5
	mov	r3, r2
	str	lr, [sp, #4]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	ldr	ip, .L46+80
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L19
	ldr	r4, .L46+84
.L20:
	mov	r0, #31
	mov	lr, pc
	bx	r4
	b	.L20
.L19:
	ldr	ip, [r6, #0]
	ldr	lr, [r7, #0]
	ldr	r1, .L46+48
	ldr	r3, .L46+56
	mov	r2, #5
	ldr	r0, [r1, #0]
	ldr	r1, [r3, #0]
	str	ip, [sp, #4]
	mov	r3, r2
	str	lr, [sp, #0]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	ldr	ip, .L46+80
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L21
	ldr	r4, .L46+84
.L22:
	mov	r0, #31
	mov	lr, pc
	bx	r4
	b	.L22
.L21:
	ldr	lr, [r7, #0]
	ldr	r6, [r6, #0]
	ldr	r1, .L46+64
	ldr	r3, .L46+72
	mov	r2, #5
	ldr	r0, [r1, #0]
	ldr	r1, [r3, #0]
	mov	r3, r2
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	lr, [sp, #0]
	str	r6, [sp, #4]
	ldr	r4, .L46+80
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldr	r2, .L46+64
	ldr	r3, .L46+72
	beq	.L23
	ldr	r4, .L46+84
.L24:
	mov	r0, #992
	mov	lr, pc
	bx	r4
	b	.L24
.L23:
	ldr	ip, .L46+24
	ldr	ip, [ip, #0]
	ldr	r6, .L46+16
	str	ip, [sp, #44]
	ldr	r4, .L46+40
	ldr	ip, .L46+56
	ldr	r6, [r6, #0]
	ldr	ip, [ip, #0]
	ldr	r4, [r4, #0]
	str	r6, [sp, #48]
	str	r4, [sp, #40]
	str	ip, [sp, #32]
	ldr	r4, [sp, #60]
	ldr	ip, [sp, #56]
	ldr	r6, .L46+48
	ldr	r0, [r4, #0]
	ldr	r6, [r6, #0]
	ldr	r4, [ip, #0]
	ldr	ip, [sp, #52]
	ldr	r1, .L46+32
	str	r6, [sp, #36]
	ldr	r6, [r5, #0]
	ldr	r5, [ip, #0]
	ldr	ip, [sp, #48]
	ldr	r1, [r1, #0]
	ldr	r7, [r8, #0]
	add	r6, r6, ip
	ldr	ip, [sp, #44]
	str	r1, [sp, #20]
	ldr	r8, [sl, #0]
	add	r7, r7, ip
	ldr	ip, [sp, #20]
	ldr	sl, [r9, #0]
	add	r8, r8, ip
	ldr	ip, [sp, #40]
	ldr	r1, [fp, #0]
	add	sl, sl, ip
	ldr	ip, [sp, #36]
	add	r1, r1, ip
	ldr	ip, [sp, #32]
	add	r0, r0, ip
	ldr	ip, [r2, #0]
	add	r4, r4, ip
	ldr	ip, [r3, #0]
	add	r5, r5, ip
	ldr	ip, .L46+16
	str	r6, [ip, #0]
	ldr	r6, .L46+24
	ldr	ip, .L46+32
	str	r7, [r6, #0]
	str	r8, [ip, #0]
	ldr	ip, .L46+48
	ldr	r6, .L46+40
	str	r1, [ip, #0]
	ldr	r1, .L46+56
	str	sl, [r6, #0]
	str	r0, [r1, #0]
	str	r4, [r2, #0]
	str	r5, [r3, #0]
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	playerRow
	.word	playerRDel
	.word	playerCol
	.word	playerCDel
	.word	rb1Row
	.word	rb1RDel
	.word	rb1Col
	.word	rb1CDel
	.word	rb2Row
	.word	rb2RDel
	.word	rb2Col
	.word	rb2CDel
	.word	rb3Row
	.word	rb3RDel
	.word	rb3Col
	.word	rb3CDel
	.word	gbRow
	.word	gbRDel
	.word	gbCol
	.word	gbCDel
	.word	collision
	.word	fillScreen
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r5, .L49
	sub	sp, sp, #28
	ldr	r1, .L49+4
	ldrh	ip, [r5, #0]
	ldr	r3, .L49+8
	mov	r2, #5
	ldr	r4, .L49+12
	ldr	r0, [r1, #0]
	ldr	r1, [r3, #0]
	mov	r3, r2
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	ip, .L49+16
	ldr	r8, .L49+20
	ldr	r1, [ip, #0]
	ldrh	ip, [r5, #0]
	mov	r2, #5
	ldr	r0, [r8, #0]
	mov	r3, r2
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	ldrh	ip, [r5, #0]
	ldr	r1, .L49+24
	ldr	r3, .L49+28
	mov	r2, #5
	ldr	r0, [r1, #0]
	ldr	r1, [r3, #0]
	mov	r3, r2
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	ip, .L49+32
	ldr	r8, .L49+36
	ldr	r1, [ip, #0]
	ldrh	ip, [r5, #0]
	mov	r2, #5
	ldr	r0, [r8, #0]
	mov	r3, r2
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	ldrh	lr, [r5, #0]
	ldr	ip, .L49+40
	ldr	r1, .L49+44
	ldr	r3, .L49+48
	mov	r2, #10
	ldr	r7, .L49+52
	ldr	r6, .L49+56
	ldr	r0, [r1, #0]
	ldr	r1, [r3, #0]
	mov	r3, r2
	str	lr, [sp, #0]
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r4
	ldr	r5, .L49+60
	ldr	r0, [r7, #0]
	ldr	r1, [r6, #0]
	mov	lr, pc
	bx	r5
	ldr	r8, .L49+64
	ldr	ip, [sp, #12]
	ldr	r0, [r8, #0]
	ldr	r1, [ip, #0]
	mov	lr, pc
	bx	r5
	ldr	r4, .L49+68
	ldr	r3, .L49+72
	ldr	fp, .L49+76
	ldr	r9, .L49+80
	ldr	r0, [r4, #0]
	ldr	r1, [r3, #0]
	ldr	r4, .L49+84
	ldr	sl, .L49+88
	mov	lr, pc
	bx	r5
	ldr	r0, [fp, #0]
	ldr	r1, [r9, #0]
	ldr	r3, .L49+92
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #0]
	ldr	r0, [sl, #0]
	ldr	r3, .L49+96
	mov	lr, pc
	bx	r3
	ldr	r7, [r7, #0]
	str	r7, [sp, #20]
	ldr	r7, [r8, #0]
	ldr	r8, .L49+68
	ldr	r6, [r6, #0]
	ldr	r5, [r8, #0]
	ldr	r2, [r4, #0]
	ldr	r8, .L49+4
	ldr	r4, [sp, #20]
	str	r6, [sp, #16]
	ldr	ip, [sp, #12]
	str	r4, [r8, #0]
	ldr	r4, [sp, #16]
	ldr	r8, .L49+8
	ldr	r6, [ip, #0]
	str	r4, [r8, #0]
	ldr	r0, .L49+72
	ldr	r8, .L49+16
	ldr	ip, [r0, #0]
	str	r6, [r8, #0]
	ldr	r8, .L49+28
	ldr	r0, [fp, #0]
	str	ip, [r8, #0]
	ldr	ip, .L49+36
	ldr	r1, [r9, #0]
	str	r0, [ip, #0]
	ldr	r0, .L49+32
	ldr	r3, [sl, #0]
	ldr	r4, .L49+20
	str	r1, [r0, #0]
	ldr	r1, .L49+44
	str	r7, [r4, #0]
	str	r3, [r1, #0]
	ldr	r4, .L49+24
	ldr	r3, .L49+48
	str	r5, [r4, #0]
	str	r2, [r3, #0]
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	bgColor
	.word	rb1OldRow
	.word	rb1OldCol
	.word	drawRect
	.word	rb2OldCol
	.word	rb2OldRow
	.word	rb3OldRow
	.word	rb3OldCol
	.word	gbOldCol
	.word	gbOldRow
	.word	rb2Col
	.word	playerOldRow
	.word	playerOldCol
	.word	rb1Row
	.word	rb1Col
	.word	makeRedBall
	.word	rb2Row
	.word	rb3Row
	.word	rb3Col
	.word	gbRow
	.word	gbCol
	.word	playerCol
	.word	playerRow
	.word	makeGreenBall
	.word	makePlayer
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
	ldr	r7, .L53
	ldr	r4, .L53+4
	ldr	r6, .L53+8
	add	r5, r5, #256
.L52:
	ldrh	r3, [r4, #0]
	strh	r3, [r7, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	bl	update
	mov	lr, pc
	bx	r6
	bl	draw
	b	.L52
.L54:
	.align	2
.L53:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	bgColor,2,2
	.comm	rb1Row,4,4
	.comm	rb1Col,4,4
	.comm	rb1OldRow,4,4
	.comm	rb1OldCol,4,4
	.comm	rb1RDel,4,4
	.comm	rb1CDel,4,4
	.comm	rb2Row,4,4
	.comm	rb2Col,4,4
	.comm	rb2OldRow,4,4
	.comm	rb2OldCol,4,4
	.comm	rb2RDel,4,4
	.comm	rb2CDel,4,4
	.comm	rb3Row,4,4
	.comm	rb3Col,4,4
	.comm	rb3OldRow,4,4
	.comm	rb3OldCol,4,4
	.comm	rb3RDel,4,4
	.comm	rb3CDel,4,4
	.comm	gbRow,4,4
	.comm	gbCol,4,4
	.comm	gbOldRow,4,4
	.comm	gbOldCol,4,4
	.comm	gbRDel,4,4
	.comm	gbCDel,4,4
	.comm	playerRow,4,4
	.comm	playerCol,4,4
	.comm	playerOldRow,4,4
	.comm	playerOldCol,4,4
	.comm	playerRDel,4,4
	.comm	playerCDel,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
