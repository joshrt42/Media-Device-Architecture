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
	mov	r1, #16
	str	r1, [r3, #0]
	str	r1, [r3, #8]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	mov	r1, #3
	mov	r2, #0
	mov	ip, #135
	mov	r0, #1
	str	r1, [r3, #56]
	mov	r1, #13
	str	ip, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r1, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
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
	ldr	r3, .L8
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L4
	ldr	r2, .L8+4
	ldr	ip, [r3, #8]
	ldr	r2, [r2, #0]
	ldr	r5, [r3, #52]
	ldr	r1, .L8+8
	mov	ip, ip, asl #23
	mov	r2, r2, asl #3
	mov	ip, ip, lsr #23
	add	r0, r1, r2
	orr	ip, ip, #16384
	cmp	r5, #0
	ldrb	r4, [r3, #12]	@ zero_extendqisi2
	strh	ip, [r0, #2]	@ movhi
	orrne	ip, ip, #4096
	strneh	ip, [r0, #2]	@ movhi
	ldr	r0, [r3, #44]
	ldr	r3, [r3, #40]
	add	r3, r3, r0, asl #5
	strh	r4, [r1, r2]	@ movhi
	mov	r3, r3, asl #1
	add	r2, r1, r2
	strh	r3, [r2, #4]	@ movhi
.L4:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	.LANCHOR0
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
	ldr	r3, .L12
	stmfd	sp!, {r4, r5, r6}
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L10
	ldr	r2, .L12+4
	ldr	r0, [r2, #4]
	ldr	r5, [r3, #56]
	add	r4, r0, #1
	ldr	r3, .L12+8
	mov	r2, #16384
	mov	r4, r4, asl #3
	add	r2, r2, #8
	mov	r0, r0, asl #3
	add	ip, r3, r4
	mov	r6, #324	@ movhi
	strh	r2, [r3, r4]	@ movhi
	mov	r5, r5, asl #5
	mov	r2, #220	@ movhi
	add	r1, r3, r0
	strh	r6, [ip, #4]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	add	r5, r5, #4
	mov	r6, #8	@ movhi
	mov	r2, #232	@ movhi
	strh	r5, [r1, #4]	@ movhi
	strh	r6, [r3, r0]	@ movhi
	strh	r2, [r1, #2]	@ movhi
.L10:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawHealth, .-drawHealth
	.align	2
	.global	drawTime
	.type	drawTime, %function
drawTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	r2, .L15+4
	ldr	r0, [r3, #12]
	smull	r1, r2, r0, r2
	mov	ip, r0, asr #31
	ldr	r1, [r3, #8]
	rsb	r2, ip, r2, asr #2
	ldr	r3, .L15+8
	add	ip, r2, r2, asl #2
	add	r8, r1, #1
	add	r6, r1, #2
	sub	r0, r0, ip, asl #1
	mov	r1, r1, asl #3
	mov	sl, #16384	@ movhi
	strh	sl, [r3, r1]	@ movhi
	add	r5, r3, r1
	mov	r8, r8, asl #3
	mov	r6, r6, asl #3
	mov	r7, #0
	mov	r1, #356	@ movhi
	mov	r2, r2, asl #5
	mov	r0, r0, asl #5
	add	r4, r3, r8
	add	ip, r3, r6
	strh	r1, [r5, #4]	@ movhi
	strh	r7, [r3, r8]	@ movhi
	add	r2, r2, #4
	add	r0, r0, #4
	strh	r7, [r3, r6]	@ movhi
	mov	sl, #232	@ movhi
	mov	r3, #220	@ movhi
	mov	r1, #236	@ movhi
	strh	r3, [r5, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	strh	sl, [r4, #2]	@ movhi
	strh	r0, [ip, #4]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.word	1717986919
	.word	shadowOAM
	.size	drawTime, .-drawTime
	.align	2
	.global	drawGun
	.type	drawGun, %function
drawGun:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L20
	ldr	r0, [r1, #52]
	cmp	r0, #0
	ldr	ip, [r1, #12]
	ldr	r3, .L20+4
	ldreq	r1, [r1, #8]
	ldr	r3, [r3, #0]
	ldrne	r1, [r1, #8]
	subeq	r1, r1, #4
	ldr	r2, .L20+8
	moveq	r1, r1, asl #23
	add	ip, ip, #8
	mov	r3, r3, asl #3
	addne	r1, r1, #12
	moveq	r1, r1, lsr #23
	and	ip, ip, #255
	add	r0, r2, r3
	strh	ip, [r2, r3]	@ movhi
	bicne	r1, r1, #65024
	add	r3, r2, r3
	orreq	r1, r1, #4096
	mov	r2, #516	@ movhi
	strneh	r1, [r0, #2]	@ movhi
	streqh	r1, [r0, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L21:
	.align	2
.L20:
	.word	player
	.word	.LANCHOR1
	.word	shadowOAM
	.size	drawGun, .-drawGun
	.align	2
	.global	drawEnemiesRemaining
	.type	drawEnemiesRemaining, %function
drawEnemiesRemaining:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	stmfd	sp!, {r4, r5, r6}
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L22
	ldr	r3, .L24+4
	add	r0, r3, #16
	ldmia	r0, {r0, r5}	@ phole ldm
	add	r4, r0, #1
	ldr	r3, .L24+8
	mov	r2, #16384
	mov	r4, r4, asl #3
	add	r2, r2, #16
	mov	r0, r0, asl #3
	add	ip, r3, r4
	mov	r6, #548	@ movhi
	strh	r2, [r3, r4]	@ movhi
	mov	r5, r5, asl #5
	mov	r2, #220	@ movhi
	add	r1, r3, r0
	strh	r6, [ip, #4]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	add	r5, r5, #4
	mov	r6, #16	@ movhi
	mov	r2, #232	@ movhi
	strh	r5, [r1, #4]	@ movhi
	strh	r6, [r3, r0]	@ movhi
	strh	r2, [r1, #2]	@ movhi
.L22:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawEnemiesRemaining, .-drawEnemiesRemaining
	.align	2
	.global	initCats
	.type	initCats, %function
initCats:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	sl, #-1241513984
	mov	r5, #0
	add	sl, sl, #745472
	ldr	r4, .L31
	ldr	fp, .L31+4
	ldr	r8, .L31+8
	ldr	r9, .L31+12
	add	sl, sl, #183
	mov	r6, r5
	mov	r7, #1
.L29:
	ldr	r3, [fp, #4]
	sub	r3, r3, #16
	str	r3, [r4, #-8]
	mov	lr, pc
	bx	r8
	smull	r1, r3, sl, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #8
	add	r3, r3, r3, asl #1
	ldr	r2, [r4, #-8]
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #3
	add	r0, r0, #100
	str	r2, [r4, #0]
	mov	r3, #32
	mov	r2, #24
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	str	r0, [r4, #-4]
	stmib	r4, {r0, r6, r7}	@ phole stm
	str	r7, [r4, #24]
	mov	lr, pc
	bx	r8
	and	r3, r5, #255
	umull	r1, r2, r9, r3
	mov	r2, r2, lsr #1
	add	r2, r2, r2, asl #1
	str	r5, [r4, #48]
	rsb	r2, r2, r3
	add	r5, r5, #1
	cmp	r3, #2
	movls	r3, #0
	movhi	r3, #1
	and	r2, r2, #255
	mov	r1, #5
	cmp	r5, #6
	str	r0, [r4, #28]
	str	r6, [r4, #32]
	str	r1, [r4, #36]
	str	r2, [r4, #40]
	str	r6, [r4, #52]
	str	r3, [r4, #44]
	add	r4, r4, #64
	bne	.L29
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	cats+8
	.word	player
	.word	rand
	.word	-1431655765
	.size	initCats, .-initCats
	.global	__aeabi_idivmod
	.align	2
	.global	updateCat
	.type	updateCat, %function
updateCat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r5, r0
	beq	.L33
	ldr	r3, [r0, #52]
	cmp	r3, #0
	bne	.L44
	ldr	r7, [r0, #28]
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #20]
	add	r3, r7, r7, lsr #31
	mov	r3, r3, asr #1
	rsb	r3, r3, #0
	rsb	r2, r2, r1
	cmp	r2, r3
	movle	r3, #1
	str	r2, [r0, #4]
	strle	r3, [r0, #52]
.L36:
	ldr	r8, [r5, #36]
	ldr	r3, .L47
	smull	r2, r3, r8, r3
	mov	r2, r8, asr #31
	add	r3, r3, r8
	rsb	r3, r2, r3, asr #2
	rsb	r3, r3, r3, asl #3
	cmp	r8, r3
	bne	.L37
	add	r0, r5, #40
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	str	r1, [r5, #40]
.L37:
	add	r6, r5, #8
	ldmia	r6, {r6, lr}	@ phole ldm
	ldr	ip, [r5, #24]
	ldr	r4, .L47+8
	add	r8, r8, #1
	add	lr, lr, #6
	add	r6, r6, #12
	sub	r7, r7, #12
	str	r8, [r5, #36]
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r8, .L47+12
	stmia	sp, {r6, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r7, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L45
.L38:
	ldr	r4, .L47+16
	ldr	r7, .L47+20
	ldr	sl, .L47+24
	add	r6, r4, #180
	mov	r9, #0
.L40:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L46
.L39:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L40
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #12]
	rsb	r2, r2, #0
	cmp	r3, r2
	movlt	r3, #1
	blt	.L41
	cmp	r3, #240
	movle	r3, #0
	movgt	r3, #1
.L41:
	str	r3, [r5, #60]
.L33:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L44:
	ldr	r7, [r0, #28]
	add	r3, r7, r7, lsr #31
	ldr	r2, [r0, #4]
	ldr	r1, [r0, #20]
	mov	r3, r3, asr #1
	rsb	r3, r3, #764
	add	r3, r3, #3
	add	r2, r1, r2
	cmp	r3, r2
	movlt	r3, #0
	str	r2, [r0, #4]
	strlt	r3, [r0, #52]
	b	.L36
.L46:
	ldr	lr, [r4, #4]
	sub	lr, lr, #1
	ldr	ip, [r4, #20]
	ldr	r1, [r5, #12]
	add	r2, r5, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r5, #8]
	str	lr, [sp, #0]
	ldr	fp, [r4, #12]
	add	ip, ip, #2
	stmib	sp, {fp, ip}	@ phole stm
	ldr	ip, [r4, #24]
	add	r1, r1, #4
	add	r2, r2, #32
	sub	r3, r3, #8
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L39
	mov	r1, #4672
	mov	r2, #11008
	str	r9, [r4, #28]
	ldr	r0, .L47+28
	add	r1, r1, #44
	add	r2, r2, #17
	mov	r3, r9
	str	r9, [r5, #32]
	ldr	fp, .L47+32
	mov	lr, pc
	bx	fp
	ldr	r3, [r5, #56]
	ldr	r2, [r7, #24]
	add	r2, r2, r3
	mov	r2, r2, asl #3
	ldrh	r0, [sl, r2]
	ldr	r1, [r7, #28]
	ldr	r3, [r4, #32]
	orr	r0, r0, #512
	strh	r0, [sl, r2]	@ movhi
	add	r3, r1, r3
	mov	r3, r3, asl #3
	ldrh	r1, [sl, r3]
	ldr	r2, [r7, #20]
	orr	r1, r1, #512
	sub	r2, r2, #1
	strh	r1, [sl, r3]	@ movhi
	str	r2, [r7, #20]
	b	.L39
.L45:
	ldr	ip, [r4, #56]
	mov	r3, #0
	sub	ip, ip, #1
	mov	r1, #4672
	mov	r2, #11008
	str	r3, [r5, #32]
	ldr	r0, .L47+28
	add	r1, r1, #44
	add	r2, r2, #17
	str	ip, [r4, #56]
	ldr	ip, .L47+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L47+20
	ldr	r2, [r5, #56]
	ldr	r0, [r3, #24]
	ldr	r1, .L47+24
	add	r2, r0, r2
	mov	r2, r2, asl #3
	ldrh	ip, [r1, r2]
	ldr	r0, [r3, #20]
	orr	ip, ip, #512
	sub	r0, r0, #1
	strh	ip, [r1, r2]	@ movhi
	str	r0, [r3, #20]
	b	.L38
.L48:
	.align	2
.L47:
	.word	-1840700269
	.word	__aeabi_idivmod
	.word	player
	.word	collision
	.word	bullets
	.word	.LANCHOR0
	.word	shadowOAM
	.word	soundCat
	.word	playSoundB
	.size	updateCat, .-updateCat
	.align	2
	.global	drawCat
	.type	drawCat, %function
drawCat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	r3, [r0, #60]
	cmp	r3, #0
	bne	.L53
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L49
	ldr	r2, .L54
	ldr	r3, [r0, #56]
	ldr	r1, [r2, #24]
	ldr	ip, [r0, #12]
	ldr	r5, [r0, #52]
	ldr	r2, .L54+4
	add	r3, r1, r3
	mov	ip, ip, asl #23
	mov	r3, r3, asl #3
	mov	ip, ip, lsr #23
	add	r1, r2, r3
	orr	ip, ip, #32768
	cmp	r5, #0
	ldrb	r4, [r0, #8]	@ zero_extendqisi2
	strh	ip, [r1, #2]	@ movhi
	orrne	ip, ip, #4096
	strneh	ip, [r1, #2]	@ movhi
	ldr	r1, [r0, #48]
	ldr	r0, [r0, #40]
	add	r0, r1, r0, asl #5
	mov	r0, r0, asl #2
	add	r0, r0, #6
	add	r1, r1, #1
	strh	r4, [r2, r3]	@ movhi
	orr	r1, r0, r1, asl #12
	add	r3, r2, r3
	strh	r1, [r3, #4]	@ movhi
.L49:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L53:
	ldr	r2, .L54
	ldr	r3, [r0, #56]
	ldr	r1, [r2, #24]
	ldr	r2, .L54+4
	add	r3, r1, r3
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	b	.L49
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawCat, .-drawCat
	.align	2
	.global	initCheese
	.type	initCheese, %function
initCheese:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L59
	ldr	fp, .L59+4
	ldr	r9, .L59+8
	mov	r5, #0
	mov	r6, #32
	mov	sl, #10
	mov	r8, #14
.L57:
	ldr	r2, .L59+12
	ldr	r7, [r2, #4]
	mov	lr, pc
	bx	fp
	smull	r2, r3, r9, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #5
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #2
	rsb	r7, r0, r7
	mov	r3, #1
	mov	r2, #0
	str	r6, [r4, #-24]
	str	r6, [r4, #-20]
	str	r7, [r4, #-32]
	str	r7, [r4, #-28]
	str	sl, [r4, #-16]
	str	r8, [r4, #-12]
	str	r3, [r4, #-8]
	str	r2, [r4, #-4]
	str	r5, [r4], #36
	add	r5, r5, r3
	cmp	r5, #9
	add	r6, r6, #90
	bne	.L57
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	cheese+32
	.word	rand
	.word	-2004318071
	.word	player
	.size	initCheese, .-initCheese
	.align	2
	.global	updateCheese
	.type	updateCheese, %function
updateCheese:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r4, r0
	bne	.L66
.L61:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L66:
	ldr	ip, [r4, #20]
	ldr	r7, [r4, #4]
	add	r6, r4, #12
	ldmia	r6, {r6, lr}	@ phole ldm
	ldr	r5, .L69
	str	ip, [sp, #12]
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	add	r2, r5, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	r7, [sp, #0]
	stmib	sp, {r6, lr}	@ phole stm
	ldr	ip, .L69+4
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L67
.L63:
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #12]
	rsb	r2, r2, #0
	cmp	r3, r2
	movlt	r3, #1
	strlt	r3, [r4, #28]
	blt	.L61
.L68:
	cmp	r3, #240
	movle	r3, #0
	movgt	r3, #1
	str	r3, [r4, #28]
	b	.L61
.L67:
	mov	r3, #0
	mov	r1, #3200
	mov	r2, #11008
	str	r3, [r4, #24]
	ldr	r0, .L69+8
	add	r1, r1, #8
	add	r2, r2, #17
	ldr	ip, .L69+12
	mov	lr, pc
	bx	ip
	ldr	r3, .L69+16
	ldr	r2, [r4, #32]
	ldr	r0, [r3, #36]
	ldr	r1, .L69+20
	add	r2, r0, r2
	mov	r2, r2, asl #3
	ldrh	r0, [r1, r2]
	ldr	r6, [r5, #60]
	ldr	ip, [r3, #32]
	add	r6, r6, #1
	sub	ip, ip, #1
	orr	r0, r0, #512
	str	r6, [r5, #60]
	str	ip, [r3, #32]
	strh	r0, [r1, r2]	@ movhi
	b	.L63
.L70:
	.align	2
.L69:
	.word	player
	.word	collision
	.word	cheeseCollected
	.word	playSoundB
	.word	.LANCHOR0
	.word	shadowOAM
	.size	updateCheese, .-updateCheese
	.align	2
	.global	drawCheese
	.type	drawCheese, %function
drawCheese:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L74
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L71
	ldr	r1, .L75
	ldr	r2, [r0, #32]
	ldr	r3, [r0, #12]
	ldr	r1, [r1, #36]
	ldr	ip, .L75+4
	add	r1, r1, r2
	mov	r3, r3, asl #23
	ldrb	r4, [r0, #4]	@ zero_extendqisi2
	mov	r1, r1, asl #3
	mov	r0, r3, lsr #23
	mov	r3, #16640
	add	r2, ip, r1
	orr	r0, r0, #16384
	add	r3, r3, #164
	strh	r4, [ip, r1]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
.L71:
	ldmfd	sp!, {r4}
	bx	lr
.L74:
	ldr	r2, .L75
	ldr	r3, [r0, #32]
	ldr	r1, [r2, #36]
	ldr	r2, .L75+4
	add	r3, r1, r3
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	b	.L71
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawCheese, .-drawCheese
	.align	2
	.global	drawCheeseRemaining
	.type	drawCheeseRemaining, %function
drawCheeseRemaining:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L80
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ble	.L78
	ldr	r5, [r3, #40]
	mov	r1, #16384
	ldr	r3, .L80+4
	add	ip, r5, #1
	add	r1, r1, #24
	mov	r5, r5, asl #3
	add	r4, r3, r5
	strh	r1, [r3, r5]	@ movhi
	mov	r1, #220	@ movhi
	strh	r1, [r4, #2]	@ movhi
	mov	r1, #388	@ movhi
	mov	ip, ip, asl #3
	strh	r1, [r4, #4]	@ movhi
	mov	r2, r2, asl #5
	mov	r1, #24	@ movhi
	add	r0, r3, ip
	add	r2, r2, #4
	strh	r1, [r3, ip]	@ movhi
	mov	r3, #232	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
.L77:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L78:
	ldr	r2, .L80+8
	ldr	r4, [r2, #4]
	ldr	r1, [r3, #40]
	add	r4, r4, #4
	ldr	r3, .L80+4
	mov	ip, r4, asr #31
	mov	r2, #16384
	mov	r0, r1, asl #3
	mov	ip, ip, lsr #30
	add	r2, r2, #24
	strh	r2, [r3, r0]	@ movhi
	add	r4, r4, ip
	add	r1, r1, #1
	mov	r1, r1, asl #3
	and	r4, r4, #3
	ldrh	r5, [r3, r1]
	rsb	ip, ip, r4
	add	ip, ip, #16
	add	r2, r3, r0
	mov	ip, ip, asl #5
	orr	r0, r5, #512
	add	ip, ip, #2
	strh	r0, [r3, r1]	@ movhi
	mov	r1, #220	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	b	.L77
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawCheeseRemaining, .-drawCheeseRemaining
	.align	2
	.global	initBullets
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L85
	str	r4, [sp, #-4]!
	ldr	r3, [r2, #24]
	ldr	r1, [r2, #4]
	add	r0, r3, r3, lsr #31
	mov	r2, #0
	ldr	r3, .L85+4
	add	r0, r1, r0, asr #1
	mov	r4, #1
	mov	ip, #2
	mov	r1, r2
.L83:
	str	r4, [r3, #-12]
	str	ip, [r3, #-8]
	str	r0, [r3, #-32]
	str	r1, [r3, #-24]
	str	r0, [r3, #-28]
	str	r1, [r3, #-20]
	str	r1, [r3, #-16]
	str	r1, [r3, #-4]
	str	r2, [r3], #36
	add	r2, r2, #1
	cmp	r2, #5
	bne	.L83
	ldmfd	sp!, {r4}
	bx	lr
.L86:
	.align	2
.L85:
	.word	player
	.word	bullets+32
	.size	initBullets, .-initBullets
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	initPlayer
	bl	initCats
	bl	initCheese
	bl	initBullets
	ldr	r2, .L88
	ldr	r3, .L88+4
	mov	r1, #0
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	str	r1, [r2, #4]
	mov	r2, #9
	mov	r0, #30
	str	r2, [r3, #32]
	mov	r2, #6
	str	r0, [r3, #12]
	str	r2, [r3, #20]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.size	initGame, .-initGame
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldr	r0, .L98
	mov	r3, #0
	mov	r2, r0
.L95:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L97
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L95
.L90:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L97:
	ldr	r2, .L98+4
	ldr	r1, [r2, #24]
	ldr	r5, [r2, #4]
	ldr	r6, [r2, #52]
	add	r1, r1, r1, lsr #31
	mov	ip, r3, asl #3
	add	r4, ip, r3
	add	r5, r5, r1, asr #1
	cmp	r6, #0
	add	r1, r0, r4, asl #2
	str	r5, [r0, r4, asl #2]
	beq	.L92
	ldr	r5, [r2, #8]
	ldr	r4, [r2, #28]
	ldr	r6, [r2, #0]
	add	r2, r4, r6
	add	r4, r5, r4
	mov	r5, #3
	str	r5, [r1, #16]
	str	r2, [r1, #8]
	str	r4, [r1, #12]
.L93:
	add	r3, ip, r3
	ldr	r2, [r0, r3, asl #2]
	add	r0, r0, r3, asl #2
	mov	r3, #1
	str	r2, [r0, #4]
	str	r3, [r0, #28]
	b	.L90
.L92:
	ldr	r4, [r2, #0]
	ldr	r2, [r2, #8]
	mvn	r5, #2
	str	r5, [r1, #16]
	str	r4, [r1, #8]
	str	r2, [r1, #12]
	b	.L93
.L99:
	.align	2
.L98:
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
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L126
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L100
	ldr	r2, .L126+4
	ldrh	r3, [r2, #0]
	tst	r3, #16
	bne	.L121
.L102:
	tst	r3, #32
	beq	.L104
	ldr	r3, .L126+8
	ldrh	r3, [r3, #0]
	tst	r3, #32
	bne	.L104
.L103:
	mov	r3, #0
	str	r3, [r4, #44]
.L104:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	ands	r0, r3, #32
	bne	.L105
	ldr	ip, [r4, #0]
	cmp	ip, #0
	ldr	r3, .L126
	blt	.L105
	ldr	r1, [r3, #36]
	ldr	r5, .L126+12
	smull	r6, r5, r1, r5
	ldr	r6, [r3, #16]
	sub	r5, r5, r1, asr #31
	add	r5, r5, r5, asl #1
	str	r0, [r3, #52]
	mov	r0, #7
	rsb	ip, r6, ip
	str	r0, [r3, #48]
	cmp	r1, r5
	mov	r0, #1
	str	ip, [r3, #0]
	str	r0, [r3, #40]
	beq	.L122
.L106:
	add	r1, r1, #1
	str	r1, [r4, #36]
.L107:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L111
	ldr	r3, [r4, #4]
	cmp	r3, #134
	mvngt	r1, #41
	mvngt	r0, #5
	bgt	.L112
.L111:
	ldr	r1, [r4, #20]
	cmp	r1, #0
	ldr	r3, .L126
	blt	.L123
	bne	.L115
	ldr	r1, [r3, #4]
	cmp	r1, #135
	movne	r1, #2
	strne	r1, [r3, #20]
.L114:
	ldrh	r3, [r2, #0]
	tst	r3, #1
	beq	.L117
	ldr	r2, .L126+8
	ldrh	r2, [r2, #0]
	ands	r2, r2, #1
	beq	.L124
.L117:
	tst	r3, #2
	beq	.L119
	ldr	r3, .L126+8
	ldrh	r3, [r3, #0]
	ands	r3, r3, #2
	bne	.L119
	ldr	r2, [r4, #64]
	cmp	r2, #0
	bne	.L125
.L119:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ldrle	r3, .L126+16
	movle	r2, #1
	strle	r2, [r3, #8]
.L100:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L121:
	ldr	r1, .L126+8
	ldrh	r1, [r1, #0]
	tst	r1, #16
	beq	.L103
	b	.L102
.L105:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L108
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #0]
	rsb	r3, r3, #768
	cmp	r1, r3
	ldr	r3, .L126
	bge	.L108
	ldr	r0, [r3, #36]
	ldr	ip, .L126+12
	smull	r6, ip, r0, ip
	ldr	r6, [r3, #16]
	sub	ip, ip, r0, asr #31
	add	r5, ip, ip, asl #1
	add	r1, r6, r1
	mov	ip, #1
	str	r1, [r3, #0]
	cmp	r0, r5
	mov	r1, #7
	str	ip, [r3, #52]
	str	r1, [r3, #48]
	str	ip, [r3, #40]
	bne	.L109
	ldr	r1, [r3, #44]
	add	r1, r1, ip
	add	ip, ip, #-1845493760
	add	ip, ip, #4784128
	add	ip, ip, #9344
	add	ip, ip, #18
	smull	r5, ip, r1, ip
	mov	r5, r1, asr #31
	add	ip, ip, r1
	rsb	ip, r5, ip, asr #2
	rsb	ip, ip, ip, asl #3
	rsb	r1, ip, r1
	str	r1, [r3, #44]
.L109:
	add	r0, r0, #1
	str	r0, [r4, #36]
	b	.L107
.L108:
	ldr	r3, [r4, #36]
	ldr	r1, .L126+20
	smull	r6, r1, r3, r1
	mov	r0, r3, asr #31
	rsb	r1, r0, r1, asr #1
	add	r1, r1, r1, asl #1
	cmp	r3, r1, asl #2
	mov	r1, #7
	str	r1, [r4, #48]
	mov	r1, #0
	ldr	r0, .L126
	str	r1, [r4, #40]
	bne	.L110
	ldr	r1, [r0, #44]
	ldr	ip, .L126+24
	add	r1, r1, #1
	smull	r5, ip, r1, ip
	mov	r5, r1, asr #31
	add	ip, ip, r1
	rsb	ip, r5, ip, asr #2
	rsb	ip, ip, ip, asl #3
	rsb	r1, ip, r1
	str	r1, [r0, #44]
.L110:
	add	r3, r3, #1
	str	r3, [r4, #36]
	b	.L107
.L115:
	ldr	r0, [r3, #4]
	cmp	r0, #133
	bgt	.L116
	ldr	ip, .L126+24
	smull	r5, ip, r1, ip
	mov	r5, r1, asr #31
	add	ip, ip, r1
	rsb	ip, r5, ip, asr #2
	add	r0, ip, r0
	add	r1, r1, #2
	str	r0, [r3, #4]
	str	r1, [r3, #20]
	b	.L114
.L123:
	ldr	r0, .L126+24
	smull	r6, r0, r1, r0
	mov	r3, r1, asr #31
	add	r0, r0, r1
	rsb	r0, r3, r0, asr #2
	add	r1, r1, #2
.L112:
	ldr	r3, [r4, #4]
	add	r3, r0, r3
	str	r3, [r4, #4]
	str	r1, [r4, #20]
	b	.L114
.L124:
	ldr	r1, [r4, #64]
	cmp	r1, #0
	ldrne	r0, .L126+16
	ldrne	r0, [r0, #0]
	ldrne	ip, .L126+28
	movne	r0, r0, asl #3
	ldrneh	r5, [ip, r0]
	ldr	r1, .L126
	orrne	r5, r5, #512
	moveq	r2, #1
	strne	r2, [r1, #64]
	streq	r2, [r1, #64]
	strneh	r5, [ip, r0]	@ movhi
	b	.L117
.L122:
	ldr	r0, [r3, #44]
	ldr	ip, .L126+24
	add	r0, r0, #1
	smull	r5, ip, r0, ip
	mov	r5, r0, asr #31
	add	ip, ip, r0
	rsb	ip, r5, ip, asr #2
	rsb	ip, ip, ip, asl #3
	rsb	r0, ip, r0
	str	r0, [r3, #44]
	b	.L106
.L116:
	mov	r1, #135
	str	r1, [r3, #4]
	mov	r1, #0
	str	r1, [r3, #20]
	b	.L114
.L125:
	mov	r1, #6592
	mov	r2, #11008
	ldr	r0, .L126+32
	add	r1, r1, #24
	add	r2, r2, #17
	ldr	ip, .L126+36
	mov	lr, pc
	bx	ip
	bl	fireBullet
	b	.L119
.L127:
	.align	2
.L126:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	1431655766
	.word	.LANCHOR1
	.word	715827883
	.word	-1840700269
	.word	shadowOAM
	.word	soundGun
	.word	playSoundB
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	updatePlayer
	ldr	r5, .L139
	mov	r4, #0
.L129:
	add	r0, r5, r4, asl #6
	add	r4, r4, #1
	bl	updateCat
	cmp	r4, #6
	bne	.L129
	ldr	r5, .L139+4
	mov	r4, #0
.L130:
	add	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	updateCheese
	cmp	r4, #9
	bne	.L130
	ldr	r4, .L139+8
	ldr	r3, .L139+12
	ldr	r7, [r4, #28]
	ldr	r5, .L139+16
	add	r1, r3, #180
	mov	r6, #0
.L132:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L131
	ldr	ip, [r3, #8]
	add	r0, r3, #12
	ldmia	r0, {r0, r2}	@ phole ldm
	add	r2, ip, r2
	cmp	r0, #240
	str	r2, [r3, #8]
	bls	.L131
	ldr	r2, [r3, #32]
	add	r2, r7, r2
	mov	r2, r2, asl #3
	ldrh	r0, [r5, r2]
	orr	r0, r0, #512
	str	r6, [r3, #28]
	strh	r0, [r5, r2]	@ movhi
.L131:
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L132
	ldr	r3, .L139+20
	ldr	r2, [r3, #4]
	add	r1, r2, #1
	cmp	r2, #59
	str	r1, [r3, #4]
	ble	.L133
	ldr	r2, [r4, #12]
	cmp	r2, #0
	movle	r1, #1
	strle	r1, [r3, #8]
	sub	r2, r2, #1
	mov	r1, #0
	str	r1, [r3, #4]
	str	r2, [r4, #12]
.L133:
	ldr	r2, [r4, #32]
	cmp	r2, #0
	bne	.L128
	ldr	r2, .L139+24
	ldr	r1, [r2, #0]
	cmp	r1, #23
	bgt	.L128
	ldr	r2, [r2, #4]
	cmp	r2, #110
	movgt	r2, #1
	strgt	r2, [r3, #12]
.L128:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L140:
	.align	2
.L139:
	.word	cats
	.word	cheese
	.word	.LANCHOR0
	.word	bullets
	.word	shadowOAM
	.word	.LANCHOR1
	.word	player
	.size	updateGame, .-updateGame
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
	add	r1, r0, #8
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	add	r3, r1, r3
	cmp	r2, #240
	str	r3, [r0, #8]
	bxls	lr
	ldr	r2, .L143
	ldr	r3, [r0, #32]
	ldr	r1, [r2, #28]
	ldr	r2, .L143+4
	add	r3, r1, r3
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	mov	ip, #0
	orr	r1, r1, #512
	str	ip, [r0, #28]
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
	.word	shadowOAM
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L145
	ldr	r2, .L147
	ldr	r3, [r0, #32]
	ldr	r2, [r2, #28]
	ldr	r4, [r0, #12]
	ldrb	ip, [r0, #4]	@ zero_extendqisi2
	ldr	r1, .L147+4
	add	r2, r2, r3
	mov	r2, r2, asl #3
	add	r3, r1, r2
	bic	r0, r4, #65024
	strh	ip, [r1, r2]	@ movhi
	mov	r2, #484	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L145:
	ldmfd	sp!, {r4}
	bx	lr
.L148:
	.align	2
.L147:
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	drawHealth
	bl	drawTime
	bl	drawCheeseRemaining
	bl	drawEnemiesRemaining
	ldr	r3, .L158
	ldr	r3, [r3, #64]
	cmp	r3, #0
	bne	.L157
.L150:
	bl	drawPlayer
	ldr	r5, .L158+4
	mov	r4, #0
.L151:
	add	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	drawCheese
	cmp	r4, #9
	bne	.L151
	ldr	r5, .L158+8
	mov	r4, #0
.L152:
	add	r0, r5, r4, asl #6
	add	r4, r4, #1
	bl	drawCat
	cmp	r4, #6
	bne	.L152
	ldr	r5, .L158+12
	mov	r4, #0
.L153:
	add	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	drawBullet
	cmp	r4, #5
	bne	.L153
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L157:
	bl	drawGun
	b	.L150
.L159:
	.align	2
.L158:
	.word	player
	.word	cheese
	.word	cats
	.word	bullets
	.size	drawGame, .-drawGame
	.global	gameOver
	.global	gameWon
	.global	timeRemaining
	.global	timeRemainingCounter
	.global	cheeseRemaining
	.global	enemiesRemaining
	.global	gunOAM
	.global	cheeseOAM
	.global	enemyOAM
	.global	timeOAM
	.global	healthOAM
	.global	cheeseRemOAM
	.global	bulletOAM
	.global	playerOAM
	.global	eRemOAM
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	player,68,4
	.comm	cats,384,4
	.comm	cheese,324,4
	.comm	bullets,180,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	playerOAM, %object
	.size	playerOAM, 4
playerOAM:
	.word	20
	.type	healthOAM, %object
	.size	healthOAM, 4
healthOAM:
	.word	51
	.type	timeOAM, %object
	.size	timeOAM, 4
timeOAM:
	.word	46
	.type	timeRemaining, %object
	.size	timeRemaining, 4
timeRemaining:
	.word	30
	.type	eRemOAM, %object
	.size	eRemOAM, 4
eRemOAM:
	.word	56
	.type	enemiesRemaining, %object
	.size	enemiesRemaining, 4
enemiesRemaining:
	.word	6
	.type	enemyOAM, %object
	.size	enemyOAM, 4
enemyOAM:
	.word	21
	.type	bulletOAM, %object
	.size	bulletOAM, 4
bulletOAM:
	.word	11
	.type	cheeseRemaining, %object
	.size	cheeseRemaining, 4
cheeseRemaining:
	.word	9
	.type	cheeseOAM, %object
	.size	cheeseOAM, 4
cheeseOAM:
	.word	2
	.type	cheeseRemOAM, %object
	.size	cheeseRemOAM, 4
cheeseRemOAM:
	.word	54
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	gunOAM, %object
	.size	gunOAM, 4
gunOAM:
	.space	4
	.type	timeRemainingCounter, %object
	.size	timeRemainingCounter, 4
timeRemainingCounter:
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
