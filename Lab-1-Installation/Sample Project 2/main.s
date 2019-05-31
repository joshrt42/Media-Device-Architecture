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
	.global	drawRain
	.type	drawRain, %function
drawRain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r9, .L2
	sub	r3, r1, #1
	smull	r4, r2, r9, r3
	mov	r4, r3, asl #1
	smull	r7, r5, r9, r4
	sub	sp, sp, #48
	add	r8, r1, #19
	add	ip, r4, r3
	str	r5, [sp, #28]
	mov	r5, r8, asl #1
	str	r2, [sp, #12]
	str	r8, [sp, #32]
	smull	r2, fp, r9, ip
	smull	r8, r7, r9, r5
	add	r6, r1, r1, asl #1
	sub	r2, r6, #45
	str	r7, [sp, #40]
	str	fp, [sp, #36]
	smull	r7, fp, r9, r2
	rsb	r9, r1, r1, asl #4
	add	r9, r0, r9, asl #4
	str	fp, [sp, #44]
	mov	fp, r9, asl #1
	str	fp, [sp, #16]
	rsb	fp, r3, r3, asl #4
	str	fp, [sp, #8]
	ldr	fp, [sp, #12]
	mov	r8, r3, asr #31
	rsb	r8, r8, fp, asr #7
	ldr	fp, [sp, #16]
	add	fp, fp, #100663296
	str	fp, [sp, #16]
	ldr	fp, [sp, #8]
	sub	sl, r0, #1
	add	fp, sl, fp, asl #4
	str	fp, [sp, #8]
	add	r8, r8, r8, asl #4
	ldr	fp, [sp, #16]
	mov	r7, #30464
	str	r8, [sp, #12]
	add	r7, r7, #189
	mov	r8, r4, asr #31
	str	r8, [sp, #24]
	strh	r7, [fp, #0]	@ movhi
	add	fp, r0, r0, asl #1
	str	fp, [sp, #16]
	mov	fp, sl, asl #1
	str	fp, [sp, #0]
	ldr	fp, [sp, #8]
	mov	fp, fp, asl #1
	str	fp, [sp, #8]
	ldr	fp, [sp, #12]
	mov	r9, r9, asl #2
	sub	fp, r3, fp, asl #4
	str	fp, [sp, #12]
	str	r9, [sp, #20]
	add	r9, sp, #24
	ldmia	r9, {r9, fp}	@ phole ldm
	rsb	r3, r4, r3, asl #5
	str	r3, [sp, #4]
	rsb	r3, r9, fp, asr #7
	ldr	fp, [sp, #8]
	rsb	r9, r6, r6, asl #4
	add	fp, fp, #100663296
	str	r9, [sp, #24]
	str	fp, [sp, #8]
	ldr	r9, [sp, #12]
	ldr	fp, [sp, #20]
	mov	r9, r9, asl #1
	add	fp, fp, #100663296
	str	r9, [sp, #12]
	str	fp, [sp, #20]
	ldmia	sp, {r9, fp}	@ phole ldm
	add	r3, r3, r3, asl #4
	str	r3, [sp, #4]
	add	r9, r9, fp, asl #4
	ldr	r3, [sp, #16]
	ldr	fp, [sp, #24]
	str	r9, [sp, #28]
	ldr	r8, .L2+4
	add	r9, r3, fp, asl #4
	ldr	fp, [sp, #12]
	mov	r3, ip, asr #31
	str	r3, [sp, #24]
	ldrh	fp, [r8, fp]
	ldr	r3, [sp, #8]
	strh	fp, [r3, #0]	@ movhi
	ldr	fp, [sp, #28]
	mov	fp, fp, asl #1
	str	fp, [sp, #8]
	ldr	fp, [sp, #4]
	ldr	r3, [sp, #20]
	sub	r4, r4, fp, asl #4
	strh	r7, [r3, #0]	@ movhi
	str	r4, [sp, #12]
	ldr	r4, [sp, #0]
	ldr	fp, [sp, #24]
	add	sl, r4, sl
	ldr	r4, [sp, #36]
	rsb	r3, ip, ip, asl #4
	str	r3, [sp, #20]
	rsb	r3, fp, r4, asr #7
	ldr	fp, [sp, #8]
	add	fp, fp, #100663296
	str	fp, [sp, #8]
	ldr	fp, [sp, #12]
	mov	fp, fp, asl #1
	str	fp, [sp, #12]
	add	r4, r0, #10
	add	r0, r0, #9
	ldr	fp, [sp, #20]
	add	r1, r1, #20
	str	r0, [sp, #20]
	ldr	r0, [sp, #12]
	rsb	r1, r1, r1, asl #4
	add	r3, r3, r3, asl #4
	ldrh	r0, [r8, r0]
	add	r1, r4, r1, asl #4
	sub	r3, ip, r3, asl #4
	ldr	r4, [sp, #8]
	ldr	ip, [sp, #32]
	mov	r9, r9, asl #1
	add	r9, r9, #100663296
	strh	r0, [r4, #0]	@ movhi
	strh	r7, [r9, #0]	@ movhi
	ldr	r4, [sp, #20]
	rsb	r9, r5, ip, asl #5
	ldr	ip, [sp, #40]
	add	sl, sl, fp, asl #4
	mov	r3, r3, asl #1
	mov	fp, r5, asr #31
	mov	r0, r4, asl #1
	rsb	fp, fp, ip, asr #7
	ldr	r4, [sp, #16]
	sub	r6, r6, #42
	mov	sl, sl, asl #1
	mov	r1, r1, asl #2
	ldrh	r3, [r8, r3]
	rsb	r6, r6, r6, asl #4
	add	sl, sl, #100663296
	add	r1, r1, #100663296
	add	fp, fp, fp, asl #4
	strh	r3, [sl, #0]	@ movhi
	sub	fp, r5, fp, asl #4
	strh	r7, [r1, #0]	@ movhi
	ldr	r5, [sp, #44]
	add	r6, r4, r6, asl #4
	add	r0, r0, r9, asl #4
	sub	r6, r6, #120
	mov	r9, r2, asr #31
	mov	fp, fp, asl #1
	ldrh	fp, [r8, fp]
	mov	r0, r0, asl #1
	mov	r6, r6, asl #1
	rsb	r9, r9, r5, asr #7
	rsb	ip, r2, r2, asl #4
	add	r0, r0, #100663296
	add	r6, r6, #100663296
	add	r9, r9, r9, asl #4
	strh	fp, [r0, #0]	@ movhi
	add	ip, r4, ip, asl #4
	strh	r7, [r6, #0]	@ movhi
	sub	r2, r2, r9, asl #4
	sub	ip, ip, #123
	mov	r2, r2, asl #1
	mov	ip, ip, asl #1
	ldrh	r2, [r8, r2]
	add	ip, ip, #100663296
	strh	r2, [ip, #0]	@ movhi
	add	sp, sp, #48
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L3:
	.align	2
.L2:
	.word	2021161081
	.word	bg
	.size	drawRain, .-drawRain
	.align	2
	.global	updateBG
	.type	updateBG, %function
updateBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sl, r0, #20
	sub	sp, sp, #60
	add	r3, r0, #26
	add	fp, r0, #7
	mov	r1, sl
	mov	r4, r0
	str	r3, [sp, #4]
	bl	drawRain
	mov	r0, fp
	ldr	r1, [sp, #4]
	bl	drawRain
	mov	r0, r4
	mov	r1, sl
	bl	drawRain
	add	r8, r4, #17
	add	r3, r4, #30
	str	r3, [sp, #8]
	mov	r0, r8
	add	r3, r4, #32
	mov	r1, r4
	str	r3, [sp, #12]
	bl	drawRain
	add	r3, r4, #60
	add	r0, sp, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	str	r3, [sp, #16]
	bl	drawRain
	add	r3, r4, #42
	str	r3, [sp, #20]
	mov	r0, r8
	add	r3, r4, #44
	ldr	r1, [sp, #16]
	str	r3, [sp, #24]
	bl	drawRain
	add	r3, r4, #11
	str	r3, [sp, #28]
	ldr	r0, [sp, #20]
	add	r3, r4, #46
	ldr	r1, [sp, #24]
	str	r3, [sp, #32]
	bl	drawRain
	add	r3, r4, #86
	str	r3, [sp, #36]
	ldr	r0, [sp, #28]
	add	r3, r4, #93
	ldr	r1, [sp, #32]
	add	r7, r4, #77
	str	r3, [sp, #40]
	bl	drawRain
	add	r3, r4, #88
	add	r0, sp, #36
	ldmia	r0, {r0, r1}	@ phole ldm
	str	r3, [sp, #44]
	add	r6, r4, #66
	bl	drawRain
	ldr	r0, [sp, #44]
	mov	r1, r7
	add	r5, r4, #55
	bl	drawRain
	mov	r0, r7
	mov	r1, r6
	bl	drawRain
	add	r3, r4, #40
	mov	r0, r6
	mov	r1, r5
	str	r3, [sp, #48]
	add	r9, r4, #3
	bl	drawRain
	add	r3, r4, #2
	mov	r0, r5
	ldr	r1, [sp, #48]
	str	r3, [sp, #52]
	bl	drawRain
	ldr	r0, [sp, #52]
	mov	r1, r9
	bl	drawRain
	mov	r0, r4
	mov	r1, sl
	bl	drawRain
	mov	r0, fp
	ldr	r1, [sp, #4]
	bl	drawRain
	mov	r0, r4
	mov	r1, sl
	bl	drawRain
	mov	r0, r8
	mov	r1, r4
	bl	drawRain
	add	r0, sp, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	bl	drawRain
	mov	r0, r8
	ldr	r1, [sp, #16]
	bl	drawRain
	add	r0, sp, #20
	ldmia	r0, {r0, r1}	@ phole ldm
	bl	drawRain
	add	r0, sp, #28
	ldmia	r0, {r0, r1}	@ phole ldm
	bl	drawRain
	add	r0, sp, #36
	ldmia	r0, {r0, r1}	@ phole ldm
	bl	drawRain
	ldr	r0, [sp, #44]
	mov	r1, r7
	bl	drawRain
	mov	r0, r7
	mov	r1, r6
	bl	drawRain
	mov	r0, r6
	mov	r1, r5
	bl	drawRain
	mov	r0, r5
	ldr	r1, [sp, #48]
	bl	drawRain
	ldr	r0, [sp, #52]
	mov	r1, r9
	add	sp, sp, #60
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	drawRain
	.size	updateBG, .-updateBG
	.align	2
	.global	backgroundColor
	.type	backgroundColor, %function
backgroundColor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L6
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #7
	add	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	ldr	r3, .L6+4
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	bx	lr
.L7:
	.align	2
.L6:
	.word	2021161081
	.word	bg
	.size	backgroundColor, .-backgroundColor
	.align	2
	.global	drawCharacterAt
	.type	drawCharacterAt, %function
drawCharacterAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	rsb	r3, r1, r1, asl #4
	mov	r3, r3, asl #4
	add	ip, r0, #14
	add	ip, ip, r3
	mov	ip, ip, asl #1
	mov	r4, #10624
	sub	sp, sp, #112
	add	r7, ip, #100663296
	mov	r6, #14
	add	r4, r4, #50
.L9:
	mov	r5, r7
	mov	ip, #0
.L10:
	add	ip, ip, #1
	cmp	ip, #11
	strh	r4, [r5, #0]	@ movhi
	add	r5, r5, #480
	bne	.L10
	add	r6, r6, #1
	cmp	r6, #28
	add	r7, r7, #2
	bne	.L9
	str	ip, [sp, #4]
	add	r2, r2, r2, lsr #31
	add	ip, r0, #18
	mov	r8, r2, asr #1
	str	ip, [sp, #60]
	add	ip, r0, #19
	str	ip, [sp, #64]
	add	r2, r8, #10
	add	ip, r0, #22
	str	r2, [sp, #16]
	str	ip, [sp, #36]
	add	ip, r0, #23
	str	ip, [sp, #40]
	ldr	ip, [sp, #16]
	add	fp, r8, #31
	orr	fp, ip, fp, asl #5
	add	ip, r0, #24
	str	fp, [sp, #20]
	str	ip, [sp, #16]
	add	ip, r0, #3600
	str	ip, [sp, #52]
	ldr	ip, [sp, #20]
	add	r4, r0, #20
	add	fp, r8, #29
	add	r2, r0, #21
	orr	fp, ip, fp, asl #10
	add	ip, r4, r3
	str	ip, [sp, #20]
	add	r5, r1, #1
	add	ip, r2, r3
	str	ip, [sp, #28]
	rsb	r5, r5, r5, asl #4
	ldr	ip, [sp, #60]
	mov	r5, r5, asl #4
	add	ip, r5, ip
	str	ip, [sp, #24]
	ldr	ip, [sp, #64]
	add	ip, r5, ip
	str	ip, [sp, #12]
	add	ip, r5, r4
	str	ip, [sp, #32]
	add	ip, r5, r2
	str	ip, [sp, #44]
	ldr	ip, [sp, #36]
	add	ip, r5, ip
	str	ip, [sp, #48]
	ldr	ip, [sp, #40]
	add	r7, r1, #2
	add	r5, r5, ip
	rsb	r7, r7, r7, asl #4
	ldr	ip, [sp, #64]
	mov	r7, r7, asl #4
	add	ip, r7, ip
	str	ip, [sp, #56]
	add	ip, r7, r4
	str	ip, [sp, #68]
	add	r9, r1, #3
	add	ip, r7, r2
	str	ip, [sp, #72]
	add	r6, r1, #6
	ldr	ip, [sp, #36]
	rsb	r9, r9, r9, asl #4
	mov	r9, r9, asl #4
	rsb	r6, r6, r6, asl #4
	mov	r6, r6, asl #4
	add	r7, r7, ip
	add	r8, r0, #17
	add	ip, r9, r4
	str	ip, [sp, #76]
	add	ip, r6, r8
	str	ip, [sp, #80]
	ldr	ip, [sp, #60]
	add	ip, r6, ip
	str	ip, [sp, #84]
	ldr	ip, [sp, #40]
	add	sl, r1, #9
	add	ip, r6, ip
	str	ip, [sp, #88]
	rsb	sl, sl, sl, asl #4
	ldr	ip, [sp, #16]
	mov	sl, sl, asl #4
	add	r6, r6, ip
	add	ip, sl, r4
	str	ip, [sp, #104]
	ldr	ip, [sp, #52]
	add	ip, ip, #11
	str	ip, [sp, #108]
	ldr	ip, [sp, #20]
	mov	ip, ip, asl #1
	str	ip, [sp, #20]
	ldr	ip, [sp, #28]
	mov	ip, ip, asl #1
	str	ip, [sp, #28]
	ldr	ip, [sp, #24]
	mov	ip, ip, asl #1
	str	ip, [sp, #24]
	ldr	ip, [sp, #12]
	mov	ip, ip, asl #1
	str	ip, [sp, #12]
	ldr	ip, [sp, #32]
	mov	ip, ip, asl #1
	str	ip, [sp, #32]
	ldr	ip, [sp, #44]
	mov	r5, r5, asl #1
	mov	ip, ip, asl #1
	str	ip, [sp, #44]
	str	r5, [sp, #52]
	ldr	ip, [sp, #48]
	ldr	r5, [sp, #56]
	mov	ip, ip, asl #1
	mov	r5, r5, asl #1
	str	ip, [sp, #48]
	str	r5, [sp, #56]
	ldr	ip, [sp, #68]
	ldr	r5, [sp, #72]
	add	r9, r9, r2
	mov	ip, ip, asl #1
	mov	r5, r5, asl #1
	mov	r7, r7, asl #1
	mov	r9, r9, asl #1
	str	ip, [sp, #68]
	str	r5, [sp, #72]
	ldr	ip, [sp, #84]
	ldr	r5, [sp, #88]
	str	r7, [sp, #92]
	str	r9, [sp, #96]
	add	r7, sp, #76
	ldmia	r7, {r7, r9}	@ phole ldm
	mov	r7, r7, asl #1
	mov	r9, r9, asl #1
	mov	ip, ip, asl #1
	mov	r5, r5, asl #1
	mov	r6, r6, asl #1
	str	r7, [sp, #76]
	str	r9, [sp, #80]
	str	ip, [sp, #84]
	str	r5, [sp, #88]
	str	r6, [sp, #100]
	ldr	r6, [sp, #104]
	mov	fp, fp, asl #16
	mov	r6, r6, asl #1
	ldr	ip, [sp, #28]
	ldr	r9, [sp, #108]
	str	r6, [sp, #104]
	mov	r6, fp, lsr #16
	ldr	fp, [sp, #20]
	add	sl, sl, r2
	mov	r5, sl, asl #1
	add	sl, r3, r9
	add	r9, fp, #100663296
	add	fp, ip, #100663296
	ldr	ip, [sp, #24]
	add	ip, ip, #100663296
	str	ip, [sp, #20]
	ldr	ip, [sp, #12]
	add	ip, ip, #100663296
	str	ip, [sp, #28]
	ldr	ip, [sp, #32]
	add	ip, ip, #100663296
	str	ip, [sp, #24]
	ldr	ip, [sp, #44]
	add	ip, ip, #100663296
	str	ip, [sp, #12]
	ldr	ip, [sp, #48]
	add	ip, ip, #100663296
	str	ip, [sp, #32]
	ldr	ip, [sp, #52]
	add	ip, ip, #100663296
	str	ip, [sp, #44]
	ldr	ip, [sp, #56]
	add	ip, ip, #100663296
	str	ip, [sp, #48]
	ldr	ip, [sp, #68]
	add	ip, ip, #100663296
	str	ip, [sp, #52]
	ldr	ip, [sp, #72]
	add	ip, ip, #100663296
	str	ip, [sp, #56]
	ldr	ip, [sp, #92]
	add	ip, ip, #100663296
	str	ip, [sp, #68]
	ldr	ip, [sp, #76]
	add	ip, ip, #100663296
	str	ip, [sp, #72]
	ldr	ip, [sp, #96]
	add	ip, ip, #100663296
	str	ip, [sp, #92]
	ldr	ip, [sp, #80]
	add	ip, ip, #100663296
	str	ip, [sp, #76]
	ldr	ip, [sp, #84]
	add	ip, ip, #100663296
	str	ip, [sp, #96]
	ldr	ip, [sp, #88]
	add	ip, ip, #100663296
	str	ip, [sp, #80]
	ldr	ip, [sp, #100]
	add	ip, ip, #100663296
	str	ip, [sp, #84]
	ldr	ip, [sp, #104]
	add	r5, r5, #100663296
	add	ip, ip, #100663296
	str	ip, [sp, #88]
	str	r5, [sp, #100]
	strh	r6, [r9, #0]	@ movhi
	ldr	r9, [sp, #20]
	strh	r6, [fp, #0]	@ movhi
	ldr	ip, [sp, #4]
	ldr	fp, [sp, #28]
	strh	r6, [r9, #0]	@ movhi
	ldr	r9, [sp, #24]
	strh	r6, [fp, #0]	@ movhi
	strh	r6, [r9, #0]	@ movhi
	ldr	fp, [sp, #12]
	ldr	r9, [sp, #32]
	strh	r6, [fp, #0]	@ movhi
	strh	r6, [r9, #0]	@ movhi
	ldr	fp, [sp, #44]
	ldr	r9, [sp, #48]
	strh	r6, [fp, #0]	@ movhi
	strh	r6, [r9, #0]	@ movhi
	ldr	fp, [sp, #52]
	ldr	r9, [sp, #56]
	strh	r6, [fp, #0]	@ movhi
	strh	r6, [r9, #0]	@ movhi
	ldr	fp, [sp, #68]
	ldr	r9, [sp, #72]
	strh	r6, [fp, #0]	@ movhi
	strh	r6, [r9, #0]	@ movhi
	ldr	fp, [sp, #92]
	ldr	r9, [sp, #76]
	strh	r6, [fp, #0]	@ movhi
	strh	r6, [r9, #0]	@ movhi
	ldr	fp, [sp, #96]
	ldr	r9, [sp, #80]
	strh	r6, [fp, #0]	@ movhi
	ldr	fp, [sp, #84]
	strh	r6, [r9, #0]	@ movhi
	mov	r7, #8512
	strh	r6, [fp, #0]	@ movhi
	ldr	r9, [sp, #100]
	ldr	r6, [sp, #88]
	add	r7, r7, #14
	mov	sl, sl, asl #1
	mov	r5, #14016
	strh	r7, [r6, #0]	@ movhi
	strh	r7, [r9, #0]	@ movhi
	add	sl, sl, #100663296
	add	r5, r5, #60
.L12:
	mov	r7, sl
	mov	r6, #15
.L13:
	add	r6, r6, #1
	cmp	r6, #23
	strh	r5, [r7, #0]	@ movhi
	add	r7, r7, #480
	bne	.L13
	add	ip, ip, #1
	cmp	ip, #31
	add	sl, sl, #2
	bne	.L12
	add	ip, r1, #23
	rsb	ip, ip, ip, asl #4
	add	r5, r0, ip, asl #4
	add	r5, r5, #11
	mov	r5, r5, asl #1
	mov	r6, #14016
	add	r5, r5, #100663296
	mov	ip, #12
	add	r6, r6, #60
.L15:
	add	ip, ip, #1
	cmp	ip, #30
	strh	r6, [r5, #2]!	@ movhi
	bne	.L15
	add	r9, r0, #5760
	add	r9, r9, #13
	add	r9, r3, r9
	mov	r9, r9, asl #1
	mov	r7, #14016
	add	r9, r9, #100663296
	mov	sl, #13
	add	r7, r7, #60
.L16:
	mov	r6, r9
	mov	r5, #24
.L17:
	add	r5, r5, #1
	mov	ip, #14016
	cmp	r5, #35
	strh	r7, [r6, #0]	@ movhi
	add	ip, ip, #60
	add	r6, r6, #480
	bne	.L17
	add	sl, sl, #1
	cmp	sl, #29
	add	r9, r9, #2
	bne	.L16
	add	r5, r1, #14
	add	r7, r1, #13
	rsb	r5, r5, r5, asl #4
	rsb	r7, r7, r7, asl #4
	mov	r5, r5, asl #4
	mov	r7, r7, asl #4
	add	fp, r5, r8
	add	r8, r7, r8
	str	r8, [sp, #20]
	ldr	r8, [sp, #16]
	add	r6, r5, r0
	add	r5, r5, r8
	str	r5, [sp, #16]
	ldr	r5, [sp, #20]
	add	sl, r6, #16
	add	r7, r7, r8
	mov	r8, r5, asl #1
	ldr	r5, [sp, #16]
	add	r8, r8, #100663296
	mov	sl, sl, asl #1
	mov	fp, fp, asl #1
	str	r8, [sp, #16]
	mov	r5, r5, asl #1
	add	sl, sl, #100663296
	add	fp, fp, #100663296
	add	r9, r0, #2656
	add	r6, r6, #25
	str	r5, [sp, #12]
	mov	r6, r6, asl #1
	strh	ip, [sl, #0]	@ movhi
	add	r9, r9, #2
	strh	ip, [fp, #0]	@ movhi
	mov	r7, r7, asl #1
	ldr	fp, [sp, #16]
	add	r8, r6, #100663296
	add	r9, r3, r9
	add	r7, r7, #100663296
	add	r5, r5, #100663296
	strh	ip, [fp, #0]	@ movhi
	mov	r9, r9, asl #1
	strh	ip, [r7, #0]	@ movhi
	mov	r6, #10624
	strh	ip, [r5, #0]	@ movhi
	strh	ip, [r8, #0]	@ movhi
	add	r9, r9, #100663296
	mov	sl, #18
	add	r6, r6, #50
.L19:
	mov	r7, r9
	mov	r5, #11
.L20:
	add	r5, r5, #1
	mov	ip, #10624
	cmp	r5, #18
	strh	r6, [r7, #0]	@ movhi
	add	ip, ip, #50
	add	r7, r7, #480
	bne	.L20
	add	sl, sl, #1
	cmp	sl, #24
	add	r9, r9, #2
	bne	.L19
	add	r5, r1, #18
	add	sl, r1, #16
	add	r7, r1, #15
	rsb	r5, r5, r5, asl #4
	rsb	sl, sl, sl, asl #4
	mov	r5, r5, asl #4
	mov	sl, sl, asl #4
	rsb	r7, r7, r7, asl #4
	add	r8, r1, #17
	str	sl, [sp, #16]
	mov	r7, r7, asl #4
	add	r2, r5, r2
	rsb	r8, r8, r8, asl #4
	str	r2, [sp, #32]
	add	r9, r7, r0
	ldr	r2, [sp, #16]
	mov	r8, r8, asl #4
	str	r9, [sp, #24]
	str	r8, [sp, #20]
	add	r6, r0, #31
	ldr	fp, [sp, #24]
	add	r8, r2, r6
	ldr	r2, [sp, #20]
	add	sl, fp, #32
	add	fp, r2, r6
	add	r2, r0, #3872
	str	r2, [sp, #12]
	ldr	r2, [sp, #32]
	add	r4, r5, r4
	mov	r2, r2, asl #1
	str	r2, [sp, #32]
	mov	r4, r4, asl #1
	ldr	r2, [sp, #12]
	str	r4, [sp, #28]
	add	r4, r3, r2
	ldr	r2, [sp, #28]
	mov	r8, r8, asl #1
	add	r2, r2, #100663296
	str	r2, [sp, #28]
	add	r9, r7, r6
	ldr	r2, [sp, #32]
	add	r8, r8, #100663296
	str	r8, [sp, #12]
	mov	r9, r9, asl #1
	ldr	r8, [sp, #28]
	add	r2, r2, #100663296
	add	r9, r9, #100663296
	add	r6, r5, r6
	str	r2, [sp, #32]
	mov	sl, sl, asl #1
	strh	ip, [r8, #0]	@ movhi
	mov	fp, fp, asl #1
	strh	ip, [r2, #0]	@ movhi
	mov	r6, r6, asl #1
	strh	ip, [r9, #0]	@ movhi
	ldr	r9, [sp, #12]
	add	sl, sl, #100663296
	add	fp, fp, #100663296
	add	r6, r6, #100663296
	strh	ip, [sl, #0]	@ movhi
	mov	r4, r4, asl #1
	strh	ip, [r9, #0]	@ movhi
	strh	ip, [fp, #0]	@ movhi
	strh	ip, [r6, #0]	@ movhi
	add	r4, r4, #100663296
	mov	r2, #32
	mov	r8, ip
.L22:
	mov	r6, r4
	mov	ip, #16
.L23:
	add	ip, ip, #1
	cmp	ip, #30
	strh	r8, [r6, #0]	@ movhi
	add	r6, r6, #480
	bne	.L23
	add	r2, r2, #1
	cmp	r2, #35
	add	r4, r4, #2
	bne	.L22
	add	sl, r0, #6464
	str	sl, [sp, #28]
	add	sl, sl, #38
	add	sl, r3, sl
	mov	sl, sl, asl #1
	mov	r6, #10624
	add	sl, sl, #100663296
	mov	r8, #22
	add	r6, r6, #50
.L24:
	mov	r4, sl
	mov	ip, #27
.L25:
	add	ip, ip, #1
	mov	r2, #10624
	cmp	ip, #30
	strh	r6, [r4, #0]	@ movhi
	add	r2, r2, #50
	add	r4, r4, #480
	bne	.L25
	add	r8, r8, #1
	cmp	r8, #32
	add	sl, sl, #2
	bne	.L24
	add	r6, r1, #24
	ldr	fp, [sp, #36]
	rsb	r6, r6, r6, asl #4
	ldr	sl, [sp, #40]
	mov	r6, r6, asl #4
	add	fp, r6, fp
	add	r4, r1, #25
	str	fp, [sp, #68]
	rsb	r4, r4, r4, asl #4
	add	fp, r6, sl
	ldr	sl, [sp, #36]
	mov	r4, r4, asl #4
	add	sl, r4, sl
	str	sl, [sp, #12]
	ldr	sl, [sp, #40]
	add	ip, r1, #26
	add	sl, r4, sl
	str	sl, [sp, #32]
	rsb	ip, ip, ip, asl #4
	ldr	sl, [sp, #36]
	mov	ip, ip, asl #4
	add	sl, ip, sl
	str	sl, [sp, #44]
	ldr	sl, [sp, #40]
	add	sl, ip, sl
	str	sl, [sp, #48]
	ldr	sl, [sp, #24]
	add	sl, sl, #9
	str	sl, [sp, #24]
	ldr	sl, [sp, #16]
	add	r8, r0, #10
	add	sl, sl, r8
	str	sl, [sp, #52]
	add	r5, r5, r8
	ldr	sl, [sp, #20]
	str	r5, [sp, #72]
	ldr	r5, [sp, #68]
	add	sl, sl, r8
	str	sl, [sp, #56]
	mov	sl, r5, asl #1
	ldr	r5, [sp, #12]
	add	r7, r7, r8
	mov	r8, r5, asl #1
	ldr	r5, [sp, #32]
	mov	r5, r5, asl #1
	str	r5, [sp, #36]
	ldr	r5, [sp, #44]
	mov	r5, r5, asl #1
	str	r5, [sp, #40]
	ldr	r5, [sp, #48]
	mov	r5, r5, asl #1
	str	r5, [sp, #16]
	ldr	r5, [sp, #24]
	mov	r5, r5, asl #1
	str	r5, [sp, #20]
	ldr	r5, [sp, #52]
	mov	r5, r5, asl #1
	str	r5, [sp, #24]
	ldr	r5, [sp, #56]
	mov	r5, r5, asl #1
	str	r5, [sp, #12]
	ldr	r5, [sp, #72]
	mov	r5, r5, asl #1
	str	r5, [sp, #32]
	ldr	r5, [sp, #36]
	add	r5, r5, #100663296
	str	r5, [sp, #44]
	ldr	r5, [sp, #40]
	add	r5, r5, #100663296
	str	r5, [sp, #36]
	ldr	r5, [sp, #16]
	mov	r7, r7, asl #1
	add	r5, r5, #100663296
	add	r7, r7, #100663296
	str	r5, [sp, #40]
	ldr	r5, [sp, #20]
	str	r7, [sp, #20]
	ldr	r7, [sp, #24]
	add	r5, r5, #100663296
	add	r7, r7, #100663296
	str	r5, [sp, #16]
	str	r7, [sp, #24]
	ldr	r5, [sp, #12]
	ldr	r7, [sp, #32]
	mov	fp, fp, asl #1
	add	sl, sl, #100663296
	add	fp, fp, #100663296
	add	r5, r5, #100663296
	add	r7, r7, #100663296
	str	r5, [sp, #12]
	str	r7, [sp, #32]
	strh	r2, [sl, #0]	@ movhi
	strh	r2, [fp, #0]	@ movhi
	ldr	sl, [sp, #44]
	ldr	fp, [sp, #36]
	add	r8, r8, #100663296
	strh	r2, [r8, #0]	@ movhi
	ldr	r5, [sp, #40]
	strh	r2, [sl, #0]	@ movhi
	strh	r2, [fp, #0]	@ movhi
	add	sl, sp, #16
	ldmia	sl, {sl, fp}	@ phole ldm
	add	r9, r0, #3840
	strh	r2, [r5, #0]	@ movhi
	add	r9, r9, #7
	strh	r2, [sl, #0]	@ movhi
	ldr	r5, [sp, #24]
	strh	r2, [fp, #0]	@ movhi
	ldr	sl, [sp, #12]
	ldr	fp, [sp, #32]
	add	r9, r3, r9
	strh	r2, [r5, #0]	@ movhi
	mov	r9, r9, asl #1
	strh	r2, [sl, #0]	@ movhi
	strh	r2, [fp, #0]	@ movhi
	add	r9, r9, #100663296
	mov	r7, #7
	mov	r8, r2
.L27:
	mov	r5, r9
	mov	r2, #16
.L28:
	add	r2, r2, #1
	cmp	r2, #30
	strh	r8, [r5, #0]	@ movhi
	add	r5, r5, #480
	bne	.L28
	add	r7, r7, #1
	cmp	r7, #10
	add	r9, r9, #2
	bne	.L27
	ldr	r2, [sp, #28]
	add	r9, r2, #26
	add	r9, r3, r9
	mov	r9, r9, asl #1
	mov	sl, #10624
	add	r9, r9, #100663296
	add	sl, sl, #50
.L29:
	mov	r5, r9
	mov	r2, #27
.L30:
	add	r2, r2, #1
	mov	r8, #10624
	cmp	r2, #30
	strh	sl, [r5, #0]	@ movhi
	add	r8, r8, #50
	add	r5, r5, #480
	bne	.L30
	add	r7, r7, #1
	cmp	r7, #20
	add	r9, r9, #2
	bne	.L29
	add	r5, sp, #60
	ldmia	r5, {r5, r9}	@ phole ldm
	ldr	fp, [sp, #60]
	add	r2, r6, r5
	add	sl, ip, fp
	add	r6, r6, r9
	add	r5, r4, r5
	add	ip, ip, r9
	add	r4, r4, r9
	add	r7, r0, #8384
	mov	ip, ip, asl #1
	add	r7, r7, #19
	mov	r2, r2, asl #1
	mov	r6, r6, asl #1
	mov	r5, r5, asl #1
	mov	r4, r4, asl #1
	mov	sl, sl, asl #1
	add	r6, r6, #100663296
	add	r9, ip, #100663296
	add	r7, r3, r7
	add	r2, r2, #100663296
	add	r5, r5, #100663296
	add	r4, r4, #100663296
	add	sl, sl, #100663296
	strh	r8, [r2, #0]	@ movhi
	mov	r7, r7, asl #1
	strh	r8, [r6, #0]	@ movhi
	mov	ip, #26368
	strh	r8, [r5, #0]	@ movhi
	strh	r8, [r4, #0]	@ movhi
	strh	r8, [sl, #0]	@ movhi
	strh	r8, [r9, #0]	@ movhi
	add	r7, r7, #100663296
	mov	r6, #36
	add	ip, ip, #223
.L32:
	mov	r4, r7
	mov	r2, #35
.L33:
	add	r2, r2, #1
	cmp	r2, #46
	strh	ip, [r4, #0]	@ movhi
	add	r4, r4, #480
	bne	.L33
	subs	r6, r6, #1
	add	r7, r7, #2
	bne	.L32
	add	r7, r0, #8640
	add	r6, r7, #1
	add	r6, r3, r6
	mov	r6, r6, asl #1
	mov	r4, #26368
	add	r6, r6, #100663296
	mov	r5, #1
	add	r4, r4, #223
.L34:
	mov	ip, r6
	mov	r2, #36
.L35:
	add	r2, r2, #1
	cmp	r2, #45
	strh	r4, [ip, #0]	@ movhi
	add	ip, ip, #480
	bne	.L35
	add	r5, r5, #1
	cmp	r5, #3
	add	r6, r6, #2
	bne	.L34
	add	ip, r0, #8832
	add	ip, ip, #48
	add	ip, ip, r3
	mov	ip, ip, asl #1
	mov	r4, #26368
	add	ip, ip, #100663296
	mov	r2, #6
	add	r4, r4, #223
.L37:
	subs	r2, r2, #1
	strh	r4, [ip, #0]	@ movhi
	add	ip, ip, #480
	bne	.L37
	add	r6, r7, #39
	add	r6, r3, r6
	mov	r6, r6, asl #1
	mov	r4, #26368
	add	r6, r6, #100663296
	mov	r5, #39
	add	r4, r4, #223
.L38:
	mov	ip, r6
	mov	r2, #36
.L39:
	add	r2, r2, #1
	cmp	r2, #45
	strh	r4, [ip, #0]	@ movhi
	add	ip, ip, #480
	bne	.L39
	add	r5, r5, #1
	cmp	r5, #41
	add	r6, r6, #2
	bne	.L38
	add	r2, r0, #8896
	add	r2, r2, #25
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	ip, #26368
	add	r2, r2, #100663296
	mov	r3, #37
	add	ip, ip, #223
.L41:
	add	r3, r3, #1
	cmp	r3, #43
	strh	ip, [r2, #0]	@ movhi
	add	r2, r2, #480
	bne	.L41
	ldr	r5, .L62
	mov	r4, #19968
	mov	r3, #0
	add	r6, r5, #192
	add	r4, r4, #248
.L42:
	ldr	r2, [r6, r3]
	add	r2, r1, r2
	ldr	ip, [r5, r3]
	rsb	r2, r2, r2, asl #4
	add	r2, r0, r2, asl #4
	add	r2, r2, ip
	mov	r2, r2, asl #1
	add	r3, r3, #4
	add	r2, r2, #100663296
	cmp	r3, #192
	strh	r4, [r2, #0]	@ movhi
	bne	.L42
	add	sp, sp, #112
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.size	drawCharacterAt, .-drawCharacterAt
	.global	__aeabi_idivmod
	.align	2
	.global	updateCharacter
	.type	updateCharacter, %function
updateCharacter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #8
	ldr	r3, .L80
	mov	r1, #6
	str	r0, [sp, #4]
	mov	lr, pc
	bx	r3
	ldr	r4, .L80+4
	ldr	r3, [r4, #384]
	ldr	r5, .L80+8
	cmp	r3, #1
	str	r1, [r5, #0]
	ldr	r2, [sp, #4]
	beq	.L65
	mov	lr, #100663296
	add	lr, lr, #22272
	mov	r6, lr
	mov	ip, #32256
	add	lr, lr, #8
	add	ip, ip, #16
	add	r6, r6, #94
.L72:
	add	r0, lr, #23040
	mov	r3, lr
.L71:
	strh	ip, [r3, #0]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L71
	add	lr, lr, #2
	cmp	lr, r6
	bne	.L72
	mov	r0, #100
	rsb	r1, r1, #45
	bl	drawCharacterAt
	ldr	r3, [r5, #0]
	cmp	r3, #5
	moveq	r3, #1
	streq	r3, [r4, #384]
.L64:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L65:
	mov	lr, #100663296
	mov	r6, lr
	mov	ip, #32256
	add	lr, lr, #18688
	add	r6, r6, #18944
	add	lr, lr, #232
	add	ip, ip, #16
	add	r6, r6, #62
.L68:
	add	r0, lr, #23040
	mov	r3, lr
.L67:
	strh	ip, [r3, #0]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L67
	add	lr, lr, #2
	cmp	lr, r6
	bne	.L68
	mov	r0, #100
	add	r1, r1, #40
	bl	drawCharacterAt
	ldr	r3, [r5, #0]
	cmp	r3, #5
	moveq	r3, #0
	streq	r3, [r4, #384]
	b	.L64
.L81:
	.align	2
.L80:
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	updateCharacter, .-updateCharacter
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	mov	r0, #1024
	mov	r2, #100663296
	add	r0, r0, #3
	mov	ip, #67108864
	mov	r3, r2
	sub	sp, sp, #12
	mov	r1, #32256
	add	r2, r2, #50176
	strh	r0, [ip, #0]	@ movhi
	sub	r3, r3, #2
	add	r1, r1, #16
	add	r2, r2, #222
.L83:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L83
	mov	r2, #16896
	ldr	r1, .L101
	add	r2, r2, #16
.L84:
	strh	r2, [r3, #2]!	@ movhi
	cmp	r3, r1
	bne	.L84
	ldr	r3, .L101+4
	mov	r2, #32256
	add	r1, r3, #210
	add	r2, r2, #16
.L85:
	strh	r2, [r3, #2]!	@ movhi
	cmp	r3, r1
	bne	.L85
	mov	r3, #16896
	ldr	r2, .L101+8
	ldr	r1, .L101+12
	add	r3, r3, #16
.L86:
	strh	r3, [r2, #2]!	@ movhi
	cmp	r2, r1
	bne	.L86
	mov	r4, #100663296
	mov	r6, #32256
	add	r4, r4, #50176
	mov	r5, #16896
	ldr	sl, .L101+16
	ldr	r7, .L101
	mov	r8, #0
	add	r6, r6, #16
	add	r4, r4, #222
	add	r5, r5, #16
.L92:
	smull	r3, r2, sl, r8
	mov	r3, r8, asr #31
	rsb	r3, r3, r2, asr #5
	rsb	r2, r3, r3, asl #5
	add	r3, r3, r2, asl #2
	cmp	r8, r3, asl #2
	bne	.L87
	mov	r3, #100663296
	sub	r3, r3, #2
.L88:
	strh	r6, [r3, #2]!	@ movhi
	cmp	r3, r4
	bne	.L88
	mov	r3, r4
.L89:
	strh	r5, [r3, #2]!	@ movhi
	cmp	r3, r7
	bne	.L89
.L87:
	mov	r0, r8
	bl	updateBG
	tst	r8, #7
	beq	.L100
.L90:
	mov	r3, #29952
	add	r3, r3, #48
.L91:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L91
	add	r8, r8, #1
	b	.L92
.L100:
	mov	r0, r8, asr #3
	bl	updateCharacter
	b	.L90
.L102:
	.align	2
.L101:
	.word	100740094
	.word	bg-2
	.word	bg+208
	.word	bg+542
	.word	274877907
	.size	main, .-main
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, asl #4
	add	r1, r0, r1, asl #4
	mov	r1, r1, asl #1
	add	r1, r1, #100663296
	strh	r2, [r1, #0]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #29952
	sub	sp, sp, #8
	add	r3, r3, #48
.L105:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L105
	add	sp, sp, #8
	bx	lr
	.size	delay, .-delay
	.global	cx
	.global	cy
	.global	characterposition
	.global	up
	.comm	bg,544,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cx, %object
	.size	cx, 192
cx:
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	9
	.word	10
	.word	11
	.word	12
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	17
	.word	18
	.word	19
	.word	19
	.word	19
	.word	19
	.word	19
	.word	38
	.word	37
	.word	36
	.word	35
	.word	34
	.word	33
	.word	32
	.word	32
	.word	31
	.word	30
	.word	29
	.word	29
	.word	28
	.word	27
	.word	26
	.word	25
	.word	24
	.word	24
	.word	23
	.word	22
	.word	22
	.word	22
	.word	22
	.word	22
	.type	cy, %object
	.size	cy, 192
cy:
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	39
	.word	39
	.word	39
	.word	39
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	41
	.word	41
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	39
	.word	39
	.word	39
	.word	39
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	41
	.word	41
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.type	up, %object
	.size	up, 4
up:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	characterposition, %object
	.size	characterposition, 4
characterposition:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
