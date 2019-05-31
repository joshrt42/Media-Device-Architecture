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
	.file	"game.c"
	.text
	.align	2
	.global	drawBar
	.type	drawBar, %function
drawBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #253
	sub	sp, sp, #12
	str	r3, [sp, #0]
	mov	r0, #120
	mov	r1, #0
	mov	r2, #3
	mov	r3, #240
	ldr	ip, .L2
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	drawRect4
	.size	drawBar, .-drawBar
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	mov	r2, #130
	str	r2, [r3, #0]
	mov	r2, #118
	str	r2, [r3, #4]
	mov	r2, #2
	str	r2, [r3, #8]
	mov	r2, #10
	str	r2, [r3, #12]
	mov	r2, #5
	str	r2, [r3, #16]
	mvn	r2, #3
	strb	r2, [r3, #20]
	mov	r2, #20
	str	r2, [r3, #24]
	bx	lr
.L6:
	.align	2
.L5:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	ip, .L8
	sub	sp, sp, #12
	ldmia	ip, {r0, r1}	@ phole ldm
	add	r2, ip, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	ldrb	ip, [ip, #20]	@ zero_extendqisi2
	str	ip, [sp, #0]
	ldr	ip, .L8+4
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	drawRect4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L14
	mov	r1, r2
	mvn	r0, #1
.L11:
	add	r2, r2, #1
	rsb	ip, r2, #0
	cmp	r2, #5
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	ip, [r3, #0]
	str	r1, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	strb	r0, [r3, #24]
	str	r1, [r3, #28]
	add	r3, r3, #32
	bne	.L11
	bx	lr
.L15:
	.align	2
.L14:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldr	r0, .L22
	mov	r3, #0
	mov	r2, r0
.L19:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L21
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #32
	bne	.L19
.L16:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L21:
	add	r2, r0, r3, asl #5
	ldr	r1, .L22+4
	ldr	r4, [r2, #20]
	ldr	ip, [r1, #16]
	add	r4, r4, r4, lsr #31
	add	r6, ip, ip, lsr #31
	ldr	r5, [r1, #4]
	mov	ip, r4, asr #1
	ldr	r4, [r1, #0]
	rsb	ip, ip, r6, asr #1
	ldr	r1, [r1, #28]
	add	ip, ip, r5
	str	r4, [r0, r3, asl #5]
	mov	r3, #1
	str	ip, [r2, #4]
	str	r1, [r2, #12]
	str	r3, [r2, #28]
	b	.L16
.L23:
	.align	2
.L22:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	add	r3, r3, #256
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldrne	r4, .L36
	bne	.L25
	ldr	r4, .L36
	ldmib	r4, {r2, r3}	@ phole ldm
	cmp	r2, r3
	blt	.L25
	rsb	r3, r3, r2
	str	r3, [r4, #4]
	mvn	r3, #0
	str	r3, [r4, #28]
	ldr	r3, .L36+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L28
.L34:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
.L29:
	str	r3, [r4, #24]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L25:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L35
.L27:
	mov	r3, #0
	str	r3, [r4, #28]
.L26:
	ldr	r3, .L36+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L34
.L28:
	ldr	r3, .L36+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L34
	ldr	r3, [r4, #24]
	cmp	r3, #12
	addle	r3, r3, #1
	ble	.L29
	bl	fireBullet
	mov	r3, #1
	b	.L29
.L35:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	ldr	r0, [r4, #16]
	rsb	r1, r2, #240
	add	r0, r3, r0
	cmp	r0, r1
	ldr	r1, .L36
	bgt	.L27
	add	r3, r2, r3
	str	r3, [r1, #4]
	mov	r3, #1
	str	r3, [r1, #28]
	b	.L26
.L37:
	.align	2
.L36:
	.word	player
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #16]
	add	r2, r3, r2
	cmp	r2, #0
	ble	.L40
	ldr	r1, [r0, #12]
	ldr	r2, [r0, #4]
	add	r2, r1, r2
	cmp	r2, #0
	ble	.L40
	cmp	r2, #238
	ble	.L41
.L40:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L41:
	ldr	r1, [r0, #8]
	add	r3, r1, r3
	str	r3, [r0, #0]
	str	r2, [r0, #4]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L42
	ldrb	ip, [r0, #24]	@ zero_extendqisi2
	ldr	lr, [r0, #0]
	ldr	r1, [r0, #4]
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	r0, lr
	ldr	ip, .L44
	mov	lr, pc
	bx	ip
.L42:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	drawRect4
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initBalls
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r9, #155189248
	mvn	sl, #-2130706432
	add	r9, r9, #991232
	sub	sl, sl, #16252928
	ldr	r4, .L49
	ldr	r8, .L49+4
	mov	r5, #0
	mov	r7, #12
	add	r9, r9, #149
	sub	sl, sl, #8064
	mov	r6, #2
	mov	fp, #1
.L47:
	str	r7, [r4, #0]
	str	r7, [r4, #4]
	mov	lr, pc
	bx	r8
	smull	r3, r2, r9, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, asl #3
	rsb	r3, r3, r2, asl #3
	sub	r0, r0, r3, asl #1
	str	r0, [r4, #-16]
	mov	lr, pc
	bx	r8
	smull	r3, r2, sl, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, asl #6
	and	r2, r5, #1
	sub	r0, r0, r3, asl #1
	add	r5, r5, #1
	add	r0, r0, #10
	cmp	r5, #5
	str	r0, [r4, #-12]
	str	r6, [r4, #-8]
	str	r6, [r4, #-4]
	str	r2, [r4, #8]
	str	fp, [r4, #12]
	add	r4, r4, #32
	bne	.L47
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	balls+16
	.word	rand
	.size	initBalls, .-initBalls
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	mov	r2, #130
	stmfd	sp!, {r4, lr}
	str	r2, [r3, #0]
	mov	r2, #118
	str	r2, [r3, #4]
	mov	r2, #2
	str	r2, [r3, #8]
	mov	r2, #10
	str	r2, [r3, #12]
	mvn	r2, #3
	strb	r2, [r3, #20]
	mov	r4, #5
	mov	r2, #20
	str	r2, [r3, #24]
	str	r4, [r3, #16]
	bl	initBullets
	bl	initBalls
	ldr	r3, .L52+4
	ldr	r0, .L52+8
	str	r4, [r3, #0]
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	mov	r3, #83886080
	mov	r2, #15808
	add	r3, r3, #256
	add	r2, r2, #47
	strh	r2, [r3, #254]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #244]	@ movhi
	mov	r2, #31744	@ movhi
	strh	r2, [r3, #246]	@ movhi
	mov	r2, #992	@ movhi
	mvn	r1, #32768
	strh	r2, [r3, #248]	@ movhi
	mov	r2, #31	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #250]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	player
	.word	ballsRemaining
	.word	pumpkinPal
	.word	loadPalette
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r5, r0
	beq	.L54
	ldr	r2, [r0, #0]
	cmp	r2, #1
	ble	.L56
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #119
	ldrle	r0, [r0, #8]
	ble	.L57
.L56:
	ldr	r0, [r5, #8]
	rsb	r0, r0, #0
	str	r0, [r5, #8]
.L57:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	ble	.L58
	ldr	r1, [r5, #20]
	add	r1, r3, r1
	cmp	r1, #238
	ldrle	r1, [r5, #12]
	ble	.L59
.L58:
	ldr	r1, [r5, #12]
	rsb	r1, r1, #0
	str	r1, [r5, #12]
.L59:
	add	r2, r0, r2
	add	r3, r1, r3
	ldr	r4, .L64
	stmia	r5, {r2, r3}	@ phole stm
	ldr	r8, .L64+4
	ldr	r7, .L64+8
	add	r6, r4, #160
	mov	sl, #0
.L61:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	bne	.L63
.L60:
	add	r4, r4, #32
	cmp	r4, r6
	bne	.L61
.L54:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L63:
	sub	ip, r4, #28
	ldmia	ip, {ip, lr}	@ phole ldm
	sub	r9, r4, #12
	ldmia	r9, {r9, fp}	@ phole ldm
	ldr	r3, [r5, #20]
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #16]
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r7, #0]
	subne	r3, r3, #1
	strne	sl, [r4, #0]
	strne	r3, [r7, #0]
	strne	sl, [r5, #28]
	b	.L60
.L65:
	.align	2
.L64:
	.word	bullets+28
	.word	collision
	.word	ballsRemaining
	.size	updateBall, .-updateBall
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	updatePlayer
	ldr	r5, .L71
	mov	r4, #0
.L67:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #5
	bne	.L67
	ldr	r5, .L71+4
	mov	r4, #0
.L68:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	updateBall
	cmp	r4, #5
	bne	.L68
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	bullets
	.word	balls
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L73
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L75
.L73:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L75:
	ldr	ip, [r0, #0]
	ldr	r1, [r0, #4]
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r0, ip
	mov	ip, #251
	str	ip, [sp, #0]
	ldr	ip, .L76
	mov	lr, pc
	bx	ip
	b	.L73
.L77:
	.align	2
.L76:
	.word	drawRect4
	.size	drawBall, .-drawBall
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r0, #250
	ldr	r3, .L83
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	bl	drawBar
	ldr	r5, .L83+4
	mov	r4, #0
.L79:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	drawBullet
	cmp	r4, #5
	bne	.L79
	ldr	r5, .L83+8
	mov	r4, #0
.L80:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	drawBall
	cmp	r4, #5
	bne	.L80
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	fillScreen4
	.word	bullets
	.word	balls
	.size	drawGame, .-drawGame
	.comm	player,32,4
	.comm	bullets,160,4
	.comm	balls,160,4
	.comm	ballsRemaining,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
