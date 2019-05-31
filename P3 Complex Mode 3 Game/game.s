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
	ldr	r3, .L2
	mov	r1, #110
	str	r1, [r3, #0]
	str	r1, [r3, #8]
	mov	r1, #0
	str	r1, [r3, #16]
	mov	r1, #2
	mov	r2, #20
	str	r1, [r3, #20]
	mov	r1, #24
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r1, [r3, #24]
	str	r2, [r3, #32]
	mov	r1, #12
	mov	r2, #1
	str	r1, [r3, #28]
	str	r2, [r3, #36]
	bx	lr
.L3:
	.align	2
.L2:
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
	ldr	r3, .L9
	sub	sp, sp, #12
	ldr	r2, [r3, #36]
	cmp	r2, #0
	bne	.L8
	ldr	ip, .L9+4
	ldmia	r3, {r0, r1}	@ phole ldm
	add	r2, r3, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L9+8
	mov	lr, pc
	bx	ip
.L4:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L8:
	ldr	ip, .L9+4
	ldmia	r3, {r0, r1}	@ phole ldm
	add	r2, r3, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L9+12
	mov	lr, pc
	bx	ip
	b	.L4
.L10:
	.align	2
.L9:
	.word	player
	.word	playerBitmap
	.word	drawImageHFlip
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
	ldr	r2, .L12
	str	r4, [sp, #-4]!
	ldr	r3, .L12+4
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #0]
	mov	r4, #2
	str	r0, [r3, #12]
	mov	r0, #4
	mov	r2, #1
	mov	r1, #0
	str	r4, [r3, #24]
	str	r0, [r3, #16]
	mvn	r4, #0
	mvn	r0, #32768
	str	r2, [r3, #20]
	str	r4, [r3, #0]
	stmib	r3, {r1, ip}	@ phole stm
	strh	r0, [r3, #36]	@ movhi
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	ldmfd	sp!, {r4}
	bx	lr
.L13:
	.align	2
.L12:
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
	ldr	r3, .L19
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L18
.L14:
	ldmfd	sp!, {r4}
	bx	lr
.L18:
	ldr	r2, .L19+4
	ldr	r4, [r2, #0]
	add	r0, r2, #24
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	ip, [r2, #4]
	ldr	r2, [r2, #36]
	cmp	r2, #0
	movne	r2, #5
	mvneq	r2, #4
	sub	r4, r4, #2
	add	r0, r0, r0, lsr #31
	add	r1, r1, r1, lsr #31
	strne	r2, [r3, #16]
	streq	r2, [r3, #16]
	mov	r2, #1
	add	r0, r4, r0, asr #1
	add	r1, ip, r1, asr #1
	str	r2, [r3, #28]
	mov	r2, #0
	stmia	r3, {r0, r1}	@ phole stm
	str	r2, [r3, #32]
	b	.L14
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
	ands	r3, r3, #32
	ldrne	r4, .L39
	bne	.L22
	ldr	r4, .L39
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	cmp	r1, r2
	blt	.L22
	rsb	r2, r2, r1
	str	r2, [r4, #4]
	str	r3, [r4, #36]
.L23:
	ldr	r3, .L39+4
	ldrh	r2, [r3, #0]
	tst	r2, #64
	beq	.L36
	ldr	r2, .L39+8
	ldrh	r2, [r2, #0]
	tst	r2, #64
	beq	.L26
.L36:
	ldr	r1, [r4, #0]
	ldr	r2, [r4, #16]
.L25:
	cmp	r1, #109
	ble	.L28
	cmp	r2, #0
	movge	r2, #2
	strge	r2, [r4, #20]
	blt	.L28
.L30:
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L37
	ldr	r3, .L39+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L37
	ldr	r3, [r4, #32]
	cmp	r3, #19
	ble	.L32
	bl	fireBullet
	ldr	r3, .L39
	ldr	r3, [r3, #32]
	b	.L32
.L22:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L23
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #28]
	rsb	r1, r2, #240
	add	r0, r3, r0
	cmp	r0, r1
	ldr	r1, .L39
	addle	r3, r2, r3
	strle	r3, [r1, #4]
	movle	r3, #1
	strle	r3, [r1, #36]
	b	.L23
.L37:
	ldr	r3, [r4, #32]
.L32:
	add	r3, r3, #1
	str	r3, [r4, #32]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L26:
	ldr	r1, [r4, #0]
	ldr	r0, .L39
	cmp	r1, #105
	ldrle	r2, [r0, #16]
	bgt	.L38
.L28:
	add	r1, r2, r1
	add	r2, r2, #1
	str	r2, [r4, #16]
	mov	r2, #5
	str	r1, [r4, #0]
	str	r2, [r4, #20]
	b	.L30
.L38:
	mvn	r2, #8
	str	r2, [r0, #16]
	b	.L25
.L40:
	.align	2
.L39:
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
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #24]
	add	r2, r3, r2
	cmp	r2, #234
	bgt	.L43
	cmp	r3, #5
	bgt	.L44
.L43:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L44:
	ldr	r2, [r0, #16]
	add	r3, r2, r3
	str	r3, [r0, #4]
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
	bne	.L48
	ldr	r3, [r0, #32]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r0, #32]
.L47:
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L48:
	ldrh	ip, [r4, #36]
	ldr	r0, [r0, #0]
	ldr	r1, [r4, #4]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L49
	mov	lr, pc
	bx	ip
	b	.L47
.L50:
	.align	2
.L49:
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
	ldr	r4, .L56
	ldr	fp, .L56+4
	ldr	r6, .L56+8
	ldr	r9, .L56+12
	add	sl, r4, #800
	mov	r8, #24
	mov	r7, #12
	mov	r5, #1
.L54:
	mov	r3, #110
	str	r3, [r4, #-32]
	str	r8, [r4, #-12]
	str	r7, [r4, #-8]
	mov	lr, pc
	bx	fp
	smull	r3, r2, r9, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, asl #2
	add	r2, r3, r3, asl #2
	sub	r0, r0, r2, asl #2
	ldr	r3, [r6, #4]
	add	r0, r0, #118
	cmp	r3, r0
	ldr	r1, [r6, #0]
	movge	r2, r5
	mvnlt	r2, #0
	str	r3, [r4, #-20]
	mov	r3, #0
	str	r0, [r4, #-28]
	str	r1, [r4, #-24]
	str	r2, [r4, #-16]
	str	r5, [r4, #-4]
	str	r3, [r4], #40
	cmp	r4, sl
	bne	.L54
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	enemies+32
	.word	rand
	.word	player
	.word	1374389535
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
	ldr	r3, .L59
	mov	r2, #20
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	enemiesRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	bne	.L71
.L61:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L71:
	ldr	r3, .L74
	mov	lr, pc
	bx	r3
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	cmp	r3, #0
	ble	.L72
	ldr	r5, .L74+4
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #4]
	cmp	r3, r2
	ldrgt	r1, [r4, #16]
	ldrle	r1, [r4, #16]
	addgt	r1, r3, r1
	rsble	r1, r1, r3
	strgt	r1, [r4, #4]
	strle	r1, [r4, #4]
.L64:
	ldr	r6, .L74+8
	ldr	r3, [r6, #28]
	cmp	r3, #0
	ldreq	r7, .L74+12
	bne	.L73
.L66:
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r4, #0]
	ldmia	r5, {r4, lr}	@ phole ldm
	ldr	ip, [r5, #24]
	ldr	r5, [r5, #28]
	stmia	sp, {r4, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r5, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, .L74+16
	movne	r2, #1
	strne	r2, [r3, #0]
	b	.L61
.L73:
	ldr	lr, [r6, #0]
	ldr	ip, [r6, #4]
	add	r8, r6, #20
	ldmia	r8, {r8, sl}	@ phole ldm
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r4, #0]
	ldr	r7, .L74+12
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r8, [sp, #8]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r2, .L74+20
	ldrne	r1, [r2, #0]
	movne	r3, #0
	subne	r1, r1, #1
	strne	r3, [r6, #28]
	strne	r1, [r2, #0]
	strne	r3, [r4, #28]
	ldr	r1, [r4, #4]
	b	.L66
.L72:
	ldr	r1, [r4, #4]
	ldr	r5, .L74+4
	b	.L64
.L75:
	.align	2
.L74:
	.word	rand
	.word	player
	.word	bullets
	.word	collision
	.word	.LANCHOR0
	.word	enemiesRemaining
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	updatePlayer
	ldr	r3, .L82
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L77
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #24]
	add	r1, r2, r1
	cmp	r1, #234
	bgt	.L79
	cmp	r2, #5
	ble	.L79
	ldr	r1, [r3, #16]
	add	r2, r1, r2
	str	r2, [r3, #4]
.L77:
	ldr	r5, .L82+4
	mov	r4, #0
.L80:
	add	r0, r4, r4, asl #2
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateEnemy
	cmp	r4, #20
	bne	.L80
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L79:
	mov	r2, #0
	str	r2, [r3, #28]
	b	.L77
.L83:
	.align	2
.L82:
	.word	bullets
	.word	enemies
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	beq	.L85
	ldr	r3, .L88
	ldr	r1, [r0, #4]
	ldr	r3, [r3, #4]
	cmp	r1, r3
	ble	.L86
	ldr	ip, .L88+4
	ldr	r0, [r0, #0]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L88+8
	mov	lr, pc
	bx	ip
	b	.L87
.L85:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r0, #32]
.L87:
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L86:
	ldr	ip, .L88+4
	ldr	r0, [r0, #0]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L88+12
	mov	lr, pc
	bx	ip
	b	.L87
.L89:
	.align	2
.L88:
	.word	player
	.word	skeletonBitmap
	.word	drawImage
	.word	drawImageHFlip
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	drawPlayer
	ldr	r0, .L93
	bl	drawBullet
	ldr	r5, .L93+4
	mov	r4, #0
.L91:
	add	r0, r4, r4, asl #2
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawEnemy
	cmp	r4, #20
	bne	.L91
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	bullets
	.word	enemies
	.size	drawGame, .-drawGame
	.global	gameOver
	.comm	player,40,4
	.comm	bullets,40,4
	.comm	enemies,800,4
	.comm	enemiesRemaining,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gameOver, %object
	.size	gameOver, 4
gameOver:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
