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
	mov	r1, #115
	str	r1, [r3, #0]
	mov	r1, #146
	str	r1, [r3, #4]
	mov	r1, #2
	str	r1, [r3, #12]
	mov	r1, #8
	str	r1, [r3, #16]
	mov	r1, #11
	str	r1, [r3, #20]
	mov	r1, #1
	mov	r2, #0
	str	r1, [r3, #24]
	mov	r1, #30
	str	r1, [r3, #28]
	str	r2, [r3, #36]
	mov	r1, #3
	str	r2, [r3, #40]
	mov	r2, #4
	str	r1, [r3, #32]
	str	r2, [r3, #44]
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
	@ link register save eliminated.
	ldr	r3, .L7
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bxeq	lr
	ldr	r0, [r3, #4]
	ldr	r1, [r3, #40]
	ldr	r2, .L7+4
	ldrh	r3, [r3, #0]
	orr	r0, r0, #16384
	mov	r1, r1, asl #5
	strh	r0, [r2, #0]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawHealth
	.type	drawHealth, %function
drawHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldr	ip, [r3, #32]
	ldr	r3, .L10+4
	mov	r0, #364
	add	ip, ip, #192
	mov	r2, #360
	strh	ip, [r3, r0]	@ movhi
	mov	r0, #8	@ movhi
	add	r1, r2, #2
	strh	r0, [r3, r2]	@ movhi
	mov	r2, #210	@ movhi
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	shadowOAM
	.size	drawHealth, .-drawHealth
	.align	2
	.global	drawScore
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	stmfd	sp!, {r4, r5, r6}
	ldr	r2, .L13+4
	ldr	r1, [r3, #0]
	smull	r3, r2, r1, r2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2, asr #2
	ldr	r3, .L13+8
	add	r0, r2, r2, asl #2
	mov	r4, #368
	mov	ip, #8
	strh	ip, [r3, r4]	@ movhi
	sub	r1, r1, r0, asl #1
	add	r2, r2, #192
	add	r6, r4, #2
	mov	r4, #372
	strh	r2, [r3, r4]	@ movhi
	add	r1, r1, #192
	mov	r2, #380
	mov	r0, #376
	strh	r1, [r3, r2]	@ movhi
	mov	r2, #45	@ movhi
	strh	r2, [r3, r6]	@ movhi
	add	r5, r0, #2
	mov	r2, #53	@ movhi
	strh	ip, [r3, r0]	@ movhi
	strh	r2, [r3, r5]	@ movhi
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.word	1717986919
	.word	shadowOAM
	.size	drawScore, .-drawScore
	.align	2
	.global	initPlayerBullets
	.type	initPlayerBullets, %function
initPlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L18
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r2, [r3, #20]
	ldmia	r3, {r1, r7}	@ phole ldm
	add	r2, r2, r2, lsr #31
	ldr	r3, .L18+4
	add	r6, r1, r2, asr #1
	sub	r7, r7, #4
	mov	r2, #31
	mov	r5, #4
	mov	r0, #3
	mvn	r4, #2
	mov	r1, #0
	mov	ip, #1
.L16:
	str	r2, [r3, #32]
	add	r2, r2, #1
	cmp	r2, #36
	str	r5, [r3, #4]
	str	r0, [r3, #8]
	str	r7, [r3, #-12]
	str	r6, [r3, #-8]
	str	r4, [r3, #0]
	str	r1, [r3, #12]
	str	ip, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r0, [r3, #28]
	add	r3, r3, #48
	bne	.L16
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L19:
	.align	2
.L18:
	.word	player
	.word	playerBullets+12
	.size	initPlayerBullets, .-initPlayerBullets
	.align	2
	.global	firePlayerBullet
	.type	firePlayerBullet, %function
firePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldr	r0, .L26
	mov	r3, #0
	mov	r2, r0
.L23:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L25
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #48
	bne	.L23
.L20:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L25:
	ldr	r2, .L26+4
	ldr	r5, [r2, #4]
	ldr	ip, [r2, #20]
	add	r3, r3, r3, asl #1
	ldr	r4, [r2, #0]
	sub	r5, r5, #4
	add	r6, ip, ip, lsr #31
	str	r5, [r0, r3, asl #4]
	add	ip, r0, r3, asl #4
	mvn	r3, #2
	add	r4, r4, r6, asr #1
	str	r3, [ip, #12]
	mov	r3, #1
	str	r4, [ip, #4]
	str	r3, [ip, #24]
	str	r1, [ip, #28]
	str	r1, [r2, #28]
	b	.L20
.L27:
	.align	2
.L26:
	.word	playerBullets
	.word	player
	.size	firePlayerBullet, .-firePlayerBullet
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r5, .L41
	sub	sp, sp, #20
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L28
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L30
	ldr	r3, [r5, #0]
	cmp	r3, #1
	ble	.L30
	ldr	r2, [r5, #12]
	rsb	r3, r2, r3
	str	r3, [r5, #0]
.L31:
	ldr	r3, .L41+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L39
	ldr	r3, .L41+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L34
.L39:
	ldr	r3, [r5, #28]
.L33:
	add	r3, r3, #1
	ldr	r4, .L41+12
	str	r3, [r5, #28]
	ldr	r7, .L41
	ldr	r8, .L41+16
	ldr	fp, .L41+20
	ldr	r9, .L41+24
	add	r6, r4, #240
	mov	sl, #0
.L36:
	ldr	r3, [r4, #-20]
	cmp	r3, #0
	bne	.L40
.L35:
	add	r4, r4, #48
	cmp	r4, r6
	bne	.L36
	ldr	r4, [r5, #36]
	ldr	r3, .L41+28
	smull	ip, r3, r4, r3
	mov	r2, r4, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, asl #2
	cmp	r4, r3
	ldr	r6, .L41
	bne	.L37
	add	r0, r6, #40
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L41+32
	mov	lr, pc
	bx	r3
	str	r1, [r6, #40]
.L37:
	add	r4, r4, #1
	str	r4, [r5, #36]
.L28:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L30:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L31
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #0]
	rsb	r2, r2, #240
	cmp	r3, r2
	ldr	r2, .L41
	ldrlt	r1, [r2, #12]
	addlt	r3, r1, r3
	strlt	r3, [r2, #0]
	b	.L31
.L40:
	ldr	ip, [r4, #-44]
	str	ip, [sp, #0]
	ldr	ip, [r4, #-40]
	str	ip, [sp, #4]
	ldr	lr, [r4, #-28]
	str	lr, [sp, #8]
	ldr	ip, [r4, #-24]
	ldr	r0, [r5, #4]
	ldr	r1, [r5, #0]
	add	r2, r5, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L35
	ldr	r3, [r7, #32]
	ldr	r2, [r4, #0]
	sub	r3, r3, #1
	mov	r2, r2, asl #3
	mov	r1, #512	@ movhi
	cmp	r3, #0
	str	sl, [r4, #-20]
	strh	r1, [fp, r2]	@ movhi
	str	r3, [r7, #32]
	bgt	.L35
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #0]
	str	r2, [r9, #0]
	mov	r2, #1
	str	r3, [r9, #4]
	str	r2, [r9, #16]
	str	sl, [r9, #20]
	str	sl, [r9, #24]
	str	sl, [r7, #24]
	strh	r1, [fp, #0]	@ movhi
	b	.L35
.L34:
	ldr	r3, [r5, #28]
	cmp	r3, #29
	ble	.L33
	bl	firePlayerBullet
	ldr	r3, .L41
	ldr	r3, [r3, #28]
	b	.L33
.L42:
	.align	2
.L41:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	enemyBullets+44
	.word	collision
	.word	shadowOAM
	.word	pExplosion
	.word	1717986919
	.word	__aeabi_idivmod
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updatePlayerBullet
	.type	updatePlayerBullet, %function
updatePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r4, r0
	beq	.L44
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #16]
	add	r2, r3, r2
	cmp	r2, #0
	ldrgt	r2, [r0, #12]
	movle	r3, #0
	addgt	r3, r2, r3
	strgt	r3, [r0, #0]
	strle	r3, [r0, #24]
.L44:
	ldr	r5, [r4, #32]
	ldr	r3, .L47
	smull	r2, r3, r5, r3
	mov	r2, r5, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, asl #2
	cmp	r5, r3
	bne	.L46
	add	r0, r4, #36
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L46:
	add	r5, r5, #1
	str	r5, [r4, #32]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	updatePlayerBullet, .-updatePlayerBullet
	.align	2
	.global	drawPlayerBullet
	.type	drawPlayerBullet, %function
drawPlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L52
	ldr	r3, [r0, #28]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r0, #28]
.L49:
	ldmfd	sp!, {r4}
	bx	lr
.L52:
	ldr	r2, [r0, #44]
	ldr	ip, [r0, #36]
	ldr	r1, .L53
	ldrh	r4, [r0, #0]
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	mov	ip, ip, asl #5
	add	r3, r1, r2
	add	ip, ip, #18
	strh	r4, [r1, r2]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	b	.L49
.L54:
	.align	2
.L53:
	.word	shadowOAM
	.size	drawPlayerBullet, .-drawPlayerBullet
	.align	2
	.global	initEnemyBullets
	.type	initEnemyBullets, %function
initEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L58
	stmfd	sp!, {r4, r5}
	mov	r1, #36
	mov	r5, #4
	mov	r0, #3
	mov	r2, #0
	mov	r4, #2
	mov	ip, #1
.L56:
	str	r1, [r3, #32]
	add	r1, r1, #1
	cmp	r1, #41
	str	r5, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #-12]
	str	r2, [r3, #-8]
	str	r4, [r3, #0]
	str	r2, [r3, #12]
	str	ip, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r0, [r3, #28]
	add	r3, r3, #48
	bne	.L56
	ldmfd	sp!, {r4, r5}
	bx	lr
.L59:
	.align	2
.L58:
	.word	enemyBullets+12
	.size	initEnemyBullets, .-initEnemyBullets
	.align	2
	.global	fireEnemyBullet
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldr	r3, .L66
	mov	r2, #0
	mov	r1, r3
.L63:
	ldr	ip, [r1, #24]
	cmp	ip, #0
	beq	.L65
	add	r2, r2, #1
	cmp	r2, #5
	add	r1, r1, #48
	bne	.L63
.L60:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L65:
	ldr	r6, [r0, #24]
	ldr	r4, [r0, #0]
	ldr	r1, [r0, #28]
	add	r2, r2, r2, asl #1
	ldr	r0, [r0, #4]
	add	r4, r6, r4
	add	r5, r1, r1, lsr #31
	str	r4, [r3, r2, asl #4]
	add	r1, r3, r2, asl #4
	mov	r3, #2
	add	r0, r0, r5, asr #1
	str	r3, [r1, #12]
	mov	r3, #1
	str	r0, [r1, #4]
	str	r3, [r1, #24]
	str	ip, [r1, #28]
	b	.L60
.L67:
	.align	2
.L66:
	.word	enemyBullets
	.size	fireEnemyBullet, .-fireEnemyBullet
	.align	2
	.global	updateEnemyBullet
	.type	updateEnemyBullet, %function
updateEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r4, r0
	beq	.L69
	ldr	r3, [r0, #0]
	cmp	r3, #159
	ldrle	r2, [r0, #12]
	movgt	r3, #0
	addle	r3, r2, r3
	strle	r3, [r0, #0]
	strgt	r3, [r0, #24]
.L69:
	ldr	r5, [r4, #32]
	ldr	r3, .L72
	smull	r2, r3, r5, r3
	mov	r2, r5, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, asl #2
	cmp	r5, r3
	bne	.L71
	add	r0, r4, #36
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L72+4
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L71:
	add	r5, r5, #1
	str	r5, [r4, #32]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	updateEnemyBullet, .-updateEnemyBullet
	.align	2
	.global	drawEnemyBullet
	.type	drawEnemyBullet, %function
drawEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L77
	ldr	r3, [r0, #28]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r0, #28]
.L74:
	ldmfd	sp!, {r4}
	bx	lr
.L77:
	ldr	r2, [r0, #44]
	ldr	ip, [r0, #36]
	ldr	r1, .L78
	ldrh	r4, [r0, #0]
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	mov	ip, ip, asl #5
	add	r3, r1, r2
	add	ip, ip, #19
	strh	r4, [r1, r2]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	b	.L74
.L79:
	.align	2
.L78:
	.word	shadowOAM
	.size	drawEnemyBullet, .-drawEnemyBullet
	.align	2
	.global	initEnemies
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r3, .L90
	mov	r1, #0
	mov	r5, #1
	mov	r0, #20
	mov	sl, #8
	mov	r4, #5
	sub	sp, sp, #16
	mov	r2, r1
	str	r0, [r3, #0]
	mov	r7, r3
	str	sl, [r3, #24]
	str	r4, [r3, #16]
	str	r5, [r3, #20]
	str	r5, [r3, #32]
	str	r1, [r3, #36]
	mov	r0, #29
	mov	ip, r1
	ldr	r8, .L90+4
	mov	fp, #4
	b	.L81
.L88:
	umull	r4, r6, r8, r2
	mov	r6, r6, lsr #2
	add	r6, r6, r6, asl #1
	sub	r6, r2, r6, asl #1
	mov	r4, r1, asl #4
	and	r6, r6, #255
	rsb	r9, r1, r4
	mov	r6, r6, asl #4
	add	r9, r7, r9, asl #2
	add	r6, r6, #4
	str	r6, [r9, #4]
	mov	r6, #2
	str	sl, [r9, #28]
	strb	r6, [r9, #41]
.L84:
	add	r2, r2, #1
	rsb	r4, r1, r4
	and	r2, r2, #255
	add	r4, r7, r4, asl #2
	add	r1, r1, #1
	cmp	r2, #30
	str	ip, [r4, #44]
	str	ip, [r4, #48]
	str	fp, [r4, #52]
	str	r1, [r4, #56]
	beq	.L87
	umull	r4, r1, r8, r2
	mov	r1, r1, lsr #2
	add	r1, r1, r1, asl #1
	mov	r4, r1, asl #2
	cmp	r0, #6
	add	r4, r4, #20
	mov	r6, #5
	rsb	r1, r0, #30
	str	sl, [r3, #84]
	str	r4, [r3, #60]
	str	r6, [r3, #76]
	str	r5, [r3, #80]
	str	r5, [r3, #92]
	str	ip, [r3, #96]
	strleb	r5, [r3, #100]
	sub	r0, r0, #1
	add	r3, r3, #60
.L81:
	cmp	r2, #5
	bls	.L88
	cmp	r2, #23
	bls	.L89
	umull	r4, r6, r8, r2
	mov	r6, r6, lsr #2
	add	r6, r6, r6, asl #1
	mov	r4, r1, asl #4
	sub	r6, r2, r6, asl #1
	rsb	r9, r1, r4
	and	r6, r6, #255
	add	r9, r7, r9, asl #2
	mov	r6, r6, asl #4
	str	r6, [sp, #4]
	add	r6, r9, #40
	str	r6, [sp, #12]
	ldr	r6, [sp, #4]
	add	r6, r6, #1
	str	r6, [r9, #4]
	mov	r6, #12
	str	r6, [r9, #28]
	ldr	r6, [sp, #12]
	strb	ip, [r6, #1]
	b	.L84
.L89:
	umull	r4, r6, r8, r2
	mov	r6, r6, lsr #2
	add	r6, r6, r6, asl #1
	sub	r6, r2, r6, asl #1
	mov	r4, r1, asl #4
	and	r6, r6, #255
	rsb	r9, r1, r4
	mov	r6, r6, asl #4
	add	r9, r7, r9, asl #2
	add	r6, r6, #2
	str	r6, [r9, #4]
	mov	r6, #11
	str	r6, [r9, #28]
	strb	r5, [r9, #41]
	b	.L84
.L87:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L91:
	.align	2
.L90:
	.word	enemies
	.word	-1431655765
	.size	initEnemies, .-initEnemies
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r5, r0
	bne	.L93
	ldr	r2, [r0, #44]
	ldr	r3, .L117
	smull	r0, r3, r2, r3
.L113:
	mov	r1, r2, asr #31
	rsb	r3, r1, r3, asr #3
	add	r3, r3, r3, asl #2
	sub	r3, r2, r3, asl #2
	add	r1, r2, #1
	cmp	r3, #0
	mov	r4, r1
	beq	.L109
.L108:
	str	r4, [r5, #44]
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L104:
	ldr	r2, [r5, #0]
	rsb	r1, r1, #0
	mov	r3, #0
	cmp	r2, #139
	str	r1, [r5, #20]
	str	r3, [r5, #44]
	ble	.L114
	ldr	r2, [r4, #24]
	cmp	r2, #0
	ldr	r1, .L117+4
	moveq	r4, #1
	beq	.L107
	ldr	r2, .L117+8
	ldmia	r1, {r0, ip}	@ phole ldm
	str	r0, [r2, #4]
	str	r3, [r2, #20]
	str	r3, [r2, #24]
	str	r3, [r1, #24]
	mov	r0, #1
	ldr	r3, .L117+12
	str	ip, [r2, #0]
	str	r0, [r2, #16]
	mov	r2, #512	@ movhi
	strh	r2, [r3, #0]	@ movhi
	mov	r1, #1
.L109:
	mov	r4, r1
.L107:
	add	r0, r5, #48
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L117+16
	mov	lr, pc
	bx	r3
	str	r1, [r5, #48]
	b	.L108
.L93:
	ldr	r3, [r0, #56]
	cmp	r3, #24
	ble	.L115
.L95:
	ldrb	r3, [r5, #40]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L96
.L97:
	ldr	r4, .L117+20
	ldr	r1, [r5, #4]
	ldr	fp, .L117+24
	ldr	sl, .L117+28
	ldr	r9, .L117+32
	ldr	r7, .L117+36
	add	r6, r4, #240
	mov	r8, #0
.L101:
	ldr	r3, [r4, #-20]
	cmp	r3, #0
	bne	.L98
.L112:
	mov	r3, r1
.L99:
	add	r4, r4, #48
	cmp	r4, r6
	bne	.L101
	ldr	r4, .L117+4
	ldr	r2, [r4, #24]
	cmp	r2, #0
	bne	.L116
.L102:
	ldr	r2, [r5, #44]
	ldr	r1, [r5, #20]
	sub	r0, r2, #145
	add	r3, r3, r1
	cmp	r0, #144
	str	r3, [r5, #4]
	bls	.L104
	ldr	r3, .L117
	smull	r1, r3, r2, r3
	b	.L113
.L98:
	sub	ip, r4, #44
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r0, [r5, #0]
	add	r2, r5, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	stmia	sp, {ip, lr}	@ phole stm
	ldr	ip, [r4, #-28]
	str	ip, [sp, #8]
	ldr	ip, [r4, #-24]
	str	ip, [sp, #12]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L100
	ldr	r1, [r5, #4]
	b	.L112
.L115:
	add	r3, r3, #6
	ldr	r2, .L117+40
	rsb	r3, r3, r3, asl #4
	add	r3, r2, r3, asl #2
	ldr	r3, [r3, #32]
	cmp	r3, #0
	moveq	r3, #1
	streqb	r3, [r0, #40]
	bne	.L95
.L96:
	ldr	r3, .L117+44
	mov	lr, pc
	bx	r3
	ldr	r2, .L117+48
	smull	r1, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	rsb	r2, r3, r3, asl #5
	add	r3, r3, r2, asl #2
	sub	r0, r0, r3, asl #1
	cmp	r0, #1
	bne	.L97
	mov	r0, r5
	bl	fireEnemyBullet
	b	.L97
.L100:
	ldr	r0, [sl, #0]
	ldr	r2, [r5, #56]
	ldr	ip, [r4, #0]
	sub	r0, r0, #1
	mov	r2, r2, asl #3
	ldr	r3, [r9, #0]
	str	r2, [sp, #28]
	str	r0, [sl, #0]
	mov	ip, ip, asl #3
	ldr	r0, [r5, #0]
	mov	r2, #1
	ldr	r1, [r5, #4]
	str	ip, [sp, #20]
	str	r2, [r7, #16]
	ldr	ip, [sp, #28]
	ldr	r2, .L117+12
	str	r0, [r7, #0]
	add	r3, r3, #1
	mov	r0, #512	@ movhi
	str	r3, [r9, #0]
	str	r8, [r4, #-20]
	str	r1, [r7, #4]
	str	r8, [r7, #20]
	str	r8, [r7, #24]
	str	r8, [r5, #32]
	strh	r0, [r2, ip]	@ movhi
	ldr	ip, [sp, #20]
	mov	r3, r1
	strh	r0, [r2, ip]	@ movhi
	b	.L99
.L114:
	ldr	r3, [r5, #16]
	add	r2, r3, r2
	str	r2, [r5, #0]
	mov	r1, #1
	b	.L109
.L116:
	ldr	ip, [r4, #16]
	ldr	r6, [r4, #4]
	ldr	lr, [r4, #0]
	ldr	r7, [r4, #20]
	ldr	r0, [r5, #0]
	ldr	r2, [r5, #24]
	mov	r3, #12
	str	ip, [sp, #8]
	stmia	sp, {r6, lr}	@ phole stm
	str	r7, [sp, #12]
	ldr	ip, .L117+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldreq	r3, [r5, #4]
	beq	.L102
	ldr	r3, .L117+8
	mov	r2, #0
	ldr	r0, [r4, #4]
	ldr	r1, [r4, #0]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r4, #24]
	ldr	r2, .L117+12
	stmia	r3, {r0, r1}	@ phole stm
	mov	r0, #512	@ movhi
	mov	r1, #1
	str	r1, [r3, #16]
	ldr	r3, [r5, #4]
	strh	r0, [r2, #0]	@ movhi
	b	.L102
.L118:
	.align	2
.L117:
	.word	1717986919
	.word	player
	.word	pExplosion
	.word	shadowOAM
	.word	__aeabi_idivmod
	.word	playerBullets+44
	.word	collision
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	explosion
	.word	enemies
	.word	rand
	.word	274877907
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemy
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bne	.L122
	ldr	r3, [r0, #36]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r0, #36]
	bx	lr
.L122:
	ldr	r2, [r0, #56]
	ldr	ip, [r0, #0]
	ldr	r1, .L123
	mov	r2, r2, asl #3
	orr	ip, ip, #16384
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	ldrh	r2, [r0, #4]
	strh	r2, [r3, #2]	@ movhi
	ldr	r1, [r0, #48]
	ldrb	r2, [r0, #41]	@ zero_extendqisi2
	add	r2, r2, r1, asl #4
	add	r2, r2, #1
	mov	r2, r2, asl #1
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L124:
	.align	2
.L123:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	initBarriers
	.type	initBarriers, %function
initBarriers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L128
	stmfd	sp!, {r4, r5, r6, r7}
	mov	r1, #41
	mov	r2, #36
	mov	r7, #125
	mov	r6, #8
	mov	r5, #16
	mov	r4, #3
	mov	ip, #1
	mov	r0, #0
.L126:
	str	r2, [r3, #4]
	add	r2, r2, #50
	cmp	r2, #236
	str	r1, [r3, #28]
	str	r7, [r3, #0]
	str	r6, [r3, #8]
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	add	r1, r1, #1
	add	r3, r3, #32
	bne	.L126
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L129:
	.align	2
.L128:
	.word	barriers
	.size	initBarriers, .-initBarriers
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	initPlayer
	bl	initPlayerBullets
	bl	initEnemyBullets
	bl	initEnemies
	bl	initBarriers
	ldr	r2, .L131
	ldr	r1, .L131+4
	mov	r3, #0
	str	r3, [r2, #0]
	str	r3, [r2, #4]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	str	r3, [r2, #24]
	str	r3, [r1, #0]
	str	r3, [r1, #4]
	str	r3, [r1, #16]
	str	r3, [r1, #20]
	str	r3, [r1, #24]
	mov	r3, #49
	mov	r4, #8
	mov	ip, #16
	mov	r0, #4
	str	r3, [r2, #32]
	ldr	r3, .L131+8
	mov	r5, #48
	str	r4, [r2, #8]
	str	ip, [r2, #12]
	str	r0, [r2, #28]
	mov	r2, #30
	str	r4, [r1, #8]
	str	ip, [r1, #12]
	str	r0, [r1, #28]
	str	r5, [r1, #32]
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	pExplosion
	.word	explosion
	.word	.LANCHOR1
	.size	initGame, .-initGame
	.align	2
	.global	updateBarrier
	.type	updateBarrier, %function
updateBarrier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L144
	ldr	r7, .L144+4
	ldr	r8, .L144+8
	sub	sp, sp, #20
	mov	r5, r0
	add	r6, r4, #240
	mov	sl, #0
.L136:
	ldr	r3, [r4, #-20]
	cmp	r3, #0
	beq	.L134
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L142
.L134:
	add	r4, r4, #48
	cmp	r4, r6
	bne	.L136
	ldr	r4, .L144+12
	ldr	r7, .L144+4
	ldr	r8, .L144+8
	add	r6, r4, #240
	mov	sl, #0
.L139:
	ldr	r3, [r4, #-20]
	cmp	r3, #0
	beq	.L137
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L143
.L137:
	add	r4, r4, #48
	cmp	r4, r6
	bne	.L139
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L142:
	sub	ip, r4, #44
	ldmia	ip, {ip, lr}	@ phole ldm
	sub	r9, r4, #28
	ldmia	r9, {r9, fp}	@ phole ldm
	ldmia	r5, {r0, r1, r2, r3}	@ phole ldm
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L134
	ldr	r3, [r5, #16]
	ldr	r2, [r4, #0]
	cmp	r3, #0
	mov	r2, r2, asl #3
	mov	r1, #512	@ movhi
	str	sl, [r4, #-20]
	ldrle	r3, [r5, #28]
	strh	r1, [r8, r2]	@ movhi
	ldrgt	r2, [r5, #24]
	subgt	r3, r3, #1
	addgt	r2, r2, #1
	movle	r3, r3, asl #3
	movle	r2, #512	@ movhi
	strle	sl, [r5, #20]
	strgt	r3, [r5, #16]
	strgt	r2, [r5, #24]
	strleh	r2, [r8, r3]	@ movhi
	b	.L134
.L143:
	sub	ip, r4, #44
	ldmia	ip, {ip, lr}	@ phole ldm
	sub	r9, r4, #28
	ldmia	r9, {r9, fp}	@ phole ldm
	ldmia	r5, {r0, r1, r2, r3}	@ phole ldm
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L137
	ldr	r3, [r5, #16]
	ldr	r2, [r4, #0]
	cmp	r3, #0
	mov	r2, r2, asl #3
	mov	r1, #512	@ movhi
	str	sl, [r4, #-20]
	ldrle	r3, [r5, #28]
	strh	r1, [r8, r2]	@ movhi
	ldrgt	r2, [r5, #24]
	subgt	r3, r3, #1
	addgt	r2, r2, #1
	movle	r3, r3, asl #3
	movle	r2, #512	@ movhi
	strle	sl, [r5, #20]
	strgt	r3, [r5, #16]
	strgt	r2, [r5, #24]
	strleh	r2, [r8, r3]	@ movhi
	b	.L137
.L145:
	.align	2
.L144:
	.word	playerBullets+44
	.word	collision
	.word	shadowOAM
	.word	enemyBullets+44
	.size	updateBarrier, .-updateBarrier
	.align	2
	.global	drawBarrier
	.type	drawBarrier, %function
drawBarrier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L146
	ldr	r2, [r0, #28]
	ldr	ip, [r0, #24]
	ldr	r4, [r0, #0]
	ldr	r1, .L148
	ldrh	r0, [r0, #4]
	mov	r2, r2, asl #3
	mov	ip, ip, asl #5
	add	r3, r1, r2
	orr	r4, r4, #16384
	add	ip, ip, #8
	strh	r0, [r3, #2]	@ movhi
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
.L146:
	ldmfd	sp!, {r4}
	bx	lr
.L149:
	.align	2
.L148:
	.word	shadowOAM
	.size	drawBarrier, .-drawBarrier
	.align	2
	.global	initExplosion
	.type	initExplosion, %function
initExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L151
	mov	r2, #0
	mov	r1, #8
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #4
	str	r1, [r3, #8]
	str	r2, [r3, #28]
	mov	r1, #16
	mov	r2, #48
	str	r1, [r3, #12]
	str	r2, [r3, #32]
	bx	lr
.L152:
	.align	2
.L151:
	.word	explosion
	.size	initExplosion, .-initExplosion
	.align	2
	.global	explode
	.type	explode, %function
explode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L154
	ldr	r1, [r0, #4]
	ldr	ip, [r0, #0]
	mov	r2, #0
	str	r1, [r3, #4]
	mov	r1, #1
	str	ip, [r3, #0]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	bx	lr
.L155:
	.align	2
.L154:
	.word	explosion
	.size	explode, .-explode
	.align	2
	.global	updateExplosion
	.type	updateExplosion, %function
updateExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L160
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldreq	r2, [r3, #24]
	beq	.L158
	ldr	r2, [r3, #20]
	add	r1, r2, #1
	cmp	r1, #0
	movge	r2, r1
	addlt	r2, r2, #4
	mov	r2, r2, asr #2
	str	r1, [r3, #20]
	str	r2, [r3, #24]
.L158:
	ldr	r3, [r3, #28]
	cmp	r3, r2
	ldr	r3, .L160
	bxgt	lr
	ldr	r2, [r3, #32]
	mov	r1, #0
	str	r1, [r3, #16]
	ldr	r3, .L160+4
	mov	r2, r2, asl #3
	mov	r1, #512	@ movhi
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L161:
	.align	2
.L160:
	.word	explosion
	.word	shadowOAM
	.size	updateExplosion, .-updateExplosion
	.align	2
	.global	drawExplosion
	.type	drawExplosion, %function
drawExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L164
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L162
	ldr	r1, [r3, #32]
	ldr	ip, [r3, #24]
	ldr	r4, [r3, #0]
	ldr	r0, .L164+4
	mov	r1, r1, asl #3
	mov	ip, ip, asl #5
	ldrh	r3, [r3, #4]
	add	r2, r0, r1
	orr	r4, r4, #16384
	add	ip, ip, #16
	strh	r4, [r0, r1]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r3, [r2, #2]	@ movhi
.L162:
	ldmfd	sp!, {r4}
	bx	lr
.L165:
	.align	2
.L164:
	.word	explosion
	.word	shadowOAM
	.size	drawExplosion, .-drawExplosion
	.align	2
	.global	initpExplosion
	.type	initpExplosion, %function
initpExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L167
	mov	r2, #0
	mov	r1, #8
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #4
	str	r1, [r3, #8]
	str	r2, [r3, #28]
	mov	r1, #16
	mov	r2, #49
	str	r1, [r3, #12]
	str	r2, [r3, #32]
	bx	lr
.L168:
	.align	2
.L167:
	.word	pExplosion
	.size	initpExplosion, .-initpExplosion
	.align	2
	.global	pExplode
	.type	pExplode, %function
pExplode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L170
	ldr	r3, .L170+4
	ldmia	r2, {r0, ip}	@ phole ldm
	mov	r1, #0
	str	r0, [r3, #4]
	mov	r0, #1
	str	ip, [r3, #0]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	ldr	r3, .L170+8
	str	r1, [r2, #24]
	mov	r2, #512	@ movhi
	strh	r2, [r3, #0]	@ movhi
	bx	lr
.L171:
	.align	2
.L170:
	.word	player
	.word	pExplosion
	.word	shadowOAM
	.size	pExplode, .-pExplode
	.align	2
	.global	updatepExplosion
	.type	updatepExplosion, %function
updatepExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L176
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldrne	r1, [r3, #20]
	ldrne	r2, .L176+4
	addne	r1, r1, #1
	smullne	r0, r2, r1, r2
	movne	r0, r1, asr #31
	rsbne	r2, r0, r2, asr #3
	ldreq	r2, [r3, #24]
	strne	r1, [r3, #20]
	strne	r2, [r3, #24]
	ldr	r3, [r3, #28]
	cmp	r2, r3, asl #1
	ldr	r3, .L176
	bxlt	lr
	mov	r1, #0
	ldr	r2, [r3, #32]
	str	r1, [r3, #16]
	ldr	r3, .L176+8
	mov	r1, #1
	str	r1, [r3, #4]
	ldr	r3, .L176+12
	mov	r2, r2, asl #3
	mov	r1, #512	@ movhi
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L177:
	.align	2
.L176:
	.word	pExplosion
	.word	1717986919
	.word	.LANCHOR0
	.word	shadowOAM
	.size	updatepExplosion, .-updatepExplosion
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	updatePlayer
	bl	updateExplosion
	bl	updatepExplosion
	ldr	r5, .L188
	mov	r4, #0
.L179:
	add	r0, r4, r4, asl #1
	add	r0, r5, r0, asl #4
	add	r4, r4, #1
	bl	updatePlayerBullet
	cmp	r4, #5
	bne	.L179
	ldr	r5, .L188+4
	mov	r4, #0
.L180:
	add	r0, r4, r4, asl #1
	add	r0, r5, r0, asl #4
	add	r4, r4, #1
	bl	updateEnemyBullet
	cmp	r4, #5
	bne	.L180
	ldr	r5, .L188+8
	mov	r4, #0
.L181:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	updateBarrier
	cmp	r4, #4
	bne	.L181
	ldr	r5, .L188+12
	mov	r4, #0
.L182:
	rsb	r0, r4, r4, asl #4
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	updateEnemy
	cmp	r4, #30
	bne	.L182
	ldr	r3, .L188+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldreq	r3, .L188+20
	moveq	r2, #1
	streq	r2, [r3, #8]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L189:
	.align	2
.L188:
	.word	playerBullets
	.word	enemyBullets
	.word	barriers
	.word	enemies
	.word	.LANCHOR1
	.word	.LANCHOR0
	.size	updateGame, .-updateGame
	.align	2
	.global	drawpExplosion
	.type	drawpExplosion, %function
drawpExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L192
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L190
	ldr	r1, [r3, #32]
	ldr	ip, [r3, #24]
	ldr	r4, [r3, #0]
	ldr	r0, .L192+4
	mov	r1, r1, asl #3
	mov	ip, ip, asl #5
	ldrh	r3, [r3, #4]
	add	r2, r0, r1
	orr	r4, r4, #16384
	add	ip, ip, #14
	strh	r4, [r0, r1]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r3, [r2, #2]	@ movhi
.L190:
	ldmfd	sp!, {r4}
	bx	lr
.L193:
	.align	2
.L192:
	.word	pExplosion
	.word	shadowOAM
	.size	drawpExplosion, .-drawpExplosion
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L208
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L208+4
	ldr	r2, [r3, #32]
	mov	r0, #8	@ movhi
	mov	r1, #360
	mov	r3, #360
	strh	r0, [r6, r1]	@ movhi
	add	r3, r3, #2
	mov	r1, #210	@ movhi
	strh	r1, [r6, r3]	@ movhi
	add	r2, r2, #192
	mov	r3, #364
	strh	r2, [r6, r3]	@ movhi
	bl	drawScore
	bl	drawPlayer
	bl	drawpExplosion
	ldr	r3, .L208+8
	mov	lr, #1
	add	r0, r3, #240
.L197:
	ldr	r2, [r3, #-20]
	cmp	r2, #0
	beq	.L195
	ldr	r1, [r3, #0]
	ldr	ip, [r3, #-8]
	ldrh	r4, [r3, #-44]
	mov	r1, r1, asl #3
	add	r2, r6, r1
	mov	ip, ip, asl #5
	strh	r4, [r6, r1]	@ movhi
	ldrh	r1, [r3, #-40]
	add	ip, ip, #18
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
.L196:
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L197
	ldr	r3, .L208+12
	mov	lr, #1
	add	r0, r3, #240
.L200:
	ldr	r2, [r3, #-20]
	cmp	r2, #0
	beq	.L198
	ldr	r1, [r3, #0]
	ldr	ip, [r3, #-8]
	ldrh	r4, [r3, #-44]
	mov	r1, r1, asl #3
	add	r2, r6, r1
	mov	ip, ip, asl #5
	strh	r4, [r6, r1]	@ movhi
	ldrh	r1, [r3, #-40]
	add	ip, ip, #19
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
.L199:
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L200
	ldr	r5, .L208+16
	mov	r4, #0
.L201:
	rsb	r0, r4, r4, asl #4
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	drawEnemy
	cmp	r4, #30
	bne	.L201
	ldr	r3, .L208+20
	add	r0, r3, #128
.L203:
	ldr	r2, [r3, #0]
	cmp	r2, #0
	beq	.L202
	ldr	r1, [r3, #8]
	ldr	r4, [r3, #-20]
	ldr	ip, [r3, #4]
	mov	r1, r1, asl #3
	orr	r4, r4, #16384
	mov	ip, ip, asl #5
	strh	r4, [r6, r1]	@ movhi
	ldrh	r4, [r3, #-16]
	add	r2, r6, r1
	add	ip, ip, #8
	strh	ip, [r2, #4]	@ movhi
	strh	r4, [r2, #2]	@ movhi
.L202:
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L203
	ldmfd	sp!, {r4, r5, r6, lr}
	b	drawExplosion
.L198:
	ldr	r2, [r3, #-16]
	cmp	r2, #0
	streq	lr, [r3, #-16]
	b	.L199
.L195:
	ldr	r2, [r3, #-16]
	cmp	r2, #0
	streq	lr, [r3, #-16]
	b	.L196
.L209:
	.align	2
.L208:
	.word	player
	.word	shadowOAM
	.word	playerBullets+44
	.word	enemyBullets+44
	.word	enemies
	.word	barriers+20
	.size	drawGame, .-drawGame
	.global	enemiesRemaining
	.global	gameOver
	.global	gameWon
	.global	score
	.comm	player,48,4
	.comm	playerBullets,240,4
	.comm	enemyBullets,240,4
	.comm	enemies,1800,4
	.comm	barriers,128,4
	.comm	explosion,36,4
	.comm	pExplosion,36,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	enemiesRemaining, %object
	.size	enemiesRemaining, 4
enemiesRemaining:
	.word	30
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.type	gameOver, %object
	.size	gameOver, 4
gameOver:
	.space	4
	.type	gameWon, %object
	.size	gameWon, 4
gameWon:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
