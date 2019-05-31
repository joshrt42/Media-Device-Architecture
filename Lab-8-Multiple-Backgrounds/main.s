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
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #768	@ movhi
	mov	r4, #67108864
	strh	r2, [r4, #0]	@ movhi
	ldr	r0, .L2
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	mov	ip, #7936	@ movhi
	ldr	r5, .L2+8
	strh	ip, [r4, #10]	@ movhi
	mov	r6, #100663296
	mov	r0, #3
	ldr	r1, .L2+12
	mov	r2, #100663296
	mov	r3, #1856
	mov	lr, pc
	bx	r5
	add	r2, r6, #63488
	mov	r0, #3
	ldr	r1, .L2+16
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	ip, #23808
	add	ip, ip, #4
	mov	r3, #5952
	strh	ip, [r4, #8]	@ movhi
	add	r2, r6, #16384
	mov	r0, #3
	ldr	r1, .L2+20
	add	r3, r3, #32
	mov	lr, pc
	bx	r5
	add	r4, r4, #256
	add	r2, r6, #59392
	mov	r3, #2048
	mov	r0, #3
	ldr	r1, .L2+24
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #48]
	ldr	r3, .L2+28
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L2+32
	mov	r2, #0	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	furtherTreesPal
	.word	loadPalette
	.word	DMANow
	.word	furtherTreesTiles
	.word	furtherTreesMap
	.word	treesTiles
	.word	treesMap
	.word	buttons
	.word	hOff
	.size	initialize, .-initialize
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	add	r3, r3, #256
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r4, .L9
	ldreqh	r3, [r4, #0]
	subeq	r3, r3, #1
	streqh	r3, [r4, #0]	@ movhi
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	ldrne	r4, .L9
	tst	r3, #16
	ldreqh	r3, [r4, #0]
	addeq	r3, r3, #1
	streqh	r3, [r4, #0]	@ movhi
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4, #0]
	ldr	r1, .L9+8
	umull	r3, r1, r2, r1
	mov	r3, #67108864
	mov	r1, r1, lsr #2
	strh	r2, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	hOff
	.word	waitForVBlank
	.word	-858993459
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r6, .L14
	ldr	r4, .L14+4
	add	r5, r5, #256
.L12:
	bl	game
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L12
.L15:
	.align	2
.L14:
	.word	oldButtons
	.word	buttons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	hOff,2,2
	.ident	"GCC: (devkitARM release 31) 4.5.0"
