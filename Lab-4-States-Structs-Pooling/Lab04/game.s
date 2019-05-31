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
	mov	r1, #140
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
	mov	ip, #1
	ldr	r7, [r2, #0]
	ldr	r6, [r2, #4]
	add	r5, r3, #200
	mov	r4, #2
	mvn	r1, #1
	mov	r2, #0
	mvn	r0, #32768
.L11:
	str	r4, [r3, #-12]
	str	ip, [r3, #-8]
	str	r1, [r3, #-32]
	str	r2, [r3, #-28]
	str	r7, [r3, #-24]
	str	r6, [r3, #-20]
	str	r1, [r3, #-16]
	strh	r0, [r3, #-4]	@ movhi
	str	r2, [r3], #40
	cmp	r3, r5
	bne	.L11
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L15:
	.align	2
.L14:
	.word	player
	.word	bullets+32
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
	add	ip, r6, r7, asr #1
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
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #16]
	ldr	r1, [r0, #20]
	add	r3, r2, r3
	rsb	r1, r1, #0
	cmp	r3, r1
	str	r3, [r0, #0]
	movle	r3, #0
	str	r2, [r0, #8]
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
	bne	.L41
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L42
.L40:
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L42:
	ldr	r3, [r4, #24]
	ldr	r0, [r0, #8]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #20]
	str	ip, [sp, #0]
	ldr	ip, .L43
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L40
.L41:
	ldr	r1, [r4, #12]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r0, #8]
	mov	ip, #0
	ldr	r5, .L43
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
	b	.L40
.L44:
	.align	2
.L43:
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
	ldr	r4, .L48
	ldr	r8, .L48+4
	ldr	r7, .L48+8
	mov	r6, #10
	add	r9, r9, #149
	sub	sl, sl, #8064
	mov	r5, #1
	mov	fp, #0
.L46:
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
	ldr	r3, .L48+12
	str	fp, [r4], #44
	cmp	r4, r3
	bne	.L46
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r3, .L51
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	ballsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r5, r0
	beq	.L53
	ldr	r2, [r0, #0]
	cmp	r2, #0
	ble	.L55
	ldr	r3, [r0, #24]
	add	r3, r2, r3
	cmp	r3, #120
	ldrle	r0, [r0, #16]
	ble	.L56
.L55:
	ldr	r0, [r5, #16]
	rsb	r0, r0, #0
	str	r0, [r5, #16]
.L56:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L57
	ldr	r1, [r5, #28]
	add	r1, r3, r1
	cmp	r1, #239
	ldrle	r1, [r5, #20]
	ble	.L58
.L57:
	ldr	r1, [r5, #20]
	rsb	r1, r1, #0
	str	r1, [r5, #20]
.L58:
	add	r2, r0, r2
	add	r3, r1, r3
	stmia	r5, {r2, r3}	@ phole stm
	ldr	r4, .L63
	ldr	r8, .L63+4
	mov	r6, #0
.L60:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	bne	.L62
.L59:
	add	r6, r6, #1
	cmp	r6, #5
	add	r4, r4, #40
	bne	.L60
.L53:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L62:
	ldr	sl, [r5, #0]
	ldr	r7, [r5, #4]
	ldr	lr, [r5, #24]
	ldr	ip, [r5, #28]
	sub	r0, r4, #32
	ldmia	r0, {r0, r1}	@ phole ldm
	sub	r2, r4, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	str	sl, [sp, #0]
	stmib	sp, {r7, lr}	@ phole stm
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L59
	ldr	r2, .L63+8
	ldr	r0, .L63+12
	ldr	r1, [r2, #0]
	add	r6, r6, r6, asl #2
	mov	r3, #0
	add	r0, r0, r6, asl #3
	sub	r1, r1, #1
	str	r3, [r0, #32]
	str	r1, [r2, #0]
	str	r3, [r5, #36]
	b	.L53
.L64:
	.align	2
.L63:
	.word	bullets+32
	.word	collision
	.word	ballsRemaining
	.word	bullets
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
	ldr	r3, .L71
	mov	lr, #0
	add	r0, r3, #200
.L67:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L66
	ldr	r1, [r3, #-8]
	add	r2, r3, #8
	ldmia	r2, {r2, ip}	@ phole ldm
	add	r2, r2, r1
	rsb	ip, ip, #0
	cmp	r2, ip
	str	r1, [r3, #0]
	str	r2, [r3, #-8]
	strle	lr, [r3, #24]
.L66:
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L67
	ldr	r5, .L71+4
	mov	r4, #0
.L68:
	add	r0, r4, r4, asl #2
	add	r0, r4, r0, asl #1
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	updateBall
	cmp	r4, #5
	bne	.L68
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	bullets+8
	.word	balls
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #12
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	bne	.L76
	ldr	ip, [r0, #40]
	cmp	ip, #0
	beq	.L77
.L75:
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L77:
	ldr	r3, [r4, #28]
	ldr	r0, [r0, #8]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #24]
	str	ip, [sp, #0]
	ldr	ip, .L78
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L75
.L76:
	ldr	r1, [r4, #12]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r0, #8]
	mov	ip, #0
	ldr	r5, .L78
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #32]
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	b	.L75
.L79:
	.align	2
.L78:
	.word	drawRect
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
	ldr	r5, .L85
	mov	r4, #0
.L81:
	add	r0, r4, r4, asl #2
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawBullet
	cmp	r4, #5
	bne	.L81
	ldr	r5, .L85+4
	mov	r4, #0
.L82:
	add	r0, r4, r4, asl #2
	add	r0, r4, r0, asl #1
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	drawBall
	cmp	r4, #5
	bne	.L82
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	bullets
	.word	balls
	.size	drawGame, .-drawGame
	.comm	player,36,4
	.comm	bullets,200,4
	.comm	balls,220,4
	.comm	ballsRemaining,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
