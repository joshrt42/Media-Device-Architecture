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
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L2
	str	r4, [sp, #-4]!
	ldr	r2, [r1, #0]
	ldr	r3, .L2+4
	add	ip, r2, r2, lsr #31
	ldr	r4, [r1, #4]
	mov	ip, ip, asr #1
	rsb	ip, ip, #80
	mov	r0, #20
	mov	r1, #2
	str	r2, [r3, #24]
	mov	r2, #10
	str	ip, [r3, #0]
	stmib	r3, {r0, ip}	@ phole stm
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r4, [r3, #28]
	str	r2, [r3, #32]
	ldmfd	sp!, {r4}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
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
	ldr	r3, .L5
	ldr	ip, .L5+4
	sub	sp, sp, #12
	ldmia	r3, {r0, r1}	@ phole ldm
	add	r2, r3, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L5+8
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	player
	.word	playerBitmap
	.word	drawImage
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldr	r2, .L11+4
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r7, [r3, #0]
	ldr	r0, [r2, #0]
	ldr	r3, .L11+8
	add	r7, r7, r7, lsr #31
	ldr	r8, [r2, #4]
	add	r7, r0, r7, asr #1
	add	r6, r3, #200
	mov	r1, #3
	mov	r5, #5
	mov	r2, #0
	mvn	r4, #32768
	mov	ip, #1
.L8:
	stmia	r3, {r1, r5}	@ phole stm
	str	r7, [r3, #-20]
	str	r2, [r3, #-16]
	str	r0, [r3, #-12]
	str	r8, [r3, #-8]
	str	r1, [r3, #-4]
	strh	r4, [r3, #16]	@ movhi
	str	r2, [r3, #8]
	str	ip, [r3, #12]
	add	r3, r3, #40
	cmp	r3, r6
	bne	.L8
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.word	player
	.word	bullets+20
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
	ldr	r0, .L19
	mov	r3, #0
	mov	r2, r0
.L16:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L18
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bne	.L16
.L13:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L18:
	ldr	r2, .L19+4
	ldr	r4, [r2, #24]
	ldr	r5, [r2, #0]
	ldr	ip, [r2, #28]
	add	r7, r4, r4, lsr #31
	sub	r5, r5, #2
	add	r3, r3, r3, asl #2
	ldr	r6, [r2, #4]
	add	r5, r5, r7, asr #1
	add	r4, ip, ip, lsr #31
	str	r5, [r0, r3, asl #3]
	add	ip, r0, r3, asl #3
	mov	r3, #3
	add	r4, r6, r4, asr #1
	str	r3, [ip, #16]
	mov	r3, #1
	str	r4, [ip, #4]
	str	r3, [ip, #28]
	str	r1, [ip, #32]
	str	r1, [r2, #32]
	b	.L13
.L20:
	.align	2
.L19:
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
	tst	r3, #64
	ldrne	r4, .L33
	bne	.L22
	ldr	r3, .L33+4
	ldr	r4, .L33
	ldr	r2, [r3, #8]
	ldr	r3, [r4, #0]
	add	r2, r2, #2
	cmp	r3, r2
	ble	.L22
	ldr	r2, [r4, #16]
	rsb	r3, r2, r3
	str	r3, [r4, #0]
.L23:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L24
.L32:
	ldr	r3, [r4, #4]
	cmp	r3, #2
	ldr	r2, .L33
	ble	.L24
	ldr	r1, [r2, #20]
	rsb	r3, r1, r3
	str	r3, [r2, #4]
.L25:
	ldr	r3, .L33+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L31
.L26:
	ldr	r3, .L33+12
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L31
	ldr	r3, [r4, #32]
	cmp	r3, #9
	ble	.L27
	bl	fireBullet
	ldr	r3, .L33
	ldr	r3, [r3, #32]
	b	.L27
.L22:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L23
	ldr	r3, .L33+4
	ldr	r2, [r4, #24]
	ldr	r1, [r3, #8]
	rsb	r2, r2, #156
	ldr	r3, [r4, #0]
	rsb	r2, r1, r2
	cmp	r3, r2
	ldr	r2, .L33
	ldrlt	r1, [r2, #16]
	addlt	r3, r1, r3
	strlt	r3, [r2, #0]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L32
.L24:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L25
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #4]
	rsb	r2, r2, #230
	cmp	r3, r2
	ldr	r2, .L33
	ldrlt	r1, [r2, #20]
	addlt	r3, r1, r3
	strlt	r3, [r2, #4]
	ldr	r3, .L33+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L26
.L31:
	ldr	r3, [r4, #32]
.L27:
	add	r3, r3, #1
	str	r3, [r4, #32]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	player
	.word	.LANCHOR0
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
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #24]
	add	r2, r3, r2
	cmp	r2, #234
	ldrle	r2, [r0, #16]
	movgt	r3, #0
	addle	r3, r2, r3
	strle	r3, [r0, #4]
	strgt	r3, [r0, #28]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	bne	.L41
	ldr	r3, [r0, #32]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r0, #32]
.L40:
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L41:
	ldrb	ip, [r4, #36]	@ zero_extendqisi2
	ldr	r0, [r0, #0]
	ldr	r1, [r4, #4]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L42
	mov	lr, pc
	bx	ip
	b	.L40
.L43:
	.align	2
.L42:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initEnemies
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r6, .L49
	ldr	r4, .L49+4
	ldr	r3, [r6, #12]
	ldr	fp, .L49+8
	ldr	sl, .L49+12
	ldr	r9, .L49+16
	mov	r5, #0
	mvn	r8, #0
	mov	r7, #1
.L47:
	ldr	r2, [r6, #16]
	stmia	r4, {r2, r3}	@ phole stm
	mov	lr, pc
	bx	fp
	smull	r1, r2, r9, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r2, r3, r3, asl #3
	add	r2, r3, r2, asl #1
	ldr	r3, [r6, #12]
	cmp	r5, #6
	rsb	r1, r3, #240
	sub	r0, r0, r2, asl #2
	str	r1, [r4, #-20]
	movgt	r2, r8
	movle	r2, r7
	ldr	ip, [sl, #0]
	add	r5, r5, #1
	ldr	r1, [sl, #4]
	str	r2, [r4, #-8]
	add	r0, r0, #26
	mov	r2, #0
	cmp	r5, #15
	str	r0, [r4, #-24]
	str	ip, [r4, #-16]
	str	r1, [r4, #-12]
	str	r8, [r4, #-4]
	str	r7, [r4, #8]
	str	r2, [r4, #12]
	add	r4, r4, #40
	bne	.L47
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	enemies+24
	.word	rand
	.word	player
	.word	1808407283
	.size	initEnemies, .-initEnemies
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
	bl	initEnemies
	ldr	r3, .L52
	mov	r2, #15
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	enemiesRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #28
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r5, r0
	beq	.L54
	ldr	r3, [r0, #0]
	cmp	r3, #25
	bgt	.L65
.L56:
	ldr	r1, [r5, #16]
	rsb	r1, r1, #0
	str	r1, [r5, #16]
.L57:
	ldr	r2, [r5, #4]
	ldr	r0, [r5, #20]
	add	r2, r0, r2
	add	r3, r1, r3
	cmp	r2, #0
	str	r3, [r5, #0]
	movlt	r3, #240
	str	r2, [r5, #4]
	ldr	r4, .L69
	strlt	r3, [r5, #4]
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #2
	cmp	r0, #0
	ldrgt	r1, [r5, #4]
	ble	.L66
.L60:
	ldr	r4, .L69+8
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ldr	r8, .L69+12
	add	r6, r4, #200
	mov	r7, #1
	mov	sl, #0
	bne	.L67
.L61:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L63
.L68:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ldr	r1, [r5, #4]
	beq	.L61
.L67:
	ldr	lr, [r4, #-28]
	ldr	ip, [r4, #-24]
	ldr	r0, [r5, #0]
	add	r2, r5, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	add	lr, lr, #1
	add	ip, ip, #5
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	strne	sl, [r4, #0]
	add	r4, r4, #40
	ldreq	r1, [r5, #4]
	ldrne	r1, [r5, #4]
	strne	sl, [r5, #32]
	cmp	r4, r6
	bne	.L68
.L63:
	ldr	r3, .L69+16
	ldr	r2, [r5, #24]
	ldr	r0, [r5, #0]
	ldr	r4, [r3, #4]
	ldr	r5, [r3, #0]
	ldr	lr, [r3, #24]
	ldr	ip, [r3, #28]
	mov	r3, #12
	str	r5, [sp, #0]
	stmib	sp, {r4, lr}	@ phole stm
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, .L69+20
	movne	r2, #1
	strne	r2, [r3, #0]
.L54:
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L65:
	ldr	r2, [r0, #24]
	rsb	r2, r2, #131
	cmp	r3, r2
	ldrle	r1, [r0, #16]
	ble	.L57
	b	.L56
.L66:
	ldr	r1, [r5, #4]
	cmp	r1, #219
	bgt	.L60
	cmp	r1, #50
	ble	.L60
	str	r1, [sp, #20]
	mov	lr, pc
	bx	r4
	ldr	r2, .L69+24
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	ldr	r1, [sp, #20]
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	add	r1, r1, #10
	sub	r0, r0, r3, asl #2
	rsb	r1, r0, r1
	str	r1, [r5, #4]
	b	.L60
.L70:
	.align	2
.L69:
	.word	rand
	.word	1374389535
	.word	bullets+28
	.word	collision
	.word	player
	.word	.LANCHOR1
	.word	1717986919
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	updatePlayer
	ldr	r3, .L79
	mov	ip, #0
	add	r1, r3, #200
.L74:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L72
	ldr	r2, [r3, #-12]
	ldr	r0, [r3, #8]
	add	r0, r2, r0
	cmp	r0, #234
	ldrle	r0, [r3, #0]
	addle	r2, r0, r2
	strle	r2, [r3, #-12]
	strgt	ip, [r3, #12]
.L72:
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L74
	ldr	r6, .L79+4
	mov	r4, #0
	ldr	r7, .L79+8
	str	r4, [r6, #4]
	mov	r5, r7
.L76:
	add	r0, r4, r4, asl #2
	add	r0, r7, r0, asl #3
	bl	updateEnemy
	ldr	r3, [r5, #32]
	cmp	r3, #0
	ldrne	r3, [r6, #4]
	add	r4, r4, #1
	addne	r3, r3, #1
	strne	r3, [r6, #4]
	cmp	r4, #15
	add	r5, r5, #40
	bne	.L76
	ldr	r2, [r6, #4]
	ldr	r3, .L79+12
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	bullets+16
	.word	.LANCHOR1
	.word	enemies
	.word	enemiesRemaining
	.size	updateGame, .-updateGame
	.align	2
	.global	drawEnemy
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	bne	.L84
	ldr	r3, [r0, #36]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r0, #36]
.L83:
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L84:
	ldr	ip, .L85
	ldr	r0, [r0, #0]
	ldr	r1, [r4, #4]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L85+4
	mov	lr, pc
	bx	ip
	b	.L83
.L86:
	.align	2
.L85:
	.word	enemyBitmap
	.word	drawImage
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L92
	mov	r4, #0
.L88:
	add	r0, r4, r4, asl #2
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawBullet
	cmp	r4, #5
	bne	.L88
	ldr	r5, .L92+4
	mov	r4, #0
.L89:
	add	r0, r4, r4, asl #2
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawEnemy
	cmp	r4, #15
	bne	.L89
	ldmfd	sp!, {r4, r5, r6, lr}
	b	drawPlayer
.L93:
	.align	2
.L92:
	.word	bullets
	.word	enemies
	.size	drawGame, .-drawGame
	.global	gameOver
	.global	playerHeight
	.global	playerWidth
	.global	enemyHeight
	.global	enemyWidth
	.global	screenbound
	.global	rem
	.comm	player,36,4
	.comm	bullets,200,4
	.comm	enemies,600,4
	.comm	enemiesRemaining,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	playerHeight, %object
	.size	playerHeight, 4
playerHeight:
	.word	12
	.type	playerWidth, %object
	.size	playerWidth, 4
playerWidth:
	.word	24
	.type	screenbound, %object
	.size	screenbound, 4
screenbound:
	.word	24
	.type	enemyWidth, %object
	.size	enemyWidth, 4
enemyWidth:
	.word	36
	.type	enemyHeight, %object
	.size	enemyHeight, 4
enemyHeight:
	.word	24
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	gameOver, %object
	.size	gameOver, 4
gameOver:
	.space	4
	.type	rem, %object
	.size	rem, 4
rem:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
