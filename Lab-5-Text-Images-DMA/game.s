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
	mov	r3, #31
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
	.word	drawRect
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
	mov	r2, #118
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	mov	r2, #1
	str	r2, [r3, #16]
	mov	r2, #10
	str	r2, [r3, #20]
	mov	r2, #5
	str	r2, [r3, #24]
	mov	r2, #20
	mov	r1, #130
	str	r2, [r3, #32]
	mov	r2, #992	@ movhi
	str	r1, [r3, #0]
	str	r1, [r3, #8]
	strh	r2, [r3, #28]	@ movhi
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
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L8
	sub	sp, sp, #12
	mov	ip, #0
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r5, .L8+4
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #28]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldmia	r4, {r0, r1}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L14
	ldr	r3, .L14+4
	stmfd	sp!, {r4, r5, r6, r7}
	mov	r0, #1
	ldr	r7, [r2, #0]
	ldr	r6, [r2, #4]
	add	r5, r3, #200
	mov	r4, #2
	mvn	r1, #1
	mov	r2, #0
	mvn	ip, #32768
.L11:
	str	r4, [r3, #20]
	str	r0, [r3, #24]
	stmia	r3, {r1, r2, r7}	@ phole stm
	str	r6, [r3, #12]
	str	r1, [r3, #16]
	strh	ip, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	str	r0, [r3, #36]
	add	r3, r3, #40
	cmp	r3, r5
	bne	.L11
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L15:
	.align	2
.L14:
	.word	player
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
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r0, .L22
	mov	r3, #0
	mov	r2, r0
.L19:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L21
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bne	.L19
.L16:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L21:
	add	r3, r3, r3, asl #2
	add	r2, r0, r3, asl #3
	ldr	ip, .L22+4
	ldr	r5, [r2, #24]
	ldr	r4, [ip, #24]
	add	r5, r5, r5, lsr #31
	add	r7, r4, r4, lsr #31
	mov	r6, r5, asr #1
	ldr	r4, [ip, #4]
	ldr	r5, [ip, #0]
	rsb	ip, r6, r7, asr #1
	add	ip, ip, r4
	str	r5, [r0, r3, asl #3]
	mov	r3, #1
	str	ip, [r2, #4]
	str	r3, [r2, #32]
	str	r1, [r2, #36]
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
	ldrne	r4, .L34
	bne	.L25
	ldr	r4, .L34
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	cmp	r2, r3
	rsbge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L25
.L26:
	ldr	r3, .L34+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L33
.L27:
	ldr	r3, .L34+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L33
	ldr	r3, [r4, #32]
	cmp	r3, #19
	addle	r3, r3, #1
	ble	.L28
	bl	fireBullet
	mov	r3, #1
	b	.L28
.L25:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L26
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r0, [r4, #24]
	rsb	r1, r2, #240
	add	r0, r3, r0
	cmp	r0, r1
	ldrle	r1, .L34
	addle	r3, r2, r3
	strle	r3, [r1, #4]
	ldr	r3, .L34+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L27
.L33:
	ldr	r3, [r4, #32]
	add	r3, r3, #1
.L28:
	str	r3, [r4, #32]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
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
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #20]
	add	r2, r3, r2
	cmp	r2, #0
	ldrgt	r2, [r0, #16]
	movle	r3, #0
	addgt	r3, r2, r3
	strgt	r3, [r0, #0]
	strle	r3, [r0, #32]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #12
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	bne	.L42
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L43
.L41:
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L43:
	ldr	r3, [r4, #24]
	ldr	r0, [r0, #8]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #20]
	str	ip, [sp, #0]
	ldr	ip, .L44
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L41
.L42:
	ldr	r1, [r4, #12]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r0, #8]
	mov	ip, #0
	ldr	r5, .L44
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #28]
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	b	.L41
.L45:
	.align	2
.L44:
	.word	drawRect
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
	ldr	r7, .L49+8
	mov	r6, #10
	add	r9, r9, #149
	sub	sl, sl, #8064
	mov	r5, #1
	mov	fp, #0
.L47:
	str	r6, [r4, #-16]
	str	r6, [r4, #-12]
	mov	lr, pc
	bx	r8
	smull	r3, r2, r9, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, asl #3
	rsb	r3, r3, r2, asl #3
	sub	r0, r0, r3, asl #1
	str	r0, [r4, #-40]
	mov	lr, pc
	bx	r8
	smull	r3, r2, sl, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, asl #6
	sub	r0, r0, r3, asl #1
	ldmia	r7, {r1, r2}	@ phole ldm
	mov	r3, #31744	@ movhi
	add	r0, r0, #10
	strh	r3, [r4, #-8]	@ movhi
	str	r0, [r4, #-36]
	str	r1, [r4, #-32]
	str	r2, [r4, #-28]
	str	r5, [r4, #-24]
	str	r5, [r4, #-20]
	str	r5, [r4, #-4]
	ldr	r3, .L49+12
	str	fp, [r4], #44
	cmp	r4, r3
	bne	.L47
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	balls+40
	.word	rand
	.word	player
	.word	balls+260
	.size	initBalls, .-initBalls
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	initPlayer
	bl	initBullets
	bl	initBalls
	ldr	r3, .L52
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	ballsRemaining
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
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r5, r0
	beq	.L54
	ldr	r2, [r0, #0]
	cmp	r2, #0
	ble	.L56
	ldr	r3, [r0, #24]
	add	r3, r2, r3
	cmp	r3, #120
	ldrle	r0, [r0, #16]
	ble	.L57
.L56:
	ldr	r0, [r5, #16]
	rsb	r0, r0, #0
	str	r0, [r5, #16]
.L57:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L58
	ldr	r1, [r5, #28]
	add	r1, r3, r1
	cmp	r1, #239
	ldrle	r1, [r5, #20]
	ble	.L59
.L58:
	ldr	r1, [r5, #20]
	rsb	r1, r1, #0
	str	r1, [r5, #20]
.L59:
	add	r2, r0, r2
	add	r3, r1, r3
	ldr	r4, .L64
	stmia	r5, {r2, r3}	@ phole stm
	ldr	r8, .L64+4
	ldr	r7, .L64+8
	add	r6, r4, #200
	mov	sl, #0
.L61:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L63
.L60:
	add	r4, r4, #40
	cmp	r4, r6
	bne	.L61
.L54:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L63:
	sub	ip, r4, #20
	ldmia	ip, {ip, lr}	@ phole ldm
	ldmia	r4, {r9, fp}	@ phole ldm
	ldr	r3, [r5, #28]
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #24]
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r7, #0]
	subne	r3, r3, #1
	strne	sl, [r4, #12]
	strne	r3, [r7, #0]
	strne	sl, [r5, #36]
	b	.L60
.L65:
	.align	2
.L64:
	.word	bullets+20
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
	ldr	r3, .L73
	mov	ip, #0
	add	r1, r3, #200
.L69:
	ldr	r2, [r3, #0]
	cmp	r2, #0
	beq	.L67
	ldr	r2, [r3, #-32]
	ldr	r0, [r3, #-12]
	add	r0, r2, r0
	cmp	r0, #0
	ldrgt	r0, [r3, #-16]
	addgt	r2, r0, r2
	strgt	r2, [r3, #-32]
	strle	ip, [r3, #0]
.L67:
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L69
	ldr	r5, .L73+4
	mov	r4, #0
.L70:
	add	r0, r4, r4, asl #2
	add	r0, r4, r0, asl #1
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	updateBall
	cmp	r4, #5
	bne	.L70
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	bullets+32
	.word	balls
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	bne	.L78
	ldr	ip, [r0, #40]
	cmp	ip, #0
	beq	.L79
.L77:
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L79:
	ldr	r3, [r4, #28]
	ldr	r0, [r0, #8]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #24]
	str	ip, [sp, #0]
	ldr	ip, .L80
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L77
.L78:
	mov	ip, #0
	ldr	r1, [r4, #12]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r0, #8]
	str	ip, [sp, #0]
	ldr	ip, .L80
	mov	lr, pc
	bx	ip
	ldr	ip, .L80+4
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L80+8
	mov	lr, pc
	bx	ip
	b	.L77
.L81:
	.align	2
.L80:
	.word	drawRect
	.word	ballBitmap
	.word	drawImage
	.size	drawBall, .-drawBall
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	drawPlayer
	bl	drawBar
	ldr	r5, .L87
	mov	r4, #0
.L83:
	add	r0, r4, r4, asl #2
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawBullet
	cmp	r4, #5
	bne	.L83
	ldr	r5, .L87+4
	mov	r4, #0
.L84:
	add	r0, r4, r4, asl #2
	add	r0, r4, r0, asl #1
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	drawBall
	cmp	r4, #5
	bne	.L84
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	bullets
	.word	balls
	.size	drawGame, .-drawGame
	.comm	player,36,4
	.comm	bullets,200,4
	.comm	balls,220,4
	.comm	ballsRemaining,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
