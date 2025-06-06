/*
	synth_stereo_neon64_s32: NEON optimized synth for AArch64 (stereo specific, 32bit output version)

	copyright 1995-2014 by the mpg123 project - free software under the terms of the LGPL 2.1
	see COPYING and AUTHORS files in distribution or http://mpg123.org
	initially written by Taihei Monma
*/

#include "aarch64_defs.h"
#include "mangle.h"

#ifndef __APPLE__
	.section	.rodata
#else
	.data
#endif
	ALIGN16
maxmin_s32:
	.word   1191181824
	.word   -956301312
	.word   1199570944
	.text
	ALIGN4
	.globl ASM_NAME(synth_1to1_s32_s_neon64_asm)
#ifdef __ELF__
	.type ASM_NAME(synth_1to1_s32_s_neon64_asm), %function
#endif
ASM_NAME(synth_1to1_s32_s_neon64_asm):
	add		x0, x0, #64
	sub		x0, x0, x4, lsl #2
	eor		v31.16b, v31.16b, v31.16b
	adrp	x5, AARCH64_PCREL_HI(maxmin_s32)
	add		x5, x5, AARCH64_PCREL_LO(maxmin_s32)
	ld3r	{v28.4s,v29.4s,v30.4s}, [x5]
	sub		sp, sp, #32
	st1		{v8.2s,v9.2s,v10.2s,v11.2s}, [sp]
	sub		sp, sp, #32
	st1		{v12.2s,v13.2s,v14.2s,v15.2s}, [sp]
	
	mov		w4, #4
	mov		x5, #128
1:
	ld1		{v0.4s,v1.4s,v2.4s,v3.4s}, [x0], x5
	ld1		{v4.4s,v5.4s,v6.4s,v7.4s}, [x0], x5
	ld1		{v16.4s,v17.4s,v18.4s,v19.4s}, [x1], #64
	ld1		{v20.4s,v21.4s,v22.4s,v23.4s}, [x2], #64
	ld1		{v8.4s,v9.4s,v10.4s,v11.4s}, [x1], #64
	ld1		{v12.4s,v13.4s,v14.4s,v15.4s}, [x2], #64
	
	fmul	v24.4s, v0.4s, v16.4s
	fmul	v25.4s, v0.4s, v20.4s
	fmul	v26.4s, v4.4s, v8.4s
	fmul	v27.4s, v4.4s, v12.4s
	fmla	v24.4s, v1.4s, v17.4s
	fmla	v25.4s, v1.4s, v21.4s
	fmla	v26.4s, v5.4s, v9.4s
	fmla	v27.4s, v5.4s, v13.4s
	fmla	v24.4s, v2.4s, v18.4s
	fmla	v25.4s, v2.4s, v22.4s
	fmla	v26.4s, v6.4s, v10.4s
	fmla	v27.4s, v6.4s, v14.4s
	fmla	v24.4s, v3.4s, v19.4s
	fmla	v25.4s, v3.4s, v23.4s
	fmla	v26.4s, v7.4s, v11.4s
	fmla	v27.4s, v7.4s, v15.4s
	
	faddp	v0.4s, v24.4s, v25.4s
	faddp	v1.4s, v26.4s, v27.4s
	faddp	v0.4s, v0.4s, v1.4s
	fmul	v1.4s, v0.4s, v30.4s
	fcmgt	v2.4s, v0.4s, v28.4s
	fcmgt	v3.4s, v29.4s, v0.4s
	fcvtns	v1.4s, v1.4s
	add		v2.4s, v2.4s, v3.4s
	add		v31.4s, v31.4s, v2.4s
	st1		{v1.4s}, [x3], #16
	
	ld1		{v0.4s,v1.4s,v2.4s,v3.4s}, [x0], x5
	ld1		{v4.4s,v5.4s,v6.4s,v7.4s}, [x0], x5
	ld1		{v16.4s,v17.4s,v18.4s,v19.4s}, [x1], #64
	ld1		{v20.4s,v21.4s,v22.4s,v23.4s}, [x2], #64
	ld1		{v8.4s,v9.4s,v10.4s,v11.4s}, [x1], #64
	ld1		{v12.4s,v13.4s,v14.4s,v15.4s}, [x2], #64
	
	fmul	v24.4s, v0.4s, v16.4s
	fmul	v25.4s, v0.4s, v20.4s
	fmul	v26.4s, v4.4s, v8.4s
	fmul	v27.4s, v4.4s, v12.4s
	fmla	v24.4s, v1.4s, v17.4s
	fmla	v25.4s, v1.4s, v21.4s
	fmla	v26.4s, v5.4s, v9.4s
	fmla	v27.4s, v5.4s, v13.4s
	fmla	v24.4s, v2.4s, v18.4s
	fmla	v25.4s, v2.4s, v22.4s
	fmla	v26.4s, v6.4s, v10.4s
	fmla	v27.4s, v6.4s, v14.4s
	fmla	v24.4s, v3.4s, v19.4s
	fmla	v25.4s, v3.4s, v23.4s
	fmla	v26.4s, v7.4s, v11.4s
	fmla	v27.4s, v7.4s, v15.4s
	
	faddp	v0.4s, v24.4s, v25.4s
	faddp	v1.4s, v26.4s, v27.4s
	faddp	v0.4s, v0.4s, v1.4s
	fmul	v1.4s, v0.4s, v30.4s
	fcmgt	v2.4s, v0.4s, v28.4s
	fcmgt	v3.4s, v29.4s, v0.4s
	fcvtns	v1.4s, v1.4s
	add		v2.4s, v2.4s, v3.4s
	add		v31.4s, v31.4s, v2.4s
	st1		{v1.4s}, [x3], #16
	
	subs	w4, w4, #1
	b.ne	1b
	
	mov		w4, #4
	mov		x6, #-64
2:
	ld1		{v0.4s,v1.4s,v2.4s,v3.4s}, [x0], x5
	ld1		{v4.4s,v5.4s,v6.4s,v7.4s}, [x0], x5
	ld1		{v16.4s,v17.4s,v18.4s,v19.4s}, [x1], x6
	ld1		{v20.4s,v21.4s,v22.4s,v23.4s}, [x2], x6
	ld1		{v8.4s,v9.4s,v10.4s,v11.4s}, [x1], x6
	ld1		{v12.4s,v13.4s,v14.4s,v15.4s}, [x2], x6
	
	fmul	v24.4s, v0.4s, v16.4s
	fmul	v25.4s, v0.4s, v20.4s
	fmul	v26.4s, v4.4s, v8.4s
	fmul	v27.4s, v4.4s, v12.4s
	fmla	v24.4s, v1.4s, v17.4s
	fmla	v25.4s, v1.4s, v21.4s
	fmla	v26.4s, v5.4s, v9.4s
	fmla	v27.4s, v5.4s, v13.4s
	fmla	v24.4s, v2.4s, v18.4s
	fmla	v25.4s, v2.4s, v22.4s
	fmla	v26.4s, v6.4s, v10.4s
	fmla	v27.4s, v6.4s, v14.4s
	fmla	v24.4s, v3.4s, v19.4s
	fmla	v25.4s, v3.4s, v23.4s
	fmla	v26.4s, v7.4s, v11.4s
	fmla	v27.4s, v7.4s, v15.4s
	
	faddp	v0.4s, v24.4s, v25.4s
	faddp	v1.4s, v26.4s, v27.4s
	faddp	v0.4s, v0.4s, v1.4s
	fmul	v1.4s, v0.4s, v30.4s
	fcmgt	v2.4s, v0.4s, v28.4s
	fcmgt	v3.4s, v29.4s, v0.4s
	fcvtns	v1.4s, v1.4s
	add		v2.4s, v2.4s, v3.4s
	add		v31.4s, v31.4s, v2.4s
	st1		{v1.4s}, [x3], #16
	
	ld1		{v0.4s,v1.4s,v2.4s,v3.4s}, [x0], x5
	ld1		{v4.4s,v5.4s,v6.4s,v7.4s}, [x0], x5
	ld1		{v16.4s,v17.4s,v18.4s,v19.4s}, [x1], x6
	ld1		{v20.4s,v21.4s,v22.4s,v23.4s}, [x2], x6
	ld1		{v8.4s,v9.4s,v10.4s,v11.4s}, [x1], x6
	ld1		{v12.4s,v13.4s,v14.4s,v15.4s}, [x2], x6
	
	fmul	v24.4s, v0.4s, v16.4s
	fmul	v25.4s, v0.4s, v20.4s
	fmul	v26.4s, v4.4s, v8.4s
	fmul	v27.4s, v4.4s, v12.4s
	fmla	v24.4s, v1.4s, v17.4s
	fmla	v25.4s, v1.4s, v21.4s
	fmla	v26.4s, v5.4s, v9.4s
	fmla	v27.4s, v5.4s, v13.4s
	fmla	v24.4s, v2.4s, v18.4s
	fmla	v25.4s, v2.4s, v22.4s
	fmla	v26.4s, v6.4s, v10.4s
	fmla	v27.4s, v6.4s, v14.4s
	fmla	v24.4s, v3.4s, v19.4s
	fmla	v25.4s, v3.4s, v23.4s
	fmla	v26.4s, v7.4s, v11.4s
	fmla	v27.4s, v7.4s, v15.4s
	
	faddp	v0.4s, v24.4s, v25.4s
	faddp	v1.4s, v26.4s, v27.4s
	faddp	v0.4s, v0.4s, v1.4s
	fmul	v1.4s, v0.4s, v30.4s
	fcmgt	v2.4s, v0.4s, v28.4s
	fcmgt	v3.4s, v29.4s, v0.4s
	fcvtns	v1.4s, v1.4s
	add		v2.4s, v2.4s, v3.4s
	add		v31.4s, v31.4s, v2.4s
	st1		{v1.4s}, [x3], #16
	
	subs	w4, w4, #1
	b.ne	2b
	
	AARCH64_DUP_2D(v0, v31, 1)
	add		v0.4s, v0.4s, v31.4s
	AARCH64_DUP_4S(v1, v0, 1)
	add		v0.4s, v0.4s, v1.4s
	umov	w0, v0.s[0]
	neg		w0, w0
	
	ld1		{v12.2s,v13.2s,v14.2s,v15.2s}, [sp], #32
	ld1		{v8.2s,v9.2s,v10.2s,v11.2s}, [sp], #32
	
	ret

NONEXEC_STACK
