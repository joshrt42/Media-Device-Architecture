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
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L3+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r8, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #12
	mov	r6, r2
	add	fp, r4, #256
	add	r2, r4, #160
	mov	sl, r1
	mov	r9, r3
	mov	r1, r8
	mov	r0, #1
	mov	r3, #910163968
	str	r5, [ip, #8]
	ldr	ip, .L3+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L3+16
	mov	r0, #16777216
	strh	r5, [fp, #2]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L3+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #0]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	strh	r3, [fp, #2]	@ movhi
	mov	r3, #1
	ldr	r7, .L3+24
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	mov	r0, sl
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L3
	ldmia	r3, {r2-r3}
	ldr	ip, .L3+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L3+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L3+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L4:
	.align	3
.L3:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L6+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r8, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #24
	mov	r6, r2
	add	fp, r4, #256
	add	r2, r4, #164
	mov	sl, r1
	mov	r9, r3
	mov	r1, r8
	mov	r0, #2
	mov	r3, #910163968
	str	r5, [ip, #8]
	ldr	ip, .L6+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L6+16
	mov	r0, #16777216
	strh	r5, [fp, #6]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L6+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #4]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	strh	r3, [fp, #6]	@ movhi
	mov	r3, #1
	ldr	r7, .L6+24
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	mov	r0, sl
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L6
	ldmia	r3, {r2-r3}
	ldr	ip, .L6+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L6+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L6+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L7:
	.align	3
.L6:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L9
	ldr	r2, .L18
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L10
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L15
	ldr	r1, .L18+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r3, [r2, #12]
	str	r3, [r0, #8]
	strh	r3, [r1, #2]	@ movhi
.L10:
	ldr	r2, .L18+8
	ldr	r3, [r2, #12]
	cmp	r3, #0
	bne	.L16
.L12:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L9:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L16:
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L12
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L17
	ldr	r1, .L18+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r3, [r2, #12]
	str	r3, [r0, #8]
	strh	r3, [r1, #6]	@ movhi
	b	.L12
.L15:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L10
.L17:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	b	.L12
.L19:
	.align	2
.L18:
	.word	soundA
	.word	dma
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L21
	mov	r2, #0
	str	r2, [r1, #12]
	mov	r3, #67108864
	ldr	r1, .L21+4
	add	r3, r3, #256
	str	r2, [r1, #12]
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L22:
	.align	2
.L21:
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L24
	mov	r1, #1
	str	r1, [r0, #12]
	mov	r3, #67108864
	ldr	r0, .L24+4
	add	r3, r3, #256
	mov	r2, #128
	str	r1, [r0, #12]
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L25:
	.align	2
.L24:
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	str	r4, [sp, #-4]!
	ldr	ip, [r3, #0]
	ldr	r0, .L27+4
	ldr	r1, .L27+8
	mov	r2, #67108864
	mov	r3, #0
	add	r2, r2, #256
	add	r4, ip, #12
	add	ip, ip, #24
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #6]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r4, #8]
	str	r3, [ip, #8]
	str	r3, [r0, #16]
	str	r3, [r1, #16]
	ldmfd	sp!, {r4}
	bx	lr
.L28:
	.align	2
.L27:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L30
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L31:
	.align	2
.L30:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #50
	stmfd	sp!, {r4, lr}
	mov	r1, r0
	ldr	r2, .L34
	mov	r3, #3
	ldr	r4, .L34+4
	mov	lr, pc
	bx	r4
	mov	r3, #3
	mov	r0, #70
	mov	r1, #50
	ldr	r2, .L34+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L32
	ldr	r3, .L34+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	bne	.L32
	ldr	r1, .L34+20
	mov	r2, #1
	str	r2, [r1, #12]
	ldr	r1, .L34+24
	mov	r3, #67108864
	add	r3, r3, #256
	str	r2, [r1, #12]
	mov	r1, #128	@ movhi
	strh	r1, [r3, #6]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	ldr	r3, .L34+28
	str	r2, [r3, #0]
.L32:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LC0
	.word	drawString4
	.word	.LC1
	.word	oldButtons
	.word	buttons
	.word	soundA
	.word	soundB
	.word	state
	.size	pause, .-pause
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #50
	stmfd	sp!, {r3, lr}
	mov	r1, r0
	ldr	r2, .L37
	mov	r3, #3
	ldr	ip, .L37+4
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LC2
	.word	drawString4
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #50
	stmfd	sp!, {r3, lr}
	mov	r1, r0
	ldr	r2, .L40
	mov	r3, #1
	ldr	ip, .L40+4
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LC3
	.word	drawString4
	.size	lose, .-lose
	.global	__aeabi_idivmod
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L45
	sub	sp, sp, #16
	ldmia	r3, {r0, r1, r2, r3}
	mov	ip, sp
	stmia	ip, {r0, r1, r2, r3}
	ldr	r4, .L45+4
	ldr	r8, .L45+8
	ldr	r5, .L45+12
	ldr	r6, .L45+16
	add	r7, r4, #140
.L43:
	ldr	r3, [r8, #0]
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #16]
	rsb	r1, r1, #160
	mov	lr, pc
	bx	r6
	str	r1, [r4, #0]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #16]
	rsb	r1, r1, #240
	mov	lr, pc
	bx	r6
	str	r1, [r4, #4]
	mov	lr, pc
	bx	r5
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	rsb	r3, r3, r0
	add	r3, r3, #1
	strh	r3, [r4, #20]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	add	r2, sp, #16
	rsb	r3, r3, r0
	add	r3, r2, r3, asl #2
	ldr	r3, [r3, #-16]
	str	r3, [r4, #8]
	mov	lr, pc
	bx	r5
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	rsb	r3, r3, r0
	add	r2, sp, #16
	add	r3, r2, r3, asl #2
	ldr	r3, [r3, #-16]
	str	r3, [r4, #12]
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L43
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.word	objs
	.word	.LANCHOR1
	.word	rand
	.word	__aeabi_idivmod
	.size	initialize, .-initialize
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #50
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, r0
	ldr	r4, .L50
	ldr	r2, .L50+4
	mov	r3, #4
	mov	lr, pc
	bx	r4
	ldr	r2, .L50+8
	mov	r3, #4
	mov	r0, #70
	mov	r1, #50
	mov	lr, pc
	bx	r4
	ldr	r4, .L50+12
	ldr	r2, .L50+16
	ldr	r3, [r4, #0]
	ldr	r2, [r2, #0]
	add	r3, r3, #1
	tst	r2, #8
	str	r3, [r4, #0]
	beq	.L47
	ldr	r3, .L50+20
	ldr	r5, [r3, #0]
	ands	r5, r5, #8
	beq	.L49
.L47:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L49:
	mov	r1, #195584
	mov	r2, #11008
	ldr	r0, .L50+24
	sub	r1, r1, #202
	add	r2, r2, #17
	mov	r3, #1
	bl	playSoundA
	mov	r1, #126976
	mov	r2, #11008
	add	r1, r1, #320
	mov	r3, r5
	ldr	r0, .L50+28
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, .L50+32
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r0, [r4, #0]
	ldr	r3, .L50+36
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	b	initialize
.L51:
	.align	2
.L50:
	.word	drawString4
	.word	.LC4
	.word	.LC5
	.word	.LANCHOR2
	.word	oldButtons
	.word	buttons
	.word	GameSong
	.word	StartSFX
	.word	state
	.word	srand
	.size	start, .-start
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L60
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r3, .L60+4
	ldr	r6, [r2, #0]
	add	r8, r3, #140
	rsb	r5, r6, #159
	mov	r7, #0
.L57:
	ldr	r1, [r3, #-16]
	ldr	r4, [r3, #-8]
	add	r1, r1, r4
	subs	ip, r1, #0
	rsblt	r4, r4, #0
	strlt	r4, [r3, #-8]
	movlt	ip, r7
	str	r1, [r3, #-16]
	strlt	r7, [r3, #-16]
	cmp	r5, ip
	ldrlt	r1, [r3, #-8]
	ldr	r0, [r3, #-4]
	ldr	r2, [r3, #-12]
	str	r6, [r3, #0]
	rsblt	r1, r1, #0
	add	r2, r2, r0
	strlt	r1, [r3, #-8]
	ldr	r1, [r3, #0]
	str	r2, [r3, #-12]
	strlt	r5, [r3, #-16]
	cmp	r2, #0
	rsblt	r0, r0, #0
	rsb	r1, r1, #239
	movlt	r2, r7
	strlt	r0, [r3, #-4]
	strlt	r7, [r3, #-12]
	cmp	r1, r2
	rsblt	r0, r0, #0
	strlt	r1, [r3, #-12]
	strlt	r0, [r3, #-4]
	add	r3, r3, #28
	cmp	r3, r8
	bne	.L57
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L61:
	.align	2
.L60:
	.word	.LANCHOR1
	.word	objs+16
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L65
	ldr	r6, .L65+4
	sub	sp, sp, #8
	add	r5, r4, #140
.L63:
	ldr	r2, [r4, #16]
	ldrb	ip, [r4, #20]	@ zero_extendqisi2
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r3, r2
	add	r4, r4, #28
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L63
	ldr	r3, .L65+8
	ldr	r1, .L65+12
	ldr	r2, [r3, #28]
	ldr	r0, .L65+16
	ldr	r3, .L65+20
	mov	lr, pc
	bx	r3
	mov	r0, #10
	mov	r1, r0
	ldr	r2, .L65+16
	mov	r3, #4
	ldr	ip, .L65+24
	mov	lr, pc
	bx	ip
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	objs
	.word	drawRect4
	.word	soundA
	.word	.LC6
	.word	fpsbuffer
	.word	sprintf
	.word	drawString4
	.size	draw, .-draw
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #50
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, r0
	ldr	r4, .L87
	ldr	r2, .L87+4
	mov	r3, #2
	mov	lr, pc
	bx	r4
	mov	r0, #70
	mov	r1, #50
	ldr	r2, .L87+8
	mov	r3, #2
	mov	lr, pc
	bx	r4
	ldr	r2, .L87+12
	mov	r0, #90
	mov	r1, #50
	mov	r3, #2
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #512
	ldreq	r3, .L87+16
	ldreq	r2, [r3, #0]
	subeq	r2, r2, #1
	streq	r2, [r3, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #256
	ldreq	r3, .L87+16
	ldreq	r2, [r3, #0]
	ldr	r4, .L87+20
	addeq	r2, r2, #1
	streq	r2, [r3, #0]
	bl	update
	bl	draw
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L70
	ldr	r2, .L87+24
	ldr	r2, [r2, #0]
	ands	r2, r2, #8
	beq	.L84
.L70:
	tst	r3, #4
	beq	.L71
	ldr	r2, .L87+24
	ldr	r5, [r2, #0]
	ands	r5, r5, #4
	beq	.L85
.L71:
	tst	r3, #2
	beq	.L72
	ldr	r2, .L87+24
	ldr	r2, [r2, #0]
	tst	r2, #2
	beq	.L86
.L72:
	tst	r3, #1
	beq	.L67
	ldr	r3, .L87+24
	ldr	r3, [r3, #0]
	tst	r3, #1
	bne	.L67
	ldr	r3, .L87+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L87+32
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #2
	rsb	r3, r3, r3, asl #3
	ldr	r2, .L87+36
	rsb	r3, r3, r0
	str	r3, [r2, #4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L74
.L82:
	.word	.L75
	.word	.L76
	.word	.L77
	.word	.L78
	.word	.L79
	.word	.L80
	.word	.L81
.L67:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L84:
	ldr	r0, .L87+40
	mov	r1, #67108864
	str	r2, [r0, #12]
	ldr	r0, .L87+44
	add	r1, r1, #256
	str	r2, [r0, #12]
	strh	r2, [r1, #6]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	r2, .L87+48
	mov	r1, #4
	str	r1, [r2, #0]
	b	.L70
.L86:
	bl	stopSound
	ldr	r3, [r4, #0]
	b	.L72
.L85:
	bl	stopSound
	mov	r1, #446464
	add	r1, r1, #560
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L87+52
	add	r1, r1, #3
	bl	playSoundA
	ldr	r2, .L87+48
	ldr	r3, [r4, #0]
	str	r5, [r2, #0]
	b	.L71
.L74:
	ldr	r3, .L87+56
	ldr	r0, [r3, #0]
	ldr	r3, .L87+60
	ldr	r3, [r3, #0]
.L83:
	ldr	r1, [r3, #0]
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #0
	ldmfd	sp!, {r4, r5, r6, lr}
	b	playSoundB
.L77:
	ldr	r2, .L87+56
	ldr	r0, .L87+64
	ldr	r3, .L87+68
	str	r0, [r2, #0]
	ldr	r2, .L87+60
	str	r3, [r2, #0]
	b	.L83
.L78:
	ldr	r2, .L87+56
	ldr	r0, .L87+72
	ldr	r3, .L87+76
	str	r0, [r2, #0]
	ldr	r2, .L87+60
	str	r3, [r2, #0]
	b	.L83
.L79:
	ldr	r2, .L87+56
	ldr	r0, .L87+80
	ldr	r3, .L87+84
	str	r0, [r2, #0]
	ldr	r2, .L87+60
	str	r3, [r2, #0]
	b	.L83
.L80:
	ldr	r2, .L87+56
	ldr	r0, .L87+88
	ldr	r3, .L87+92
	str	r0, [r2, #0]
	ldr	r2, .L87+60
	str	r3, [r2, #0]
	b	.L83
.L75:
	ldr	r2, .L87+56
	ldr	r0, .L87+96
	ldr	r3, .L87+100
	str	r0, [r2, #0]
	ldr	r2, .L87+60
	str	r3, [r2, #0]
	b	.L83
.L76:
	ldr	r2, .L87+56
	ldr	r0, .L87+104
	ldr	r3, .L87+108
	str	r0, [r2, #0]
	ldr	r2, .L87+60
	str	r3, [r2, #0]
	b	.L83
.L81:
	ldr	r2, .L87+56
	ldr	r0, .L87+112
	ldr	r3, .L87+116
	str	r0, [r2, #0]
	ldr	r2, .L87+60
	str	r3, [r2, #0]
	b	.L83
.L88:
	.align	2
.L87:
	.word	drawString4
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LANCHOR1
	.word	oldButtons
	.word	buttons
	.word	rand
	.word	-1840700269
	.word	.LANCHOR2
	.word	soundA
	.word	soundB
	.word	state
	.word	TitleSong
	.word	spaceSound
	.word	spaceSoundLen
	.word	space03
	.word	_space03len
	.word	space04
	.word	_space04len
	.word	space05
	.word	_space05len
	.word	space06
	.word	_space06len
	.word	space01
	.word	_space01len
	.word	space02
	.word	_space02len
	.word	space07
	.word	_space07len
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1024
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	add	r2, r2, #4
	mov	r6, #67108864
	mvn	r3, #1264
	strh	r2, [r6, #0]	@ movhi
	mov	lr, #0
	sub	r3, r3, #1
	mov	r2, #128	@ movhi
	ldr	r0, [r6, #304]
	strh	lr, [r6, #128]	@ movhi
	strh	r2, [r6, #132]	@ movhi
	strh	r3, [r6, #130]	@ movhi
	ldr	r4, .L98
	add	r3, r6, #512
	ldrh	r1, [r3, #0]
	ldr	r5, .L98+4
	str	r0, [r4, #0]
	mov	r2, #50331648
	ldr	r0, .L98+8
	add	r2, r2, #28672
	orr	r1, r1, #1
	str	lr, [r5, #0]
	str	r0, [r2, #4092]
	strh	r1, [r3, #0]	@ movhi
	ldrh	r0, [r6, #4]
	orr	r0, r0, #8
	strh	r0, [r6, #4]	@ movhi
	mov	ip, #83886080
	mov	r0, #1	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	lr, #31	@ movhi
	strh	lr, [ip, #2]	@ movhi
	mov	lr, #31744	@ movhi
	strh	lr, [ip, #4]	@ movhi
	mov	r1, #446464
	mov	lr, #992	@ movhi
	strh	lr, [ip, #6]	@ movhi
	add	r1, r1, #560
	mvn	lr, #32768
	mov	r2, #11008
	ldr	r0, .L98+12
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	strh	lr, [ip, #8]	@ movhi
	bl	playSoundA
	ldr	r9, .L98+16
	ldr	sl, .L98+20
	ldr	r8, .L98+24
	ldr	r7, .L98+28
.L97:
	ldr	r3, [r6, #304]
	ldr	r2, [r4, #0]
	mov	r0, #0
	str	r3, [r4, #0]
	str	r2, [r9, #0]
	mov	lr, pc
	bx	sl
	ldr	r3, [r5, #0]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L90
.L96:
	.word	.L91
	.word	.L92
	.word	.L93
	.word	.L94
	.word	.L95
.L93:
	bl	lose
.L90:
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	b	.L97
.L95:
	bl	pause
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	b	.L97
.L94:
	bl	win
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	b	.L97
.L92:
	bl	game
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	b	.L97
.L91:
	bl	start
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	b	.L97
.L99:
	.align	2
.L98:
	.word	buttons
	.word	state
	.word	interruptHandler
	.word	TitleSong
	.word	oldButtons
	.word	fillScreen4
	.word	waitForVblank
	.word	flipPage
	.size	main, .-main
	.global	size
	.global	randomSeed
	.global	spaceSoundToPlay
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	objs,140,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	state,4,4
	.comm	spaceSound,4,4
	.comm	spaceSoundLen,4,4
	.comm	scanLineCounter,2,2
	.comm	fpsbuffer,30,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	C.1.3465, %object
	.size	C.1.3465, 16
C.1.3465:
	.word	-2
	.word	-1
	.word	1
	.word	2
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	size, %object
	.size	size, 4
size:
	.word	5
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"PAUSE SCREEN\000"
	.space	3
.LC1:
	.ascii	"Press START to return\000"
	.space	2
.LC2:
	.ascii	"WIN SCREEN\000"
	.space	1
.LC3:
	.ascii	"LOSE SCREEN\000"
.LC4:
	.ascii	"START SCREEN\000"
	.space	3
.LC5:
	.ascii	"Press START to begin\000"
	.space	3
.LC6:
	.ascii	"%d\000"
	.space	1
.LC7:
	.ascii	"GAME SCREEN\000"
.LC8:
	.ascii	"Press START to pause\000"
	.space	3
.LC9:
	.ascii	"Press SELECT to return\000"
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	randomSeed, %object
	.size	randomSeed, 4
randomSeed:
	.space	4
	.type	spaceSoundToPlay, %object
	.size	spaceSoundToPlay, 4
spaceSoundToPlay:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
