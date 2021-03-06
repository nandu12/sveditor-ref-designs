/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc8.s
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
#define PORTABLE_CORE
		
define(INIT_TH_FP_REG,
	`setx $3, %g4, %g5
	stx %g5, [$1]
	ldd    [$1], $2')

#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO

#include "hboot.s"
	
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	! Get TID/DIAG DATA AREA. Separate memory for each thread.
	ta	T_RD_THID
	mov	%o1, %l6
	setx	user_data_start, %g1, %l7
	ta	T_CHANGE_HPRIV
	cmp %l6, 0x0
	be thread_0
	nop
	cmp %l6, 0x1
	be thread_1
	nop
	cmp %l6, 0x2
	be thread_2
	nop
	cmp %l6, 0x3
	be thread_3
	nop
	cmp %l6, 0x4
	be thread_4
	nop
	cmp %l6, 0x5
	be thread_5
	nop
	cmp %l6, 0x6
	be thread_6
	nop
	cmp %l6, 0x7
	be thread_7
	nop
	EXIT_BAD
!
! Thread 0 Start
!
.global thread_0
thread_0:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0xD,	%g2
	set	0x0,	%g3
	set	0x7,	%g4
	set	0x6,	%g5
	set	0xB,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0xC,	%i1
	set	-0x1,	%i2
	set	-0xC,	%i3
	set	-0xB,	%i4
	set	-0xF,	%i5
	set	-0x2,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x1B1479EB,	%l0
	set	0x3FC48DBB,	%l1
	set	0x547A3F28,	%l2
	set	0x6A4ABDE9,	%l3
	set	0x0DB2F34A,	%l4
	set	0x303D2170,	%l5
	set	0x6F19D96E,	%l6
	!# Output registers
	set	-0x17B3,	%o0
	set	-0x1AB7,	%o1
	set	0x15C7,	%o2
	set	-0x1DF8,	%o3
	set	0x09EF,	%o4
	set	0x05D0,	%o5
	set	-0x0D92,	%o6
	set	-0x1254,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA52B36A3745B7D0F)
	INIT_TH_FP_REG(%l7,%f2,0xF56E0DA3B90577AE)
	INIT_TH_FP_REG(%l7,%f4,0x402D7DAC36E9E004)
	INIT_TH_FP_REG(%l7,%f6,0x3E7BF54684D0E162)
	INIT_TH_FP_REG(%l7,%f8,0x28D8FFEFD3AADC85)
	INIT_TH_FP_REG(%l7,%f10,0xCB7B13CDA6BF8DEA)
	INIT_TH_FP_REG(%l7,%f12,0xFBE4579F62424EC9)
	INIT_TH_FP_REG(%l7,%f14,0x0803BB4F6DA96F25)
	INIT_TH_FP_REG(%l7,%f16,0x8C8CF0668AFE08A2)
	INIT_TH_FP_REG(%l7,%f18,0xA553375C4CDAC316)
	INIT_TH_FP_REG(%l7,%f20,0x08DDCB6D2CEAA72B)
	INIT_TH_FP_REG(%l7,%f22,0x33B2375325954A03)
	INIT_TH_FP_REG(%l7,%f24,0xBE22DBBDCE6BB10C)
	INIT_TH_FP_REG(%l7,%f26,0xD5B7E828433B5701)
	INIT_TH_FP_REG(%l7,%f28,0xEE1A081B36C4A381)
	INIT_TH_FP_REG(%l7,%f30,0xB3D02AD26C75010E)

	!# Execute Main Diag ..

	nop
	set	0x64, %l1
	lduw	[%l7 + %l1],	%l5
	set	0x58, %i0
	sta	%f16,	[%l7 + %i0] 0x81
	nop
	set	0x48, %l3
	sth	%l1,	[%l7 + %l3]
	set	0x5D, %l5
	ldstuba	[%l7 + %l5] 0x80,	%o3
	nop
	set	0x48, %o3
	swap	[%l7 + %o3],	%i2
	nop
	set	0x70, %o7
	ldub	[%l7 + %o7],	%l0
	or	%o2,	%o0,	%g2
	nop
	set	0x48, %i7
	std	%f30,	[%l7 + %i7]
	nop
	set	0x50, %l0
	ldsh	[%l7 + %l0],	%i3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%o7
	nop
	set	0x48, %g3
	std	%f24,	[%l7 + %g3]
	nop
	set	0x6F, %i5
	ldub	[%l7 + %i5],	%l6
	and	%o6,	%i7,	%i4
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%i5
	set	0x1C, %i4
	stwa	%o4,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x30, %l6
	prefetch	[%l7 + %l6],	 2
	nop
	set	0x1F, %g2
	ldsb	[%l7 + %g2],	%i0
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f26
	nop
	set	0x38, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x20, %o5
	stwa	%g3,	[%l7 + %o5] 0x89
	nop
	set	0x41, %l4
	ldsb	[%l7 + %l4],	%i6
	nop
	set	0x18, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%i1
	nop
	set	0x0C, %i3
	prefetch	[%l7 + %i3],	 2
	or	%o1,	%g6,	%l3
	set	0x10, %l2
	ldstuba	[%l7 + %l2] 0x81,	%g5
	set	0x6C, %i6
	lda	[%l7 + %i6] 0x88,	%f18
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x81,	%g6
	nop
	set	0x3C, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f0
	nop
	set	0x50, %o2
	std	%f24,	[%l7 + %o2]
	wr	%g4,	%g1,	%pic
	st	%fsr,	[%l7 + 0x6C]
	set	0x40, %i2
	stxa	%l5,	[%l7 + %i2] 0x81
	and	%l1,	%l2,	%o3
	set	0x60, %o6
	ldxa	[%l7 + %o6] 0x81,	%i2
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x89,	%o2
	nop
	set	0x18, %i1
	std	%f26,	[%l7 + %i1]
	ld	[%l7 + 0x34],	%f16
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x68, %l1
	stb	%l0,	[%l7 + %l1]
	set	0x70, %l3
	stda	%g2,	[%l7 + %l3] 0x89
	nop
	set	0x18, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%o0
	nop
	set	0x44, %i7
	swap	[%l7 + %i7],	%i3
	nop
	set	0x70, %l0
	std	%f22,	[%l7 + %l0]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf0
	membar	#Sync
	nop
	set	0x1A, %i5
	ldsh	[%l7 + %i5],	%o5
	nop
	set	0x74, %o7
	sth	%l6,	[%l7 + %o7]
	be,pt	%xcc,	loop_1
	nop
	set	0x40, %i4
	std	%o6,	[%l7 + %i4]
	nop
	set	0x60, %l6
	stx	%o6,	[%l7 + %l6]
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x89,	%i7
loop_1:
	ld	[%l7 + 0x3C],	%f14
	nop
	set	0x5C, %o0
	lduh	[%l7 + %o0],	%i5
	set	0x7C, %g1
	lda	[%l7 + %g1] 0x81,	%f20
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f16
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%o4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%g3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f0
	nop
	set	0x28, %l4
	ldsw	[%l7 + %l4],	%l4
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x81,	%i6
	nop
	set	0x38, %l2
	std	%f30,	[%l7 + %l2]
	nop
	set	0x18, %g7
	sth	%i1,	[%l7 + %g7]
	set	0x4C, %i6
	swapa	[%l7 + %i6] 0x88,	%o1
	st	%fsr,	[%l7 + 0x50]
	set	0x7E, %g5
	stba	%g6,	[%l7 + %g5] 0x89
	set	0x70, %o1
	stda	%l2,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x48, %g6
	lda	[%l7 + %g6] 0x80,	%f15
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x89
	nop
	set	0x30, %o6
	ldsh	[%l7 + %o6],	%g7
	set	0x18, %i2
	stda	%g4,	[%l7 + %i2] 0x80
	nop
	set	0x0F, %i1
	ldstub	[%l7 + %i1],	%g1
	ld	[%l7 + 0x28],	%f27
	set	0x60, %i0
	lda	[%l7 + %i0] 0x89,	%f1
	nop
	set	0x48, %g4
	std	%l4,	[%l7 + %g4]
	nop
	set	0x76, %l3
	lduh	[%l7 + %l3],	%l1
	nop
	set	0x10, %o3
	std	%l2,	[%l7 + %o3]
	st	%f1,	[%l7 + 0x5C]
	ld	[%l7 + 0x34],	%f4
	nop
	set	0x4C, %l1
	stw	%g5,	[%l7 + %l1]
	set	0x20, %l5
	stwa	%o3,	[%l7 + %l5] 0x80
	set	0x66, %i7
	ldstuba	[%l7 + %i7] 0x80,	%i2
	set	0x38, %g3
	swapa	[%l7 + %g3] 0x80,	%o2
	set	0x18, %l0
	sta	%f22,	[%l7 + %l0] 0x80
	nop
	set	0x72, %i5
	ldstub	[%l7 + %i5],	%g2
	fpsub32	%f22,	%f2,	%f2
	set	0x58, %i4
	sta	%f31,	[%l7 + %i4] 0x81
	or	%o0,	%i3,	%o5
	nop
	set	0x1C, %l6
	ldsh	[%l7 + %l6],	%l0
	nop
	set	0x3F, %o7
	ldstub	[%l7 + %o7],	%o7
	nop
	set	0x3C, %g2
	ldstub	[%l7 + %g2],	%o6
	nop
	set	0x68, %o0
	std	%i6,	[%l7 + %o0]
	set	0x5D, %g1
	ldstuba	[%l7 + %g1] 0x80,	%i5
	nop
	set	0x7F, %o4
	ldub	[%l7 + %o4],	%l6
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%o4
	set	0x40, %o5
	stda	%i0,	[%l7 + %o5] 0x81
	set	0x60, %i3
	lda	[%l7 + %i3] 0x80,	%f24
	or	%g3,	%i4,	%l4
	nop
	set	0x18, %g7
	lduh	[%l7 + %g7],	%i6
	fpsub16	%f22,	%f10,	%f22
	nop
	set	0x28, %l2
	std	%o0,	[%l7 + %l2]
	set	0x18, %i6
	lda	[%l7 + %i6] 0x89,	%f20
	set	0x6F, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g6
	wr	%i1,	%g7,	%y
	ld	[%l7 + 0x5C],	%f3
	nop
	set	0x08, %g6
	swap	[%l7 + %g6],	%g4
	set	0x60, %g5
	ldxa	[%l7 + %g5] 0x89,	%g1
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x89,	%l5
	nop
	set	0x56, %i2
	lduh	[%l7 + %i2],	%l3
	nop
	set	0x5E, %i1
	stb	%l1,	[%l7 + %i1]
	nop
	set	0x3C, %o2
	sth	%l2,	[%l7 + %o2]
	nop
	set	0x38, %g4
	std	%f0,	[%l7 + %g4]
	set	0x20, %i0
	lda	[%l7 + %i0] 0x89,	%f30
	nop
	set	0x50, %o3
	std	%o2,	[%l7 + %o3]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%o2
	nop
	set	0x48, %l3
	std	%f14,	[%l7 + %l3]
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x4E, %l5
	sth	%g5,	[%l7 + %l5]
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x80,	%g2
	ld	[%l7 + 0x78],	%f23
	or	%o0,	%i3,	%l0
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%o7
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x44, %i5
	ldsw	[%l7 + %i5],	%o6
	nop
	set	0x74, %l0
	lduh	[%l7 + %l0],	%i7
	nop
	set	0x08, %i4
	ldsh	[%l7 + %i4],	%i5
	nop
	set	0x57, %o7
	ldstub	[%l7 + %o7],	%l6
	nop
	set	0x5C, %g2
	swap	[%l7 + %g2],	%o5
	nop
	set	0x66, %o0
	sth	%i0,	[%l7 + %o0]
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x89,	 1
	be,a,pt	%xcc,	loop_2
	nop
	set	0x78, %o4
	std	%f20,	[%l7 + %o4]
	set	0x7A, %l4
	stha	%i4,	[%l7 + %l4] 0x80
loop_2:
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%l4
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x18, %i3
	stx	%fsr,	[%l7 + %i3]
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f0
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x88,	 0
	nop
	set	0x1A, %i6
	lduh	[%l7 + %i6],	%o1
	set	0x20, %g6
	stwa	%g6,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f16
	nop
	set	0x20, %o1
	stx	%i1,	[%l7 + %o1]
	set	0x44, %i2
	swapa	[%l7 + %i2] 0x80,	%o4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xcc
	set	0x20, %i1
	prefetcha	[%l7 + %i1] 0x81,	 4
	nop
	set	0x7D, %g4
	ldsb	[%l7 + %g4],	%g1
	fpadd16	%f10,	%f4,	%f26
	or	%g4,	%l5,	%l3
	nop
	set	0x50, %o2
	ldub	[%l7 + %o2],	%l1
	set	0x69, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l2
	set	0x40, %o3
	stxa	%i2,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x40, %l1
	sta	%f21,	[%l7 + %l1] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%g5
	nop
	set	0x68, %l3
	stx	%g2,	[%l7 + %l3]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%o3
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x81,	%i3
	wr	%o7,	%o6,	%softint
	nop
	set	0x70, %g3
	std	%l0,	[%l7 + %g3]
	nop
	set	0x7C, %i5
	sth	%i7,	[%l7 + %i5]
	st	%f30,	[%l7 + 0x34]
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x1C]
	and	%l6,	%i5,	%i0
	or	%g3,	%o5,	%i4
	nop
	set	0x0C, %i4
	lduw	[%l7 + %i4],	%l4
	nop
	set	0x40, %l5
	stx	%fsr,	[%l7 + %l5]
	ld	[%l7 + 0x18],	%f2
	set	0x10, %g2
	stba	%o1,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x68, %o0
	sth	%g6,	[%l7 + %o0]
	set	0x4C, %g1
	stha	%i6,	[%l7 + %g1] 0xe2
	membar	#Sync
	ld	[%l7 + 0x30],	%f20
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%i1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xda,	%f0
	nop
	set	0x6C, %o4
	lduh	[%l7 + %o4],	%g7
	and	%g1,	%g4,	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%l2
	nop
	set	0x2C, %l4
	swap	[%l7 + %l4],	%l5
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x80,	%o2
	nop
	set	0x20, %l6
	swap	[%l7 + %l6],	%g5
	nop
	set	0x40, %i3
	stx	%i2,	[%l7 + %i3]
	nop
	set	0x38, %g7
	ldx	[%l7 + %g7],	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%i3
	or	%o7,	%o6,	%g2
	set	0x30, %l2
	stda	%l0,	[%l7 + %l2] 0x80
	nop
	set	0x27, %g6
	ldstub	[%l7 + %g6],	%l6
	set	0x6C, %i6
	lda	[%l7 + %i6] 0x88,	%f4
	nop
	set	0x56, %o1
	stb	%i5,	[%l7 + %o1]
	nop
	set	0x68, %i2
	ldx	[%l7 + %i2],	%i7
	nop
	set	0x7E, %g5
	lduh	[%l7 + %g5],	%i0
	set	0x54, %i1
	lda	[%l7 + %i1] 0x80,	%f20
	set	0x14, %o6
	stwa	%g3,	[%l7 + %o6] 0x81
	set	0x48, %g4
	stha	%o5,	[%l7 + %g4] 0x88
	and	%l4,	%i4,	%o1
	nop
	set	0x60, %i0
	stx	%g6,	[%l7 + %i0]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%i1
	nop
	set	0x3B, %o3
	ldstub	[%l7 + %o3],	%g7
	nop
	set	0x50, %l1
	lduw	[%l7 + %l1],	%g1
	set	0x54, %l3
	lda	[%l7 + %l3] 0x81,	%f9
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f6
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%g4
	or	%i6,	%l3,	%l1
	set	0x1C, %g3
	stwa	%l2,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x52, %l0
	ldub	[%l7 + %l0],	%o2
	nop
	set	0x7E, %i5
	ldub	[%l7 + %i5],	%l5
	and	%g5,	%i2,	%o0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o7
	ld	[%l7 + 0x78],	%f27
	set	0x68, %l5
	lda	[%l7 + %l5] 0x89,	%f17
	set	0x10, %i4
	stxa	%i3,	[%l7 + %i4] 0x89
	set	0x08, %g2
	sta	%f19,	[%l7 + %g2] 0x81
	nop
	set	0x14, %o0
	swap	[%l7 + %o0],	%g2
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%l0
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc8
	ld	[%l7 + 0x10],	%f25
	set	0x38, %l4
	sta	%f25,	[%l7 + %l4] 0x81
	nop
	set	0x60, %o4
	lduw	[%l7 + %o4],	%o6
	set	0x6D, %o5
	stba	%i5,	[%l7 + %o5] 0xe3
	membar	#Sync
	and	%i7,	%l6,	%g3
	nop
	set	0x3C, %l6
	stw	%i0,	[%l7 + %l6]
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%o5
	wr	%l4,	%o1,	%ccr
	nop
	set	0x50, %g7
	std	%f0,	[%l7 + %g7]
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x81,	 3
	nop
	set	0x74, %i6
	swap	[%l7 + %i6],	%o4
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%g6
	fpadd32s	%f24,	%f13,	%f18
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%g7
	set	0x19, %o1
	stba	%i6,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x74, %i1
	prefetch	[%l7 + %i1],	 0
	ld	[%l7 + 0x38],	%f27
	set	0x10, %g5
	stda	%g4,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x80,	%l2
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x80,	%l2
	set	0x20, %g4
	sta	%f29,	[%l7 + %g4] 0x89
	nop
	set	0x44, %l1
	ldsw	[%l7 + %l1],	%o2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f16
	set	0x54, %l3
	stwa	%l5,	[%l7 + %l3] 0x89
	set	0x5A, %i7
	stha	%l1,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xe3,	%i2
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x81,	 3
	nop
	set	0x78, %l0
	std	%f14,	[%l7 + %l0]
	nop
	set	0x50, %l5
	std	%f22,	[%l7 + %l5]
	set	0x28, %i4
	sta	%f31,	[%l7 + %i4] 0x88
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	or	%g5,	%o7,	%g2
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%i3
	nop
	set	0x68, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x2C, %g2
	ldstub	[%l7 + %g2],	%l0
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x88,	%o6
	nop
	set	0x10, %o4
	sth	%i7,	[%l7 + %o4]
	set	0x10, %g1
	ldxa	[%l7 + %g1] 0x88,	%i5
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%g3
	set	0x52, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l6
	nop
	set	0x49, %g7
	ldsb	[%l7 + %g7],	%i0
	nop
	set	0x1D, %i3
	ldstub	[%l7 + %i3],	%o5
	bge,a,pt	%xcc,	loop_3
	nop
	set	0x38, %i6
	ldx	[%l7 + %i6],	%l4
	set	0x70, %g6
	stda	%i4,	[%l7 + %g6] 0xe2
	membar	#Sync
loop_3:
	nop
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe2,	%o0
	nop
	set	0x48, %o1
	lduw	[%l7 + %o1],	%g6
	st	%f5,	[%l7 + 0x58]
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xcc
	nop
	set	0x6C, %g5
	ldsb	[%l7 + %g5],	%o4
	nop
	set	0x54, %o6
	swap	[%l7 + %o6],	%i1
	nop
	set	0x2C, %i0
	ldub	[%l7 + %i0],	%g7
	nop
	set	0x58, %i1
	stx	%g1,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x2C]
	set	0x78, %l1
	stba	%i6,	[%l7 + %l1] 0x89
	ba,pt	%icc,	loop_4
	nop
	set	0x40, %o3
	stx	%fsr,	[%l7 + %o3]
	ld	[%l7 + 0x44],	%f14
	add	%g4,	%l3,	%l2
loop_4:
	nop
	set	0x0E, %l3
	stha	%l5,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x30, %g4
	stx	%l1,	[%l7 + %g4]
	add	%i2,	%o2,	%o0
	ld	[%l7 + 0x1C],	%f4
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f14
	nop
	set	0x6A, %g3
	ldsb	[%l7 + %g3],	%g5
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x88,	%o3
	st	%f4,	[%l7 + 0x78]
	nop
	set	0x10, %l5
	ldsh	[%l7 + %l5],	%o7
	nop
	set	0x72, %i4
	sth	%i3,	[%l7 + %i4]
	nop
	set	0x7A, %i5
	ldsb	[%l7 + %i5],	%l0
	nop
	set	0x7C, %l0
	ldub	[%l7 + %l0],	%g2
	set	0x34, %o7
	swapa	[%l7 + %o7] 0x80,	%i7
	nop
	set	0x40, %g2
	std	%o6,	[%l7 + %g2]
	set	0x36, %l4
	stha	%i5,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xcc
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%o5
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x81,	%l4
	nop
	set	0x23, %g1
	stb	%l6,	[%l7 + %g1]
	nop
	set	0x59, %g7
	ldstub	[%l7 + %g7],	%o1
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x64, %o5
	ldsw	[%l7 + %o5],	%i4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x19F, 	%tick_cmpr
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%g6
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x88,	 4
	nop
	set	0x70, %g6
	std	%i6,	[%l7 + %g6]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%l3
	set	0x68, %o1
	stda	%l2,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x30, %l2
	ldsw	[%l7 + %l2],	%l5
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f12
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%g4
	and	%l1,	%o2,	%i2
	set	0x68, %i1
	prefetcha	[%l7 + %i1] 0x89,	 1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%o3
	nop
	set	0x50, %i0
	swap	[%l7 + %i0],	%i3
	set	0x66, %o3
	stha	%l0,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x10, %l3
	std	%f22,	[%l7 + %l3]
	set	0x58, %l1
	ldxa	[%l7 + %l1] 0x89,	%o7
	ld	[%l7 + 0x60],	%f10
	set	0x7A, %o2
	ldstuba	[%l7 + %o2] 0x80,	%i7
	nop
	set	0x2C, %g4
	ldsw	[%l7 + %g4],	%g2
	set	0x40, %g3
	stxa	%i5,	[%l7 + %g3] 0xe3
	membar	#Sync
	add	%o6,	%i0,	%o5
	nop
	set	0x3F, %l5
	ldsb	[%l7 + %l5],	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc8
	nop
	set	0x5F, %i5
	stb	%i4,	[%l7 + %i5]
	set	0x22, %i7
	ldstuba	[%l7 + %i7] 0x89,	%l4
	nop
	set	0x48, %o7
	stw	%g6,	[%l7 + %o7]
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x88,	%o4
	set	0x08, %g2
	stda	%g6,	[%l7 + %g2] 0x89
	wr	%i6,	%g1,	%y
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%l3
	nop
	set	0x48, %o0
	lduh	[%l7 + %o0],	%l2
	set	0x28, %l6
	lda	[%l7 + %l6] 0x81,	%f18
	set	0x64, %l4
	sta	%f1,	[%l7 + %l4] 0x88
	set	0x40, %g1
	sta	%f10,	[%l7 + %g1] 0x88
	nop
	set	0x32, %o5
	ldsb	[%l7 + %o5],	%i1
	set	0x5E, %i6
	ldstuba	[%l7 + %i6] 0x88,	%l5
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x81,	%l1
	add	%g4,	%o2,	%i2
	set	0x34, %g7
	swapa	[%l7 + %g7] 0x88,	%o0
	nop
	set	0x54, %o1
	lduh	[%l7 + %o1],	%o3
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0
	or	%g5,	%o7,	%i7
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x36, %g5
	ldsh	[%l7 + %g5],	%g2
	set	0x6E, %i2
	stba	%i5,	[%l7 + %i2] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%o6
	and	%i0,	%o5,	%l6
	nop
	set	0x18, %o6
	sth	%o1,	[%l7 + %o6]
	set	0x50, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g3
	set	0x44, %i1
	stwa	%i4,	[%l7 + %i1] 0x88
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%l4
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	set	0x18, %l1
	stda	%g6,	[%l7 + %l1] 0x81
	nop
	set	0x70, %o2
	stx	%fsr,	[%l7 + %o2]
	ld	[%l7 + 0x64],	%f8
	nop
	set	0x50, %g4
	std	%i6,	[%l7 + %g4]
	set	0x18, %l3
	sta	%f3,	[%l7 + %l3] 0x89
	ld	[%l7 + 0x74],	%f30
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%l3
	fpadd16s	%f15,	%f26,	%f9
	nop
	set	0x5C, %g3
	ldsw	[%l7 + %g3],	%l2
	nop
	set	0x18, %l5
	std	%i0,	[%l7 + %l5]
	or	%o4,	%l5,	%l1
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f10
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc4
	nop
	set	0x14, %o7
	ldsw	[%l7 + %o7],	%g4
	st	%fsr,	[%l7 + 0x68]
	fpsub32s	%f19,	%f20,	%f25
	fpadd16s	%f5,	%f3,	%f14
	nop
	set	0x16, %l0
	ldsh	[%l7 + %l0],	%i2
	nop
	set	0x0F, %g2
	ldstub	[%l7 + %g2],	%o2
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f18
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc8
	set	0x60, %o0
	stwa	%o3,	[%l7 + %o0] 0x80
	set	0x48, %l6
	stda	%o0,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x21, %l4
	ldub	[%l7 + %l4],	%i3
	add	%g5,	%o7,	%i7
	nop
	set	0x3E, %o5
	sth	%i5,	[%l7 + %o5]
	nop
	set	0x20, %i6
	sth	%g2,	[%l7 + %i6]
	set	0x69, %g1
	stba	%l0,	[%l7 + %g1] 0x88
	wr	%o6,	%o5,	%softint
	set	0x1A, %g7
	ldstuba	[%l7 + %g7] 0x81,	%i0
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%o1
	set	0x18, %i3
	stxa	%g3,	[%l7 + %i3] 0x81
	nop
	set	0x58, %g6
	std	%f10,	[%l7 + %g6]
	set	0x20, %i2
	stda	%i4,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x30, %o6
	std	%f2,	[%l7 + %o6]
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xea,	%l4
	nop
	set	0x3C, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x3C, %o3
	stwa	%g6,	[%l7 + %o3] 0xea
	membar	#Sync
	fpadd16	%f18,	%f12,	%f10
	nop
	set	0x3C, %l2
	sth	%g7,	[%l7 + %l2]
	nop
	set	0x37, %i0
	stb	%l6,	[%l7 + %i0]
	set	0x54, %l1
	lda	[%l7 + %l1] 0x81,	%f23
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%g0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%i6
	set	0x4E, %o2
	stba	%l2,	[%l7 + %o2] 0x89
	set	0x18, %g3
	stxa	%o4,	[%l7 + %g3] 0x81
	set	0x08, %l3
	swapa	[%l7 + %l3] 0x81,	%l5
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xd0
	nop
	set	0x70, %i5
	lduw	[%l7 + %i5],	%i1
	set	0x64, %i4
	swapa	[%l7 + %i4] 0x89,	%l1
	nop
	set	0x60, %o7
	swap	[%l7 + %o7],	%i2
	nop
	set	0x1F, %l0
	ldsb	[%l7 + %l0],	%g4
	nop
	set	0x43, %g2
	stb	%o3,	[%l7 + %g2]
	st	%f16,	[%l7 + 0x74]
	set	0x18, %i7
	sta	%f10,	[%l7 + %i7] 0x89
	nop
	set	0x4C, %o0
	lduw	[%l7 + %o0],	%o2
	nop
	set	0x60, %o4
	ldstub	[%l7 + %o4],	%o0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f0
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe3,	%i2
	set	0x28, %i6
	swapa	[%l7 + %i6] 0x89,	%g5
	set	0x78, %o5
	stda	%i6,	[%l7 + %o5] 0xe2
	membar	#Sync
	st	%f13,	[%l7 + 0x50]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc8
	st	%f6,	[%l7 + 0x30]
	nop
	set	0x60, %o1
	ldstub	[%l7 + %o1],	%i5
	ld	[%l7 + 0x60],	%f21
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%l0
	and	%o7,	%o5,	%o6
	set	0x4C, %i3
	lda	[%l7 + %i3] 0x80,	%f12
	nop
	set	0x50, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x7C, %g7
	lda	[%l7 + %g7] 0x88,	%f3
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	or	%i0,	%g3,	%i4
	set	0x40, %g5
	stxa	%o1,	[%l7 + %g5] 0x89
	nop
	set	0x7C, %o6
	ldsw	[%l7 + %o6],	%l4
	nop
	set	0x2D, %i1
	stb	%g6,	[%l7 + %i1]
	nop
	set	0x78, %l2
	std	%f2,	[%l7 + %l2]
	set	0x70, %i0
	prefetcha	[%l7 + %i0] 0x88,	 3
	ld	[%l7 + 0x44],	%f19
	nop
	set	0x40, %o3
	stx	%g7,	[%l7 + %o3]
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x89,	%g1
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x1C, %g3
	sta	%f20,	[%l7 + %g3] 0x81
	set	0x64, %g4
	sta	%f4,	[%l7 + %g4] 0x89
	fpsub32	%f16,	%f24,	%f20
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf8
	membar	#Sync
	nop
	set	0x08, %i5
	ldub	[%l7 + %i5],	%l3
	fpadd32	%f2,	%f16,	%f24
	nop
	set	0x5A, %i4
	stb	%l2,	[%l7 + %i4]
	set	0x5C, %o7
	stwa	%o4,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x30, %l5
	lduh	[%l7 + %l5],	%l5
	nop
	set	0x48, %l0
	swap	[%l7 + %l0],	%i1
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x80,	%i6
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x80,	 2
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x81
	nop
	set	0x38, %g2
	lduw	[%l7 + %g2],	%g4
	set	0x1C, %l6
	stwa	%o3,	[%l7 + %l6] 0xe2
	membar	#Sync
	st	%f22,	[%l7 + 0x18]
	nop
	set	0x3F, %i6
	ldstub	[%l7 + %i6],	%o2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%i3
	nop
	set	0x5C, %l4
	prefetch	[%l7 + %l4],	 3
	or	%g5,	%l1,	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%l0
	set	0x56, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g2
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%f12
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x38, %g6
	swapa	[%l7 + %g6] 0x80,	%o7
	set	0x26, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o6
	nop
	set	0x20, %i2
	std	%o4,	[%l7 + %i2]
	nop
	set	0x64, %g7
	ldstub	[%l7 + %g7],	%i0
	and	%g3,	%i4,	%l4
	set	0x08, %o6
	sta	%f1,	[%l7 + %o6] 0x81
	nop
	set	0x59, %g5
	ldub	[%l7 + %g5],	%o1
	nop
	set	0x20, %i1
	stw	%g6,	[%l7 + %i1]
	nop
	set	0x1F, %l2
	ldsb	[%l7 + %l2],	%l6
	nop
	set	0x52, %i0
	ldsh	[%l7 + %i0],	%g7
	nop
	set	0x42, %o3
	ldsh	[%l7 + %o3],	%g1
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%l2
	nop
	set	0x64, %o2
	ldub	[%l7 + %o2],	%o4
	nop
	set	0x18, %g4
	stb	%l2,	[%l7 + %g4]
	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x89,	%l5
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%i6
	nop
	set	0x78, %i5
	lduw	[%l7 + %i5],	%i2
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xda
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f0
	and	%g4,	%i1,	%o3
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x80,	 4
	or	%i3,	%g5,	%l1
	nop
	set	0x60, %i7
	prefetch	[%l7 + %i7],	 1
	fpsub32s	%f17,	%f26,	%f25
	ld	[%l7 + 0x70],	%f22
	nop
	set	0x14, %o0
	stw	%o0,	[%l7 + %o0]
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x80,	%i4
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f2
	set	0x70, %g2
	swapa	[%l7 + %g2] 0x81,	%l0
	set	0x7C, %i6
	swapa	[%l7 + %i6] 0x89,	%i7
	st	%f23,	[%l7 + 0x54]
	nop
	set	0x30, %l6
	stx	%o7,	[%l7 + %l6]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%o5
	set	0x2D, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g2
	set	0x2F, %g1
	stba	%g3,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x4E, %o5
	lduh	[%l7 + %o5],	%i0
	nop
	set	0x70, %o1
	stx	%o1,	[%l7 + %o1]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%l3
	wr	%o4,	%l6,	%ccr
	nop
	set	0x40, %i3
	std	%l2,	[%l7 + %i3]
	nop
	set	0x10, %i2
	stx	%i6,	[%l7 + %i2]
	set	0x58, %g6
	sta	%f31,	[%l7 + %g6] 0x80
	bne,a	%icc,	loop_5
	nop
	set	0x30, %g7
	stw	%i2,	[%l7 + %g7]
	set	0x74, %g5
	stha	%g4,	[%l7 + %g5] 0xe2
	membar	#Sync
loop_5:
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f28
	nop
	set	0x3C, %i1
	stw	%l5,	[%l7 + %i1]
	set	0x16, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i1
	nop
	set	0x0F, %i0
	ldsb	[%l7 + %i0],	%o2
	set	0x38, %o3
	lda	[%l7 + %o3] 0x89,	%f6
	or	%i3,	%o3,	%l1
	nop
	set	0x6C, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x48, %g4
	stha	%o0,	[%l7 + %g4] 0x89
	nop
	set	0x6C, %g3
	lduh	[%l7 + %g3],	%i5
	add	%l0,	%g5,	%o7
	nop
	set	0x68, %o2
	stw	%i7,	[%l7 + %o2]
	set	0x2A, %i5
	stba	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	be	%xcc,	loop_6
	nop
	set	0x3D, %l3
	ldub	[%l7 + %l3],	%o5
	nop
	set	0x28, %o7
	stx	%g2,	[%l7 + %o7]
	nop
	set	0x24, %l0
	stw	%g3,	[%l7 + %l0]
loop_6:
	nop
	set	0x78, %i4
	ldx	[%l7 + %i4],	%i4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%i0
	nop
	set	0x18, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x7C, %o4
	lduh	[%l7 + %o4],	%g6
	nop
	set	0x20, %g2
	std	%o0,	[%l7 + %g2]
	set	0x60, %l5
	stxa	%g7,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f12
	fpadd16s	%f30,	%f22,	%f21
	nop
	set	0x0A, %l4
	lduh	[%l7 + %l4],	%g1
	nop
	set	0x42, %g1
	ldsh	[%l7 + %g1],	%l3
	ld	[%l7 + 0x34],	%f28
	nop
	set	0x22, %l6
	ldub	[%l7 + %l6],	%l6
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x80,	%l2
	ld	[%l7 + 0x1C],	%f29
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x81,	 4
	nop
	set	0x18, %i2
	lduh	[%l7 + %i2],	%i2
	nop
	set	0x24, %g6
	ldsb	[%l7 + %g6],	%o4
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x89,	 3
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x89,	%l5
	nop
	set	0x18, %o1
	std	%f4,	[%l7 + %o1]
	nop
	set	0x48, %o6
	sth	%i1,	[%l7 + %o6]
	nop
	set	0x3C, %l2
	lduh	[%l7 + %l2],	%i3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%l1
	nop
	set	0x28, %i1
	stx	%o2,	[%l7 + %i1]
	st	%f24,	[%l7 + 0x3C]
	ld	[%l7 + 0x70],	%f22
	set	0x1C, %o3
	swapa	[%l7 + %o3] 0x89,	%o0
	nop
	set	0x5C, %l1
	ldsw	[%l7 + %l1],	%i5
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x0C, %g4
	lduw	[%l7 + %g4],	%l0
	set	0x44, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o7
	or	%g5,	%i7,	%o5
	nop
	set	0x48, %o2
	std	%g2,	[%l7 + %o2]
	set	0x1C, %i0
	stwa	%o6,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x69, %l3
	ldub	[%l7 + %l3],	%i4
	st	%f11,	[%l7 + 0x30]
	st	%f24,	[%l7 + 0x70]
	set	0x60, %o7
	ldda	[%l7 + %o7] 0xea,	%l4
	set	0x48, %i5
	stwa	%i0,	[%l7 + %i5] 0xeb
	membar	#Sync
	fpsub16	%f18,	%f4,	%f2
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x89,	%g2
	nop
	set	0x18, %o0
	stb	%g6,	[%l7 + %o0]
	nop
	set	0x2C, %l0
	lduw	[%l7 + %l0],	%g7
	set	0x20, %i7
	ldda	[%l7 + %i7] 0xea,	%o0
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x81,	%g1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l2
	nop
	set	0x0C, %l5
	lduw	[%l7 + %l5],	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%g4
	set	0x2A, %i6
	stha	%i1,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f0
	nop
	set	0x52, %g1
	ldsb	[%l7 + %g1],	%l5
	nop
	set	0x42, %l6
	lduh	[%l7 + %l6],	%o3
	st	%f25,	[%l7 + 0x48]
	nop
	set	0x30, %l4
	std	%l0,	[%l7 + %l4]
	set	0x20, %i3
	stwa	%i3,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x38, %i2
	std	%f12,	[%l7 + %i2]
	set	0x68, %g6
	stda	%o0,	[%l7 + %g6] 0x89
	fpadd16	%f16,	%f12,	%f20
	nop
	set	0x70, %o5
	ldub	[%l7 + %o5],	%o2
	set	0x20, %g5
	stda	%l0,	[%l7 + %g5] 0x81
	st	%fsr,	[%l7 + 0x70]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%g5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o7
	set	0x2C, %o1
	stba	%o5,	[%l7 + %o1] 0x89
	set	0x30, %g7
	lda	[%l7 + %g7] 0x80,	%f13
	set	0x74, %o6
	lda	[%l7 + %o6] 0x81,	%f18
	set	0x44, %l2
	sta	%f19,	[%l7 + %l2] 0x81
	set	0x58, %i1
	ldstuba	[%l7 + %i1] 0x89,	%o6
	set	0x58, %l1
	lda	[%l7 + %l1] 0x89,	%f15
	nop
	set	0x40, %o3
	ldsh	[%l7 + %o3],	%i4
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc0
	st	%f6,	[%l7 + 0x70]
	set	0x08, %o2
	swapa	[%l7 + %o2] 0x81,	%l4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f0
	st	%f19,	[%l7 + 0x68]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f16
	nop
	set	0x18, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x48, %o7
	std	%f6,	[%l7 + %o7]
	add	%g2,	%i0,	%g3
	set	0x6C, %i4
	lda	[%l7 + %i4] 0x89,	%f24
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x89,	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o1
	nop
	set	0x4B, %o0
	stb	%g1,	[%l7 + %o0]
	wr	%l6,	%l2,	%y
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f6
	nop
	set	0x1C, %i7
	ldsh	[%l7 + %i7],	%l3
	nop
	set	0x12, %l5
	ldub	[%l7 + %l5],	%i2
	nop
	set	0x40, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x81,	%i6
	set	0x40, %g1
	prefetcha	[%l7 + %g1] 0x81,	 4
	nop
	set	0x6A, %l6
	ldub	[%l7 + %l6],	%g4
	nop
	set	0x49, %g2
	ldsb	[%l7 + %g2],	%l5
	nop
	set	0x34, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x64, %l4
	sth	%o3,	[%l7 + %l4]
	set	0x18, %g6
	stxa	%i1,	[%l7 + %g6] 0x88
	wr	%l1,	%i3,	%softint
	add	%o0,	%l0,	%i5
	set	0x48, %o5
	stda	%g4,	[%l7 + %o5] 0x81
	nop
	set	0x40, %i2
	ldsw	[%l7 + %i2],	%o2
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x81,	%i7
	nop
	set	0x68, %g7
	ldx	[%l7 + %g7],	%o5
	nop
	set	0x18, %o6
	std	%o6,	[%l7 + %o6]
	nop
	set	0x14, %g5
	ldstub	[%l7 + %g5],	%o7
	nop
	set	0x24, %l2
	swap	[%l7 + %l2],	%i4
	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%l4
	set	0x08, %l1
	lda	[%l7 + %l1] 0x88,	%f31
	or	%g2,	%i0,	%g7
	fpadd16s	%f31,	%f28,	%f1
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%g2
	nop
	set	0x68, %o3
	ldx	[%l7 + %o3],	%o1
	set	0x40, %g3
	stxa	%g6,	[%l7 + %g3] 0xe3
	membar	#Sync
	and	%l6,	%g1,	%l2
	nop
	set	0x60, %l3
	prefetch	[%l7 + %l3],	 2
	add	%l3,	%i2,	%o4
	nop
	set	0x3F, %o2
	ldsb	[%l7 + %o2],	%g4
	and	%i6,	%o3,	%l5
	add	%l1,	%i3,	%i1
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%o0
	set	0x60, %i4
	ldda	[%l7 + %i4] 0xe2,	%l0
	or	%g5,	%i5,	%o2
	st	%fsr,	[%l7 + 0x0C]
	ld	[%l7 + 0x64],	%f19
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%o4
	set	0x10, %i5
	stxa	%i7,	[%l7 + %i5] 0x88
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%o6
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%i4
	st	%fsr,	[%l7 + 0x64]
	fpadd32s	%f27,	%f22,	%f3
	set	0x14, %o0
	stwa	%l4,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x3C, %i6
	stw	%g2,	[%l7 + %i6]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%i0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f0
	nop
	nop
	setx	0xD1C8B895,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x8563A47B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f20,	%f10
	set	0x70, %o4
	stwa	%g3,	[%l7 + %o4] 0x80
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f26
	fpsub32s	%f15,	%f8,	%f3
	set	0x40, %g1
	stha	%g7,	[%l7 + %g1] 0xeb
	membar	#Sync
	bn,a,pt	%xcc,	loop_7
	st	%f20,	[%l7 + 0x08]
	fpadd16s	%f6,	%f10,	%f0
	nop
	set	0x78, %i3
	ldstub	[%l7 + %i3],	%g6
loop_7:
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%o1
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x81,	%i6
	nop
	set	0x38, %i2
	prefetch	[%l7 + %i2],	 2
	ld	[%l7 + 0x28],	%f18
	set	0x58, %g6
	stxa	%l2,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%l2
	set	0x18, %o1
	stda	%g0,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x40, %o6
	stwa	%i2,	[%l7 + %o6] 0x89
	nop
	set	0x30, %g5
	stx	%o4,	[%l7 + %g5]
	nop
	set	0x1E, %i1
	ldstub	[%l7 + %i1],	%i6
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%o3
	nop
	set	0x54, %g4
	ldsw	[%l7 + %g4],	%i3
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x88,	%l0
	set	0x18, %l2
	stwa	%i1,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x74, %l3
	ldsb	[%l7 + %l3],	%o0
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x88,	 0
	nop
	set	0x1C, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x40, %o7
	ldsh	[%l7 + %o7],	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%g5
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%i7
	ld	[%l7 + 0x40],	%f9
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%o6
	set	0x10, %i4
	swapa	[%l7 + %i4] 0x89,	%i4
	set	0x44, %i7
	stha	%o5,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x3C, %l0
	stb	%g2,	[%l7 + %l0]
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f22
	set	0x43, %l5
	stba	%o7,	[%l7 + %l5] 0x89
	set	0x0C, %o4
	lda	[%l7 + %o4] 0x88,	%f21
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%i0
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%g3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%g6
	nop
	set	0x60, %g2
	stw	%l4,	[%l7 + %g2]
	set	0x4E, %g1
	stha	%g6,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x68, %l4
	swapa	[%l7 + %l4] 0x80,	%o1
	nop
	nop
	setx	0x057F1315,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x1DE1129B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f3,	%f2
	nop
	set	0x20, %i2
	ldstub	[%l7 + %i2],	%l6
	nop
	set	0x6C, %g6
	lduh	[%l7 + %g6],	%l2
	nop
	set	0x10, %g7
	std	%f12,	[%l7 + %g7]
	nop
	set	0x2E, %o1
	ldub	[%l7 + %o1],	%g1
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x80,	%i2
	st	%f29,	[%l7 + 0x60]
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%o4
	nop
	set	0x28, %i1
	lduw	[%l7 + %i1],	%l3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%l5
	st	%f19,	[%l7 + 0x38]
	st	%f12,	[%l7 + 0x14]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%i6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%i3
	set	0x10, %o5
	lda	[%l7 + %o5] 0x81,	%f8
	nop
	set	0x1C, %g4
	ldub	[%l7 + %g4],	%i1
	or	%o0,	%i5,	%l0
	nop
	set	0x1C, %o3
	stw	%o2,	[%l7 + %o3]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%g5
	nop
	set	0x0C, %l2
	ldub	[%l7 + %l2],	%i4
	nop
	set	0x3E, %l1
	ldub	[%l7 + %l1],	%o5
	st	%f4,	[%l7 + 0x08]
	set	0x68, %l3
	stwa	%g2,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f0
	set	0x10, %g3
	stxa	%o6,	[%l7 + %g3] 0x81
	and	%i0,	%o7,	%g3
	nop
	set	0x50, %i0
	std	%l4,	[%l7 + %i0]
	nop
	set	0x4D, %i5
	ldstub	[%l7 + %i5],	%g6
	nop
	set	0x1D, %i4
	ldub	[%l7 + %i4],	%g7
	bge,pn	%icc,	loop_8
	ld	[%l7 + 0x44],	%f1
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%l6
	nop
	set	0x70, %l0
	lduh	[%l7 + %l0],	%l2
loop_8:
	and	%o1,	%i2,	%o4
	nop
	set	0x50, %i6
	swap	[%l7 + %i6],	%l3
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f22
	nop
	set	0x57, %o4
	ldub	[%l7 + %o4],	%g1
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x89,	%g4
	nop
	set	0x30, %l6
	std	%l4,	[%l7 + %l6]
	nop
	set	0x08, %l5
	sth	%i6,	[%l7 + %l5]
	set	0x38, %i3
	stxa	%l1,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x08, %g2
	std	%o2,	[%l7 + %g2]
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%i3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd8,	%f0
	wr	%o0,	%i1,	%set_softint
	nop
	set	0x24, %g1
	lduw	[%l7 + %g1],	%i5
	nop
	set	0x48, %g7
	stx	%l0,	[%l7 + %g7]
	nop
	set	0x28, %o1
	lduw	[%l7 + %o1],	%o2
	set	0x68, %g6
	lda	[%l7 + %g6] 0x89,	%f19
	add	%i7,	%g5,	%i4
	set	0x5C, %g5
	swapa	[%l7 + %g5] 0x81,	%o5
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x68, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x28, %o5
	std	%f16,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x74, %g4
	swap	[%l7 + %g4],	%g2
	nop
	set	0x43, %l2
	ldsb	[%l7 + %l2],	%i0
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%o6
	add	%g3,	%o6,	%l4
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%g7
	set	0x68, %o2
	stha	%g6,	[%l7 + %o2] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f12
	set	0x38, %g3
	lda	[%l7 + %g3] 0x80,	%f13
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAE1, 	%tick_cmpr
	nop
	set	0x5A, %i0
	ldsh	[%l7 + %i0],	%o1
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x3A, %i5
	ldsb	[%l7 + %i5],	%i2
	set	0x18, %o7
	swapa	[%l7 + %o7] 0x80,	%o4
	nop
	set	0x24, %l0
	swap	[%l7 + %l0],	%l3
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%g4
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%g1
	set	0x38, %o4
	stda	%l4,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x0E, %o0
	ldsh	[%l7 + %o0],	%l1
	set	0x48, %i7
	swapa	[%l7 + %i7] 0x89,	%i6
	nop
	set	0x18, %l5
	std	%i2,	[%l7 + %l5]
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%o0
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x6C, %i3
	prefetch	[%l7 + %i3],	 2
	and	%o3,	%i1,	%l0
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x48, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x47, %i2
	stb	%i4,	[%l7 + %i2]
	nop
	set	0x78, %l4
	ldub	[%l7 + %l4],	%o5
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x50, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x0E, %g1
	ldsb	[%l7 + %g1],	%g5
	nop
	set	0x70, %o1
	std	%g2,	[%l7 + %o1]
	add	%o7,	%g3,	%i0
	nop
	set	0x0C, %g5
	stw	%o6,	[%l7 + %g5]
	set	0x60, %i1
	stxa	%g7,	[%l7 + %i1] 0x80
	set	0x10, %g6
	stda	%g6,	[%l7 + %g6] 0xe2
	membar	#Sync
	fpadd16	%f20,	%f20,	%f20
	nop
	set	0x42, %o5
	lduh	[%l7 + %o5],	%l6
	nop
	set	0x68, %g4
	ldsb	[%l7 + %g4],	%l2
	set	0x35, %o6
	ldstuba	[%l7 + %o6] 0x88,	%l4
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%i2
	add	%o4,	%o1,	%g4
	fpadd16	%f28,	%f14,	%f26
	set	0x3F, %o3
	ldstuba	[%l7 + %o3] 0x80,	%g1
	nop
	set	0x34, %o2
	lduh	[%l7 + %o2],	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%l3
	ld	[%l7 + 0x6C],	%f4
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x81,	%i6
	st	%fsr,	[%l7 + 0x44]
	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x89,	%i3
	nop
	set	0x1C, %l3
	swap	[%l7 + %l3],	%o3
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f28
	nop
	set	0x30, %i0
	lduw	[%l7 + %i0],	%o0
	nop
	set	0x4E, %l0
	sth	%i1,	[%l7 + %l0]
	add	%l0,	%i5,	%o2
	nop
	set	0x60, %o7
	prefetch	[%l7 + %o7],	 2
	nop
	set	0x74, %i6
	ldsw	[%l7 + %i6],	%i4
	set	0x58, %i4
	stxa	%i7,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x42, %o4
	sth	%g5,	[%l7 + %o4]
	nop
	set	0x20, %i7
	ldx	[%l7 + %i7],	%o5
	fpsub16	%f6,	%f0,	%f16
	wr	%o7,	%g3,	%softint
	nop
	set	0x40, %l5
	std	%f2,	[%l7 + %l5]
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x38, %l6
	std	%f6,	[%l7 + %l6]
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%g2
	ble	%xcc,	loop_9
	add	%i0,	%o6,	%g7
	nop
	set	0x36, %l4
	ldstub	[%l7 + %l4],	%g6
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%l6
loop_9:
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x42, %o1
	ldub	[%l7 + %o1],	%l4
	nop
	set	0x36, %g1
	sth	%i2,	[%l7 + %g1]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%o1
	set	0x58, %i1
	stda	%g4,	[%l7 + %i1] 0x81
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f24
	nop
	set	0x08, %o5
	stb	%l2,	[%l7 + %o5]
	nop
	set	0x78, %g4
	stx	%l5,	[%l7 + %g4]
	fpsub32s	%f22,	%f29,	%f21
	nop
	set	0x3D, %g6
	ldstub	[%l7 + %g6],	%l1
	nop
	set	0x66, %o6
	sth	%l3,	[%l7 + %o6]
	nop
	set	0x62, %o3
	sth	%i6,	[%l7 + %o3]
	add	%g1,	%i3,	%o0
	nop
	set	0x30, %o2
	stx	%o3,	[%l7 + %o2]
	nop
	set	0x48, %l2
	stx	%i1,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x48, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x40, %l3
	std	%l0,	[%l7 + %l3]
	ld	[%l7 + 0x28],	%f13
	set	0x48, %g3
	stwa	%o2,	[%l7 + %g3] 0x80
	st	%f23,	[%l7 + 0x50]
	set	0x10, %i5
	swapa	[%l7 + %i5] 0x81,	%i5
	nop
	set	0x24, %l0
	stw	%i4,	[%l7 + %l0]
	bg	%icc,	loop_10
	nop
	set	0x48, %o7
	std	%f10,	[%l7 + %o7]
	nop
	set	0x1A, %i6
	sth	%g5,	[%l7 + %i6]
	set	0x5C, %i0
	stwa	%o5,	[%l7 + %i0] 0x81
loop_10:
	ld	[%l7 + 0x20],	%f8
	nop
	set	0x60, %o4
	stx	%i7,	[%l7 + %o4]
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xe2,	%o6
	nop
	set	0x37, %i4
	ldub	[%l7 + %i4],	%g3
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%i0
	nop
	set	0x28, %l6
	stx	%o6,	[%l7 + %l6]
	nop
	set	0x18, %l5
	swap	[%l7 + %l5],	%g7
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x88,	 1
	nop
	set	0x58, %i2
	std	%g6,	[%l7 + %i2]
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%l4
	wr	%o4,	%g4,	%clear_softint
	nop
	set	0x20, %g7
	std	%f30,	[%l7 + %g7]
	and	%o1,	%l2,	%l5
	nop
	set	0x28, %o1
	lduw	[%l7 + %o1],	%l3
	set	0x74, %l4
	swapa	[%l7 + %l4] 0x80,	%l1
	nop
	nop
	setx	0x997D552293D3DE1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x267E3D28F9FADC1F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f4,	%f16
	nop
	set	0x22, %i1
	sth	%i6,	[%l7 + %i1]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%i3
	nop
	set	0x78, %g5
	ldsb	[%l7 + %g5],	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%l0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd0
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x80,	%o3
	nop
	set	0x4C, %g6
	prefetch	[%l7 + %g6],	 3
	nop
	set	0x1C, %g4
	lduw	[%l7 + %g4],	%i5
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0
	nop
	set	0x34, %o2
	swap	[%l7 + %o2],	%g5
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%o5
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%i6
	set	0x18, %l3
	stda	%o6,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDF3, 	%tick_cmpr
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%o6
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xeb,	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%g2
	set	0x68, %i5
	stxa	%g6,	[%l7 + %i5] 0xe3
	membar	#Sync
	ld	[%l7 + 0x20],	%f6
	set	0x44, %l0
	sta	%f25,	[%l7 + %l0] 0x89
	bne,a	%xcc,	loop_11
	nop
	set	0x56, %i6
	lduh	[%l7 + %i6],	%i2
	or	%l4,	%l6,	%o4
	set	0x30, %i0
	ldda	[%l7 + %i0] 0xe2,	%o0
loop_11:
	nop
	set	0x55, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g4
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	bleu,pn	%icc,	loop_12
	nop
	set	0x20, %o7
	swap	[%l7 + %o7],	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%l1
loop_12:
	nop
	set	0x44, %o0
	stw	%l5,	[%l7 + %o0]
	add	%g1,	%i3,	%i6
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%o0
	st	%f8,	[%l7 + 0x4C]
	set	0x50, %l5
	stxa	%l0,	[%l7 + %l5] 0x89
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f16
	add	%o3,	%i1,	%i4
	nop
	set	0x28, %i2
	sth	%i5,	[%l7 + %i2]
	nop
	set	0x60, %i3
	ldsb	[%l7 + %i3],	%g5
	set	0x3C, %g2
	sta	%f14,	[%l7 + %g2] 0x88
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%i7
	nop
	set	0x38, %o1
	prefetch	[%l7 + %o1],	 4
	set	0x58, %l4
	stxa	%o7,	[%l7 + %l4] 0x88
	nop
	set	0x68, %g7
	ldsw	[%l7 + %g7],	%g3
	nop
	set	0x7D, %g5
	ldsb	[%l7 + %g5],	%o6
	and	%i0,	%o2,	%g2
	nop
	set	0x30, %i1
	stw	%g7,	[%l7 + %i1]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf1
	membar	#Sync
	add	%g6,	%i2,	%l6
	nop
	set	0x44, %o5
	ldsw	[%l7 + %o5],	%l4
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f16
	nop
	set	0x18, %g4
	stx	%o4,	[%l7 + %g4]
	nop
	set	0x60, %o2
	swap	[%l7 + %o2],	%g4
	fpadd16	%f8,	%f16,	%f16
	nop
	set	0x64, %l2
	swap	[%l7 + %l2],	%o1
	ld	[%l7 + 0x34],	%f10
	set	0x34, %l1
	swapa	[%l7 + %l1] 0x80,	%l2
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%f22
	nop
	set	0x40, %l3
	std	%l0,	[%l7 + %l3]
	or	%l3,	%l5,	%g1
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x81,	 1
	nop
	set	0x44, %o6
	lduh	[%l7 + %o6],	%i6
	nop
	set	0x54, %i5
	lduw	[%l7 + %i5],	%o0
	set	0x18, %l0
	swapa	[%l7 + %l0] 0x80,	%l0
	bg,a,pt	%icc,	loop_13
	ld	[%l7 + 0x38],	%f25
	add	%o3,	%i4,	%i1
	nop
	set	0x0C, %i6
	lduh	[%l7 + %i6],	%g5
loop_13:
	nop
	set	0x75, %i0
	ldstub	[%l7 + %i0],	%o5
	nop
	set	0x10, %o4
	std	%f30,	[%l7 + %o4]
	set	0x37, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xe3,	%o6
	set	0x38, %i7
	stda	%g2,	[%l7 + %i7] 0x89
	nop
	set	0x30, %l5
	lduw	[%l7 + %l5],	%i7
	st	%f2,	[%l7 + 0x24]
	fpadd32	%f22,	%f12,	%f14
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%i0
	and	%o2,	%g7,	%g2
	nop
	set	0x37, %i4
	ldub	[%l7 + %i4],	%g6
	and	%i2,	%l6,	%o4
	nop
	set	0x4D, %i2
	ldsb	[%l7 + %i2],	%l4
	nop
	set	0x6E, %l6
	ldsh	[%l7 + %l6],	%g4
	nop
	set	0x60, %g2
	stw	%o1,	[%l7 + %g2]
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f20
	nop
	set	0x68, %l4
	std	%l2,	[%l7 + %l4]
	nop
	set	0x08, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x78, %g7
	stx	%l3,	[%l7 + %g7]
	and	%l1,	%l5,	%i3
	nop
	set	0x68, %i1
	lduh	[%l7 + %i1],	%g1
	nop
	set	0x73, %g5
	ldsb	[%l7 + %g5],	%o0
	add	%l0,	%o3,	%i6
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%i0
	set	0x56, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g5
	set	0x0A, %g4
	stha	%i4,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x54, %o5
	lduw	[%l7 + %o5],	%i5
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x80,	 3
	nop
	set	0x2E, %l1
	ldsh	[%l7 + %l1],	%g3
	nop
	set	0x28, %l2
	std	%f20,	[%l7 + %l2]
	nop
	set	0x26, %l3
	lduh	[%l7 + %l3],	%i7
	ld	[%l7 + 0x5C],	%f22
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x89,	 3
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%i0
	wr	%o6,	%o2,	%clear_softint
	st	%f14,	[%l7 + 0x48]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%g6
	nop
	set	0x20, %o6
	stw	%i2,	[%l7 + %o6]
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%f20
	or	%l6,	%g7,	%l4
	fpsub32	%f26,	%f12,	%f2
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x81,	%o4
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%o1
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%l2
	nop
	set	0x1C, %l0
	swap	[%l7 + %l0],	%g4
	set	0x36, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l3
	add	%l1,	%l5,	%i3
	set	0x4C, %o7
	lda	[%l7 + %o7] 0x88,	%f5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x40, %i7
	stb	%o3,	[%l7 + %i7]
	set	0x68, %i4
	stda	%i6,	[%l7 + %i4] 0x89
	nop
	set	0x60, %l5
	ldsb	[%l7 + %l5],	%o0
	add	%g5,	%i4,	%i5
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf9
	membar	#Sync
	fpsub16s	%f3,	%f16,	%f19
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x4E, %i2
	ldsh	[%l7 + %i2],	%o7
	nop
	set	0x44, %o1
	sth	%i1,	[%l7 + %o1]
	nop
	set	0x78, %l4
	std	%f28,	[%l7 + %l4]
	set	0x6C, %i3
	lda	[%l7 + %i3] 0x89,	%f26
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x81,	 3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%i0
	nop
	set	0x74, %g2
	lduh	[%l7 + %g2],	%o6
	set	0x24, %i1
	sta	%f11,	[%l7 + %i1] 0x81
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x88,	%o4
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%f6
	nop
	set	0x1E, %g1
	sth	%o2,	[%l7 + %g1]
	nop
	set	0x34, %g4
	ldsw	[%l7 + %g4],	%g6
	st	%f18,	[%l7 + 0x08]
	nop
	set	0x18, %o2
	stx	%i2,	[%l7 + %o2]
	set	0x30, %l1
	swapa	[%l7 + %l1] 0x81,	%g2
	nop
	set	0x68, %o5
	std	%g6,	[%l7 + %o5]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xcc
	nop
	set	0x6C, %g3
	stw	%l4,	[%l7 + %g3]
	nop
	set	0x08, %l2
	ldstub	[%l7 + %l2],	%o4
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%o0
	set	0x15, %o6
	stba	%l2,	[%l7 + %o6] 0xe3
	membar	#Sync
	bleu,a,pn	%icc,	loop_14
	nop
	set	0x08, %i6
	stx	%fsr,	[%l7 + %i6]
	add	%g4,	%l3,	%l6
	nop
	set	0x48, %i5
	stw	%l1,	[%l7 + %i5]
loop_14:
	nop
	set	0x08, %o4
	lduh	[%l7 + %o4],	%l5
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x80,	 1
	nop
	set	0x6C, %o0
	lduh	[%l7 + %o0],	%l0
	nop
	set	0x10, %o7
	std	%o2,	[%l7 + %o7]
	nop
	set	0x6A, %i0
	sth	%i6,	[%l7 + %i0]
	st	%f18,	[%l7 + 0x38]
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%o0
	nop
	set	0x54, %l5
	lduh	[%l7 + %l5],	%g5
	nop
	set	0x50, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%i3
	nop
	set	0x60, %o1
	ldub	[%l7 + %o1],	%i4
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%i4
	fpadd16s	%f28,	%f3,	%f28
	nop
	set	0x78, %l4
	stx	%i1,	[%l7 + %l4]
	set	0x40, %i3
	stba	%i7,	[%l7 + %i3] 0xea
	membar	#Sync
	fpsub16	%f14,	%f30,	%f4
	bn,pn	%xcc,	loop_15
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%o6
	nop
	set	0x36, %i1
	ldstub	[%l7 + %i1],	%g3
	set	0x6F, %g2
	stba	%i0,	[%l7 + %g2] 0x88
loop_15:
	nop
	set	0x6E, %g5
	stb	%o6,	[%l7 + %g5]
	nop
	set	0x28, %g6
	std	%f24,	[%l7 + %g6]
	nop
	set	0x36, %g4
	lduh	[%l7 + %g4],	%o2
	nop
	set	0x7F, %o2
	ldsb	[%l7 + %o2],	%g6
	nop
	set	0x2C, %g1
	stb	%o5,	[%l7 + %g1]
	set	0x6C, %o5
	stwa	%i2,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x29, %l3
	ldub	[%l7 + %l3],	%g2
	add	%g7,	%o4,	%l4
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xe2,	%l2
	nop
	set	0x6E, %g3
	ldstub	[%l7 + %g3],	%o1
	set	0x50, %l2
	stda	%l2,	[%l7 + %l2] 0x89
	nop
	set	0x10, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%g4
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%l6
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%l1
	nop
	set	0x60, %i5
	std	%l0,	[%l7 + %i5]
	nop
	set	0x10, %l0
	std	%g0,	[%l7 + %l0]
	set	0x74, %o0
	swapa	[%l7 + %o0] 0x89,	%o3
	ld	[%l7 + 0x40],	%f2
	set	0x54, %o7
	sta	%f22,	[%l7 + %o7] 0x80
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%i6
	bl,pn	%xcc,	loop_16
	or	%g5,	%i3,	%i5
	set	0x50, %i7
	stwa	%i4,	[%l7 + %i7] 0xea
	membar	#Sync
loop_16:
	nop
	set	0x34, %i0
	lduw	[%l7 + %i0],	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%i7
	set	0x58, %i4
	stxa	%i0,	[%l7 + %i4] 0x88
	nop
	set	0x62, %l6
	ldub	[%l7 + %l6],	%g3
	fpadd32s	%f9,	%f14,	%f14
	set	0x78, %l5
	lda	[%l7 + %l5] 0x80,	%f28
	nop
	set	0x7C, %o1
	swap	[%l7 + %o1],	%o2
	st	%fsr,	[%l7 + 0x10]
	set	0x46, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o6
	nop
	set	0x60, %i3
	stx	%o5,	[%l7 + %i3]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%g6
	nop
	set	0x3E, %l4
	ldstub	[%l7 + %l4],	%g7
	ble,a	%icc,	loop_17
	nop
	set	0x18, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x22, %g2
	stha	%g2,	[%l7 + %g2] 0x80
loop_17:
	nop
	set	0x53, %i1
	ldstub	[%l7 + %i1],	%o4
	nop
	set	0x08, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x50, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x20, %g4
	stxa	%l2,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x27, %o2
	ldub	[%l7 + %o2],	%o1
	nop
	set	0x7C, %g1
	lduw	[%l7 + %g1],	%l4
	set	0x60, %l3
	stha	%g4,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x42, %l1
	stha	%l6,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x5C, %g3
	ldstub	[%l7 + %g3],	%l3
	set	0x48, %l2
	stha	%l1,	[%l7 + %l2] 0x80
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f14
	set	0x48, %o3
	ldxa	[%l7 + %o3] 0x89,	%l0
	set	0x4D, %i6
	ldstuba	[%l7 + %i6] 0x88,	%g1
	ld	[%l7 + 0x3C],	%f24
	nop
	set	0x1C, %o4
	ldsw	[%l7 + %o4],	%l5
	nop
	set	0x7E, %i5
	stb	%o3,	[%l7 + %i5]
	nop
	set	0x28, %o6
	std	%i6,	[%l7 + %o6]
	nop
	set	0x44, %o0
	prefetch	[%l7 + %o0],	 3
	nop
	set	0x24, %o7
	swap	[%l7 + %o7],	%o0
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%g5
	set	0x20, %i0
	stxa	%i5,	[%l7 + %i0] 0x80
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f16
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%i1
	set	0x7E, %l6
	stha	%i3,	[%l7 + %l6] 0x81
	set	0x40, %l5
	stda	%i6,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x58, %o1
	ldxa	[%l7 + %o1] 0x81,	%i0
	set	0x30, %i2
	stda	%g2,	[%l7 + %i2] 0xea
	membar	#Sync
	wr	%o2,	%o7,	%ccr
	set	0x10, %i3
	stba	%o5,	[%l7 + %i3] 0x88
	set	0x49, %i4
	stba	%i2,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x56, %l4
	sth	%g6,	[%l7 + %l4]
	st	%f27,	[%l7 + 0x34]
	fpadd32	%f6,	%f12,	%f16
	nop
	set	0x10, %g7
	ldsh	[%l7 + %g7],	%g7
	nop
	set	0x14, %i1
	stb	%o6,	[%l7 + %i1]
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x88,	 0
	ld	[%l7 + 0x2C],	%f10
	set	0x20, %g6
	stda	%o4,	[%l7 + %g6] 0x88
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xe2,	%l2
	nop
	set	0x78, %g2
	std	%f16,	[%l7 + %g2]
	set	0x6C, %g1
	swapa	[%l7 + %g1] 0x80,	%o1
	or	%l4,	%g4,	%l3
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%f18
	nop
	set	0x5C, %l1
	prefetch	[%l7 + %l1],	 0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe2,	%i6
	nop
	set	0x58, %g3
	stx	%l1,	[%l7 + %g3]
	fpsub16s	%f6,	%f27,	%f1
	add	%l0,	%l5,	%o3
	nop
	set	0x38, %l2
	lduw	[%l7 + %l2],	%g1
	nop
	set	0x56, %o3
	sth	%o0,	[%l7 + %o3]
	or	%g5,	%i6,	%i5
	nop
	set	0x52, %i6
	sth	%i1,	[%l7 + %i6]
	set	0x4B, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i3
	set	0x18, %i5
	stwa	%i4,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x54, %o5
	stwa	%i0,	[%l7 + %o5] 0x80
	nop
	set	0x20, %o0
	prefetch	[%l7 + %o0],	 1
	set	0x26, %o6
	stba	%i7,	[%l7 + %o6] 0xeb
	membar	#Sync
	and	%o2,	%g3,	%o7
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x81,	%i2
	nop
	set	0x6F, %i0
	ldstub	[%l7 + %i0],	%o5
	set	0x68, %i7
	stda	%g6,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x1C, %l0
	ldstuba	[%l7 + %l0] 0x88,	%g7
	or	%o6,	%o4,	%g2
	st	%fsr,	[%l7 + 0x10]
	set	0x5C, %l5
	sta	%f2,	[%l7 + %l5] 0x80
	nop
	set	0x63, %o1
	ldub	[%l7 + %o1],	%l2
	and	%l4,	%g4,	%l3
	nop
	set	0x54, %i2
	stw	%l6,	[%l7 + %i2]
	nop
	set	0x18, %l6
	ldsw	[%l7 + %l6],	%o1
	set	0x10, %i4
	stda	%l0,	[%l7 + %i4] 0x88
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x30, %l4
	ldsw	[%l7 + %l4],	%l5
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%o3
	nop
	set	0x38, %i1
	lduh	[%l7 + %i1],	%l0
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xeb,	%g0
	st	%fsr,	[%l7 + 0x14]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%i6
	set	0x18, %g7
	stda	%g4,	[%l7 + %g7] 0xeb
	membar	#Sync
	or	%i5,	%i3,	%i4
	st	%f27,	[%l7 + 0x70]
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f10
	set	0x70, %g6
	stxa	%i0,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x26, %g2
	sth	%i7,	[%l7 + %g2]
	fpsub32	%f14,	%f22,	%f22
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc8
	nop
	set	0x6E, %o2
	ldsb	[%l7 + %o2],	%o2
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%i0
	st	%fsr,	[%l7 + 0x70]
	set	0x70, %l1
	stda	%o6,	[%l7 + %l1] 0x88
	nop
	set	0x14, %l2
	swap	[%l7 + %l2],	%i2
	set	0x78, %g3
	swapa	[%l7 + %g3] 0x88,	%o5
	nop
	set	0x34, %o3
	ldsw	[%l7 + %o3],	%g3
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%g6
	nop
	set	0x14, %i5
	ldsw	[%l7 + %i5],	%g6
	or	%o4,	%g2,	%o6
	wr	%l4,	%g4,	%set_softint
	nop
	set	0x50, %o5
	stx	%l3,	[%l7 + %o5]
	st	%f26,	[%l7 + 0x30]
	set	0x68, %o0
	lda	[%l7 + %o0] 0x88,	%f20
	nop
	set	0x70, %o4
	lduw	[%l7 + %o4],	%l2
	nop
	set	0x34, %o6
	ldub	[%l7 + %o6],	%o1
	nop
	set	0x08, %i0
	std	%i6,	[%l7 + %i0]
	set	0x50, %o7
	stba	%l1,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x44, %i7
	ldsw	[%l7 + %i7],	%o3
	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%l5
	set	0x78, %l0
	sta	%f10,	[%l7 + %l0] 0x80
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f8
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x88,	%l0
	nop
	set	0x34, %i4
	ldsh	[%l7 + %i4],	%g1
	set	0x52, %l4
	stha	%i6,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f2
	add	%o0,	%i5,	%g5
	nop
	set	0x3C, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x42, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i4
	set	0x60, %i3
	stxa	%i3,	[%l7 + %i3] 0x81
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f0
	set	0x56, %g6
	stba	%i0,	[%l7 + %g6] 0x88
	nop
	set	0x70, %g2
	std	%f4,	[%l7 + %g2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%i7
	add	%o7,	%i1,	%i2
	st	%fsr,	[%l7 + 0x64]
	set	0x68, %g1
	lda	[%l7 + %g1] 0x88,	%f6
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f10
	set	0x2C, %g7
	sta	%f4,	[%l7 + %g7] 0x81
	st	%fsr,	[%l7 + 0x74]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%o5
	set	0x50, %l1
	sta	%f30,	[%l7 + %l1] 0x89
	nop
	set	0x17, %l2
	ldstub	[%l7 + %l2],	%g6
	ld	[%l7 + 0x28],	%f25
	nop
	set	0x2F, %g3
	stb	%o4,	[%l7 + %g3]
	nop
	set	0x08, %o3
	std	%g2,	[%l7 + %o3]
	nop
	set	0x48, %l3
	stx	%o6,	[%l7 + %l3]
	set	0x30, %i6
	stwa	%g7,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x58, %o5
	stwa	%g4,	[%l7 + %o5] 0x89
	add	%l3,	%l2,	%l4
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%l1
	set	0x30, %o4
	swapa	[%l7 + %o4] 0x88,	%l6
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x89,	%l5
	set	0x30, %o6
	stxa	%l0,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x28, %i0
	ldsw	[%l7 + %i0],	%g1
	or	%o3,	%i6,	%i5
	add	%g5,	%i4,	%i3
	nop
	set	0x18, %o7
	stx	%o0,	[%l7 + %o7]
	nop
	set	0x28, %l5
	std	%f22,	[%l7 + %l5]
	nop
	set	0x54, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x40, %i2
	lduw	[%l7 + %i2],	%o2
	nop
	set	0x21, %l0
	stb	%i7,	[%l7 + %l0]
	nop
	set	0x4C, %l6
	ldsw	[%l7 + %l6],	%o7
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x80,	%i0
	set	0x28, %o1
	swapa	[%l7 + %o1] 0x89,	%i1
	nop
	set	0x0D, %l4
	ldstub	[%l7 + %l4],	%g3
	nop
	set	0x38, %i1
	stx	%i2,	[%l7 + %i1]
	set	0x10, %g5
	stwa	%o5,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x44, %i3
	stw	%o4,	[%l7 + %i3]
	nop
	set	0x7E, %g4
	ldub	[%l7 + %g4],	%g6
	set	0x78, %g6
	stha	%o6,	[%l7 + %g6] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f16
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd0
	nop
	set	0x1E, %o2
	ldsh	[%l7 + %o2],	%g7
	set	0x54, %g7
	stwa	%g4,	[%l7 + %g7] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x08, %l2
	lduw	[%l7 + %l2],	%l3
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%g2
	nop
	nop
	setx	0xBECB4E77,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xD1AC3400,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f12,	%f16
	nop
	set	0x28, %l1
	ldsb	[%l7 + %l1],	%l2
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x88,	%o0
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%l4
	set	0x0D, %o5
	stba	%l1,	[%l7 + %o5] 0x89
	set	0x48, %i6
	stda	%l4,	[%l7 + %i6] 0x81
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f0
	set	0x58, %o4
	ldstuba	[%l7 + %o4] 0x88,	%l6
	nop
	set	0x0C, %o6
	ldsw	[%l7 + %o6],	%g1
	set	0x60, %o0
	stda	%o2,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x70, %i0
	stwa	%i6,	[%l7 + %i0] 0x81
	set	0x28, %o7
	swapa	[%l7 + %o7] 0x81,	%l0
	nop
	set	0x68, %i7
	std	%i4,	[%l7 + %i7]
	nop
	set	0x70, %l5
	std	%f8,	[%l7 + %l5]
	set	0x58, %l0
	swapa	[%l7 + %l0] 0x80,	%g5
	set	0x24, %i2
	sta	%f22,	[%l7 + %i2] 0x89
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0
	nop
	set	0x50, %o1
	swap	[%l7 + %o1],	%i3
	set	0x09, %l4
	stba	%o0,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x89,	%o2
	nop
	set	0x40, %i4
	std	%i6,	[%l7 + %i4]
	and	%i0,	%o7,	%i1
	nop
	set	0x4E, %g5
	lduh	[%l7 + %g5],	%i2
	set	0x73, %i3
	ldstuba	[%l7 + %i3] 0x81,	%g3
	nop
	set	0x46, %g4
	ldub	[%l7 + %g4],	%o5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%o6
	nop
	set	0x40, %g6
	std	%f22,	[%l7 + %g6]
	set	0x0C, %g1
	stha	%o4,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x89
	ld	[%l7 + 0x68],	%f6
	set	0x68, %g2
	stwa	%g4,	[%l7 + %g2] 0x80
	nop
	set	0x52, %l2
	stb	%g7,	[%l7 + %l2]
	nop
	set	0x6C, %g3
	ldsw	[%l7 + %g3],	%g2
	add	%l3,	%o1,	%l2
	set	0x6B, %l1
	stba	%l4,	[%l7 + %l1] 0x89
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%l0
	set	0x13, %o3
	stba	%l6,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x74, %o5
	swapa	[%l7 + %o5] 0x89,	%g1
	nop
	set	0x50, %l3
	prefetch	[%l7 + %l3],	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%l5
	or	%l0,	%i6,	%g5
	nop
	set	0x24, %i6
	sth	%i4,	[%l7 + %i6]
	nop
	set	0x56, %o4
	stb	%i3,	[%l7 + %o4]
	nop
	set	0x68, %o6
	std	%o0,	[%l7 + %o6]
	set	0x30, %i5
	stwa	%i5,	[%l7 + %i5] 0x80
	nop
	set	0x32, %i0
	ldsb	[%l7 + %i0],	%i7
	nop
	set	0x60, %o0
	std	%i0,	[%l7 + %o0]
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f2
	nop
	set	0x7F, %l5
	ldsb	[%l7 + %l5],	%o7
	nop
	set	0x70, %o7
	ldsw	[%l7 + %o7],	%i1
	or	%o2,	%i2,	%o5
	nop
	set	0x74, %i2
	swap	[%l7 + %i2],	%g3
	nop
	set	0x6D, %l6
	ldsb	[%l7 + %l6],	%g6
	nop
	set	0x0C, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	fpadd32s	%f26,	%f16,	%f9
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	set	0x0E, %i4
	stha	%g4,	[%l7 + %i4] 0x88
	fpsub16s	%f0,	%f23,	%f30
	ld	[%l7 + 0x2C],	%f5
	set	0x34, %i1
	stwa	%o4,	[%l7 + %i1] 0x81
	and	%g2,	%g7,	%l3
	nop
	set	0x5D, %g5
	ldub	[%l7 + %g5],	%l2
	or	%o1,	%l1,	%l6
	nop
	set	0x74, %i3
	stw	%l4,	[%l7 + %i3]
	nop
	set	0x20, %g6
	stw	%o3,	[%l7 + %g6]
	nop
	set	0x30, %g4
	stx	%g1,	[%l7 + %g4]
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x0F, %g2
	ldub	[%l7 + %g2],	%l0
	nop
	set	0x54, %o2
	ldsh	[%l7 + %o2],	%l5
	set	0x6C, %g3
	lda	[%l7 + %g3] 0x81,	%f28
	set	0x78, %l2
	stxa	%i6,	[%l7 + %l2] 0x88
	and	%i4,	%i3,	%o0
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%g5
	nop
	set	0x0C, %o3
	lduw	[%l7 + %o3],	%i5
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x20, %l3
	sta	%f27,	[%l7 + %l3] 0x80
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc2
	st	%fsr,	[%l7 + 0x28]
	set	0x38, %g7
	stxa	%i0,	[%l7 + %g7] 0xeb
	membar	#Sync
	add	%i7,	%i1,	%o7
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x78, %o4
	stxa	%o2,	[%l7 + %o4] 0xe2
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%g3
	and	%g4,	%o4,	%o6
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%f24
	nop
	set	0x28, %i0
	swap	[%l7 + %i0],	%g2
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f16
	nop
	set	0x18, %o0
	prefetch	[%l7 + %o0],	 1
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x88,	 2
	nop
	set	0x74, %i2
	sth	%l2,	[%l7 + %i2]
	set	0x10, %o1
	lda	[%l7 + %o1] 0x89,	%f10
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf8
	membar	#Sync
	nop
	set	0x54, %l0
	sth	%g7,	[%l7 + %l0]
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%l1
	nop
	set	0x08, %l6
	std	%f2,	[%l7 + %l6]
	ld	[%l7 + 0x58],	%f7
	set	0x60, %g5
	stda	%o0,	[%l7 + %g5] 0x81
	add	%l4,	%o3,	%l6
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xd8
	ld	[%l7 + 0x28],	%f3
	bl,pn	%xcc,	loop_18
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x70, %i1
	stx	%l0,	[%l7 + %i1]
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f0
loop_18:
	nop
	set	0x40, %g1
	std	%l4,	[%l7 + %g1]
	set	0x50, %g2
	stxa	%g1,	[%l7 + %g2] 0x89
	st	%fsr,	[%l7 + 0x70]
	st	%f30,	[%l7 + 0x24]
	set	0x28, %g4
	lda	[%l7 + %g4] 0x80,	%f27
	st	%f24,	[%l7 + 0x18]
	nop
	set	0x2C, %o2
	lduw	[%l7 + %o2],	%i4
	fpadd32s	%f20,	%f7,	%f4
	nop
	set	0x28, %l2
	prefetch	[%l7 + %l2],	 0
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f0
	nop
	set	0x30, %o3
	sth	%i6,	[%l7 + %o3]
	set	0x4C, %g3
	lda	[%l7 + %g3] 0x88,	%f0
	set	0x2C, %l3
	swapa	[%l7 + %l3] 0x89,	%i3
	fpadd16	%f12,	%f2,	%f22
	nop
	set	0x10, %i6
	swap	[%l7 + %i6],	%o0
	fpsub32s	%f18,	%f6,	%f15
	nop
	set	0x0C, %o5
	ldub	[%l7 + %o5],	%i5
	set	0x28, %g7
	prefetcha	[%l7 + %g7] 0x88,	 4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%i1
	nop
	set	0x78, %o6
	prefetch	[%l7 + %o6],	 1
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x88,	%o7
	nop
	set	0x4B, %i5
	ldsb	[%l7 + %i5],	%o2
	and	%i0,	%o5,	%g6
	nop
	set	0x28, %i0
	stx	%g3,	[%l7 + %i0]
	nop
	set	0x48, %l5
	lduw	[%l7 + %l5],	%g4
	add	%i2,	%o4,	%o6
	set	0x60, %o0
	stda	%l2,	[%l7 + %o0] 0x80
	st	%fsr,	[%l7 + 0x0C]
	or	%g2,	%g7,	%l1
	add	%o1,	%l2,	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%l6
	set	0x37, %i7
	ldstuba	[%l7 + %i7] 0x89,	%l5
	nop
	set	0x58, %i2
	ldx	[%l7 + %i2],	%l0
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f0
	nop
	set	0x52, %o1
	ldsh	[%l7 + %o1],	%g1
	ld	[%l7 + 0x24],	%f2
	set	0x42, %l4
	stha	%i4,	[%l7 + %l4] 0x80
	nop
	set	0x3E, %l0
	stb	%i6,	[%l7 + %l0]
	fpsub32	%f26,	%f8,	%f18
	ld	[%l7 + 0x68],	%f23
	set	0x0C, %l6
	lda	[%l7 + %l6] 0x80,	%f15
	fpadd32s	%f24,	%f20,	%f12
	nop
	set	0x08, %i4
	lduw	[%l7 + %i4],	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%g5
	set	0x58, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i7
	set	0x48, %i1
	stha	%o0,	[%l7 + %i1] 0x88
	nop
	set	0x54, %g5
	prefetch	[%l7 + %g5],	 1
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f16
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x89
	nop
	set	0x64, %g4
	swap	[%l7 + %g4],	%i1
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f28
	set	0x18, %l2
	stxa	%o2,	[%l7 + %l2] 0x88
	nop
	set	0x0C, %g2
	lduw	[%l7 + %g2],	%i0
	add	%o7,	%o5,	%g6
	and	%g4,	%i2,	%o4
	nop
	set	0x18, %o3
	ldsh	[%l7 + %o3],	%g3
	set	0x78, %l1
	ldxa	[%l7 + %l1] 0x81,	%o6
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xe3,	%l2
	nop
	set	0x38, %i6
	std	%g2,	[%l7 + %i6]
	nop
	set	0x21, %o5
	ldub	[%l7 + %o5],	%g7
	set	0x22, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o1
	fpsub16s	%f18,	%f8,	%f10
	add	%l1,	%l4,	%l2
	bleu,pn	%xcc,	loop_19
	nop
	set	0x68, %o6
	ldsb	[%l7 + %o6],	%l6
	fpsub32	%f8,	%f14,	%f18
	set	0x3C, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l5
loop_19:
	nop
	set	0x79, %i5
	ldub	[%l7 + %i5],	%o3
	or	%g1,	%i4,	%l0
	nop
	set	0x74, %i0
	lduw	[%l7 + %i0],	%i6
	nop
	set	0x20, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f14
	nop
	set	0x20, %l5
	ldsh	[%l7 + %l5],	%i3
	set	0x40, %i7
	sta	%f14,	[%l7 + %i7] 0x88
	set	0x73, %o7
	ldstuba	[%l7 + %o7] 0x81,	%g5
	nop
	set	0x7A, %o1
	ldsb	[%l7 + %o1],	%i7
	set	0x1A, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o0
	nop
	set	0x52, %l0
	stb	%i1,	[%l7 + %l0]
	nop
	set	0x38, %l4
	lduw	[%l7 + %l4],	%o2
	nop
	set	0x63, %i4
	ldstub	[%l7 + %i4],	%i0
	nop
	set	0x0C, %l6
	ldsw	[%l7 + %l6],	%i5
	fpadd16s	%f4,	%f20,	%f19
	nop
	set	0x74, %i3
	swap	[%l7 + %i3],	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o7
	nop
	set	0x38, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x28, %i1
	swapa	[%l7 + %i1] 0x89,	%g4
	nop
	set	0x40, %g1
	std	%f16,	[%l7 + %g1]
	set	0x36, %g4
	stha	%i2,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%g2
	nop
	set	0x53, %g6
	ldub	[%l7 + %g6],	%o6
	set	0x68, %l2
	stxa	%l3,	[%l7 + %l2] 0x81
	st	%fsr,	[%l7 + 0x58]
	set	0x47, %g2
	stba	%o4,	[%l7 + %g2] 0x89
	set	0x41, %o3
	stba	%g2,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x88,	%o0
	nop
	set	0x38, %l1
	lduw	[%l7 + %l1],	%g7
	bne,a	%xcc,	loop_20
	nop
	set	0x60, %o5
	ldsh	[%l7 + %o5],	%l4
	set	0x5C, %l3
	lda	[%l7 + %l3] 0x89,	%f2
loop_20:
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x46, %i6
	ldsb	[%l7 + %i6],	%l2
	nop
	set	0x45, %i5
	stb	%l1,	[%l7 + %i5]
	set	0x28, %o4
	stba	%l5,	[%l7 + %o4] 0xeb
	membar	#Sync
	or	%o3,	%g1,	%l6
	nop
	set	0x28, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x48, %g7
	stba	%l0,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x68, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x5C, %i7
	swap	[%l7 + %i7],	%i6
	nop
	set	0x0C, %o7
	lduh	[%l7 + %o7],	%i4
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%g4
	set	0x52, %i2
	stha	%i7,	[%l7 + %i2] 0x80
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%i3
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xda
	nop
	set	0x08, %o1
	std	%f26,	[%l7 + %o1]
	nop
	set	0x08, %l6
	std	%o0,	[%l7 + %l6]
	nop
	set	0x48, %i3
	stx	%fsr,	[%l7 + %i3]
	or	%i1,	%i0,	%i5
	nop
	set	0x58, %i4
	std	%f28,	[%l7 + %i4]
	set	0x68, %i1
	lda	[%l7 + %i1] 0x80,	%f23
	nop
	set	0x30, %g5
	ldsb	[%l7 + %g5],	%o2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd2
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xcc
	set	0x0E, %g1
	stha	%o5,	[%l7 + %g1] 0x89
	nop
	set	0x19, %l2
	ldstub	[%l7 + %l2],	%g6
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xca
	set	0x4A, %o3
	stha	%o7,	[%l7 + %o3] 0x80
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xda
	nop
	set	0x32, %l1
	lduh	[%l7 + %l1],	%i2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1290
!	Type a   	: 21
!	Type cti   	: 20
!	Type x   	: 518
!	Type f   	: 46
!	Type i   	: 105
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 1 Start
!
.global thread_1
thread_1:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0xF,	%g2
	set	0x1,	%g3
	set	0x3,	%g4
	set	0xE,	%g5
	set	0x0,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x4,	%i1
	set	-0x8,	%i2
	set	-0x6,	%i3
	set	-0xE,	%i4
	set	-0x3,	%i5
	set	-0x0,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x26013394,	%l0
	set	0x4A36A79C,	%l1
	set	0x5D360D35,	%l2
	set	0x2F2650FF,	%l3
	set	0x62B9E824,	%l4
	set	0x3C6B5FD6,	%l5
	set	0x745BAEA4,	%l6
	!# Output registers
	set	-0x04C3,	%o0
	set	0x0952,	%o1
	set	-0x1AE0,	%o2
	set	-0x0A5E,	%o3
	set	0x1C6E,	%o4
	set	-0x1D83,	%o5
	set	-0x17CF,	%o6
	set	0x1E6B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA52B36A3745B7D0F)
	INIT_TH_FP_REG(%l7,%f2,0xF56E0DA3B90577AE)
	INIT_TH_FP_REG(%l7,%f4,0x402D7DAC36E9E004)
	INIT_TH_FP_REG(%l7,%f6,0x3E7BF54684D0E162)
	INIT_TH_FP_REG(%l7,%f8,0x28D8FFEFD3AADC85)
	INIT_TH_FP_REG(%l7,%f10,0xCB7B13CDA6BF8DEA)
	INIT_TH_FP_REG(%l7,%f12,0xFBE4579F62424EC9)
	INIT_TH_FP_REG(%l7,%f14,0x0803BB4F6DA96F25)
	INIT_TH_FP_REG(%l7,%f16,0x8C8CF0668AFE08A2)
	INIT_TH_FP_REG(%l7,%f18,0xA553375C4CDAC316)
	INIT_TH_FP_REG(%l7,%f20,0x08DDCB6D2CEAA72B)
	INIT_TH_FP_REG(%l7,%f22,0x33B2375325954A03)
	INIT_TH_FP_REG(%l7,%f24,0xBE22DBBDCE6BB10C)
	INIT_TH_FP_REG(%l7,%f26,0xD5B7E828433B5701)
	INIT_TH_FP_REG(%l7,%f28,0xEE1A081B36C4A381)
	INIT_TH_FP_REG(%l7,%f30,0xB3D02AD26C75010E)

	!# Execute Main Diag ..

	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x54, %o6
	ldsw	[%l7 + %o6],	%o6
	st	%fsr,	[%l7 + 0x78]
	set	0x7F, %i6
	stba	%l3,	[%l7 + %i6] 0xea
	membar	#Sync
	or	%o4,	%g2,	%g3
	ble,pn	%icc,	loop_21
	nop
	set	0x31, %i5
	ldsb	[%l7 + %i5],	%o1
	nop
	set	0x4C, %l3
	stw	%l4,	[%l7 + %l3]
	set	0x7C, %i0
	lda	[%l7 + %i0] 0x89,	%f26
loop_21:
	nop
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf8,	%f16
	nop
	set	0x1C, %l5
	lduw	[%l7 + %l5],	%l2
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x89,	%g7
	nop
	set	0x77, %o7
	ldsb	[%l7 + %o7],	%l5
	nop
	set	0x12, %o0
	sth	%l1,	[%l7 + %o0]
	st	%f13,	[%l7 + 0x7C]
	add	%o3,	%g1,	%l0
	nop
	set	0x6C, %i2
	stw	%i6,	[%l7 + %i2]
	st	%f13,	[%l7 + 0x14]
	set	0x28, %l0
	ldxa	[%l7 + %l0] 0x81,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%i7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x596, 	%tick_cmpr
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%i0
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%f8
	ld	[%l7 + 0x5C],	%f25
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xda,	%f0
	nop
	set	0x3C, %o1
	prefetch	[%l7 + %o1],	 0
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x81,	%i5
	set	0x21, %i4
	stba	%i1,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x47, %i3
	ldub	[%l7 + %i3],	%o2
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%g6
	nop
	set	0x2C, %i1
	swap	[%l7 + %i1],	%o5
	and	%o7,	%g4,	%o6
	nop
	set	0x60, %o2
	ldsb	[%l7 + %o2],	%l3
	set	0x2D, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i2
	add	%g2,	%g3,	%o4
	set	0x38, %g1
	sta	%f21,	[%l7 + %g1] 0x81
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x88,	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%g7
	add	%l2,	%l1,	%o3
	set	0x08, %g2
	sta	%f2,	[%l7 + %g2] 0x89
	wr	%l5,	%l0,	%ccr
	set	0x7C, %o3
	sta	%f18,	[%l7 + %o3] 0x89
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f14
	set	0x48, %l1
	stda	%i6,	[%l7 + %l1] 0x88
	nop
	set	0x48, %g6
	stx	%fsr,	[%l7 + %g6]
	ld	[%l7 + 0x6C],	%f25
	nop
	set	0x18, %o6
	ldsb	[%l7 + %o6],	%g1
	set	0x08, %i6
	sta	%f3,	[%l7 + %i6] 0x80
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc0
	nop
	set	0x6D, %o5
	ldub	[%l7 + %o5],	%l6
	set	0x28, %l3
	stxa	%g5,	[%l7 + %l3] 0x88
	nop
	nop
	setx	0x1C9A4084E94EF0E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x1D4B6A03BD48DCD0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f2,	%f16
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%i6
	nop
	set	0x20, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x30, %i0
	swapa	[%l7 + %i0] 0x81,	%o0
	nop
	set	0x56, %o7
	ldstub	[%l7 + %o7],	%i4
	or	%i3,	%i5,	%i1
	nop
	set	0x10, %i7
	std	%f2,	[%l7 + %i7]
	set	0x75, %i2
	stba	%o2,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x68, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x3E, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i0
	set	0x58, %g7
	stxa	%o5,	[%l7 + %g7] 0x80
	nop
	set	0x54, %l4
	lduh	[%l7 + %l4],	%o7
	st	%fsr,	[%l7 + 0x64]
	set	0x6C, %o1
	stwa	%g6,	[%l7 + %o1] 0x89
	nop
	set	0x74, %l6
	ldub	[%l7 + %l6],	%g4
	set	0x58, %i4
	stda	%l2,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x50, %g5
	stx	%i2,	[%l7 + %g5]
	fpsub16s	%f13,	%f2,	%f14
	add	%o6,	%g2,	%g3
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xc0
	nop
	set	0x5D, %i1
	ldstub	[%l7 + %i1],	%o1
	st	%f4,	[%l7 + 0x50]
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf0,	%f0
	or	%o4,	%l4,	%g7
	nop
	set	0x78, %g4
	std	%f26,	[%l7 + %g4]
	nop
	set	0x3C, %g1
	ldsw	[%l7 + %g1],	%l2
	fpsub32	%f14,	%f14,	%f26
	nop
	set	0x34, %g2
	swap	[%l7 + %g2],	%o3
	st	%f23,	[%l7 + 0x74]
	set	0x60, %o3
	sta	%f8,	[%l7 + %o3] 0x88
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x80,	%l4
	nop
	set	0x54, %l1
	swap	[%l7 + %l1],	%l0
	nop
	set	0x1C, %g6
	ldsb	[%l7 + %g6],	%i6
	nop
	set	0x60, %o6
	std	%f24,	[%l7 + %o6]
	add	%g1,	%l1,	%l6
	nop
	set	0x0A, %i6
	ldstub	[%l7 + %i6],	%i7
	nop
	set	0x10, %i5
	std	%f16,	[%l7 + %i5]
	set	0x24, %o5
	stwa	%g5,	[%l7 + %o5] 0x80
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xda
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f22
	set	0x1E, %l5
	stba	%i4,	[%l7 + %l5] 0x89
	nop
	set	0x70, %i0
	ldub	[%l7 + %i0],	%i3
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f16
	nop
	set	0x0B, %i7
	ldub	[%l7 + %i7],	%i5
	set	0x38, %i2
	prefetcha	[%l7 + %i2] 0x89,	 4
	nop
	nop
	setx	0x8072DC9F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x140FB69D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f23,	%f30
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x89
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%f18
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f16
	nop
	set	0x6C, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x28, %l4
	stha	%i1,	[%l7 + %l4] 0x88
	nop
	set	0x10, %l6
	ldsw	[%l7 + %l6],	%i0
	set	0x18, %i4
	stda	%o2,	[%l7 + %i4] 0xeb
	membar	#Sync
	wr	%o7,	%g6,	%set_softint
	nop
	set	0x74, %g5
	stw	%o5,	[%l7 + %g5]
	set	0x58, %o1
	stxa	%g4,	[%l7 + %o1] 0x81
	st	%fsr,	[%l7 + 0x60]
	add	%i2,	%l3,	%o6
	set	0x2C, %i1
	lda	[%l7 + %i1] 0x80,	%f12
	nop
	set	0x20, %i3
	std	%f18,	[%l7 + %i3]
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f18
	ble,a,pn	%icc,	loop_22
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f26
	ld	[%l7 + 0x40],	%f4
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%g2
loop_22:
	nop
	set	0x64, %g4
	lduw	[%l7 + %g4],	%o1
	set	0x2C, %l2
	lda	[%l7 + %l2] 0x80,	%f28
	set	0x20, %l1
	stda	%g2,	[%l7 + %l1] 0x88
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x30, %o3
	swap	[%l7 + %o3],	%o4
	set	0x14, %g6
	stwa	%l4,	[%l7 + %g6] 0x81
	nop
	set	0x58, %i6
	swap	[%l7 + %i6],	%g7
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0
	nop
	set	0x48, %o6
	swap	[%l7 + %o6],	%l5
	nop
	set	0x64, %g3
	sth	%l2,	[%l7 + %g3]
	add	%l0,	%g1,	%i6
	nop
	set	0x4C, %o5
	sth	%l1,	[%l7 + %o5]
	and	%i7,	%l6,	%i4
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xd2
	ld	[%l7 + 0x74],	%f1
	nop
	set	0x68, %l5
	std	%f10,	[%l7 + %l5]
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%i3
	set	0x40, %i7
	stxa	%g5,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x7A, %o4
	stha	%i5,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x78, %o7
	lda	[%l7 + %o7] 0x89,	%f19
	set	0x78, %i2
	stxa	%i1,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x38, %l0
	stxa	%o0,	[%l7 + %l0] 0x81
	nop
	set	0x2C, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x1A, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o2
	nop
	set	0x65, %l6
	ldsb	[%l7 + %l6],	%o7
	nop
	set	0x5F, %i4
	ldsb	[%l7 + %i4],	%g6
	add	%o5,	%i0,	%g4
	or	%i2,	%o6,	%g2
	st	%fsr,	[%l7 + 0x28]
	set	0x20, %g5
	stxa	%o1,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%f16
	nop
	set	0x60, %o1
	lduw	[%l7 + %o1],	%g3
	set	0x68, %i3
	stxa	%o4,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc2
	nop
	set	0x60, %g1
	ldsb	[%l7 + %g1],	%l4
	nop
	set	0x0B, %g2
	stb	%l3,	[%l7 + %g2]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%g7
	nop
	set	0x18, %o2
	stx	%l5,	[%l7 + %o2]
	set	0x48, %l2
	ldxa	[%l7 + %l2] 0x89,	%l0
	set	0x70, %l1
	stxa	%g1,	[%l7 + %l1] 0x81
	set	0x25, %g4
	ldstuba	[%l7 + %g4] 0x81,	%i6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f0
	set	0x10, %g6
	ldxa	[%l7 + %g6] 0x81,	%l1
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x81,	%i7
	set	0x68, %i6
	stda	%i6,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x4C, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i4
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x80
	add	%l2,	%g5,	%i3
	nop
	set	0x78, %l3
	ldub	[%l7 + %l3],	%i5
	or	%o0,	%o2,	%i1
	nop
	set	0x64, %o5
	stw	%g6,	[%l7 + %o5]
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%g4
	set	0x40, %i0
	stxa	%i0,	[%l7 + %i0] 0x81
	nop
	set	0x7A, %o4
	lduh	[%l7 + %o4],	%o6
	nop
	set	0x38, %i7
	stx	%i2,	[%l7 + %i7]
	and	%g2,	%o1,	%g3
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%l4
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%o4
	set	0x48, %o7
	lda	[%l7 + %o7] 0x89,	%f18
	nop
	set	0x74, %o0
	prefetch	[%l7 + %o0],	 3
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%o2
	nop
	set	0x14, %l6
	lduw	[%l7 + %l6],	%l3
	nop
	set	0x76, %i4
	ldsb	[%l7 + %i4],	%g7
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%l4
	nop
	set	0x30, %l4
	lduh	[%l7 + %l4],	%g1
	nop
	set	0x24, %o1
	stw	%i6,	[%l7 + %o1]
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x81,	%l0
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%i6
	nop
	set	0x68, %g2
	prefetch	[%l7 + %g2],	 0
	set	0x40, %g1
	lda	[%l7 + %g1] 0x81,	%f17
	add	%l6,	%l1,	%i4
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x81,	%g5
	and	%i3,	%l2,	%i5
	be,pn	%xcc,	loop_23
	nop
	set	0x08, %l1
	std	%o0,	[%l7 + %l1]
	set	0x0C, %l2
	stha	%o2,	[%l7 + %l2] 0xea
	membar	#Sync
loop_23:
	nop
	set	0x51, %g4
	stb	%i1,	[%l7 + %g4]
	set	0x38, %o3
	stxa	%o5,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x70, %g6
	stha	%o7,	[%l7 + %g6] 0x81
	set	0x34, %i6
	stha	%g4,	[%l7 + %i6] 0x80
	nop
	set	0x4C, %i5
	lduw	[%l7 + %i5],	%i0
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%o6
	bn,a,pt	%xcc,	loop_24
	nop
	set	0x34, %l3
	stb	%i2,	[%l7 + %l3]
	set	0x0A, %o5
	ldstuba	[%l7 + %o5] 0x88,	%g2
loop_24:
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x14, %i0
	ldub	[%l7 + %i0],	%o1
	nop
	set	0x38, %l5
	stw	%g6,	[%l7 + %l5]
	set	0x14, %o4
	swapa	[%l7 + %o4] 0x88,	%g3
	nop
	set	0x48, %i2
	ldsb	[%l7 + %i2],	%l4
	set	0x2A, %l0
	stha	%o3,	[%l7 + %l0] 0x80
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x4F, %i7
	ldstub	[%l7 + %i7],	%o4
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%l3
	nop
	set	0x30, %o0
	stx	%fsr,	[%l7 + %o0]
	add	%l5,	%g7,	%i6
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x40, %l6
	lduw	[%l7 + %l6],	%l6
	st	%fsr,	[%l7 + 0x40]
	ble,a	%icc,	loop_25
	nop
	set	0x78, %g7
	stx	%g1,	[%l7 + %g7]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%l1
loop_25:
	add	%g5,	%l2,	%i3
	set	0x50, %i4
	stxa	%i5,	[%l7 + %i4] 0x80
	and	%o0,	%o2,	%o5
	nop
	set	0x6A, %g5
	lduh	[%l7 + %g5],	%o7
	set	0x24, %o1
	lda	[%l7 + %o1] 0x89,	%f11
	nop
	set	0x18, %i3
	swap	[%l7 + %i3],	%i1
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x88,	%i0
	nop
	set	0x70, %l4
	stb	%g4,	[%l7 + %l4]
	nop
	set	0x1C, %g1
	stw	%i2,	[%l7 + %g1]
	set	0x50, %o2
	lda	[%l7 + %o2] 0x81,	%f27
	nop
	set	0x46, %g2
	sth	%o6,	[%l7 + %g2]
	nop
	set	0x7E, %l2
	ldstub	[%l7 + %l2],	%g2
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f4
	set	0x3A, %o3
	stha	%g6,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x0E, %l1
	stha	%o1,	[%l7 + %l1] 0x88
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	and	%l4,	%o3,	%g3
	nop
	set	0x50, %i6
	lduh	[%l7 + %i6],	%l3
	and	%o4,	%g7,	%i6
	set	0x08, %i5
	lda	[%l7 + %i5] 0x88,	%f22
	nop
	set	0x18, %g3
	stw	%l5,	[%l7 + %g3]
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	fpsub16s	%f12,	%f10,	%f2
	set	0x5C, %o6
	swapa	[%l7 + %o6] 0x81,	%l0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%l6
	set	0x17, %i0
	stba	%g1,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x4C, %l5
	ldsw	[%l7 + %l5],	%i4
	st	%f2,	[%l7 + 0x18]
	nop
	set	0x4A, %o4
	sth	%l1,	[%l7 + %o4]
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%f20
	set	0x40, %l0
	lda	[%l7 + %l0] 0x80,	%f0
	nop
	set	0x24, %i2
	prefetch	[%l7 + %i2],	 3
	wr	%g5,	%i3,	%clear_softint
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xda,	%f16
	set	0x60, %o0
	swapa	[%l7 + %o0] 0x89,	%l2
	st	%f16,	[%l7 + 0x70]
	add	%o0,	%i5,	%o2
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
	bgu	%xcc,	loop_26
	st	%fsr,	[%l7 + 0x5C]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%i1
loop_26:
	add	%g4,	%i2,	%o6
	nop
	set	0x38, %i7
	ldsw	[%l7 + %i7],	%i0
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%g6
	set	0x70, %g7
	stda	%g2,	[%l7 + %g7] 0x89
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x89
	nop
	set	0x40, %i3
	lduw	[%l7 + %i3],	%l4
	nop
	nop
	setx	0x7D3354FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xBB57E52B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f3,	%f3
	bleu,pn	%icc,	loop_27
	nop
	set	0x7C, %i1
	lduh	[%l7 + %i1],	%o1
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x88,	%o2
loop_27:
	nop
	set	0x10, %l4
	stx	%g3,	[%l7 + %l4]
	nop
	set	0x4C, %g1
	stw	%o4,	[%l7 + %g1]
	ba	%xcc,	loop_28
	nop
	set	0x65, %g2
	ldstub	[%l7 + %g2],	%g7
	nop
	set	0x60, %o2
	stw	%l3,	[%l7 + %o2]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%l5
loop_28:
	nop
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd2
	nop
	set	0x32, %g4
	ldub	[%l7 + %g4],	%i7
	set	0x60, %l1
	ldxa	[%l7 + %l1] 0x81,	%l0
	and	%g1,	%i4,	%l1
	set	0x3D, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l6
	nop
	set	0x68, %g6
	ldx	[%l7 + %g6],	%g5
	set	0x30, %i6
	stxa	%i3,	[%l7 + %i6] 0x89
	add	%l2,	%o0,	%i5
	nop
	set	0x52, %g3
	ldsh	[%l7 + %g3],	%o7
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x81,	 2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%o2
	nop
	set	0x58, %i0
	ldsw	[%l7 + %i0],	%i1
	nop
	set	0x24, %o6
	swap	[%l7 + %o6],	%g4
	ld	[%l7 + 0x6C],	%f23
	nop
	set	0x64, %l5
	stw	%i2,	[%l7 + %l5]
	nop
	set	0x14, %l3
	ldsw	[%l7 + %l3],	%o6
	nop
	set	0x26, %l0
	ldstub	[%l7 + %l0],	%g6
	set	0x4C, %i2
	stwa	%i0,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x54, %o4
	lduh	[%l7 + %o4],	%l4
	nop
	set	0x17, %o7
	ldstub	[%l7 + %o7],	%o1
	nop
	set	0x78, %o0
	stx	%g2,	[%l7 + %o0]
	nop
	set	0x74, %i7
	stw	%o3,	[%l7 + %i7]
	set	0x48, %l6
	sta	%f5,	[%l7 + %l6] 0x80
	set	0x3C, %i4
	stha	%g3,	[%l7 + %i4] 0xea
	membar	#Sync
	st	%f20,	[%l7 + 0x7C]
	nop
	set	0x0C, %g7
	lduw	[%l7 + %g7],	%o4
	nop
	set	0x4C, %i3
	lduw	[%l7 + %i3],	%l3
	nop
	set	0x6C, %i1
	lduh	[%l7 + %i1],	%g7
	nop
	set	0x24, %g5
	swap	[%l7 + %g5],	%i6
	nop
	set	0x58, %o1
	std	%i6,	[%l7 + %o1]
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f24
	st	%fsr,	[%l7 + 0x7C]
	add	%l5,	%l0,	%i4
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%l1
	nop
	set	0x40, %o2
	prefetch	[%l7 + %o2],	 3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%g5
	set	0x3C, %l2
	sta	%f5,	[%l7 + %l2] 0x89
	add	%g1,	%l2,	%i3
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x89
	nop
	set	0x58, %l1
	stx	%i5,	[%l7 + %l1]
	wr	%o0,	%o7,	%y
	nop
	set	0x6E, %o3
	lduh	[%l7 + %o3],	%o5
	nop
	set	0x08, %g6
	stw	%o2,	[%l7 + %g6]
	nop
	set	0x26, %g2
	ldsh	[%l7 + %g2],	%i1
	nop
	set	0x1E, %i6
	ldsh	[%l7 + %i6],	%i2
	fpadd16	%f8,	%f4,	%f30
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%i0
	add	%l4,	%g4,	%o1
	set	0x0C, %o5
	stba	%g2,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x70, %g3
	sta	%f21,	[%l7 + %g3] 0x81
	nop
	set	0x77, %i0
	ldub	[%l7 + %i0],	%g3
	nop
	set	0x49, %o6
	ldstub	[%l7 + %o6],	%o3
	nop
	set	0x20, %l5
	std	%o4,	[%l7 + %l5]
	st	%f28,	[%l7 + 0x48]
	nop
	set	0x50, %l3
	std	%f14,	[%l7 + %l3]
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%g7
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xea,	%l2
	set	0x6D, %l0
	stba	%i7,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x38, %o0
	sth	%l5,	[%l7 + %o0]
	nop
	set	0x3A, %o7
	sth	%i6,	[%l7 + %o7]
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x80,	 3
	and	%l0,	%l6,	%l1
	nop
	set	0x4F, %l6
	ldstub	[%l7 + %l6],	%g1
	st	%f6,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%g5
	nop
	set	0x20, %i3
	ldx	[%l7 + %i3],	%i3
	or	%i5,	%o0,	%o7
	set	0x48, %i1
	swapa	[%l7 + %i1] 0x80,	%o5
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f14
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%l2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f16
	nop
	set	0x20, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x64, %g1
	stwa	%i1,	[%l7 + %g1] 0x81
	and	%o6,	%i2,	%i0
	or	%l4,	%g4,	%o1
	set	0x48, %g5
	sta	%f19,	[%l7 + %g5] 0x81
	fpadd32	%f6,	%f28,	%f18
	nop
	set	0x54, %o2
	prefetch	[%l7 + %o2],	 3
	nop
	set	0x31, %g4
	stb	%g6,	[%l7 + %g4]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%o3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x81,	%g2
	nop
	set	0x08, %l1
	stb	%o4,	[%l7 + %l1]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g7
	nop
	nop
	setx	0x0C01AF4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x9B6E8D87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f16,	%f29
	set	0x28, %g6
	stxa	%l5,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x73, %o3
	stb	%i7,	[%l7 + %o3]
	fpsub32	%f24,	%f30,	%f12
	set	0x48, %g2
	stxa	%i6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%l0
	nop
	set	0x3A, %i5
	stb	%l6,	[%l7 + %i5]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xd2
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x88,	%l0
	nop
	set	0x08, %g3
	stb	%i4,	[%l7 + %g3]
	nop
	set	0x40, %l3
	ldx	[%l7 + %l3],	%g5
	add	%i3,	%i5,	%g1
	set	0x08, %i2
	sta	%f2,	[%l7 + %i2] 0x81
	set	0x08, %l5
	stwa	%o0,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x62, %l0
	sth	%o5,	[%l7 + %l0]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	nop
	set	0x48, %o7
	ldx	[%l7 + %o7],	%o7
	nop
	set	0x70, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x3C, %i7
	swap	[%l7 + %i7],	%l2
	or	%i1,	%o2,	%o6
	set	0x3C, %g7
	stwa	%i0,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x74, %l6
	ldsw	[%l7 + %l6],	%i2
	nop
	set	0x0C, %i1
	lduh	[%l7 + %i1],	%g4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%g6
	be,a,pt	%xcc,	loop_29
	wr	%o1,	%o3,	%y
	nop
	set	0x52, %i4
	stb	%g2,	[%l7 + %i4]
	ble	%icc,	loop_30
loop_29:
	nop
	set	0x38, %o1
	stw	%o4,	[%l7 + %o1]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%g3
loop_30:
	nop
	set	0x18, %i3
	stx	%l5,	[%l7 + %i3]
	nop
	set	0x68, %l4
	lduh	[%l7 + %l4],	%i7
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f16
	nop
	set	0x1C, %o2
	ldsw	[%l7 + %o2],	%i6
	set	0x40, %g4
	lda	[%l7 + %g4] 0x80,	%f27
	set	0x3C, %l2
	swapa	[%l7 + %l2] 0x81,	%g7
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x88,	%l6
	nop
	set	0x54, %g6
	ldsb	[%l7 + %g6],	%l1
	set	0x1C, %g1
	stwa	%i4,	[%l7 + %g1] 0x88
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xeb,	%l0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%i3
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%g1
	set	0x5C, %i6
	lda	[%l7 + %i6] 0x89,	%f28
	add	%o0,	%o5,	%o7
	set	0x50, %i5
	stda	%l2,	[%l7 + %i5] 0xeb
	membar	#Sync
	st	%f28,	[%l7 + 0x50]
	set	0x20, %i0
	sta	%f10,	[%l7 + %i0] 0x81
	nop
	set	0x18, %o6
	ldsw	[%l7 + %o6],	%i1
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%o2
	bn,a,pn	%xcc,	loop_31
	nop
	nop
	setx	0xA71491B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x51061119,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f28,	%f8
	nop
	set	0x34, %l3
	lduh	[%l7 + %l3],	%o6
	set	0x0C, %i2
	stwa	%i5,	[%l7 + %i2] 0x81
loop_31:
	nop
	set	0x3F, %l5
	stb	%i2,	[%l7 + %l5]
	set	0x44, %l0
	stwa	%i0,	[%l7 + %l0] 0x81
	nop
	set	0x68, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x89,	 0
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f10
	or	%g4,	%o1,	%o3
	or	%g6,	%g2,	%o4
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%l2
	wr	%g3,	%l5,	%set_softint
	set	0x78, %g7
	stda	%i6,	[%l7 + %g7] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x38, %l6
	lduh	[%l7 + %l6],	%i6
	set	0x4C, %i1
	stha	%g7,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x6D, %o4
	stb	%l1,	[%l7 + %o4]
	nop
	set	0x24, %i4
	lduh	[%l7 + %i4],	%l6
	nop
	set	0x12, %i3
	ldsh	[%l7 + %i3],	%i4
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x80
	nop
	set	0x0D, %l4
	ldsb	[%l7 + %l4],	%g5
	nop
	set	0x60, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x6A, %o2
	ldsb	[%l7 + %o2],	%l0
	set	0x64, %g4
	swapa	[%l7 + %g4] 0x89,	%i3
	nop
	set	0x5C, %l2
	lduh	[%l7 + %l2],	%g1
	set	0x24, %l1
	sta	%f12,	[%l7 + %l1] 0x80
	set	0x11, %g6
	ldstuba	[%l7 + %g6] 0x80,	%o5
	set	0x72, %g1
	stha	%o0,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x28, %g2
	std	%o6,	[%l7 + %g2]
	set	0x38, %o3
	swapa	[%l7 + %o3] 0x89,	%i1
	nop
	set	0x40, %i5
	std	%f18,	[%l7 + %i5]
	add	%l2,	%o6,	%i5
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%i2
	nop
	set	0x64, %o6
	prefetch	[%l7 + %o6],	 2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%o2
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0
	nop
	set	0x08, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x78, %l5
	sta	%f9,	[%l7 + %l5] 0x80
	set	0x0B, %l0
	stba	%l4,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x28, %i2
	stxa	%g4,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x56, %g3
	lduh	[%l7 + %g3],	%o1
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x89,	 1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f16
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%g2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xea,	%l2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%l5
	add	%g3,	%i6,	%i7
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x88,	%l0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f0
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x28, %i4
	std	%g6,	[%l7 + %i4]
	nop
	set	0x40, %l6
	std	%f20,	[%l7 + %l6]
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x89,	%i4
	st	%fsr,	[%l7 + 0x6C]
	set	0x3E, %l4
	stha	%l6,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x56, %g5
	stb	%l0,	[%l7 + %g5]
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%i3
	nop
	set	0x48, %l2
	stw	%g1,	[%l7 + %l2]
	wr 	%g0, 	0x7, 	%fprs
	set	0x5E, %o1
	stha	%o7,	[%l7 + %o1] 0xe2
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%l2
	set	0x30, %g6
	stda	%i0,	[%l7 + %g6] 0x80
	set	0x60, %l1
	stda	%o6,	[%l7 + %l1] 0x81
	set	0x38, %g1
	lda	[%l7 + %g1] 0x89,	%f25
	set	0x18, %o3
	stda	%i2,	[%l7 + %o3] 0x89
	set	0x08, %g2
	stda	%i4,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xca
	add	%i0,	%l4,	%o2
	nop
	set	0x23, %i6
	ldstub	[%l7 + %i6],	%g4
	set	0x78, %o5
	stha	%o1,	[%l7 + %o5] 0xe3
	membar	#Sync
	st	%f10,	[%l7 + 0x5C]
	set	0x5C, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o3
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f16
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%g2
	nop
	set	0x1C, %l5
	sth	%l3,	[%l7 + %l5]
	bne	%icc,	loop_32
	nop
	set	0x66, %i2
	sth	%g6,	[%l7 + %i2]
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x81,	 3
loop_32:
	nop
	set	0x11, %o0
	ldstuba	[%l7 + %o0] 0x89,	%l5
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%f22
	nop
	set	0x6C, %g3
	stw	%i6,	[%l7 + %g3]
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xc2
	nop
	set	0x08, %i7
	std	%f4,	[%l7 + %i7]
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f0
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf1
	membar	#Sync
	nop
	set	0x40, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	set	0x30, %l4
	sth	%l1,	[%l7 + %l4]
	or	%g7,	%g3,	%l6
	ld	[%l7 + 0x3C],	%f2
	nop
	set	0x78, %l6
	std	%l0,	[%l7 + %l6]
	set	0x78, %g5
	stwa	%i3,	[%l7 + %g5] 0x88
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xcc
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf9
	membar	#Sync
	nop
	set	0x70, %o1
	swap	[%l7 + %o1],	%g1
	set	0x50, %o2
	stda	%i4,	[%l7 + %o2] 0x89
	nop
	set	0x08, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x38, %g1
	stx	%o0,	[%l7 + %g1]
	set	0x24, %l1
	lda	[%l7 + %l1] 0x81,	%f3
	wr	%o5,	%g5,	%ccr
	nop
	set	0x39, %g2
	ldsb	[%l7 + %g2],	%l2
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xe2,	%o6
	set	0x32, %i6
	stha	%o6,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x16, %i5
	lduh	[%l7 + %i5],	%i1
	nop
	set	0x58, %o5
	std	%f8,	[%l7 + %o5]
	nop
	set	0x72, %i0
	lduh	[%l7 + %i0],	%i5
	nop
	set	0x37, %l3
	ldub	[%l7 + %l3],	%i2
	nop
	set	0x10, %o6
	lduw	[%l7 + %o6],	%i0
	nop
	set	0x52, %l5
	ldub	[%l7 + %l5],	%o2
	set	0x4B, %i2
	stba	%l4,	[%l7 + %i2] 0x81
	wr	%g4,	%o1,	%ccr
	set	0x24, %o0
	swapa	[%l7 + %o0] 0x80,	%o3
	or	%l3,	%g2,	%o4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd0
	set	0x40, %g3
	stwa	%g6,	[%l7 + %g3] 0x81
	nop
	set	0x10, %o7
	swap	[%l7 + %o7],	%i6
	set	0x7C, %g7
	sta	%f29,	[%l7 + %g7] 0x80
	be,a	%icc,	loop_33
	nop
	set	0x64, %i1
	sth	%l5,	[%l7 + %i1]
	nop
	set	0x42, %i4
	lduh	[%l7 + %i4],	%l1
	set	0x30, %i7
	stxa	%g7,	[%l7 + %i7] 0xe3
	membar	#Sync
loop_33:
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%i7
	set	0x60, %l4
	ldda	[%l7 + %l4] 0xe3,	%g2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i3
	st	%fsr,	[%l7 + 0x74]
	ld	[%l7 + 0x18],	%f1
	set	0x28, %i3
	stda	%l0,	[%l7 + %i3] 0x81
	ld	[%l7 + 0x1C],	%f7
	set	0x68, %l6
	stha	%i4,	[%l7 + %l6] 0x80
	nop
	set	0x68, %g4
	lduh	[%l7 + %g4],	%g1
	set	0x30, %l2
	stxa	%o5,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x34, %o1
	lduh	[%l7 + %o1],	%g5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%o7
	set	0x09, %g5
	ldstuba	[%l7 + %g5] 0x88,	%o0
	fpadd32	%f6,	%f2,	%f8
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%i1
	bge,a	%icc,	loop_34
	add	%i5,	%i2,	%i0
	nop
	set	0x30, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x24, %g1
	prefetch	[%l7 + %g1],	 2
loop_34:
	nop
	set	0x08, %g2
	stxa	%o6,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x20, %o3
	std	%f20,	[%l7 + %o3]
	set	0x60, %i6
	stxa	%o2,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x6C, %l1
	stw	%g4,	[%l7 + %l1]
	be,a	%xcc,	loop_35
	nop
	set	0x28, %i5
	stx	%fsr,	[%l7 + %i5]
	and	%o1,	%l4,	%o3
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%l3
loop_35:
	nop
	set	0x2A, %o5
	ldsh	[%l7 + %o5],	%g2
	set	0x10, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g6
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%f6
	set	0x4C, %l3
	sta	%f12,	[%l7 + %l3] 0x80
	nop
	set	0x1E, %i2
	sth	%o4,	[%l7 + %i2]
	and	%l5,	%i6,	%l1
	nop
	set	0x5B, %o0
	ldub	[%l7 + %o0],	%g7
	set	0x15, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g3
	set	0x30, %l0
	stda	%i6,	[%l7 + %l0] 0x81
	set	0x78, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l6
	nop
	set	0x40, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x30, %i4
	stwa	%l0,	[%l7 + %i4] 0x81
	st	%f15,	[%l7 + 0x7C]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%i4
	nop
	set	0x60, %o7
	prefetch	[%l7 + %o7],	 4
	nop
	set	0x5C, %o4
	ldsb	[%l7 + %o4],	%g1
	nop
	set	0x48, %i7
	std	%f16,	[%l7 + %i7]
	nop
	set	0x40, %i3
	ldsw	[%l7 + %i3],	%o5
	nop
	set	0x1C, %l4
	stw	%l2,	[%l7 + %l4]
	and	%o7,	%g5,	%i1
	nop
	set	0x74, %g4
	sth	%i5,	[%l7 + %g4]
	nop
	set	0x48, %l6
	sth	%i2,	[%l7 + %l6]
	set	0x10, %l2
	sta	%f12,	[%l7 + %l2] 0x80
	ld	[%l7 + 0x28],	%f13
	set	0x30, %g5
	ldda	[%l7 + %g5] 0xea,	%i0
	nop
	set	0x4F, %o2
	ldsb	[%l7 + %o2],	%o6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%g4
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%o0
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x80,	%o1
	st	%f11,	[%l7 + 0x28]
	set	0x5C, %g2
	swapa	[%l7 + %g2] 0x80,	%l4
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	set	0x24, %i6
	stwa	%o3,	[%l7 + %i6] 0x88
	nop
	set	0x74, %g1
	swap	[%l7 + %g1],	%g2
	set	0x50, %i5
	ldxa	[%l7 + %i5] 0x80,	%o4
	fpsub16	%f14,	%f26,	%f22
	or	%g6,	%i6,	%l5
	set	0x08, %i0
	stxa	%g7,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x30, %o5
	ldda	[%l7 + %o5] 0xeb,	%l0
	st	%f31,	[%l7 + 0x50]
	set	0x44, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l0
	ld	[%l7 + 0x4C],	%f14
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%g2
	set	0x78, %l3
	stwa	%i4,	[%l7 + %l3] 0x81
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xda,	%f16
	nop
	set	0x48, %o0
	stx	%i3,	[%l7 + %o0]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%g1
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x0C, %l0
	sta	%f8,	[%l7 + %l0] 0x81
	nop
	set	0x5C, %g3
	stw	%o7,	[%l7 + %g3]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f0
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x89,	%l2
	set	0x1C, %g7
	stwa	%i1,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x47, %o7
	stba	%i5,	[%l7 + %o7] 0x81
	or	%i2,	%i0,	%o6
	nop
	nop
	setx	0xF9B23980,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xE60EF2AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f22,	%f19
	nop
	set	0x40, %i7
	stw	%g5,	[%l7 + %i7]
	nop
	set	0x12, %i3
	ldsh	[%l7 + %i3],	%o2
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%o0
	nop
	set	0x1D, %g4
	ldub	[%l7 + %g4],	%g4
	nop
	set	0x3C, %l6
	ldub	[%l7 + %l6],	%l4
	and	%l3,	%o3,	%o1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%o4
	nop
	set	0x74, %l2
	stw	%i6,	[%l7 + %l2]
	nop
	set	0x58, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%l5
	nop
	set	0x10, %g5
	std	%l0,	[%l7 + %g5]
	nop
	set	0x4C, %g6
	stw	%i7,	[%l7 + %g6]
	set	0x10, %o2
	stba	%g7,	[%l7 + %o2] 0x80
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf8
	membar	#Sync
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xca
	nop
	set	0x7A, %o1
	lduh	[%l7 + %o1],	%l0
	st	%fsr,	[%l7 + 0x4C]
	add	%l6,	%g3,	%i4
	nop
	set	0x64, %g1
	swap	[%l7 + %g1],	%o5
	nop
	set	0x30, %i5
	ldsh	[%l7 + %i5],	%i3
	fpadd16s	%f9,	%f9,	%f17
	nop
	set	0x5C, %i0
	lduh	[%l7 + %i0],	%o7
	set	0x58, %i6
	stxa	%l2,	[%l7 + %i6] 0xea
	membar	#Sync
	or	%i1,	%i5,	%g1
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%i0
	set	0x40, %l5
	stxa	%o6,	[%l7 + %l5] 0x81
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc4
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x81,	%i2
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%o2
	nop
	set	0x0F, %i2
	ldub	[%l7 + %i2],	%o0
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	set	0x7F, %o0
	stba	%l4,	[%l7 + %o0] 0x88
	set	0x70, %i1
	stda	%l2,	[%l7 + %i1] 0x81
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%o1
	nop
	set	0x18, %i4
	stb	%o3,	[%l7 + %i4]
	ld	[%l7 + 0x78],	%f31
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%g2
	nop
	set	0x30, %g7
	std	%f16,	[%l7 + %g7]
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x88,	%i6
	nop
	set	0x36, %i3
	stb	%o4,	[%l7 + %i3]
	nop
	set	0x27, %o7
	ldub	[%l7 + %o7],	%g6
	nop
	set	0x0C, %l4
	ldstub	[%l7 + %l4],	%l1
	nop
	set	0x40, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f6
	nop
	set	0x40, %l2
	std	%f22,	[%l7 + %l2]
	set	0x4E, %g5
	stha	%l5,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f16
	nop
	set	0x28, %o2
	lduw	[%l7 + %o2],	%g7
	add	%i7,	%l6,	%g3
	nop
	set	0x28, %o4
	stw	%i4,	[%l7 + %o4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%i3
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%o7
	st	%f10,	[%l7 + 0x38]
	nop
	set	0x40, %o1
	ldub	[%l7 + %o1],	%l0
	set	0x58, %g2
	prefetcha	[%l7 + %g2] 0x81,	 4
	nop
	set	0x3E, %g1
	sth	%l2,	[%l7 + %g1]
	nop
	set	0x50, %i5
	stw	%g1,	[%l7 + %i5]
	nop
	set	0x60, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x70, %o5
	stxa	%i0,	[%l7 + %o5] 0x88
	nop
	set	0x50, %l5
	std	%f22,	[%l7 + %l5]
	nop
	set	0x08, %i0
	std	%o6,	[%l7 + %i0]
	nop
	set	0x0D, %o6
	ldub	[%l7 + %o6],	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%o0
	and	%o2,	%l4,	%l3
	nop
	set	0x15, %l1
	stb	%g5,	[%l7 + %l1]
	nop
	set	0x4A, %i2
	stb	%g4,	[%l7 + %i2]
	nop
	set	0x3C, %l0
	swap	[%l7 + %l0],	%o3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%g2
	nop
	set	0x08, %o0
	stx	%i6,	[%l7 + %o0]
	set	0x57, %i1
	stba	%g6,	[%l7 + %i1] 0x80
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%o4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%l5
	set	0x30, %l3
	prefetcha	[%l7 + %l3] 0x81,	 4
	fpadd16	%f20,	%f16,	%f8
	ld	[%l7 + 0x08],	%f28
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x88
	and	%l6,	%i4,	%g3
	or	%o5,	%i3,	%l0
	set	0x10, %g7
	lda	[%l7 + %g7] 0x80,	%f13
	nop
	set	0x44, %i4
	prefetch	[%l7 + %i4],	 2
	set	0x38, %i3
	stda	%i0,	[%l7 + %i3] 0x80
	and	%l2,	%o7,	%g1
	nop
	set	0x68, %i7
	ldsw	[%l7 + %i7],	%i0
	nop
	set	0x6C, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x0E, %l6
	ldstub	[%l7 + %l6],	%i2
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f16
	nop
	set	0x60, %o7
	stx	%i5,	[%l7 + %o7]
	set	0x4E, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o0
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc0
	nop
	set	0x78, %g6
	swap	[%l7 + %g6],	%o2
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f28
	set	0x37, %o2
	ldstuba	[%l7 + %o2] 0x88,	%l4
	nop
	set	0x34, %o1
	lduh	[%l7 + %o1],	%l3
	st	%fsr,	[%l7 + 0x70]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x88
	nop
	set	0x50, %g1
	stx	%g5,	[%l7 + %g1]
	set	0x5C, %o3
	swapa	[%l7 + %o3] 0x88,	%g4
	nop
	set	0x70, %i5
	ldx	[%l7 + %i5],	%o3
	set	0x68, %i6
	lda	[%l7 + %i6] 0x89,	%f1
	nop
	set	0x30, %l5
	prefetch	[%l7 + %l5],	 4
	or	%o1,	%o6,	%g2
	set	0x34, %i0
	sta	%f31,	[%l7 + %i0] 0x89
	nop
	set	0x50, %o6
	lduh	[%l7 + %o6],	%i6
	nop
	set	0x70, %l1
	std	%l0,	[%l7 + %l1]
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xeb,	%o4
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%g6
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x80,	 4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x30, %o0
	stwa	%i4,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x38, %i1
	swapa	[%l7 + %i1] 0x80,	%l6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x81
	nop
	set	0x14, %g7
	ldsb	[%l7 + %g7],	%g3
	nop
	set	0x0B, %l3
	ldsb	[%l7 + %l3],	%o5
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f10
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x23, %i7
	ldstub	[%l7 + %i7],	%l0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f0
	add	%i3,	%l2,	%o7
	set	0x53, %l6
	stba	%i1,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x17, %g4
	ldub	[%l7 + %g4],	%g1
	nop
	set	0x60, %o7
	stx	%i2,	[%l7 + %o7]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%o0
	set	0x08, %i3
	stxa	%i0,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x50, %l2
	stw	%l4,	[%l7 + %l2]
	and	%l3,	%g5,	%g4
	wr	%o2,	%o1,	%pic
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%o6
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%o3
	nop
	set	0x1C, %g6
	swap	[%l7 + %g6],	%i6
	nop
	set	0x5F, %o2
	stb	%l1,	[%l7 + %o2]
	set	0x28, %g2
	stda	%o4,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xeb,	%g6
	set	0x50, %o3
	stda	%l4,	[%l7 + %o3] 0xe2
	membar	#Sync
	and	%g2,	%i7,	%i4
	nop
	set	0x70, %o1
	ldstub	[%l7 + %o1],	%g7
	nop
	set	0x14, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x40, %i5
	stba	%g3,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x50, %l5
	stda	%o4,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%l0
	nop
	set	0x1A, %i0
	lduh	[%l7 + %i0],	%l6
	nop
	set	0x44, %l1
	ldub	[%l7 + %l1],	%l2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%i1
	nop
	set	0x35, %i2
	ldub	[%l7 + %i2],	%g1
	nop
	set	0x58, %l0
	std	%f26,	[%l7 + %l0]
	or	%i2,	%i5,	%o0
	nop
	set	0x37, %o5
	ldstub	[%l7 + %o5],	%i0
	nop
	set	0x7C, %o0
	swap	[%l7 + %o0],	%l4
	set	0x21, %i1
	ldstuba	[%l7 + %i1] 0x88,	%l3
	nop
	set	0x24, %g3
	stw	%g5,	[%l7 + %g3]
	fpsub16s	%f12,	%f30,	%f28
	set	0x50, %l3
	stda	%i2,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x5D, %g7
	ldub	[%l7 + %g7],	%g4
	wr 	%g0, 	0x5, 	%fprs
	add	%o6,	%i6,	%o3
	nop
	set	0x10, %i7
	ldub	[%l7 + %i7],	%o4
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x89,	%g6
	set	0x68, %i4
	lda	[%l7 + %i4] 0x89,	%f16
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x20, %g4
	ldsw	[%l7 + %g4],	%l1
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	nop
	set	0x51, %l6
	ldstub	[%l7 + %l6],	%g2
	set	0x58, %i3
	stda	%i4,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x14, %o4
	lduw	[%l7 + %o4],	%g7
	bne,pn	%xcc,	loop_36
	nop
	set	0x27, %l2
	ldsb	[%l7 + %l2],	%g3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%o5
loop_36:
	nop
	set	0x18, %g6
	stha	%l0,	[%l7 + %g6] 0xea
	membar	#Sync
	st	%f15,	[%l7 + 0x0C]
	nop
	set	0x42, %o2
	ldsh	[%l7 + %o2],	%l6
	nop
	set	0x48, %g2
	stw	%l2,	[%l7 + %g2]
	be,a	%icc,	loop_37
	nop
	set	0x78, %o3
	lduh	[%l7 + %o3],	%i1
	set	0x64, %o1
	lda	[%l7 + %o1] 0x80,	%f14
loop_37:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%o7
	nop
	set	0x08, %g1
	ldsh	[%l7 + %g1],	%i2
	nop
	set	0x70, %i6
	std	%f28,	[%l7 + %i6]
	nop
	set	0x60, %i5
	ldsh	[%l7 + %i5],	%i5
	set	0x08, %o6
	stxa	%i0,	[%l7 + %o6] 0x80
	set	0x54, %i0
	stha	%o0,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x14, %l5
	lduh	[%l7 + %l5],	%l4
	set	0x74, %i2
	lda	[%l7 + %i2] 0x89,	%f24
	set	0x52, %l0
	stha	%g5,	[%l7 + %l0] 0x89
	set	0x10, %o5
	lda	[%l7 + %o5] 0x80,	%f27
	set	0x3C, %o0
	stha	%i3,	[%l7 + %o0] 0x88
	nop
	set	0x2E, %i1
	ldsh	[%l7 + %i1],	%g4
	set	0x3C, %g3
	lda	[%l7 + %g3] 0x81,	%f5
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x80,	%l3
	st	%fsr,	[%l7 + 0x7C]
	add	%o1,	%o2,	%i6
	nop
	set	0x2E, %g7
	lduh	[%l7 + %g7],	%o3
	nop
	set	0x40, %i7
	lduw	[%l7 + %i7],	%o6
	nop
	set	0x54, %l4
	lduw	[%l7 + %l4],	%o4
	set	0x50, %l1
	stha	%l1,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%l4
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f0
	set	0x08, %l6
	stxa	%g2,	[%l7 + %l6] 0x80
	nop
	set	0x1A, %o7
	ldstub	[%l7 + %o7],	%g6
	set	0x38, %i3
	stda	%i4,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xd2
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f0
	set	0x6A, %g6
	stha	%g7,	[%l7 + %g6] 0x81
	fpsub32s	%f10,	%f26,	%f24
	st	%f2,	[%l7 + 0x18]
	nop
	set	0x0C, %o2
	ldsh	[%l7 + %o2],	%g3
	nop
	set	0x32, %l2
	sth	%o5,	[%l7 + %l2]
	set	0x24, %g2
	swapa	[%l7 + %g2] 0x80,	%l0
	and	%i7,	%l2,	%l6
	nop
	set	0x14, %o3
	lduh	[%l7 + %o3],	%i1
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%f8
	nop
	set	0x71, %o1
	ldstub	[%l7 + %o1],	%o7
	nop
	set	0x78, %i5
	prefetch	[%l7 + %i5],	 2
	set	0x30, %i6
	stha	%i2,	[%l7 + %i6] 0x80
	set	0x78, %i0
	sta	%f17,	[%l7 + %i0] 0x89
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f10
	set	0x0F, %i2
	stba	%i5,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f16
	ld	[%l7 + 0x2C],	%f6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i0
	set	0x28, %o6
	stda	%o0,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	nop
	set	0x30, %o0
	sth	%l4,	[%l7 + %o0]
	set	0x23, %i1
	ldstuba	[%l7 + %i1] 0x88,	%g5
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x6E, %l3
	stb	%i3,	[%l7 + %l3]
	nop
	set	0x7C, %g3
	stw	%o2,	[%l7 + %g3]
	set	0x64, %g7
	stha	%o1,	[%l7 + %g7] 0x89
	set	0x20, %l4
	stda	%o2,	[%l7 + %l4] 0x89
	add	%o6,	%o4,	%i6
	set	0x44, %i7
	swapa	[%l7 + %i7] 0x80,	%l5
	add	%g2,	%l1,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%g3
	nop
	set	0x7C, %l1
	ldsw	[%l7 + %l1],	%g7
	bl,a,pn	%icc,	loop_38
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x60, %l6
	sta	%f12,	[%l7 + %l6] 0x88
loop_38:
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%l0
	and	%o5,	%l2,	%l6
	st	%f19,	[%l7 + 0x20]
	nop
	set	0x1C, %i3
	ldub	[%l7 + %i3],	%i7
	nop
	set	0x10, %o4
	swap	[%l7 + %o4],	%i1
	set	0x10, %g5
	stwa	%o7,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x6A, %o7
	stb	%i2,	[%l7 + %o7]
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x70, %o2
	stx	%i0,	[%l7 + %o2]
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x14, %l2
	stw	%o0,	[%l7 + %l2]
	set	0x3C, %o3
	stwa	%l4,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x38, %g1
	prefetch	[%l7 + %g1],	 2
	set	0x38, %o1
	stda	%g4,	[%l7 + %o1] 0x88
	ble	%xcc,	loop_39
	nop
	set	0x7F, %g2
	ldub	[%l7 + %g2],	%g4
	nop
	nop
	setx	0xD73854E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xDBEC7ABE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f11,	%f25
	nop
	set	0x40, %i6
	ldsb	[%l7 + %i6],	%i3
loop_39:
	nop
	set	0x78, %i0
	lda	[%l7 + %i0] 0x81,	%f16
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%o2
	set	0x40, %l0
	stxa	%l3,	[%l7 + %l0] 0x81
	set	0x60, %o6
	stda	%o0,	[%l7 + %o6] 0x88
	nop
	set	0x78, %i2
	lduh	[%l7 + %i2],	%o6
	or	%o4,	%i6,	%o3
	or	%l5,	%l1,	%g6
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x40, %o5
	lduw	[%l7 + %o5],	%g2
	add	%i4,	%g3,	%g7
	nop
	set	0x3A, %l3
	ldsh	[%l7 + %l3],	%l0
	or	%o5,	%l2,	%l6
	nop
	set	0x4C, %i1
	ldsw	[%l7 + %i1],	%i1
	nop
	set	0x34, %g3
	ldsh	[%l7 + %g3],	%o7
	nop
	set	0x36, %l4
	ldsh	[%l7 + %l4],	%i2
	set	0x3A, %i7
	stba	%i7,	[%l7 + %i7] 0x88
	set	0x20, %l1
	stxa	%g1,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x7C, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x10, %g4
	sta	%f30,	[%l7 + %g4] 0x80
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x89,	 1
	set	0x58, %i3
	lda	[%l7 + %i3] 0x89,	%f6
	nop
	set	0x5C, %l6
	lduw	[%l7 + %l6],	%o0
	nop
	set	0x35, %g5
	ldub	[%l7 + %g5],	%l4
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%g5
	wr	%g4,	%i5,	%y
	wr	%o2,	%i3,	%clear_softint
	nop
	set	0x4C, %o2
	stw	%o1,	[%l7 + %o2]
	nop
	set	0x30, %o4
	lduw	[%l7 + %o4],	%l3
	set	0x6A, %l2
	stha	%o4,	[%l7 + %l2] 0xe3
	membar	#Sync
	fpsub32s	%f16,	%f27,	%f2
	nop
	set	0x45, %g6
	ldstub	[%l7 + %g6],	%i6
	and	%o6,	%l5,	%l1
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x81,	%o2
	nop
	set	0x3C, %o3
	ldstub	[%l7 + %o3],	%g2
	ld	[%l7 + 0x38],	%f3
	nop
	set	0x48, %o1
	stx	%i4,	[%l7 + %o1]
	or	%g6,	%g7,	%g3
	nop
	set	0x5C, %g2
	prefetch	[%l7 + %g2],	 0
	nop
	set	0x74, %i6
	lduw	[%l7 + %i6],	%l0
	or	%l2,	%l6,	%o5
	nop
	set	0x6A, %i5
	sth	%i1,	[%l7 + %i5]
	nop
	set	0x40, %l5
	ldx	[%l7 + %l5],	%i2
	nop
	set	0x72, %i0
	sth	%i7,	[%l7 + %i0]
	nop
	set	0x48, %l0
	ldsw	[%l7 + %l0],	%o7
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f0
	add	%i0,	%o0,	%g1
	st	%fsr,	[%l7 + 0x28]
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x89,	%l4
	nop
	set	0x36, %o5
	stb	%g4,	[%l7 + %o5]
	bgu	%xcc,	loop_40
	nop
	set	0x54, %l3
	swap	[%l7 + %l3],	%i5
	set	0x78, %i2
	stda	%o2,	[%l7 + %i2] 0x80
loop_40:
	fpsub32	%f22,	%f12,	%f2
	be	%icc,	loop_41
	st	%f1,	[%l7 + 0x34]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f0
loop_41:
	and	%i3,	%o1,	%g5
	nop
	set	0x3D, %l4
	ldub	[%l7 + %l4],	%o4
	nop
	set	0x14, %g3
	ldsb	[%l7 + %g3],	%l3
	st	%f1,	[%l7 + 0x18]
	set	0x08, %l1
	stda	%o6,	[%l7 + %l1] 0xe2
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%l1
	and	%l5,	%o3,	%g2
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x6C, %i7
	swap	[%l7 + %i7],	%i4
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x81,	%g6
	set	0x34, %g4
	stha	%g3,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f0
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf1,	%f16
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc8
	set	0x66, %g5
	stha	%l0,	[%l7 + %g5] 0x89
	nop
	set	0x60, %o7
	swap	[%l7 + %o7],	%g6
	bl,a	%xcc,	loop_42
	nop
	set	0x68, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x1B, %l2
	stb	%l2,	[%l7 + %l2]
	set	0x6E, %g6
	stha	%l6,	[%l7 + %g6] 0x81
loop_42:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%o5
	nop
	set	0x14, %g1
	prefetch	[%l7 + %g1],	 0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc0
	fpsub16	%f28,	%f4,	%f30
	set	0x18, %o3
	stda	%i6,	[%l7 + %o3] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x80,	%i2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x80
	set	0x2C, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o7
	set	0x70, %l5
	lda	[%l7 + %l5] 0x88,	%f22
	st	%f4,	[%l7 + 0x14]
	nop
	set	0x1C, %i0
	swap	[%l7 + %i0],	%i0
	nop
	set	0x28, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x5F, %o6
	ldstuba	[%l7 + %o6] 0x81,	%g1
	nop
	set	0x78, %o0
	std	%o0,	[%l7 + %o0]
	nop
	set	0x46, %o5
	ldsh	[%l7 + %o5],	%g4
	ld	[%l7 + 0x5C],	%f2
	nop
	set	0x7E, %l3
	sth	%l4,	[%l7 + %l3]
	and	%o2,	%i5,	%o1
	nop
	set	0x4E, %l0
	lduh	[%l7 + %l0],	%i3
	nop
	set	0x20, %i1
	std	%g4,	[%l7 + %i1]
	nop
	set	0x68, %i2
	lduh	[%l7 + %i2],	%l3
	set	0x10, %g3
	sta	%f27,	[%l7 + %g3] 0x80
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f28
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xd2
	st	%fsr,	[%l7 + 0x30]
	ld	[%l7 + 0x70],	%f11
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%o6
	nop
	set	0x20, %l4
	stx	%o4,	[%l7 + %l4]
	wr	%i6,	%l1,	%set_softint
	set	0x70, %g4
	stxa	%o3,	[%l7 + %g4] 0x89
	set	0x6F, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g2
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x81,	%f19
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%i4
	nop
	set	0x48, %o7
	ldsb	[%l7 + %o7],	%g7
	set	0x6C, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g3
	nop
	set	0x44, %o4
	swap	[%l7 + %o4],	%l5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%l2
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	set	0x30, %g1
	stda	%i0,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x89,	%o4
	nop
	set	0x78, %o3
	stx	%i7,	[%l7 + %o3]
	set	0x44, %o1
	ldstuba	[%l7 + %o1] 0x89,	%l6
	set	0x50, %l2
	lda	[%l7 + %l2] 0x81,	%f25
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f30
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f30
	and	%o7,	%i0,	%g1
	st	%f31,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x56, %i6
	sth	%o0,	[%l7 + %i6]
	set	0x1A, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i2
	set	0x30, %o6
	stda	%l4,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x6C, %i0
	swapa	[%l7 + %i0] 0x88,	%o2
	set	0x61, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i5
	or	%o1,	%g4,	%g5
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x44]
	set	0x44, %o5
	lda	[%l7 + %o5] 0x89,	%f30
	nop
	set	0x18, %l3
	lduh	[%l7 + %l3],	%i3
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	fpsub16	%f10,	%f22,	%f24
	nop
	set	0x38, %l0
	stw	%l3,	[%l7 + %l0]
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x10, %l1
	stx	%o4,	[%l7 + %l1]
	and	%o6,	%l1,	%o3
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x88,	%g2
	nop
	set	0x68, %i2
	stw	%i4,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x6C, %l4
	ldsw	[%l7 + %l4],	%g7
	nop
	set	0x38, %g7
	std	%i6,	[%l7 + %g7]
	set	0x78, %i4
	lda	[%l7 + %i4] 0x89,	%f15
	nop
	set	0x38, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%g2
	nop
	set	0x08, %l6
	ldsb	[%l7 + %l6],	%g6
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x80,	%l5
	nop
	set	0x20, %o7
	std	%l0,	[%l7 + %o7]
	or	%i1,	%l2,	%i7
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%l6
	st	%f10,	[%l7 + 0x74]
	st	%f3,	[%l7 + 0x60]
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%f10
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x20, %o2
	std	%f26,	[%l7 + %o2]
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%f20
	nop
	set	0x1C, %g1
	ldsh	[%l7 + %g1],	%i0
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%g1
	set	0x70, %i5
	stda	%o0,	[%l7 + %i5] 0x81
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd2,	%f16
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc8
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f16
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%i2
	nop
	set	0x12, %o6
	ldstub	[%l7 + %o6],	%l4
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%i5
	ble,a,pn	%icc,	loop_43
	nop
	set	0x18, %o0
	lduh	[%l7 + %o0],	%g4
	nop
	set	0x27, %o5
	ldsb	[%l7 + %o5],	%o1
	nop
	set	0x7C, %l3
	lduh	[%l7 + %l3],	%g5
loop_43:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%l3
	nop
	set	0x56, %i0
	sth	%o4,	[%l7 + %i0]
	ld	[%l7 + 0x2C],	%f29
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%l1
	set	0x18, %g3
	stwa	%o6,	[%l7 + %g3] 0x88
	nop
	set	0x28, %l1
	sth	%g2,	[%l7 + %l1]
	and	%o3,	%g7,	%i6
	add	%g3,	%i4,	%l5
	set	0x10, %i1
	stda	%g6,	[%l7 + %i1] 0x80
	nop
	set	0x38, %i7
	std	%f10,	[%l7 + %i7]
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x88,	%l0
	nop
	nop
	setx	0xD76C0441,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x54DBA6D0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f8,	%f0
	nop
	set	0x54, %i2
	lduw	[%l7 + %i2],	%l2
	nop
	set	0x46, %i4
	sth	%i1,	[%l7 + %i4]
	nop
	set	0x4C, %g7
	swap	[%l7 + %g7],	%l6
	nop
	set	0x0C, %g4
	swap	[%l7 + %g4],	%i7
	st	%fsr,	[%l7 + 0x7C]
	set	0x10, %i3
	stwa	%o5,	[%l7 + %i3] 0x81
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xcc
	set	0x38, %o7
	swapa	[%l7 + %o7] 0x89,	%i0
	set	0x08, %g6
	stwa	%o7,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x81,	%g1
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f16
	nop
	set	0x40, %o2
	stx	%fsr,	[%l7 + %o2]
	fpadd32s	%f1,	%f27,	%f6
	nop
	set	0x50, %o3
	stw	%o0,	[%l7 + %o3]
	wr	%l4,	%o2,	%set_softint
	nop
	set	0x54, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x58, %i5
	ldsh	[%l7 + %i5],	%i5
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o1
	ld	[%l7 + 0x08],	%f21
	set	0x50, %g1
	stxa	%i2,	[%l7 + %g1] 0x88
	fpadd16s	%f6,	%f7,	%f17
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f6
	nop
	set	0x7A, %i6
	ldsb	[%l7 + %i6],	%i3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%l3
	st	%fsr,	[%l7 + 0x38]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBDE, 	%sys_tick_cmpr
	set	0x62, %l2
	stha	%l1,	[%l7 + %l2] 0x81
	set	0x7C, %o6
	lda	[%l7 + %o6] 0x88,	%f25
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%o2
	set	0x4C, %g2
	stwa	%g7,	[%l7 + %g2] 0xe3
	membar	#Sync
	or	%g2,	%i6,	%g3
	set	0x50, %l3
	stwa	%i4,	[%l7 + %l3] 0x88
	st	%f12,	[%l7 + 0x54]
	nop
	set	0x74, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x22, %l0
	sth	%l5,	[%l7 + %l0]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f16
	nop
	set	0x78, %o5
	prefetch	[%l7 + %o5],	 1
	and	%l0,	%g6,	%l2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%i7
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%o5
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%i6
	nop
	set	0x5C, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x70, %l4
	prefetcha	[%l7 + %l4] 0x80,	 4
	set	0x2D, %i2
	stba	%o7,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x38, %g7
	stb	%o0,	[%l7 + %g7]
	add	%g1,	%l4,	%o2
	add	%g4,	%i5,	%i2
	set	0x6A, %i4
	stba	%i3,	[%l7 + %i4] 0x80
	set	0x09, %i3
	ldstuba	[%l7 + %i3] 0x80,	%o1
	st	%f24,	[%l7 + 0x14]
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x80,	%g5
	nop
	set	0x68, %g6
	ldx	[%l7 + %g6],	%l3
	nop
	set	0x21, %o7
	ldsb	[%l7 + %o7],	%o6
	nop
	set	0x6C, %o4
	lduw	[%l7 + %o4],	%l1
	set	0x34, %g5
	stwa	%o3,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x89,	 4
	set	0x0C, %o1
	stwa	%g7,	[%l7 + %o1] 0x81
	nop
	set	0x14, %i5
	stb	%i6,	[%l7 + %i5]
	nop
	set	0x40, %g1
	swap	[%l7 + %g1],	%g3
	set	0x0C, %o2
	lda	[%l7 + %o2] 0x81,	%f7
	nop
	set	0x38, %i6
	std	%i4,	[%l7 + %i6]
	set	0x14, %l5
	stha	%l5,	[%l7 + %l5] 0x89
	and	%l0,	%g6,	%l2
	nop
	set	0x7C, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x15, %l2
	stb	%i1,	[%l7 + %l2]
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%g2
	nop
	set	0x40, %o0
	stx	%o5,	[%l7 + %o0]
	add	%l6,	%i7,	%o7
	nop
	set	0x30, %i0
	lduw	[%l7 + %i0],	%o0
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%i0
	nop
	set	0x10, %l3
	sth	%l4,	[%l7 + %l3]
	set	0x58, %o5
	stda	%o2,	[%l7 + %o5] 0xeb
	membar	#Sync
	bgu,a	%xcc,	loop_44
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%g1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%g4
loop_44:
	nop
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xe3,	%i2
	set	0x09, %i1
	stba	%i2,	[%l7 + %i1] 0x89
	set	0x7C, %l4
	stba	%g5,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x38, %i7
	stw	%o1,	[%l7 + %i7]
	bg,pt	%icc,	loop_45
	nop
	set	0x30, %i2
	std	%f18,	[%l7 + %i2]
	nop
	set	0x5C, %i4
	ldsw	[%l7 + %i4],	%l3
	nop
	set	0x38, %g7
	prefetch	[%l7 + %g7],	 2
loop_45:
	nop
	set	0x34, %i3
	lda	[%l7 + %i3] 0x89,	%f23
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x80,	%l0
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f24
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%o6
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xd0
	st	%f8,	[%l7 + 0x6C]
	st	%fsr,	[%l7 + 0x34]
	set	0x20, %g5
	ldxa	[%l7 + %g5] 0x88,	%o3
	nop
	set	0x38, %o3
	stx	%g7,	[%l7 + %o3]
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x88,	%i6
	set	0x30, %o4
	ldda	[%l7 + %o4] 0xea,	%o4
	nop
	nop
	setx	0xE50B767A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x0DACF74E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f17,	%f18
	add	%g3,	%i4,	%l5
	nop
	set	0x24, %g1
	ldsw	[%l7 + %g1],	%g6
	nop
	nop
	setx	0x5CA375DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x75A33095,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f6,	%f7
	fpadd32	%f6,	%f8,	%f4
	nop
	set	0x53, %i5
	stb	%l2,	[%l7 + %i5]
	nop
	set	0x38, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x08, %o2
	swapa	[%l7 + %o2] 0x80,	%i1
	nop
	set	0x54, %o6
	swap	[%l7 + %o6],	%g2
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f0
	nop
	set	0x0C, %l2
	ldub	[%l7 + %l2],	%o5
	nop
	set	0x4E, %i0
	ldsh	[%l7 + %i0],	%l0
	set	0x20, %l0
	stwa	%i7,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x7E, %o0
	stha	%l6,	[%l7 + %o0] 0x89
	set	0x38, %l3
	stda	%o0,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%o7
	nop
	set	0x58, %l1
	stx	%l4,	[%l7 + %l1]
	ld	[%l7 + 0x58],	%f7
	nop
	set	0x3C, %o5
	stw	%i0,	[%l7 + %o5]
	nop
	set	0x25, %l4
	ldstub	[%l7 + %l4],	%o2
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x89,	%g0
	ld	[%l7 + 0x3C],	%f2
	nop
	set	0x4B, %i7
	stb	%g4,	[%l7 + %i7]
	set	0x28, %i4
	stwa	%i3,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x40, %i3
	std	%i2,	[%l7 + %i3]
	st	%f19,	[%l7 + 0x40]
	nop
	set	0x72, %g4
	sth	%i5,	[%l7 + %g4]
	nop
	set	0x62, %g6
	lduh	[%l7 + %g6],	%g5
	nop
	set	0x7C, %o7
	stw	%o1,	[%l7 + %o7]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%l1
	set	0x10, %g7
	stda	%o6,	[%l7 + %g7] 0x80
	set	0x60, %l6
	swapa	[%l7 + %l6] 0x88,	%g7
	set	0x18, %o3
	stda	%i6,	[%l7 + %o3] 0x80
	ld	[%l7 + 0x6C],	%f25
	nop
	set	0x34, %o1
	sth	%o4,	[%l7 + %o1]
	fpsub16s	%f23,	%f20,	%f8
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x89,	 0
	st	%f8,	[%l7 + 0x1C]
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f26
	nop
	set	0x78, %g5
	stx	%i4,	[%l7 + %g5]
	nop
	set	0x78, %i6
	stx	%g3,	[%l7 + %i6]
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x80,	%g6
	nop
	set	0x4C, %i5
	ldstub	[%l7 + %i5],	%l2
	nop
	set	0x2B, %o6
	ldsb	[%l7 + %o6],	%l5
	bleu,a	%xcc,	loop_46
	fpsub32	%f30,	%f2,	%f4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xED4, 	%sys_tick_cmpr
	nop
	set	0x48, %o2
	stx	%g2,	[%l7 + %o2]
loop_46:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%l0
	and	%o0,	%o7,	%l6
	nop
	set	0x58, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xe3,	%l4
	nop
	set	0x7A, %l2
	lduh	[%l7 + %l2],	%i0
	set	0x6E, %o0
	stha	%o2,	[%l7 + %o0] 0x89
	add	%g1,	%i3,	%g4
	nop
	set	0x68, %l0
	prefetch	[%l7 + %l0],	 4
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%g5
	nop
	set	0x40, %l1
	std	%l2,	[%l7 + %l1]
	add	%l1,	%o1,	%o6
	nop
	set	0x66, %o5
	ldub	[%l7 + %o5],	%i6
	nop
	set	0x2C, %l3
	sth	%g7,	[%l7 + %l3]
	add	%o3,	%i4,	%g3
	set	0x78, %l4
	stxa	%o4,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x58, %i1
	ldsh	[%l7 + %i1],	%g6
	nop
	set	0x4D, %i7
	stb	%l2,	[%l7 + %i7]
	nop
	set	0x48, %i2
	stb	%l5,	[%l7 + %i2]
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f12
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f16
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%f18
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%g2
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f24
	ld	[%l7 + 0x50],	%f17
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%i6
	nop
	set	0x08, %o7
	std	%f30,	[%l7 + %o7]
	and	%l0,	%o0,	%o7
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x81,	%f14
	or	%l6,	%o5,	%i0
	set	0x61, %o1
	stba	%o2,	[%l7 + %o1] 0xe2
	membar	#Sync
	or	%l4,	%g1,	%g4
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x12, %o3
	sth	%i5,	[%l7 + %o3]
	nop
	set	0x44, %o4
	stw	%i3,	[%l7 + %o4]
	bleu,pn	%icc,	loop_47
	nop
	set	0x63, %g1
	stb	%i2,	[%l7 + %g1]
	nop
	set	0x1E, %g5
	ldsb	[%l7 + %g5],	%g5
	set	0x6C, %l5
	stba	%l3,	[%l7 + %l5] 0xe3
	membar	#Sync
loop_47:
	nop
	set	0x59, %i6
	stba	%o1,	[%l7 + %i6] 0xea
	membar	#Sync
	ld	[%l7 + 0x08],	%f8
	set	0x40, %o6
	lda	[%l7 + %o6] 0x81,	%f12
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xca
	add	%l1,	%i6,	%g7
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%f2
	nop
	set	0x24, %l2
	prefetch	[%l7 + %l2],	 4
	set	0x3D, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o6
	nop
	set	0x6F, %o0
	stb	%i4,	[%l7 + %o0]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	nop
	set	0x52, %g3
	ldsh	[%l7 + %g3],	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%g3
	set	0x58, %l1
	stxa	%g6,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x18, %l3
	std	%l4,	[%l7 + %l3]
	nop
	set	0x0C, %l4
	lduw	[%l7 + %l4],	%l2
	set	0x08, %o5
	stxa	%i1,	[%l7 + %o5] 0x88
	set	0x0C, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i7
	nop
	set	0x5C, %i7
	ldsw	[%l7 + %i7],	%g2
	or	%l0,	%o7,	%o0
	nop
	set	0x20, %i2
	stb	%o5,	[%l7 + %i2]
	nop
	set	0x10, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f16
	st	%f22,	[%l7 + 0x08]
	fpadd32s	%f9,	%f19,	%f17
	set	0x2D, %i3
	stba	%i0,	[%l7 + %i3] 0x81
	set	0x50, %g6
	stxa	%l6,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x66, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l4
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf8,	%f0
	set	0x44, %o1
	lda	[%l7 + %o1] 0x88,	%f2
	set	0x38, %o3
	sta	%f1,	[%l7 + %o3] 0x80
	set	0x10, %o4
	sta	%f20,	[%l7 + %o4] 0x81
	nop
	set	0x38, %g1
	swap	[%l7 + %g1],	%g1
	set	0x08, %g5
	ldstuba	[%l7 + %g5] 0x81,	%o2
	and	%g4,	%i3,	%i2
	nop
	set	0x6C, %l6
	stw	%g5,	[%l7 + %l6]
	set	0x5B, %i6
	stba	%i5,	[%l7 + %i6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%l2
	st	%f12,	[%l7 + 0x2C]
	nop
	set	0x3C, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x70, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x60, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x48, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x2E, %i5
	ldstub	[%l7 + %i5],	%l1
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x81
	nop
	set	0x52, %o0
	stb	%i6,	[%l7 + %o0]
	nop
	set	0x78, %g3
	std	%f24,	[%l7 + %g3]
	nop
	set	0x60, %l3
	stx	%g7,	[%l7 + %l3]
	nop
	set	0x70, %l1
	stx	%i4,	[%l7 + %l1]
	set	0x48, %l4
	lda	[%l7 + %l4] 0x80,	%f28
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xea,	%o6
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%o3
	set	0x60, %i7
	stda	%o4,	[%l7 + %i7] 0x80
	nop
	set	0x2C, %i2
	ldsh	[%l7 + %i2],	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l2
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%i0
	add	%g3,	%g2,	%l0
	set	0x31, %i4
	ldstuba	[%l7 + %i4] 0x88,	%o7
	nop
	set	0x38, %i3
	std	%f6,	[%l7 + %i3]
	nop
	set	0x3E, %o7
	lduh	[%l7 + %o7],	%i7
	set	0x60, %g7
	prefetcha	[%l7 + %g7] 0x81,	 4
	set	0x56, %g6
	stha	%i0,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x30, %o3
	stx	%o5,	[%l7 + %o3]
	set	0x20, %o4
	lda	[%l7 + %o4] 0x88,	%f20
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x89,	 3
	set	0x5C, %g5
	stha	%l6,	[%l7 + %g5] 0x89
	st	%fsr,	[%l7 + 0x08]
	set	0x24, %g1
	lda	[%l7 + %g1] 0x89,	%f2
	nop
	set	0x70, %i6
	lduw	[%l7 + %i6],	%o2
	set	0x38, %l6
	stda	%g0,	[%l7 + %l6] 0xeb
	membar	#Sync
	bleu,a,pt	%xcc,	loop_48
	st	%f19,	[%l7 + 0x64]
	nop
	set	0x70, %l5
	std	%g4,	[%l7 + %l5]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%g5
loop_48:
	nop
	set	0x24, %o6
	sta	%f21,	[%l7 + %o6] 0x89
	set	0x62, %o2
	stha	%i2,	[%l7 + %o2] 0x89
	set	0x48, %l2
	stxa	%l3,	[%l7 + %l2] 0x81
	set	0x3C, %g2
	sta	%f29,	[%l7 + %g2] 0x80
	nop
	set	0x48, %i5
	std	%f24,	[%l7 + %i5]
	nop
	set	0x16, %l0
	sth	%i5,	[%l7 + %l0]
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xe2,	%l0
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	or	%i6,	%i4,	%o6
	nop
	set	0x18, %o0
	ldx	[%l7 + %o0],	%o3
	add	%o4,	%g6,	%l5
	nop
	set	0x34, %l1
	ldsw	[%l7 + %l1],	%g7
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f2
	set	0x44, %l4
	lda	[%l7 + %l4] 0x89,	%f10
	add	%l2,	%g3,	%i1
	st	%fsr,	[%l7 + 0x78]
	set	0x10, %i1
	stha	%l0,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x35, %i7
	stba	%o7,	[%l7 + %i7] 0x89
	set	0x78, %o5
	stxa	%g2,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x38, %g4
	stx	%fsr,	[%l7 + %g4]
	st	%f5,	[%l7 + 0x4C]
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xe3,	%i6
	set	0x0C, %i3
	stwa	%o0,	[%l7 + %i3] 0x80
	fpsub16s	%f15,	%f23,	%f29
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xca
	nop
	set	0x60, %i2
	ldsw	[%l7 + %i2],	%i0
	set	0x27, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l4
	nop
	set	0x18, %g6
	ldsh	[%l7 + %g6],	%o5
	nop
	set	0x1D, %o4
	ldsb	[%l7 + %o4],	%l6
	nop
	set	0x30, %o1
	swap	[%l7 + %o1],	%g1
	nop
	set	0x30, %o3
	swap	[%l7 + %o3],	%g4
	nop
	set	0x08, %g1
	std	%o2,	[%l7 + %g1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%g5
	nop
	set	0x58, %g5
	stx	%l3,	[%l7 + %g5]
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%i2
	nop
	set	0x14, %l6
	lduw	[%l7 + %l6],	%i5
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	fpsub16s	%f14,	%f28,	%f10
	nop
	set	0x40, %l5
	std	%f28,	[%l7 + %l5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%i6
	and	%i4,	%o1,	%o6
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x89,	%o3
	nop
	set	0x69, %o2
	stb	%o4,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x2C, %g2
	sta	%f4,	[%l7 + %g2] 0x89
	nop
	set	0x70, %i0
	lduw	[%l7 + %i0],	%l5
	nop
	set	0x0C, %l0
	ldsb	[%l7 + %l0],	%g7
	nop
	set	0x1C, %o0
	swap	[%l7 + %o0],	%l2
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf8
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%g3
	st	%f3,	[%l7 + 0x14]
	nop
	set	0x55, %l3
	ldsb	[%l7 + %l3],	%l0
	set	0x34, %l4
	sta	%f20,	[%l7 + %l4] 0x89
	set	0x2C, %g3
	lda	[%l7 + %g3] 0x89,	%f20
	set	0x38, %i7
	prefetcha	[%l7 + %i7] 0x81,	 1
	nop
	set	0x20, %i1
	stw	%o7,	[%l7 + %i1]
	set	0x60, %o5
	stxa	%g2,	[%l7 + %o5] 0x81
	ble,a,pt	%icc,	loop_49
	add	%i7,	%o0,	%i0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%l4
loop_49:
	bleu,a,pn	%icc,	loop_50
	and	%l6,	%g4,	%o2
	or	%i3,	%g1,	%l3
	or	%i2,	%g5,	%i5
loop_50:
	nop
	set	0x0C, %g4
	lda	[%l7 + %g4] 0x88,	%f9
	nop
	set	0x64, %i4
	lduw	[%l7 + %i4],	%l1
	nop
	set	0x10, %i3
	stw	%i4,	[%l7 + %i3]
	be,a	%icc,	loop_51
	st	%f16,	[%l7 + 0x50]
	nop
	set	0x0D, %i2
	stb	%o1,	[%l7 + %i2]
	or	%o6,	%o3,	%i6
loop_51:
	add	%o4,	%g7,	%l2
	nop
	set	0x0C, %o7
	prefetch	[%l7 + %o7],	 1
	set	0x18, %g6
	swapa	[%l7 + %g6] 0x89,	%g6
	set	0x0D, %g7
	ldstuba	[%l7 + %g7] 0x88,	%l5
	nop
	set	0x6C, %o1
	swap	[%l7 + %o1],	%l0
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	nop
	set	0x4B, %o4
	ldsb	[%l7 + %o4],	%o7
	nop
	set	0x13, %g1
	ldstub	[%l7 + %g1],	%g2
	nop
	set	0x27, %g5
	stb	%i7,	[%l7 + %g5]
	nop
	set	0x26, %l6
	lduh	[%l7 + %l6],	%o0
	or	%i0,	%i1,	%o5
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd8,	%f0
	nop
	set	0x5E, %l5
	lduh	[%l7 + %l5],	%l6
	set	0x40, %l2
	prefetcha	[%l7 + %l2] 0x81,	 4
	nop
	set	0x0A, %i6
	ldsh	[%l7 + %i6],	%o2
	set	0x3F, %o2
	stba	%i3,	[%l7 + %o2] 0x80
	nop
	set	0x20, %i5
	stx	%l4,	[%l7 + %i5]
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%g0
	ld	[%l7 + 0x08],	%f11
	nop
	set	0x08, %l0
	prefetch	[%l7 + %l0],	 0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g5
	set	0x32, %o0
	stha	%i2,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x40, %l1
	sta	%f13,	[%l7 + %l1] 0x88
	nop
	set	0x62, %l3
	ldub	[%l7 + %l3],	%i5
	nop
	set	0x58, %i0
	ldsw	[%l7 + %i0],	%l1
	ld	[%l7 + 0x14],	%f22
	set	0x3A, %l4
	stha	%i4,	[%l7 + %l4] 0x89
	set	0x28, %i7
	prefetcha	[%l7 + %i7] 0x81,	 3
	nop
	nop
	setx	0xB6796D6345E78FF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x80EADE1A0BC0695C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f28,	%f22
	set	0x5D, %g3
	stba	%o3,	[%l7 + %g3] 0x89
	fpadd32s	%f17,	%f21,	%f25
	nop
	set	0x40, %i1
	std	%f28,	[%l7 + %i1]
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x52, %i4
	ldsh	[%l7 + %i4],	%o1
	nop
	set	0x5C, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x34, %i2
	stwa	%o4,	[%l7 + %i2] 0xe3
	membar	#Sync
	st	%f25,	[%l7 + 0x20]
	nop
	set	0x20, %o7
	stx	%i6,	[%l7 + %o7]
	nop
	set	0x7F, %i3
	ldstub	[%l7 + %i3],	%l2
	nop
	set	0x1C, %g6
	ldsw	[%l7 + %g6],	%g6
	nop
	set	0x60, %g7
	stw	%l5,	[%l7 + %g7]
	ld	[%l7 + 0x64],	%f30
	wr	%l0,	%g7,	%clear_softint
	nop
	set	0x50, %o1
	lduh	[%l7 + %o1],	%o7
	add	%g3,	%g2,	%o0
	nop
	set	0x3C, %o4
	stw	%i0,	[%l7 + %o4]
	nop
	set	0x50, %o3
	ldsw	[%l7 + %o3],	%i7
	nop
	set	0x7C, %g5
	swap	[%l7 + %g5],	%i1
	or	%o5,	%g4,	%l6
	nop
	set	0x74, %l6
	swap	[%l7 + %l6],	%o2
	nop
	set	0x55, %g1
	ldub	[%l7 + %g1],	%l4
	nop
	set	0x33, %l5
	stb	%i3,	[%l7 + %l5]
	set	0x20, %l2
	stda	%g0,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x18, %i6
	std	%l2,	[%l7 + %i6]
	nop
	set	0x28, %o2
	std	%f14,	[%l7 + %o2]
	bleu,pn	%icc,	loop_52
	nop
	set	0x50, %o6
	stx	%i2,	[%l7 + %o6]
	set	0x2C, %g2
	swapa	[%l7 + %g2] 0x89,	%g5
loop_52:
	nop
	set	0x76, %i5
	sth	%l1,	[%l7 + %i5]
	set	0x34, %l0
	lda	[%l7 + %l0] 0x89,	%f29
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o6
	nop
	set	0x44, %o0
	lduh	[%l7 + %o0],	%o3
	or	%o1,	%i4,	%i6
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x89,	%l2
	nop
	set	0x58, %i0
	ldub	[%l7 + %i0],	%g6
	set	0x30, %l4
	stda	%o4,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
	st	%f27,	[%l7 + 0x08]
	nop
	set	0x48, %g3
	std	%f2,	[%l7 + %g3]
	set	0x10, %i1
	stda	%l4,	[%l7 + %i1] 0x89
	nop
	set	0x48, %o5
	stx	%o7,	[%l7 + %o5]
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x89,	%g2
	set	0x40, %i7
	stda	%g2,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x54, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x64, %i2
	swap	[%l7 + %i2],	%g7
	nop
	set	0x68, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x49, %g6
	ldub	[%l7 + %g6],	%o0
	nop
	set	0x42, %g7
	ldsh	[%l7 + %g7],	%i0
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1259
!	Type a   	: 24
!	Type cti   	: 32
!	Type x   	: 530
!	Type f   	: 36
!	Type i   	: 119
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 2 Start
!
.global thread_2
thread_2:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0xB,	%g2
	set	0xC,	%g3
	set	0xE,	%g4
	set	0x2,	%g5
	set	0xD,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xE,	%i1
	set	-0xF,	%i2
	set	-0x9,	%i3
	set	-0xA,	%i4
	set	-0xA,	%i5
	set	-0x7,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x766D95C2,	%l0
	set	0x09D64989,	%l1
	set	0x3DB93018,	%l2
	set	0x09ACE449,	%l3
	set	0x21E513F7,	%l4
	set	0x34C52E19,	%l5
	set	0x113ED987,	%l6
	!# Output registers
	set	-0x1EBB,	%o0
	set	0x02BB,	%o1
	set	-0x08E5,	%o2
	set	-0x156A,	%o3
	set	-0x19AA,	%o4
	set	0x1139,	%o5
	set	-0x13BE,	%o6
	set	0x1971,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA52B36A3745B7D0F)
	INIT_TH_FP_REG(%l7,%f2,0xF56E0DA3B90577AE)
	INIT_TH_FP_REG(%l7,%f4,0x402D7DAC36E9E004)
	INIT_TH_FP_REG(%l7,%f6,0x3E7BF54684D0E162)
	INIT_TH_FP_REG(%l7,%f8,0x28D8FFEFD3AADC85)
	INIT_TH_FP_REG(%l7,%f10,0xCB7B13CDA6BF8DEA)
	INIT_TH_FP_REG(%l7,%f12,0xFBE4579F62424EC9)
	INIT_TH_FP_REG(%l7,%f14,0x0803BB4F6DA96F25)
	INIT_TH_FP_REG(%l7,%f16,0x8C8CF0668AFE08A2)
	INIT_TH_FP_REG(%l7,%f18,0xA553375C4CDAC316)
	INIT_TH_FP_REG(%l7,%f20,0x08DDCB6D2CEAA72B)
	INIT_TH_FP_REG(%l7,%f22,0x33B2375325954A03)
	INIT_TH_FP_REG(%l7,%f24,0xBE22DBBDCE6BB10C)
	INIT_TH_FP_REG(%l7,%f26,0xD5B7E828433B5701)
	INIT_TH_FP_REG(%l7,%f28,0xEE1A081B36C4A381)
	INIT_TH_FP_REG(%l7,%f30,0xB3D02AD26C75010E)

	!# Execute Main Diag ..

	set	0x28, %o4
	prefetcha	[%l7 + %o4] 0x88,	 1
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%o4
	nop
	set	0x3B, %o3
	ldstub	[%l7 + %o3],	%i7
	add	%l6,	%g4,	%l4
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f0
	nop
	set	0x10, %l6
	stx	%o2,	[%l7 + %l6]
	wr	%g1,	%l3,	%ccr
	fpsub32s	%f4,	%f21,	%f12
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd8
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%i2
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	nop
	set	0x74, %o2
	ldstub	[%l7 + %o2],	%g5
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%l1
	set	0x1C, %g2
	lda	[%l7 + %g2] 0x80,	%f24
	nop
	set	0x68, %o6
	swap	[%l7 + %o6],	%i5
	nop
	set	0x48, %l0
	prefetch	[%l7 + %l0],	 1
	and	%i3,	%o6,	%o3
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x89,	 1
	fpadd16	%f4,	%f14,	%f12
	add	%o1,	%l2,	%i6
	nop
	set	0x48, %l3
	std	%o4,	[%l7 + %l3]
	nop
	set	0x48, %o0
	lduh	[%l7 + %o0],	%l0
	nop
	set	0x50, %i0
	ldsh	[%l7 + %i0],	%l5
	set	0x24, %l1
	lda	[%l7 + %l1] 0x89,	%f29
	nop
	set	0x70, %l4
	swap	[%l7 + %l4],	%g6
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xe2,	%o6
	nop
	set	0x0C, %g3
	ldsw	[%l7 + %g3],	%g2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%o0
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f16
	nop
	set	0x22, %i4
	sth	%i0,	[%l7 + %i4]
	set	0x30, %g4
	stwa	%g7,	[%l7 + %g4] 0x89
	set	0x58, %i7
	stda	%o4,	[%l7 + %i7] 0xe2
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%l6
	nop
	set	0x64, %i2
	ldsw	[%l7 + %i2],	%i7
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf0
	membar	#Sync
	ld	[%l7 + 0x6C],	%f21
	nop
	set	0x78, %g6
	ldsw	[%l7 + %g6],	%l4
	set	0x41, %g7
	stba	%g4,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%g1
	set	0x40, %o7
	sta	%f11,	[%l7 + %o7] 0x81
	bne	%xcc,	loop_53
	nop
	set	0x58, %o3
	std	%l2,	[%l7 + %o3]
	nop
	set	0x3C, %g5
	ldsb	[%l7 + %g5],	%o2
	set	0x50, %o1
	stha	%i2,	[%l7 + %o1] 0xeb
	membar	#Sync
loop_53:
	nop
	set	0x64, %l6
	swapa	[%l7 + %l6] 0x89,	%g5
	nop
	set	0x20, %g1
	swap	[%l7 + %g1],	%i5
	set	0x60, %l5
	lda	[%l7 + %l5] 0x80,	%f27
	set	0x38, %o2
	stxa	%l1,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x54, %i6
	swap	[%l7 + %i6],	%i3
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x80,	%o3
	set	0x60, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	set	0x18, %o6
	stwa	%o1,	[%l7 + %o6] 0x80
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%i6
	nop
	set	0x28, %l0
	ldsw	[%l7 + %l0],	%o4
	nop
	set	0x38, %l3
	sth	%i4,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x60, %i5
	std	%f6,	[%l7 + %i5]
	nop
	set	0x0E, %i0
	ldstub	[%l7 + %i0],	%l5
	nop
	set	0x50, %o0
	ldsw	[%l7 + %o0],	%g6
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x89
	nop
	set	0x30, %l4
	stx	%o7,	[%l7 + %l4]
	nop
	set	0x61, %i1
	ldub	[%l7 + %i1],	%l0
	nop
	set	0x08, %o5
	stw	%g3,	[%l7 + %o5]
	add	%o0,	%i0,	%g2
	wr	%o5,	%g7,	%pic
	set	0x40, %i4
	swapa	[%l7 + %i4] 0x88,	%l6
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	and	%i1,	%i7,	%l4
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f0
	set	0x0A, %i7
	stha	%g4,	[%l7 + %i7] 0x89
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%l2
	set	0x78, %i2
	lda	[%l7 + %i2] 0x81,	%f1
	set	0x30, %g6
	stda	%g0,	[%l7 + %g6] 0x80
	set	0x1C, %g7
	sta	%f29,	[%l7 + %g7] 0x89
	or	%o2,	%g5,	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%i3
	set	0x24, %o4
	lda	[%l7 + %o4] 0x80,	%f29
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%o3
	nop
	set	0x54, %g5
	ldub	[%l7 + %g5],	%o6
	nop
	set	0x20, %o1
	std	%f2,	[%l7 + %o1]
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x89,	%o1
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f28
	nop
	set	0x40, %o7
	std	%f28,	[%l7 + %o7]
	st	%f20,	[%l7 + 0x38]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f16
	nop
	set	0x44, %o2
	ldsh	[%l7 + %o2],	%i5
	nop
	set	0x55, %l2
	ldsb	[%l7 + %l2],	%l2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf9
	membar	#Sync
	set	0x70, %o6
	swapa	[%l7 + %o6] 0x80,	%i6
	nop
	set	0x72, %g2
	ldsh	[%l7 + %g2],	%o4
	set	0x70, %l3
	stwa	%i4,	[%l7 + %l3] 0x89
	fpsub32s	%f4,	%f3,	%f17
	and	%l5,	%g6,	%o7
	set	0x30, %i5
	stda	%g2,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x70, %i0
	ldsh	[%l7 + %i0],	%o0
	nop
	set	0x60, %o0
	std	%l0,	[%l7 + %o0]
	nop
	set	0x30, %l1
	ldsw	[%l7 + %l1],	%g2
	nop
	set	0x6D, %l4
	ldub	[%l7 + %l4],	%i0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%g7
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x81
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f8
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%i1
	nop
	set	0x64, %i4
	stw	%i7,	[%l7 + %i4]
	fpadd16	%f14,	%f24,	%f26
	nop
	set	0x18, %g4
	sth	%l6,	[%l7 + %g4]
	set	0x34, %g3
	swapa	[%l7 + %g3] 0x88,	%g4
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x58, %i7
	std	%l2,	[%l7 + %i7]
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%l4
	nop
	set	0x28, %g6
	sth	%g1,	[%l7 + %g6]
	nop
	set	0x4C, %i3
	lduw	[%l7 + %i3],	%g5
	ba,a,pt	%xcc,	loop_54
	nop
	set	0x32, %o4
	ldsb	[%l7 + %o4],	%i2
	nop
	set	0x5C, %o3
	prefetch	[%l7 + %o3],	 0
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x88,	%l1
loop_54:
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xe2,	%o2
	nop
	set	0x3E, %o1
	lduh	[%l7 + %o1],	%o3
	nop
	set	0x36, %g1
	ldub	[%l7 + %g1],	%o6
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%i3
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f28
	nop
	set	0x48, %l2
	std	%f14,	[%l7 + %l2]
	set	0x60, %i6
	ldda	[%l7 + %i6] 0xea,	%i4
	and	%l2,	%o1,	%i6
	set	0x6A, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i4
	set	0x38, %g2
	stxa	%o4,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x0E, %l3
	ldstub	[%l7 + %l3],	%g6
	and	%l5,	%g3,	%o0
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%f8
	fpsub32	%f18,	%f30,	%f10
	nop
	set	0x40, %l5
	swap	[%l7 + %l5],	%l0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%o7
	nop
	set	0x08, %o0
	std	%f26,	[%l7 + %o0]
	add	%i0,	%g7,	%i1
	nop
	set	0x58, %l1
	swap	[%l7 + %l1],	%i7
	set	0x48, %i0
	stxa	%l6,	[%l7 + %i0] 0xeb
	membar	#Sync
	fpsub32s	%f0,	%f28,	%f17
	set	0x58, %i1
	stxa	%g4,	[%l7 + %i1] 0x80
	set	0x33, %l4
	stba	%o5,	[%l7 + %l4] 0x89
	set	0x78, %l0
	stxa	%l3,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x88,	 4
	nop
	set	0x3D, %o5
	ldsb	[%l7 + %o5],	%g1
	nop
	set	0x68, %g3
	std	%f18,	[%l7 + %g3]
	set	0x50, %g4
	stda	%g4,	[%l7 + %g4] 0x80
	set	0x4E, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l1
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x58, %g6
	lduw	[%l7 + %g6],	%i2
	or	%o2,	%o3,	%i3
	set	0x69, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o6
	set	0x24, %o4
	sta	%f10,	[%l7 + %o4] 0x88
	set	0x70, %i3
	swapa	[%l7 + %i3] 0x81,	%i5
	set	0x6E, %o3
	ldstuba	[%l7 + %o3] 0x88,	%l2
	and	%i6,	%o1,	%o4
	set	0x2C, %g7
	stwa	%i4,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x20, %l6
	lda	[%l7 + %l6] 0x80,	%f9
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xe3,	%l4
	set	0x78, %g1
	lda	[%l7 + %g1] 0x89,	%f5
	add	%g3,	%o0,	%g6
	nop
	set	0x38, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x08, %o7
	stda	%g2,	[%l7 + %o7] 0x81
	set	0x79, %o2
	stba	%o7,	[%l7 + %o2] 0x81
	set	0x22, %i6
	stba	%l0,	[%l7 + %i6] 0x80
	set	0x10, %o6
	stxa	%i0,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x14, %l2
	sta	%f27,	[%l7 + %l2] 0x81
	nop
	set	0x56, %l3
	stb	%g7,	[%l7 + %l3]
	ld	[%l7 + 0x28],	%f4
	set	0x18, %i5
	stda	%i0,	[%l7 + %i5] 0x88
	nop
	set	0x18, %g2
	std	%i6,	[%l7 + %g2]
	set	0x2E, %l5
	stba	%l6,	[%l7 + %l5] 0x88
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%o4
	set	0x4C, %i0
	lda	[%l7 + %i0] 0x88,	%f23
	set	0x49, %o0
	stba	%l3,	[%l7 + %o0] 0x89
	set	0x0C, %i1
	swapa	[%l7 + %i1] 0x89,	%l4
	nop
	set	0x70, %l0
	lduh	[%l7 + %l0],	%g1
	nop
	set	0x18, %i4
	stw	%g5,	[%l7 + %i4]
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%g4
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%i2
	nop
	set	0x2E, %g4
	ldstub	[%l7 + %g4],	%o2
	set	0x28, %i7
	stha	%o3,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x08, %g3
	lduh	[%l7 + %g3],	%i3
	add	%l1,	%o6,	%i5
	set	0x6E, %g6
	stha	%l2,	[%l7 + %g6] 0xeb
	membar	#Sync
	fpadd32	%f22,	%f14,	%f16
	fpsub16s	%f16,	%f29,	%f6
	set	0x08, %i2
	lda	[%l7 + %i2] 0x88,	%f0
	and	%o1,	%i6,	%i4
	and	%o4,	%g3,	%l5
	nop
	set	0x38, %i3
	stx	%o0,	[%l7 + %i3]
	fpsub32	%f16,	%f24,	%f26
	nop
	set	0x28, %o3
	ldub	[%l7 + %o3],	%g2
	bleu,pn	%xcc,	loop_55
	nop
	set	0x4A, %g7
	ldsh	[%l7 + %g7],	%o7
	fpsub32	%f24,	%f12,	%f4
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%g6
loop_55:
	nop
	set	0x7E, %o1
	stb	%l0,	[%l7 + %o1]
	set	0x70, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i0
	set	0x3B, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i1
	nop
	set	0x64, %o7
	ldub	[%l7 + %o7],	%g7
	ld	[%l7 + 0x70],	%f25
	nop
	set	0x08, %l6
	ldsw	[%l7 + %l6],	%l6
	set	0x70, %o2
	stda	%o4,	[%l7 + %o2] 0x89
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%l4
	set	0x10, %i6
	ldda	[%l7 + %i6] 0xea,	%l2
	nop
	set	0x54, %l2
	ldsw	[%l7 + %l2],	%g1
	or	%g4,	%i2,	%g5
	and	%o3,	%o2,	%i3
	nop
	set	0x17, %l3
	stb	%l1,	[%l7 + %l3]
	nop
	set	0x4C, %o6
	swap	[%l7 + %o6],	%o6
	nop
	set	0x7C, %g2
	stw	%l2,	[%l7 + %g2]
	set	0x60, %l5
	prefetcha	[%l7 + %l5] 0x88,	 4
	add	%i6,	%i5,	%o4
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc0
	nop
	set	0x0E, %i0
	ldstub	[%l7 + %i0],	%i4
	wr	%g3,	%o0,	%ccr
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%g2
	set	0x48, %i5
	ldxa	[%l7 + %i5] 0x80,	%l5
	set	0x44, %i1
	stba	%o7,	[%l7 + %i1] 0x88
	add	%g6,	%l0,	%i0
	ld	[%l7 + 0x60],	%f9
	bge,pt	%icc,	loop_56
	nop
	set	0x18, %i4
	stx	%i1,	[%l7 + %i4]
	nop
	set	0x40, %l0
	ldsw	[%l7 + %l0],	%l6
	and	%o5,	%i7,	%g7
loop_56:
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x37, %l4
	ldub	[%l7 + %l4],	%l4
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%l3
	nop
	set	0x0C, %g4
	ldub	[%l7 + %g4],	%i2
	and	%g5,	%o3,	%o2
	nop
	set	0x74, %i7
	swap	[%l7 + %i7],	%i3
	nop
	set	0x38, %g3
	stx	%g4,	[%l7 + %g3]
	nop
	set	0x1C, %i2
	ldsw	[%l7 + %i2],	%l1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%o1
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf0,	%f0
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xeb,	%o6
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x88,	%i6
	set	0x7E, %o4
	stha	%i5,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x68, %o1
	stxa	%o4,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x42, %g1
	lduh	[%l7 + %g1],	%g3
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x81,	 3
	nop
	set	0x60, %o7
	lduw	[%l7 + %o7],	%g2
	ld	[%l7 + 0x30],	%f11
	wr	%l5,	%i4,	%softint
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%f20
	nop
	nop
	setx	0x05D53D7C466E98FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xA445A55472AE8F0E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f22,	%f2
	nop
	set	0x7C, %g5
	sth	%g6,	[%l7 + %g5]
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f16
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x80,	%l0
	st	%f14,	[%l7 + 0x64]
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x81,	 0
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%i1
	nop
	set	0x7E, %o6
	ldstub	[%l7 + %o6],	%l6
	nop
	set	0x24, %g2
	swap	[%l7 + %g2],	%i0
	set	0x20, %l1
	stda	%o4,	[%l7 + %l1] 0x89
	nop
	set	0x7C, %l5
	ldsw	[%l7 + %l5],	%i7
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f8
	set	0x08, %o0
	stxa	%l4,	[%l7 + %o0] 0x88
	and	%g7,	%g1,	%i2
	nop
	set	0x2F, %i5
	ldstub	[%l7 + %i5],	%g5
	and	%o3,	%o2,	%i3
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x88,	%g4
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x20, %i1
	stx	%l1,	[%l7 + %i1]
	set	0x28, %l0
	stxa	%l2,	[%l7 + %l0] 0x89
	st	%f24,	[%l7 + 0x24]
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x88,	%o1
	set	0x08, %o5
	ldxa	[%l7 + %o5] 0x89,	%o6
	nop
	set	0x28, %i7
	ldstub	[%l7 + %i7],	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%i6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xda
	nop
	set	0x20, %g4
	ldx	[%l7 + %g4],	%g3
	set	0x50, %g6
	ldxa	[%l7 + %g6] 0x88,	%o4
	nop
	set	0x60, %i3
	std	%f22,	[%l7 + %i3]
	add	%o0,	%g2,	%i4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f16
	nop
	set	0x30, %o4
	ldsw	[%l7 + %o4],	%g6
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%f0
	set	0x60, %i2
	ldda	[%l7 + %i2] 0x80,	%l0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%o7
	nop
	set	0x6C, %o3
	ldsw	[%l7 + %o3],	%l6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%o5
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%i7,	%i0,	%g7
	wr	%l4,	%i2,	%y
	nop
	set	0x18, %g1
	std	%f14,	[%l7 + %g1]
	nop
	set	0x08, %l6
	stw	%g1,	[%l7 + %l6]
	nop
	set	0x60, %g5
	stx	%g5,	[%l7 + %g5]
	set	0x5C, %o2
	sta	%f16,	[%l7 + %o2] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x36, %i6
	sth	%i3,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x3C, %l3
	ldsw	[%l7 + %l3],	%g4
	nop
	set	0x56, %l2
	ldsh	[%l7 + %l2],	%l1
	set	0x78, %o6
	stxa	%l2,	[%l7 + %o6] 0x89
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xe2,	%o6
	set	0x68, %l5
	stxa	%l3,	[%l7 + %l5] 0xe2
	membar	#Sync
	and	%i5,	%i6,	%g3
	set	0x7C, %i0
	lda	[%l7 + %i0] 0x81,	%f5
	add	%o4,	%o1,	%o0
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x81,	 1
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%i4
	and	%g6,	%l0,	%l5
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%f22
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xeb,	%i6
	nop
	set	0x38, %l0
	ldx	[%l7 + %l0],	%o7
	nop
	set	0x11, %l4
	stb	%o5,	[%l7 + %l4]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%i7
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	and	%i0,	%l4,	%g7
	set	0x24, %i7
	sta	%f13,	[%l7 + %i7] 0x80
	fpadd32	%f26,	%f14,	%f4
	set	0x20, %i4
	stwa	%g1,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xda
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x88,	 1
	set	0x40, %i3
	stwa	%g5,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x6C, %g4
	sta	%f0,	[%l7 + %g4] 0x89
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f18
	set	0x68, %o4
	stxa	%o3,	[%l7 + %o4] 0x89
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xea,	%i2
	st	%f24,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x68]
	set	0x33, %o3
	stba	%o2,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xea,	%l0
	nop
	set	0x43, %g1
	ldsb	[%l7 + %g1],	%g4
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xca
	wr	%o6,	%l3,	%pic
	and	%i5,	%l2,	%g3
	nop
	set	0x58, %o7
	std	%f10,	[%l7 + %o7]
	nop
	set	0x28, %o2
	stx	%i6,	[%l7 + %o2]
	and	%o1,	%o0,	%g2
	add	%o4,	%g6,	%i4
	fpadd32s	%f9,	%f0,	%f0
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f16
	set	0x57, %l3
	stba	%l5,	[%l7 + %l3] 0xe2
	membar	#Sync
	or	%l6,	%l0,	%o5
	set	0x20, %l2
	swapa	[%l7 + %l2] 0x81,	%o7
	add	%i1,	%i0,	%l4
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x81,	 3
	nop
	set	0x62, %o6
	ldub	[%l7 + %o6],	%g1
	nop
	set	0x30, %l5
	ldub	[%l7 + %l5],	%g7
	nop
	set	0x40, %i0
	swap	[%l7 + %i0],	%i2
	nop
	set	0x68, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x70, %i5
	sta	%f8,	[%l7 + %i5] 0x88
	st	%f13,	[%l7 + 0x18]
	nop
	set	0x5A, %l1
	sth	%g5,	[%l7 + %l1]
	nop
	set	0x48, %g2
	stw	%o3,	[%l7 + %g2]
	nop
	set	0x5C, %l0
	lduw	[%l7 + %l0],	%o2
	set	0x38, %i1
	stda	%i2,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x38, %o5
	lduh	[%l7 + %o5],	%l1
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x89,	 2
	set	0x6C, %i4
	stwa	%g4,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x81,	%l2
	nop
	set	0x30, %i3
	stx	%g3,	[%l7 + %i3]
	nop
	set	0x20, %g4
	ldub	[%l7 + %g4],	%i6
	set	0x38, %g7
	stha	%o1,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x48, %o4
	swapa	[%l7 + %o4] 0x80,	%o0
	nop
	set	0x30, %i2
	std	%f2,	[%l7 + %i2]
	add	%g2,	%l3,	%g6
	set	0x48, %g6
	stxa	%i4,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x28, %o3
	std	%f24,	[%l7 + %o3]
	set	0x50, %o1
	stwa	%l5,	[%l7 + %o1] 0x81
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%o4
	nop
	set	0x64, %l6
	ldsh	[%l7 + %l6],	%l6
	nop
	set	0x49, %o2
	ldstub	[%l7 + %o2],	%l0
	set	0x24, %o7
	sta	%f20,	[%l7 + %o7] 0x88
	set	0x58, %l3
	stwa	%o5,	[%l7 + %l3] 0x80
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f10
	set	0x10, %i6
	stxa	%o7,	[%l7 + %i6] 0x80
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xda,	%f16
	nop
	set	0x10, %l5
	std	%f12,	[%l7 + %l5]
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x52, %o6
	lduh	[%l7 + %o6],	%i1
	nop
	set	0x79, %o0
	ldstub	[%l7 + %o0],	%i7
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x80,	%l4
	set	0x58, %i5
	stxa	%g7,	[%l7 + %i5] 0x80
	set	0x28, %l0
	swapa	[%l7 + %l0] 0x89,	%g1
	nop
	set	0x10, %g2
	std	%f16,	[%l7 + %g2]
	nop
	set	0x30, %i1
	stx	%fsr,	[%l7 + %i1]
	and	%g5,	%i2,	%o3
	nop
	set	0x6C, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x48, %i4
	lda	[%l7 + %i4] 0x88,	%f11
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%o2
	nop
	set	0x38, %o5
	stx	%o6,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x4C]
	or	%g4,	%i5,	%l1
	nop
	set	0x34, %l4
	lduw	[%l7 + %l4],	%l2
	add	%g3,	%i6,	%o0
	be,a,pt	%icc,	loop_57
	nop
	set	0x70, %i3
	lduh	[%l7 + %i3],	%o1
	st	%f7,	[%l7 + 0x58]
	set	0x60, %g3
	stda	%g2,	[%l7 + %g3] 0xeb
	membar	#Sync
loop_57:
	nop
	set	0x26, %g4
	stha	%l3,	[%l7 + %g4] 0x81
	nop
	set	0x0C, %g7
	prefetch	[%l7 + %g7],	 3
	or	%g6,	%i4,	%o4
	set	0x20, %o4
	stwa	%l6,	[%l7 + %o4] 0x81
	set	0x3E, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l5
	set	0x58, %o3
	stwa	%l0,	[%l7 + %o3] 0x89
	set	0x6B, %o1
	ldstuba	[%l7 + %o1] 0x81,	%o7
	ld	[%l7 + 0x70],	%f9
	st	%f0,	[%l7 + 0x34]
	nop
	set	0x24, %g1
	ldsw	[%l7 + %g1],	%o5
	nop
	set	0x26, %l6
	ldsh	[%l7 + %l6],	%i0
	set	0x30, %i2
	stda	%i6,	[%l7 + %i2] 0xeb
	membar	#Sync
	add	%i1,	%l4,	%g7
	set	0x48, %o2
	stwa	%g1,	[%l7 + %o2] 0xea
	membar	#Sync
	ld	[%l7 + 0x08],	%f24
	nop
	set	0x30, %o7
	stx	%fsr,	[%l7 + %o7]
	wr 	%g0, 	0x7, 	%fprs
	set	0x24, %l3
	sta	%f11,	[%l7 + %l3] 0x81
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%o2
	nop
	set	0x26, %l2
	lduh	[%l7 + %l2],	%g4
	or	%l1,	%i5,	%g3
	ld	[%l7 + 0x34],	%f16
	nop
	nop
	setx	0x46D1AD17D6ED5C1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x03BB20402578A8B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f22,	%f28
	nop
	set	0x1C, %g5
	lduh	[%l7 + %g5],	%i6
	nop
	set	0x36, %i6
	ldsh	[%l7 + %i6],	%l2
	fpsub16s	%f17,	%f2,	%f25
	and	%o1,	%o0,	%g2
	nop
	set	0x44, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x48, %l5
	stx	%g6,	[%l7 + %l5]
	and	%l3,	%o4,	%i4
	nop
	set	0x20, %o6
	ldsw	[%l7 + %o6],	%l5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f16
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%l6
	nop
	set	0x60, %i5
	stw	%l0,	[%l7 + %i5]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%o5
	nop
	set	0x7C, %l0
	swap	[%l7 + %l0],	%i7
	bne	%xcc,	loop_58
	add	%i1,	%l4,	%i0
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f4
	nop
	set	0x77, %i7
	ldsb	[%l7 + %i7],	%g7
loop_58:
	nop
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f16
	nop
	set	0x08, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xeb,	%i2
	set	0x0D, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g1
	set	0x50, %g4
	prefetcha	[%l7 + %g4] 0x80,	 3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f0
	nop
	set	0x12, %g7
	sth	%g5,	[%l7 + %g7]
	ld	[%l7 + 0x20],	%f2
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x80,	%o6
	set	0x30, %o3
	stxa	%o2,	[%l7 + %o3] 0x88
	set	0x30, %g6
	stwa	%i3,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x0E, %g1
	stha	%l1,	[%l7 + %g1] 0x88
	st	%fsr,	[%l7 + 0x6C]
	and	%g4,	%i5,	%g3
	nop
	set	0x68, %l6
	swap	[%l7 + %l6],	%i6
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%l2
	nop
	set	0x52, %i2
	sth	%o1,	[%l7 + %i2]
	ld	[%l7 + 0x5C],	%f19
	add	%o0,	%g2,	%l3
	ld	[%l7 + 0x78],	%f16
	nop
	set	0x15, %o7
	ldsb	[%l7 + %o7],	%g6
	nop
	set	0x68, %o2
	stx	%i4,	[%l7 + %o2]
	nop
	set	0x44, %l3
	sth	%l5,	[%l7 + %l3]
	nop
	set	0x34, %l2
	lduh	[%l7 + %l2],	%o4
	set	0x7C, %i6
	lda	[%l7 + %i6] 0x80,	%f24
	nop
	set	0x56, %i0
	sth	%l0,	[%l7 + %i0]
	fpsub16	%f14,	%f6,	%f22
	set	0x18, %l5
	stha	%o7,	[%l7 + %l5] 0x89
	set	0x76, %g5
	stha	%l6,	[%l7 + %g5] 0xe3
	membar	#Sync
	bg,a,pn	%icc,	loop_59
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x54, %l1
	prefetch	[%l7 + %l1],	 3
loop_59:
	st	%f19,	[%l7 + 0x30]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%o5
	ld	[%l7 + 0x24],	%f19
	fpadd16	%f8,	%f10,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%i2
	nop
	set	0x4E, %i5
	ldsh	[%l7 + %i5],	%g1
	nop
	set	0x6E, %o0
	ldub	[%l7 + %o0],	%o3
	nop
	set	0x2E, %g2
	ldub	[%l7 + %g2],	%g5
	set	0x1B, %l0
	ldstuba	[%l7 + %l0] 0x89,	%o6
	nop
	set	0x7E, %i1
	ldsb	[%l7 + %i1],	%i0
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x89,	 3
	bl,pt	%icc,	loop_60
	nop
	set	0x18, %l4
	stx	%l1,	[%l7 + %l4]
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xe3,	%o2
loop_60:
	nop
	set	0x60, %i3
	lduw	[%l7 + %i3],	%g4
	nop
	set	0x70, %g4
	sth	%g3,	[%l7 + %g4]
	set	0x70, %o5
	lda	[%l7 + %o5] 0x89,	%f2
	ld	[%l7 + 0x70],	%f12
	set	0x28, %g3
	prefetcha	[%l7 + %g3] 0x89,	 4
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	set	0x50, %o3
	stxa	%l2,	[%l7 + %o3] 0x88
	bne,a	%icc,	loop_61
	nop
	set	0x18, %g6
	std	%f24,	[%l7 + %g6]
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x89,	%o0
loop_61:
	nop
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%g2
	set	0x2F, %o1
	ldstuba	[%l7 + %o1] 0x81,	%o1
	set	0x34, %i2
	lda	[%l7 + %i2] 0x80,	%f0
	nop
	set	0x39, %o7
	ldub	[%l7 + %o7],	%g6
	nop
	set	0x54, %o2
	swap	[%l7 + %o2],	%i4
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%l4
	or	%l3,	%l0,	%o7
	nop
	set	0x74, %l2
	prefetch	[%l7 + %l2],	 3
	and	%l6,	%o4,	%i7
	set	0x64, %l3
	stha	%l4,	[%l7 + %l3] 0x81
	nop
	set	0x68, %i0
	stw	%i1,	[%l7 + %i0]
	nop
	set	0x2C, %i6
	stw	%g7,	[%l7 + %i6]
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x80,	%i2
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%g1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%g5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%o3
	set	0x10, %o6
	lda	[%l7 + %o6] 0x89,	%f27
	nop
	set	0x58, %i5
	stx	%i0,	[%l7 + %i5]
	add	%i3,	%l1,	%g4
	nop
	set	0x2A, %o0
	ldsb	[%l7 + %o0],	%o2
	nop
	set	0x10, %l1
	std	%f30,	[%l7 + %l1]
	set	0x20, %l0
	stda	%i6,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x68, %i1
	sta	%f21,	[%l7 + %i1] 0x88
	set	0x10, %g2
	stda	%i4,	[%l7 + %g2] 0xe3
	membar	#Sync
	add	%l2,	%o0,	%g3
	set	0x18, %i4
	lda	[%l7 + %i4] 0x89,	%f27
	nop
	set	0x15, %l4
	ldstub	[%l7 + %l4],	%g2
	set	0x2B, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g6
	nop
	set	0x60, %g4
	stx	%o1,	[%l7 + %g4]
	add	%l5,	%l3,	%i4
	fpsub16	%f28,	%f28,	%f16
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x38, %i3
	stb	%o7,	[%l7 + %i3]
	and	%l0,	%o4,	%l6
	set	0x26, %g3
	stha	%l4,	[%l7 + %g3] 0x89
	fpsub16s	%f20,	%f18,	%f29
	set	0x58, %o5
	sta	%f7,	[%l7 + %o5] 0x80
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x24, %g6
	stha	%i1,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x68, %o3
	ldx	[%l7 + %o3],	%g7
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x81,	%i7
	set	0x38, %o1
	stda	%g0,	[%l7 + %o1] 0x88
	nop
	set	0x68, %g1
	std	%f6,	[%l7 + %g1]
	nop
	set	0x12, %i2
	ldsb	[%l7 + %i2],	%o5
	add	%g5,	%o6,	%i2
	wr	%i0,	%o3,	%sys_tick
	set	0x50, %o7
	stxa	%l1,	[%l7 + %o7] 0x89
	fpadd16s	%f27,	%f30,	%f0
	nop
	set	0x20, %o2
	sth	%g4,	[%l7 + %o2]
	and	%i3,	%i6,	%o2
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%l2
	nop
	set	0x2F, %l3
	ldsb	[%l7 + %l3],	%o0
	set	0x14, %l2
	lda	[%l7 + %l2] 0x88,	%f0
	ld	[%l7 + 0x48],	%f23
	add	%g3,	%i5,	%g2
	add	%g6,	%o1,	%l5
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x81,	%i4
	nop
	set	0x10, %i6
	std	%f0,	[%l7 + %i6]
	add	%l3,	%o7,	%l0
	set	0x70, %g5
	stxa	%o4,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x21, %l5
	ldstuba	[%l7 + %l5] 0x88,	%l6
	nop
	set	0x60, %o6
	stw	%l4,	[%l7 + %o6]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc2
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	set	0x0C, %l0
	swapa	[%l7 + %l0] 0x88,	%i1
	add	%g1,	%i7,	%g5
	set	0x11, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o5
	nop
	set	0x42, %i1
	ldsb	[%l7 + %i1],	%o6
	fpadd32s	%f30,	%f12,	%f2
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%i2
	set	0x70, %i4
	ldda	[%l7 + %i4] 0xeb,	%o2
	set	0x08, %i7
	stwa	%l1,	[%l7 + %i7] 0x89
	nop
	set	0x46, %g4
	ldsh	[%l7 + %g4],	%i0
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xe2,	%g4
	bg,a	%xcc,	loop_62
	nop
	set	0x38, %i3
	stx	%i3,	[%l7 + %i3]
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x89,	 4
loop_62:
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%l2
	ld	[%l7 + 0x18],	%f10
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x80,	 4
	nop
	set	0x68, %o3
	stx	%o0,	[%l7 + %o3]
	nop
	set	0x0A, %l6
	lduh	[%l7 + %l6],	%i5
	nop
	set	0x58, %g6
	stw	%g3,	[%l7 + %g6]
	set	0x7E, %g1
	stha	%g2,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x5C, %i2
	lduw	[%l7 + %i2],	%g6
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%l5,	%i4,	%o1
	nop
	set	0x70, %o1
	ldsw	[%l7 + %o1],	%o7
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%l2
	nop
	set	0x19, %g7
	ldstub	[%l7 + %g7],	%l0
	set	0x10, %l2
	stha	%o4,	[%l7 + %l2] 0x88
	nop
	set	0x73, %l3
	ldub	[%l7 + %l3],	%l4
	set	0x2B, %i0
	stba	%g7,	[%l7 + %i0] 0x80
	nop
	set	0x5C, %g5
	ldsh	[%l7 + %g5],	%i1
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x80,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%g1
	nop
	set	0x6C, %o6
	lduh	[%l7 + %o6],	%g5
	nop
	set	0x44, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x28, %l1
	stx	%o6,	[%l7 + %l1]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%i2
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x89,	%o2
	set	0x78, %i5
	sta	%f14,	[%l7 + %i5] 0x89
	nop
	set	0x40, %l0
	std	%f18,	[%l7 + %l0]
	bleu,a	%xcc,	loop_63
	st	%f1,	[%l7 + 0x48]
	set	0x78, %g2
	lda	[%l7 + %g2] 0x80,	%f14
loop_63:
	add	%l1,	%g4,	%i0
	ld	[%l7 + 0x54],	%f25
	ld	[%l7 + 0x30],	%f30
	nop
	set	0x40, %i1
	stx	%i3,	[%l7 + %i1]
	nop
	set	0x5C, %i7
	ldsw	[%l7 + %i7],	%l2
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf9
	membar	#Sync
	set	0x0C, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i6
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x7C, %g3
	prefetch	[%l7 + %g3],	 3
	set	0x58, %o5
	stda	%o2,	[%l7 + %o5] 0x89
	nop
	set	0x52, %i3
	ldsb	[%l7 + %i3],	%i5
	set	0x60, %o4
	stda	%g2,	[%l7 + %o4] 0x81
	set	0x58, %o3
	stda	%o0,	[%l7 + %o3] 0xe2
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%l5
	set	0x68, %g6
	stha	%g2,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x20, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%i4
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f16
	set	0x64, %o7
	swapa	[%l7 + %o7] 0x88,	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%l4
	nop
	set	0x7A, %o2
	sth	%o4,	[%l7 + %o2]
	nop
	set	0x48, %o1
	stw	%i1,	[%l7 + %o1]
	nop
	set	0x20, %l2
	stx	%g7,	[%l7 + %l2]
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%l6
	nop
	set	0x60, %g7
	std	%f6,	[%l7 + %g7]
	set	0x68, %i0
	stwa	%g1,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x88,	%i7
	set	0x48, %o6
	lda	[%l7 + %o6] 0x81,	%f0
	nop
	set	0x40, %i6
	prefetch	[%l7 + %i6],	 3
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%o6
	nop
	set	0x38, %o0
	swap	[%l7 + %o0],	%o5
	nop
	set	0x10, %i5
	ldsb	[%l7 + %i5],	%g5
	nop
	set	0x50, %l5
	swap	[%l7 + %l5],	%o3
	nop
	set	0x18, %l0
	stx	%l1,	[%l7 + %l0]
	nop
	set	0x48, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x08, %g2
	stx	%i2,	[%l7 + %g2]
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf0
	membar	#Sync
	nop
	set	0x78, %g4
	std	%f6,	[%l7 + %g4]
	add	%g4,	%i3,	%l2
	nop
	set	0x41, %l4
	ldub	[%l7 + %l4],	%i6
	fpsub16s	%f20,	%f11,	%f16
	nop
	set	0x40, %g3
	stx	%i0,	[%l7 + %g3]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%o2
	nop
	set	0x1A, %i3
	ldsh	[%l7 + %i3],	%g3
	nop
	set	0x64, %o4
	sth	%o0,	[%l7 + %o4]
	nop
	set	0x64, %o3
	ldsw	[%l7 + %o3],	%l5
	nop
	set	0x40, %o5
	std	%g6,	[%l7 + %o5]
	nop
	set	0x30, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x0C, %g6
	swapa	[%l7 + %g6] 0x80,	%i4
	and	%g2,	%o7,	%l0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%o0
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x58, %o7
	stw	%l3,	[%l7 + %o7]
	and	%o4,	%l4,	%i1
	and	%g7,	%g1,	%l6
	nop
	set	0x60, %o2
	stx	%i7,	[%l7 + %o2]
	set	0x34, %o1
	lda	[%l7 + %o1] 0x88,	%f29
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%o6
	wr	%g5,	%o5,	%pic
	nop
	set	0x68, %l3
	lduh	[%l7 + %l3],	%l1
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f0
	nop
	set	0x64, %g7
	swap	[%l7 + %g7],	%i2
	nop
	set	0x78, %g5
	stx	%g4,	[%l7 + %g5]
	nop
	set	0x18, %o6
	lduw	[%l7 + %o6],	%o3
	set	0x78, %i0
	stxa	%i3,	[%l7 + %i0] 0x81
	and	%l2,	%i0,	%i6
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f10
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd8,	%f16
	nop
	set	0x2E, %i6
	ldsb	[%l7 + %i6],	%o2
	ld	[%l7 + 0x50],	%f7
	set	0x08, %i5
	swapa	[%l7 + %i5] 0x88,	%g3
	set	0x28, %l0
	stwa	%i5,	[%l7 + %l0] 0x89
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%o0
	fpsub16s	%f2,	%f26,	%f5
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	add	%l5,	%i4,	%g2
	nop
	set	0x4A, %i7
	lduh	[%l7 + %i7],	%g6
	nop
	set	0x78, %l5
	sth	%o7,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x08, %g4
	lduw	[%l7 + %g4],	%l0
	set	0x7F, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l3
	nop
	set	0x20, %l4
	std	%o4,	[%l7 + %l4]
	set	0x4C, %g3
	sta	%f27,	[%l7 + %g3] 0x80
	nop
	set	0x14, %o4
	lduw	[%l7 + %o4],	%l4
	nop
	set	0x09, %o3
	stb	%o1,	[%l7 + %o3]
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%i0
	nop
	set	0x4A, %i3
	lduh	[%l7 + %i3],	%g1
	nop
	set	0x4E, %g6
	ldsb	[%l7 + %g6],	%g7
	nop
	set	0x5C, %l6
	stb	%i7,	[%l7 + %l6]
	set	0x50, %o7
	swapa	[%l7 + %o7] 0x89,	%o6
	nop
	set	0x58, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x28, %g1
	sta	%f9,	[%l7 + %g1] 0x88
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x89
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf1
	membar	#Sync
	set	0x44, %l3
	sta	%f4,	[%l7 + %l3] 0x89
	set	0x48, %g7
	stxa	%g5,	[%l7 + %g7] 0x88
	nop
	set	0x69, %i2
	ldstub	[%l7 + %i2],	%o5
	nop
	set	0x58, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x6B, %i0
	ldub	[%l7 + %i0],	%l6
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%l1
	ld	[%l7 + 0x2C],	%f15
	set	0x54, %o0
	lda	[%l7 + %o0] 0x88,	%f9
	nop
	set	0x40, %i6
	stx	%g4,	[%l7 + %i6]
	nop
	set	0x1C, %g5
	swap	[%l7 + %g5],	%i2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%o3
	ld	[%l7 + 0x44],	%f25
	fpadd32s	%f19,	%f5,	%f6
	st	%f13,	[%l7 + 0x34]
	nop
	set	0x40, %l0
	stw	%l2,	[%l7 + %l0]
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%f16
	nop
	set	0x18, %g2
	stx	%fsr,	[%l7 + %g2]
	or	%i6,	%i0,	%g3
	nop
	set	0x70, %i1
	ldx	[%l7 + %i1],	%o2
	add	%o0,	%i5,	%l5
	set	0x08, %i7
	stxa	%i4,	[%l7 + %i7] 0x81
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%o7
	set	0x59, %l5
	stba	%l0,	[%l7 + %l5] 0x81
	set	0x70, %g4
	stxa	%l3,	[%l7 + %g4] 0xe3
	membar	#Sync
	st	%f13,	[%l7 + 0x24]
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x20, %i4
	stx	%fsr,	[%l7 + %i4]
	add	%g2,	%o4,	%l4
	nop
	set	0x48, %l4
	stx	%i1,	[%l7 + %l4]
	nop
	set	0x54, %o4
	prefetch	[%l7 + %o4],	 0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%g7
	nop
	set	0x48, %o3
	lduw	[%l7 + %o3],	%g1
	set	0x30, %g3
	stwa	%i7,	[%l7 + %g3] 0x81
	set	0x4D, %i3
	stba	%o6,	[%l7 + %i3] 0xe2
	membar	#Sync
	and	%g5,	%l6,	%l1
	bl,a,pt	%icc,	loop_64
	or	%o5,	%i2,	%i3
	nop
	set	0x14, %g6
	stw	%o3,	[%l7 + %g6]
	st	%f18,	[%l7 + 0x20]
loop_64:
	nop
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf9
	membar	#Sync
	nop
	set	0x60, %o7
	lduw	[%l7 + %o7],	%g4
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x80,	%i6
	st	%fsr,	[%l7 + 0x40]
	set	0x7C, %g1
	stwa	%l2,	[%l7 + %g1] 0x80
	st	%fsr,	[%l7 + 0x4C]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%i0
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc8
	nop
	set	0x58, %o1
	ldsh	[%l7 + %o1],	%o0
	set	0x54, %l2
	sta	%f20,	[%l7 + %l2] 0x80
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf1
	membar	#Sync
	set	0x28, %g7
	prefetcha	[%l7 + %g7] 0x89,	 3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%l5
	nop
	set	0x58, %o6
	stx	%g6,	[%l7 + %o6]
	nop
	set	0x78, %i2
	std	%i4,	[%l7 + %i2]
	set	0x5E, %l1
	stha	%l0,	[%l7 + %l1] 0x89
	set	0x20, %o0
	stda	%o6,	[%l7 + %o0] 0x89
	set	0x0C, %i0
	sta	%f5,	[%l7 + %i0] 0x80
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%g2
	set	0x70, %i6
	sta	%f14,	[%l7 + %i6] 0x80
	nop
	set	0x14, %l0
	lduw	[%l7 + %l0],	%o4
	set	0x60, %g2
	ldda	[%l7 + %g2] 0xea,	%l4
	set	0x34, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l3
	ble,pn	%xcc,	loop_65
	nop
	set	0x0C, %i1
	swap	[%l7 + %i1],	%i1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%g1
loop_65:
	nop
	set	0x34, %i7
	stha	%i7,	[%l7 + %i7] 0x88
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x81,	%g7
	set	0x0E, %g4
	stha	%o6,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0
	nop
	set	0x38, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x40, %i4
	lda	[%l7 + %i4] 0x80,	%f8
	and	%l1,	%l6,	%i2
	set	0x38, %o3
	stda	%o4,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x7C, %i3
	swap	[%l7 + %i3],	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%i6
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%l2
	set	0x68, %g3
	stda	%g4,	[%l7 + %g3] 0x89
	bn,a	%xcc,	loop_66
	nop
	set	0x70, %o5
	stx	%i0,	[%l7 + %o5]
	set	0x64, %o2
	sta	%f14,	[%l7 + %o2] 0x88
loop_66:
	nop
	set	0x40, %g1
	stxa	%o0,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x60, %l6
	stwa	%i5,	[%l7 + %l6] 0x89
	nop
	set	0x48, %o7
	lduw	[%l7 + %o7],	%o2
	nop
	set	0x3C, %o1
	lduw	[%l7 + %o1],	%g3
	nop
	set	0x4E, %l2
	lduh	[%l7 + %l2],	%g6
	nop
	set	0x40, %l3
	stx	%l5,	[%l7 + %l3]
	add	%i4,	%l0,	%g2
	nop
	set	0x5C, %g7
	ldsh	[%l7 + %g7],	%o7
	nop
	set	0x53, %i2
	ldsb	[%l7 + %i2],	%l4
	bgu,a	%icc,	loop_67
	nop
	set	0x28, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x5E, %o0
	ldsh	[%l7 + %o0],	%l3
	nop
	set	0x32, %i0
	ldsh	[%l7 + %i0],	%o4
loop_67:
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x0E, %g5
	ldstub	[%l7 + %g5],	%o1
	add	%g1,	%i1,	%g7
	wr	%o6,	%i7,	%y
	st	%fsr,	[%l7 + 0x18]
	bgu,a	%xcc,	loop_68
	ld	[%l7 + 0x30],	%f13
	nop
	set	0x68, %o6
	std	%l0,	[%l7 + %o6]
	st	%fsr,	[%l7 + 0x40]
loop_68:
	fpadd16	%f20,	%f30,	%f18
	and	%l6,	%g5,	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%i3
	nop
	set	0x58, %l0
	lduh	[%l7 + %l0],	%i6
	nop
	set	0x78, %g2
	std	%f6,	[%l7 + %g2]
	set	0x28, %i6
	stxa	%i2,	[%l7 + %i6] 0x80
	nop
	set	0x38, %i5
	stw	%l2,	[%l7 + %i5]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f16
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%i0
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x81,	 2
	nop
	set	0x38, %i7
	std	%f18,	[%l7 + %i7]
	or	%o0,	%o2,	%i5
	nop
	set	0x0C, %l4
	ldstub	[%l7 + %l4],	%g3
	set	0x58, %i4
	stxa	%l5,	[%l7 + %i4] 0x88
	bleu,pn	%xcc,	loop_69
	nop
	set	0x18, %o3
	std	%g6,	[%l7 + %o3]
	set	0x10, %i3
	stwa	%i4,	[%l7 + %i3] 0x89
loop_69:
	fpadd16s	%f12,	%f21,	%f11
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%l0
	nop
	set	0x3E, %g6
	sth	%g2,	[%l7 + %g6]
	set	0x08, %o5
	stxa	%o7,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x08, %g3
	swapa	[%l7 + %g3] 0x81,	%l4
	nop
	set	0x53, %g1
	stb	%o4,	[%l7 + %g1]
	nop
	set	0x78, %l6
	ldsw	[%l7 + %l6],	%l3
	nop
	set	0x4A, %o7
	sth	%g1,	[%l7 + %o7]
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x80,	%i1
	nop
	set	0x78, %l2
	swap	[%l7 + %l2],	%o1
	add	%g7,	%o6,	%i7
	nop
	set	0x4F, %l3
	ldub	[%l7 + %l3],	%l1
	nop
	set	0x2E, %o1
	ldsb	[%l7 + %o1],	%g5
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xca
	st	%f24,	[%l7 + 0x50]
	and	%l6,	%o5,	%o3
	set	0x30, %g7
	sta	%f6,	[%l7 + %g7] 0x81
	and	%i6,	%i3,	%l2
	ld	[%l7 + 0x08],	%f27
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x30, %i0
	ldsw	[%l7 + %i0],	%i2
	set	0x7B, %o0
	ldstuba	[%l7 + %o0] 0x88,	%g4
	set	0x78, %g5
	stda	%o0,	[%l7 + %g5] 0x81
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x2E, %l0
	ldub	[%l7 + %l0],	%i0
	set	0x6E, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i5
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf8
	membar	#Sync
	nop
	set	0x18, %i1
	ldx	[%l7 + %i1],	%g3
	set	0x08, %l5
	lda	[%l7 + %l5] 0x88,	%f9
	nop
	set	0x18, %g4
	stx	%fsr,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x78]
	fpadd32s	%f2,	%f10,	%f15
	st	%f12,	[%l7 + 0x6C]
	fpsub32s	%f28,	%f1,	%f16
	nop
	set	0x10, %i6
	std	%o2,	[%l7 + %i6]
	nop
	set	0x68, %l4
	ldstub	[%l7 + %l4],	%g6
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%i4
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd0
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x89,	%l5
	nop
	set	0x36, %i3
	lduh	[%l7 + %i3],	%l0
	fpadd32s	%f27,	%f28,	%f25
	nop
	set	0x78, %o4
	ldsb	[%l7 + %o4],	%g2
	or	%l4,	%o7,	%o4
	and	%g1,	%l3,	%o1
	add	%g7,	%i1,	%i7
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%l1
	nop
	set	0x5C, %g3
	lduh	[%l7 + %g3],	%o6
	nop
	set	0x7D, %g1
	stb	%l6,	[%l7 + %g1]
	nop
	set	0x2C, %l6
	sth	%g5,	[%l7 + %l6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%o5
	set	0x38, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0
	set	0x60, %o2
	stda	%i6,	[%l7 + %o2] 0xe3
	membar	#Sync
	ld	[%l7 + 0x4C],	%f18
	nop
	set	0x2C, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x20, %l2
	stx	%i2,	[%l7 + %l2]
	nop
	set	0x78, %o1
	std	%l2,	[%l7 + %o1]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%i0
	nop
	set	0x36, %l3
	ldub	[%l7 + %l3],	%i5
	nop
	set	0x3C, %i2
	sth	%g4,	[%l7 + %i2]
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x80,	 3
	set	0x66, %i0
	stba	%o2,	[%l7 + %i0] 0x88
	nop
	set	0x10, %l1
	lduw	[%l7 + %l1],	%g6
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%i4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x89,	 0
	nop
	set	0x08, %g2
	ldsb	[%l7 + %g2],	%l0
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x80,	%g2
	set	0x30, %i5
	stxa	%l4,	[%l7 + %i5] 0x89
	st	%fsr,	[%l7 + 0x6C]
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x80,	 1
	nop
	set	0x08, %i1
	stx	%o7,	[%l7 + %i1]
	st	%f15,	[%l7 + 0x38]
	nop
	set	0x0E, %i6
	ldstub	[%l7 + %i6],	%g1
	set	0x38, %g4
	sta	%f25,	[%l7 + %g4] 0x81
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xc4
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x88
	fpsub16s	%f12,	%f29,	%f28
	nop
	set	0x50, %o3
	std	%o0,	[%l7 + %o3]
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x80,	 3
	st	%f11,	[%l7 + 0x0C]
	nop
	set	0x60, %o4
	sth	%l3,	[%l7 + %o4]
	ld	[%l7 + 0x64],	%f12
	fpadd32	%f26,	%f18,	%f6
	set	0x10, %i3
	ldxa	[%l7 + %i3] 0x81,	%i1
	nop
	set	0x22, %g6
	ldsh	[%l7 + %g6],	%i7
	nop
	set	0x46, %g1
	ldsh	[%l7 + %g1],	%o6
	nop
	set	0x4C, %g3
	ldub	[%l7 + %g3],	%l6
	fpsub16	%f4,	%f8,	%f0
	nop
	set	0x30, %l6
	ldsw	[%l7 + %l6],	%g5
	nop
	set	0x40, %o2
	ldsw	[%l7 + %o2],	%l1
	set	0x20, %o7
	ldda	[%l7 + %o7] 0x88,	%o4
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%o2
	nop
	set	0x20, %l2
	sth	%i6,	[%l7 + %l2]
	nop
	set	0x18, %o1
	stx	%i2,	[%l7 + %o1]
	ld	[%l7 + 0x44],	%f5
	add	%l2,	%o0,	%i3
	set	0x40, %l3
	ldstuba	[%l7 + %l3] 0x80,	%i0
	nop
	set	0x38, %i2
	lduw	[%l7 + %i2],	%g4
	nop
	set	0x74, %g7
	lduw	[%l7 + %g7],	%i5
	or	%o2,	%g3,	%g6
	set	0x38, %i0
	stha	%i4,	[%l7 + %i0] 0x80
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xea,	%l4
	set	0x30, %l1
	sta	%f5,	[%l7 + %l1] 0x81
	set	0x70, %l0
	stda	%g2,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x64, %g2
	stwa	%l4,	[%l7 + %g2] 0x89
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%o1
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%f10
	ld	[%l7 + 0x6C],	%f11
	set	0x5C, %i5
	stha	%g7,	[%l7 + %i5] 0x88
	nop
	set	0x3E, %o6
	ldub	[%l7 + %o6],	%l3
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f16
	set	0x28, %l5
	stda	%g0,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x10, %g4
	stxa	%i1,	[%l7 + %g4] 0x81
	and	%o6,	%l6,	%i7
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x50, %l4
	ldsh	[%l7 + %l4],	%l1
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x81
	set	0x16, %i6
	stba	%o5,	[%l7 + %i6] 0x89
	nop
	set	0x7E, %o3
	lduh	[%l7 + %o3],	%o3
	ld	[%l7 + 0x68],	%f11
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x89,	%i6
	set	0x39, %i3
	stba	%g5,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x5E, %g6
	sth	%l2,	[%l7 + %g6]
	nop
	set	0x68, %g1
	std	%i2,	[%l7 + %g1]
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	nop
	set	0x78, %l6
	stw	%i3,	[%l7 + %l6]
	nop
	set	0x40, %g3
	std	%f30,	[%l7 + %g3]
	set	0x70, %o7
	ldda	[%l7 + %o7] 0x80,	%i0
	st	%f22,	[%l7 + 0x1C]
	set	0x28, %o5
	lda	[%l7 + %o5] 0x80,	%f1
	nop
	set	0x08, %l2
	std	%f16,	[%l7 + %l2]
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%g4
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f8
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%i5
	nop
	set	0x64, %g7
	ldsw	[%l7 + %g7],	%o2
	nop
	set	0x18, %i0
	stx	%g6,	[%l7 + %i0]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%l5
	set	0x40, %i2
	ldxa	[%l7 + %i2] 0x89,	%g3
	ld	[%l7 + 0x54],	%f0
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd0
	nop
	set	0x50, %l0
	sth	%l4,	[%l7 + %l0]
	nop
	set	0x78, %l1
	ldsb	[%l7 + %l1],	%g2
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x81,	 4
	nop
	set	0x08, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f16
	nop
	set	0x70, %o6
	ldsw	[%l7 + %o6],	%o7
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f0
	nop
	set	0x10, %i1
	ldsh	[%l7 + %i1],	%o1
	set	0x7D, %l4
	ldstuba	[%l7 + %l4] 0x88,	%g7
	set	0x54, %g4
	stwa	%l0,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x2B, %i6
	ldstub	[%l7 + %i6],	%l3
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x80
	nop
	set	0x28, %o4
	ldsw	[%l7 + %o4],	%i1
	nop
	set	0x2C, %o3
	swap	[%l7 + %o3],	%g1
	nop
	set	0x28, %i3
	ldub	[%l7 + %i3],	%o6
	nop
	set	0x78, %g1
	ldsw	[%l7 + %g1],	%i7
	set	0x24, %g6
	swapa	[%l7 + %g6] 0x81,	%l1
	st	%f19,	[%l7 + 0x0C]
	set	0x28, %i4
	ldxa	[%l7 + %i4] 0x80,	%o5
	set	0x60, %g3
	stxa	%o3,	[%l7 + %g3] 0x81
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x88,	%i6
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%i6
	nop
	set	0x18, %o5
	lduh	[%l7 + %o5],	%l2
	set	0x40, %o7
	sta	%f27,	[%l7 + %o7] 0x80
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f30
	nop
	set	0x60, %o1
	std	%f30,	[%l7 + %o1]
	nop
	set	0x28, %o2
	ldsw	[%l7 + %o2],	%i2
	bge,a	%icc,	loop_70
	nop
	set	0x68, %l3
	swap	[%l7 + %l3],	%o0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x81
loop_70:
	nop
	set	0x2A, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i0
	nop
	set	0x20, %g7
	ldsh	[%l7 + %g7],	%i3
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%g4
	nop
	set	0x38, %g5
	std	%f30,	[%l7 + %g5]
	nop
	set	0x58, %l1
	std	%o2,	[%l7 + %l1]
	set	0x18, %i5
	stxa	%g6,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x70, %g2
	stw	%i4,	[%l7 + %g2]
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x80,	 3
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%g3,	%l4,	%l5
	set	0x0E, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g2
	nop
	nop
	setx	0xFEDD6AE0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xFF306B79,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f30,	%f23
	nop
	set	0x48, %l4
	stx	%o7,	[%l7 + %l4]
	nop
	set	0x1C, %o0
	ldsw	[%l7 + %o0],	%o4
	set	0x0C, %g4
	sta	%f30,	[%l7 + %g4] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%l0
	nop
	set	0x78, %i7
	ldsw	[%l7 + %i7],	%o1
	and	%l3,	%g1,	%o6
	nop
	set	0x68, %i6
	std	%f2,	[%l7 + %i6]
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	and	%i7,	%l1,	%o5
	set	0x20, %i3
	stwa	%o3,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x17, %o3
	ldstub	[%l7 + %o3],	%l6
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x81
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%g4
	add	%i1,	%l2,	%i6
	set	0x58, %g3
	lda	[%l7 + %g3] 0x88,	%f26
	nop
	set	0x40, %l6
	prefetch	[%l7 + %l6],	 3
	fpsub32s	%f31,	%f8,	%f22
	set	0x37, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%i0
	nop
	set	0x60, %l2
	std	%f2,	[%l7 + %l2]
	nop
	set	0x48, %o1
	stx	%g4,	[%l7 + %o1]
	nop
	set	0x68, %i4
	ldsw	[%l7 + %i4],	%g6
	nop
	set	0x14, %o2
	ldsw	[%l7 + %o2],	%i4
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%o2
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%f6
	nop
	set	0x40, %g7
	ldx	[%l7 + %g7],	%i5
	nop
	set	0x5E, %l0
	ldstub	[%l7 + %l0],	%g3
	nop
	set	0x78, %g5
	std	%f20,	[%l7 + %g5]
	nop
	set	0x24, %l1
	ldstub	[%l7 + %l1],	%l5
	set	0x78, %l3
	prefetcha	[%l7 + %l3] 0x80,	 3
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%l4
	ld	[%l7 + 0x68],	%f20
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc2
	add	%o7,	%o4,	%g7
	set	0x4A, %l5
	stha	%o1,	[%l7 + %l5] 0x81
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f16
	ld	[%l7 + 0x58],	%f14
	nop
	set	0x2E, %i1
	ldsb	[%l7 + %i1],	%l0
	nop
	set	0x72, %l4
	lduh	[%l7 + %l4],	%g1
	or	%l3,	%i7,	%o6
	fpsub16s	%f11,	%f10,	%f28
	nop
	set	0x60, %g4
	swap	[%l7 + %g4],	%l1
	or	%o3,	%o5,	%l6
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%i1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f16
	or	%g5,	%l2,	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%i3
	fpadd32s	%f11,	%f15,	%f18
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xea,	%o0
	set	0x74, %i6
	sta	%f6,	[%l7 + %i6] 0x89
	nop
	set	0x13, %i3
	stb	%i0,	[%l7 + %i3]
	nop
	set	0x5C, %o3
	stw	%g6,	[%l7 + %o3]
	nop
	set	0x12, %g6
	sth	%g4,	[%l7 + %g6]
	nop
	set	0x68, %g1
	stw	%i4,	[%l7 + %g1]
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	set	0x60, %o5
	stha	%l5,	[%l7 + %o5] 0x88
	nop
	set	0x64, %l2
	lduw	[%l7 + %l2],	%g2
	nop
	set	0x60, %o7
	swap	[%l7 + %o7],	%l4
	set	0x10, %i4
	prefetcha	[%l7 + %i4] 0x88,	 1
	set	0x76, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g3
	fpadd32s	%f1,	%f1,	%f22
	st	%fsr,	[%l7 + 0x1C]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%g7
	st	%f22,	[%l7 + 0x44]
	fpsub32s	%f17,	%f4,	%f10
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%f16
	nop
	set	0x70, %i0
	swap	[%l7 + %i0],	%o1
	nop
	set	0x58, %i2
	lduw	[%l7 + %i2],	%l0
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x80,	%g0
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x88
	nop
	set	0x57, %g5
	stb	%i7,	[%l7 + %g5]
	nop
	set	0x10, %l3
	lduh	[%l7 + %l3],	%l3
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%o6
	set	0x3C, %i5
	stha	%l1,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x81,	%o3
	nop
	set	0x56, %o6
	sth	%o5,	[%l7 + %o6]
	set	0x48, %g2
	stxa	%l6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x54, %l4
	stw	%g5,	[%l7 + %l4]
	nop
	set	0x10, %g4
	ldx	[%l7 + %g4],	%l2
	wr	%i2,	%i1,	%softint
	st	%fsr,	[%l7 + 0x08]
	set	0x60, %i1
	stda	%i6,	[%l7 + %i1] 0x80
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xeb,	%o0
	nop
	set	0x70, %o4
	ldsh	[%l7 + %o4],	%i0
	set	0x70, %i7
	stxa	%g6,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x40, %i3
	sth	%g4,	[%l7 + %i3]
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xea,	%i2
	set	0x30, %g6
	ldxa	[%l7 + %g6] 0x88,	%i4
	nop
	set	0x30, %o3
	ldsw	[%l7 + %o3],	%i5
	set	0x20, %g1
	stwa	%o2,	[%l7 + %g1] 0x88
	or	%l5,	%g2,	%l4
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f12
	fpadd32	%f20,	%f20,	%f8
	nop
	set	0x08, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x10, %l2
	std	%f30,	[%l7 + %l2]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%o4
	nop
	set	0x66, %g3
	ldsh	[%l7 + %g3],	%g3
	nop
	set	0x78, %i4
	std	%f12,	[%l7 + %i4]
	set	0x5E, %o7
	stha	%o1,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x5F, %o1
	stb	%l0,	[%l7 + %o1]
	nop
	set	0x50, %o2
	swap	[%l7 + %o2],	%g7
	nop
	set	0x40, %i2
	std	%f6,	[%l7 + %i2]
	nop
	set	0x60, %i0
	ldx	[%l7 + %i0],	%g1
	set	0x10, %g7
	stha	%l3,	[%l7 + %g7] 0x81
	set	0x10, %g5
	stxa	%o6,	[%l7 + %g5] 0x80
	set	0x6C, %l0
	stha	%l1,	[%l7 + %l0] 0x88
	set	0x50, %l3
	ldda	[%l7 + %l3] 0xea,	%i6
	set	0x4C, %i5
	stba	%o3,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x30, %l1
	stxa	%o5,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x30, %l5
	std	%i6,	[%l7 + %l5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%i2
	wr	%i1,	%g5,	%y
	nop
	set	0x53, %o6
	ldstub	[%l7 + %o6],	%o0
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f14
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f0
	set	0x38, %i1
	stda	%i0,	[%l7 + %i1] 0x89
	nop
	set	0x1C, %g4
	lduw	[%l7 + %g4],	%g6
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x80,	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%i4
	nop
	set	0x34, %i7
	swap	[%l7 + %i7],	%o2
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%g2
	set	0x6F, %i3
	ldstuba	[%l7 + %i3] 0x81,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%o4
	nop
	set	0x60, %i6
	std	%f0,	[%l7 + %i6]
	nop
	set	0x58, %g6
	std	%o6,	[%l7 + %g6]
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf0
	membar	#Sync
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f10
	st	%f2,	[%l7 + 0x34]
	nop
	set	0x7E, %l6
	ldsh	[%l7 + %l6],	%o1
	set	0x18, %l2
	stwa	%g3,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x60, %o5
	std	%f20,	[%l7 + %o5]
	nop
	set	0x38, %g3
	ldsw	[%l7 + %g3],	%g7
	nop
	set	0x60, %i4
	ldsh	[%l7 + %i4],	%g1
	set	0x10, %o7
	ldxa	[%l7 + %o7] 0x80,	%l0
	set	0x6C, %o2
	lda	[%l7 + %o2] 0x81,	%f2
	nop
	set	0x62, %o1
	lduh	[%l7 + %o1],	%l3
	nop
	set	0x26, %i0
	ldsh	[%l7 + %i0],	%l1
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x88,	 2
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x80,	 4
	and	%o3,	%l6,	%l2
	set	0x50, %g5
	stda	%o4,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f28
	set	0x2C, %i5
	sta	%f23,	[%l7 + %i5] 0x89
	set	0x6C, %l1
	sta	%f19,	[%l7 + %l1] 0x89
	add	%i2,	%g5,	%o0
	st	%f15,	[%l7 + 0x6C]
	nop
	set	0x44, %l5
	ldsw	[%l7 + %l5],	%i0
	nop
	set	0x50, %o6
	prefetch	[%l7 + %o6],	 4
	add	%g6,	%g4,	%i3
	set	0x1B, %l3
	stba	%i6,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x20, %l4
	std	%f4,	[%l7 + %l4]
	nop
	set	0x70, %g2
	stw	%i1,	[%l7 + %g2]
	nop
	set	0x7E, %i1
	lduh	[%l7 + %i1],	%i5
	and	%o2,	%g2,	%i4
	nop
	set	0x6C, %o0
	stw	%l4,	[%l7 + %o0]
	nop
	set	0x76, %g4
	sth	%o4,	[%l7 + %g4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%l5
	nop
	set	0x09, %i7
	ldsb	[%l7 + %i7],	%o1
	set	0x7A, %o4
	stba	%g7,	[%l7 + %o4] 0x88
	bleu,a,pn	%icc,	loop_71
	bl	%xcc,	loop_72
	and	%g1,	%l0,	%l3
	nop
	set	0x74, %i6
	ldsh	[%l7 + %i6],	%g3
loop_71:
	and	%i7,	%o6,	%o3
loop_72:
	nop
	set	0x70, %i3
	stxa	%l6,	[%l7 + %i3] 0x88
	fpadd16s	%f10,	%f1,	%f21
	nop
	set	0x30, %g6
	std	%l2,	[%l7 + %g6]
	nop
	set	0x30, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x32, %g1
	sth	%l1,	[%l7 + %g1]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xd2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%o5
	set	0x74, %l2
	sta	%f30,	[%l7 + %l2] 0x80
	and	%g5,	%i0,	%g6
	add	%o0,	%g4,	%i6
	set	0x40, %o5
	sta	%f2,	[%l7 + %o5] 0x89
	nop
	set	0x67, %i4
	stb	%i3,	[%l7 + %i4]
	set	0x2C, %o7
	sta	%f5,	[%l7 + %o7] 0x88
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x89,	%i1
	nop
	set	0x2C, %g3
	ldsh	[%l7 + %g3],	%i5
	nop
	set	0x49, %i0
	ldstub	[%l7 + %i0],	%o2
	and	%i4,	%l4,	%g2
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%o6
	nop
	set	0x4B, %i2
	ldsb	[%l7 + %i2],	%o4
	st	%f17,	[%l7 + 0x68]
	st	%f18,	[%l7 + 0x30]
	fpadd16	%f0,	%f20,	%f8
	nop
	set	0x60, %o1
	prefetch	[%l7 + %o1],	 1
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf1
	membar	#Sync
	set	0x4C, %l0
	sta	%f8,	[%l7 + %l0] 0x81
	set	0x58, %l1
	stha	%o1,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x60, %i5
	std	%f4,	[%l7 + %i5]
	set	0x50, %o6
	stxa	%l5,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x54, %l3
	stw	%g1,	[%l7 + %l3]
	ld	[%l7 + 0x0C],	%f28
	nop
	set	0x50, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x30, %l4
	ldsw	[%l7 + %l4],	%g7
	nop
	set	0x46, %g2
	stb	%l3,	[%l7 + %g2]
	nop
	set	0x28, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x54, %g4
	stwa	%l0,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f28
	nop
	set	0x18, %i7
	std	%f20,	[%l7 + %i7]
	or	%i7,	%g3,	%o6
	nop
	set	0x24, %i6
	ldsw	[%l7 + %i6],	%o3
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x88,	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%l6
	nop
	set	0x10, %g6
	stx	%i2,	[%l7 + %g6]
	nop
	set	0x6C, %o4
	swap	[%l7 + %o4],	%o5
	set	0x6C, %o3
	lda	[%l7 + %o3] 0x89,	%f10
	ld	[%l7 + 0x44],	%f15
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%g5
	set	0x6C, %l2
	stba	%i0,	[%l7 + %l2] 0x80
	fpadd16	%f4,	%f0,	%f24
	wr	%g6,	%g4,	%set_softint
	nop
	set	0x58, %o5
	lduh	[%l7 + %o5],	%i6
	nop
	set	0x72, %i4
	sth	%o0,	[%l7 + %i4]
	nop
	set	0x58, %o7
	std	%f2,	[%l7 + %o7]
	set	0x0A, %g1
	ldstuba	[%l7 + %g1] 0x81,	%i1
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x18, %g3
	stb	%i5,	[%l7 + %g3]
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f16
	wr	%i3,	%i4,	%clear_softint
	bn	%icc,	loop_73
	nop
	set	0x30, %i0
	lduh	[%l7 + %i0],	%l4
	set	0x1C, %o1
	stwa	%g2,	[%l7 + %o1] 0x81
loop_73:
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%o2
	set	0x18, %l0
	lda	[%l7 + %l0] 0x88,	%f2
	or	%o7,	%o4,	%l5
	set	0x20, %l1
	stxa	%o1,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x54, %i5
	lda	[%l7 + %i5] 0x89,	%f11
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%l3
	fpsub32	%f4,	%f26,	%f18
	and	%g1,	%i7,	%l0
	nop
	set	0x58, %o6
	lduh	[%l7 + %o6],	%o6
	st	%f6,	[%l7 + 0x3C]
	nop
	set	0x0C, %l3
	prefetch	[%l7 + %l3],	 1
	or	%o3,	%g3,	%l2
	set	0x2A, %i2
	stba	%l1,	[%l7 + %i2] 0x89
	set	0x58, %l4
	stxa	%l6,	[%l7 + %l4] 0x88
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x88,	%i2
	set	0x1D, %i1
	stba	%o5,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x3C, %g2
	stwa	%g5,	[%l7 + %g2] 0x89
	ld	[%l7 + 0x78],	%f29
	set	0x7C, %o0
	swapa	[%l7 + %o0] 0x80,	%i0
	set	0x58, %g4
	swapa	[%l7 + %g4] 0x88,	%g4
	nop
	set	0x68, %i6
	lduw	[%l7 + %i6],	%g6
	set	0x70, %i3
	swapa	[%l7 + %i3] 0x80,	%o0
	nop
	set	0x75, %i7
	ldub	[%l7 + %i7],	%i6
	set	0x20, %g6
	ldda	[%l7 + %g6] 0x80,	%i0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xcc
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f0
	st	%f29,	[%l7 + 0x54]
	nop
	set	0x3E, %l2
	ldstub	[%l7 + %l2],	%i3
	nop
	set	0x7C, %l6
	lduh	[%l7 + %l6],	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%g2
	set	0x16, %o5
	stha	%o2,	[%l7 + %o5] 0x81
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%i4
	nop
	set	0x54, %g1
	ldsw	[%l7 + %g1],	%o7
	nop
	set	0x44, %i4
	ldsb	[%l7 + %i4],	%l5
	or	%o4,	%o1,	%l3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%g0
	set	0x38, %g7
	swapa	[%l7 + %g7] 0x89,	%g7
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	and	%l0,	%o6,	%o3
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x89,	 1
	nop
	set	0x4C, %g5
	lduw	[%l7 + %g5],	%l2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%l6
	set	0x69, %o2
	ldstuba	[%l7 + %o2] 0x80,	%i7
	set	0x1F, %l1
	stba	%o5,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x7C, %l0
	ldsb	[%l7 + %l0],	%g5
	set	0x28, %o6
	sta	%f4,	[%l7 + %o6] 0x81
	ld	[%l7 + 0x14],	%f15
	nop
	set	0x38, %l3
	std	%i2,	[%l7 + %l3]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%i0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%o0
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x38, %i2
	std	%i0,	[%l7 + %i2]
	bne,a,pt	%xcc,	loop_74
	nop
	set	0x6C, %i5
	stw	%i3,	[%l7 + %i5]
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x88,	%i4
loop_74:
	nop
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x80,	%l4
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%g2
	nop
	set	0x40, %o0
	lduw	[%l7 + %o0],	%i6
	set	0x48, %g2
	stda	%o2,	[%l7 + %g2] 0xeb
	membar	#Sync
	or	%i5,	%o7,	%o4
	set	0x44, %i6
	lda	[%l7 + %i6] 0x88,	%f0
	add	%o1,	%l3,	%g1
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x80
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%l5
	set	0x44, %g6
	swapa	[%l7 + %g6] 0x88,	%g7
	nop
	set	0x12, %i3
	sth	%o6,	[%l7 + %i3]
	nop
	set	0x28, %o3
	ldstub	[%l7 + %o3],	%l0
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x14, %l2
	lduw	[%l7 + %l2],	%g3
	nop
	set	0x3E, %l6
	ldsb	[%l7 + %l6],	%l2
	set	0x25, %o4
	stba	%o3,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x4B, %o5
	stba	%l1,	[%l7 + %o5] 0x88
	set	0x60, %g1
	stxa	%l6,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x58, %o7
	ldsw	[%l7 + %o7],	%o5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%i7
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%f6
	set	0x18, %i4
	stda	%i2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x7F, %i0
	ldstuba	[%l7 + %i0] 0x81,	%i0
	nop
	set	0x23, %g7
	ldsb	[%l7 + %g7],	%g6
	nop
	set	0x2C, %g5
	ldsh	[%l7 + %g5],	%g4
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f16
	nop
	set	0x10, %l1
	stw	%i1,	[%l7 + %l1]
	nop
	set	0x1E, %l0
	stb	%i3,	[%l7 + %l0]
	nop
	set	0x1C, %o2
	sth	%i4,	[%l7 + %o2]
	or	%o0,	%l4,	%i6
	nop
	set	0x08, %l3
	stb	%o2,	[%l7 + %l3]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f16
	st	%fsr,	[%l7 + 0x20]
	set	0x14, %i2
	lda	[%l7 + %i2] 0x88,	%f5
	nop
	set	0x78, %i5
	stw	%g2,	[%l7 + %i5]
	or	%o7,	%o4,	%o1
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f24
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i5
	ld	[%l7 + 0x58],	%f11
	nop
	set	0x58, %i1
	std	%l4,	[%l7 + %i1]
	nop
	set	0x7D, %l5
	ldstub	[%l7 + %l5],	%g7
	add	%o6,	%g1,	%l0
	or	%l2,	%o3,	%g3
	be	%icc,	loop_75
	nop
	set	0x28, %o0
	ldsb	[%l7 + %o0],	%l6
	nop
	set	0x70, %g2
	lduw	[%l7 + %g2],	%l1
	st	%fsr,	[%l7 + 0x2C]
loop_75:
	nop
	set	0x60, %g4
	std	%f4,	[%l7 + %g4]
	nop
	set	0x52, %i7
	ldub	[%l7 + %i7],	%g5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%i7
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd0
	nop
	set	0x20, %g6
	stx	%i0,	[%l7 + %g6]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf0
	membar	#Sync
	nop
	set	0x74, %i3
	lduh	[%l7 + %i3],	%g6
	nop
	set	0x78, %l2
	ldub	[%l7 + %l2],	%i2
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%g4
	nop
	set	0x46, %l6
	sth	%i3,	[%l7 + %l6]
	nop
	set	0x59, %o5
	ldsb	[%l7 + %o5],	%i4
	or	%o0,	%i1,	%l4
	ld	[%l7 + 0x60],	%f8
	wr	%i6,	%g2,	%pic
	nop
	set	0x65, %g1
	stb	%o2,	[%l7 + %g1]
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x89,	%o7
	nop
	set	0x18, %i4
	std	%f28,	[%l7 + %i4]
	ld	[%l7 + 0x5C],	%f31
	and	%o1,	%l3,	%i5
	nop
	set	0x24, %o7
	ldsw	[%l7 + %o7],	%o4
	set	0x30, %g7
	lda	[%l7 + %g7] 0x89,	%f29
	nop
	set	0x24, %i0
	lduh	[%l7 + %i0],	%g7
	and	%l5,	%g1,	%l0
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x80,	%l2
	fpadd16s	%f21,	%f21,	%f26
	nop
	set	0x34, %o1
	ldsw	[%l7 + %o1],	%o3
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%o6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%i6
	ld	[%l7 + 0x3C],	%f31
	nop
	set	0x4C, %l1
	swap	[%l7 + %l1],	%g3
	or	%l1,	%o5,	%g5
	set	0x10, %o6
	stwa	%i0,	[%l7 + %o6] 0xe3
	membar	#Sync
	fpadd16	%f16,	%f10,	%f4
	nop
	set	0x18, %l3
	std	%i6,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x68]
	and	%g6,	%g4,	%i3
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	add	%i2,	%i4,	%o0
	set	0x18, %l4
	ldxa	[%l7 + %l4] 0x80,	%i1
	ld	[%l7 + 0x24],	%f30
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%l4
	nop
	set	0x10, %i1
	std	%g2,	[%l7 + %i1]
	set	0x7E, %l5
	ldstuba	[%l7 + %l5] 0x89,	%o2
	nop
	set	0x52, %g2
	sth	%o7,	[%l7 + %g2]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%l3
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f20
	set	0x50, %i7
	prefetcha	[%l7 + %i7] 0x81,	 3
	nop
	set	0x64, %o0
	lduw	[%l7 + %o0],	%i5
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf0
	membar	#Sync
	st	%f5,	[%l7 + 0x3C]
	set	0x69, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o4
	set	0x78, %i3
	sta	%f28,	[%l7 + %i3] 0x80
	nop
	set	0x68, %l2
	std	%l4,	[%l7 + %l2]
	set	0x78, %o3
	stxa	%g1,	[%l7 + %o3] 0x89
	nop
	set	0x74, %o4
	stw	%g7,	[%l7 + %o4]
	nop
	set	0x4E, %o5
	ldub	[%l7 + %o5],	%l0
	add	%l2,	%o3,	%l6
	nop
	set	0x08, %g1
	std	%g2,	[%l7 + %g1]
	and	%o6,	%l1,	%o5
	fpadd32s	%f22,	%f1,	%f20
	nop
	nop
	setx	0xC1415556,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x654F81E6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f3,	%f19
	set	0x40, %l6
	sta	%f23,	[%l7 + %l6] 0x88
	ld	[%l7 + 0x14],	%f27
	st	%fsr,	[%l7 + 0x54]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%i7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAF4, 	%sys_tick_cmpr
	st	%f7,	[%l7 + 0x2C]
	nop
	set	0x70, %i4
	std	%i2,	[%l7 + %i4]
	ld	[%l7 + 0x44],	%f3
	nop
	set	0x54, %o7
	ldsh	[%l7 + %o7],	%g6
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x40, %i0
	stxa	%i2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%f26
	nop
	set	0x10, %o1
	std	%o0,	[%l7 + %o1]
	nop
	set	0x62, %l0
	ldsh	[%l7 + %l0],	%i4
	nop
	set	0x08, %g3
	std	%f28,	[%l7 + %g3]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x80
	nop
	set	0x18, %o2
	stw	%l4,	[%l7 + %o2]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%o2
	nop
	set	0x18, %o6
	std	%f26,	[%l7 + %o6]
	nop
	set	0x10, %l3
	std	%o6,	[%l7 + %l3]
	nop
	set	0x4B, %i2
	ldub	[%l7 + %i2],	%g2
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x81,	 0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%i6
	nop
	set	0x67, %i5
	ldstub	[%l7 + %i5],	%o4
	nop
	set	0x4C, %l5
	prefetch	[%l7 + %l5],	 3
	set	0x48, %i1
	stda	%l4,	[%l7 + %i1] 0x80
	set	0x3C, %g4
	swapa	[%l7 + %g4] 0x81,	%g1
	nop
	set	0x58, %g2
	std	%i4,	[%l7 + %g2]
	nop
	set	0x1C, %i7
	stw	%l0,	[%l7 + %i7]
	nop
	set	0x60, %o0
	std	%f18,	[%l7 + %o0]
	set	0x4C, %i6
	stwa	%l2,	[%l7 + %i6] 0x89
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x1C]
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x81,	%g6
	nop
	set	0x70, %l2
	std	%o2,	[%l7 + %l2]
	fpsub32s	%f30,	%f1,	%f15
	wr	%l6,	%g3,	%clear_softint
	nop
	set	0x18, %o3
	ldsb	[%l7 + %o3],	%l1
	or	%o5,	%g5,	%o6
	set	0x76, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i0
	nop
	set	0x17, %g1
	stb	%i7,	[%l7 + %g1]
	or	%g4,	%i3,	%g6
	nop
	set	0x6A, %l6
	sth	%o0,	[%l7 + %l6]
	nop
	set	0x16, %i4
	lduh	[%l7 + %i4],	%i2
	fpsub16	%f10,	%f12,	%f30
	nop
	set	0x2C, %o5
	stw	%l4,	[%l7 + %o5]
	nop
	set	0x10, %o7
	lduw	[%l7 + %o7],	%i1
	set	0x40, %g7
	stda	%o2,	[%l7 + %g7] 0xe2
	membar	#Sync
	st	%f16,	[%l7 + 0x64]
	nop
	set	0x54, %g5
	stw	%i4,	[%l7 + %g5]
	fpsub16	%f4,	%f24,	%f2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%l3
	nop
	set	0x10, %i0
	std	%f20,	[%l7 + %i0]
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%o6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f16
	nop
	set	0x7C, %o1
	stw	%o1,	[%l7 + %o1]
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f14
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f20
	set	0x18, %l3
	sta	%f20,	[%l7 + %l3] 0x80
	set	0x58, %o6
	stxa	%i6,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x24, %l4
	prefetch	[%l7 + %l4],	 3
	set	0x56, %i5
	stba	%l5,	[%l7 + %i5] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x1C, %l5
	ldub	[%l7 + %l5],	%g1
	fpsub32	%f30,	%f30,	%f8
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%o4
	nop
	set	0x6F, %i1
	ldstub	[%l7 + %i1],	%i5
	nop
	set	0x7C, %g4
	ldsh	[%l7 + %g4],	%l2
	nop
	set	0x5A, %i7
	ldstub	[%l7 + %i7],	%g7
	nop
	set	0x48, %o0
	ldsw	[%l7 + %o0],	%l0
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%o3
	set	0x30, %g2
	stxa	%g3,	[%l7 + %g2] 0x88
	nop
	set	0x68, %g6
	ldsh	[%l7 + %g6],	%l1
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f30
	st	%f8,	[%l7 + 0x58]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o5
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x89,	%g4
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x88,	 3
	nop
	set	0x58, %g1
	ldstub	[%l7 + %g1],	%i7
	nop
	set	0x4F, %l6
	ldsb	[%l7 + %l6],	%o6
	set	0x60, %i4
	stxa	%i3,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	, %o4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1249
!	Type a   	: 20
!	Type cti   	: 23
!	Type x   	: 531
!	Type f   	: 51
!	Type i   	: 126
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 3 Start
!
.global thread_3
thread_3:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0xB,	%g2
	set	0xC,	%g3
	set	0x7,	%g4
	set	0x2,	%g5
	set	0x7,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x0,	%i1
	set	-0x9,	%i2
	set	-0x4,	%i3
	set	-0xE,	%i4
	set	-0x3,	%i5
	set	-0x3,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x015FF983,	%l0
	set	0x1D66DF0D,	%l1
	set	0x10A0A91D,	%l2
	set	0x14271867,	%l3
	set	0x544A4161,	%l4
	set	0x19E9860A,	%l5
	set	0x1E0B67B2,	%l6
	!# Output registers
	set	-0x0BDF,	%o0
	set	-0x1AF1,	%o1
	set	0x0227,	%o2
	set	0x0719,	%o3
	set	0x0E19,	%o4
	set	0x0CE3,	%o5
	set	-0x0CDD,	%o6
	set	0x0C84,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA52B36A3745B7D0F)
	INIT_TH_FP_REG(%l7,%f2,0xF56E0DA3B90577AE)
	INIT_TH_FP_REG(%l7,%f4,0x402D7DAC36E9E004)
	INIT_TH_FP_REG(%l7,%f6,0x3E7BF54684D0E162)
	INIT_TH_FP_REG(%l7,%f8,0x28D8FFEFD3AADC85)
	INIT_TH_FP_REG(%l7,%f10,0xCB7B13CDA6BF8DEA)
	INIT_TH_FP_REG(%l7,%f12,0xFBE4579F62424EC9)
	INIT_TH_FP_REG(%l7,%f14,0x0803BB4F6DA96F25)
	INIT_TH_FP_REG(%l7,%f16,0x8C8CF0668AFE08A2)
	INIT_TH_FP_REG(%l7,%f18,0xA553375C4CDAC316)
	INIT_TH_FP_REG(%l7,%f20,0x08DDCB6D2CEAA72B)
	INIT_TH_FP_REG(%l7,%f22,0x33B2375325954A03)
	INIT_TH_FP_REG(%l7,%f24,0xBE22DBBDCE6BB10C)
	INIT_TH_FP_REG(%l7,%f26,0xD5B7E828433B5701)
	INIT_TH_FP_REG(%l7,%f28,0xEE1A081B36C4A381)
	INIT_TH_FP_REG(%l7,%f30,0xB3D02AD26C75010E)

	!# Execute Main Diag ..

	nop
	set	0x40, %o7
	std	%g4,	[%l7 + %o7]
	nop
	set	0x4A, %o5
	lduh	[%l7 + %o5],	%o0
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x89,	%i2
	nop
	set	0x48, %i0
	stx	%l4,	[%l7 + %i0]
	set	0x54, %g7
	ldstuba	[%l7 + %g7] 0x89,	%i1
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x2C, %l0
	ldsh	[%l7 + %l0],	%g6
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%i4
	nop
	set	0x18, %g3
	ldsw	[%l7 + %g3],	%g2
	nop
	set	0x60, %l1
	stw	%o2,	[%l7 + %l1]
	set	0x50, %o2
	stxa	%o7,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x1A, %l3
	ldsh	[%l7 + %l3],	%l3
	nop
	set	0x3C, %o6
	swap	[%l7 + %o6],	%i6
	nop
	set	0x60, %i5
	ldub	[%l7 + %i5],	%l5
	nop
	set	0x10, %l5
	ldsh	[%l7 + %l5],	%g1
	set	0x58, %i2
	stha	%o1,	[%l7 + %i2] 0x89
	nop
	set	0x60, %i1
	ldsb	[%l7 + %i1],	%o4
	set	0x18, %l4
	stxa	%l2,	[%l7 + %l4] 0x89
	set	0x60, %g4
	stda	%g6,	[%l7 + %g4] 0xea
	membar	#Sync
	and	%l0,	%i5,	%g3
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%l0
	set	0x16, %i6
	stba	%l6,	[%l7 + %i6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x44],	%f11
	set	0x54, %i7
	stwa	%o3,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x4C, %g2
	stw	%o5,	[%l7 + %g2]
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f10
	and	%g5,	%i7,	%o6
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x80,	%i0
	nop
	set	0x7A, %g6
	sth	%g4,	[%l7 + %g6]
	nop
	set	0x78, %i3
	stx	%o0,	[%l7 + %i3]
	nop
	set	0x3C, %l6
	ldsw	[%l7 + %l6],	%i2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%l4
	st	%fsr,	[%l7 + 0x2C]
	set	0x60, %i4
	stxa	%g6,	[%l7 + %i4] 0x88
	set	0x30, %o4
	ldxa	[%l7 + %o4] 0x81,	%i4
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%o7
	set	0x44, %g1
	swapa	[%l7 + %g1] 0x80,	%o2
	set	0x68, %o5
	stha	%i6,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x70, %i0
	swap	[%l7 + %i0],	%l3
	nop
	set	0x6E, %g5
	lduh	[%l7 + %g5],	%l5
	set	0x4C, %l0
	swapa	[%l7 + %l0] 0x88,	%g1
	nop
	set	0x1E, %g7
	ldub	[%l7 + %g7],	%o1
	nop
	set	0x5C, %o1
	swap	[%l7 + %o1],	%o4
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f6
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%l2
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x80,	%l0
	nop
	set	0x1C, %l3
	ldsw	[%l7 + %l3],	%i5
	set	0x10, %o6
	stxa	%g7,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x27, %l5
	ldub	[%l7 + %l5],	%l1
	ld	[%l7 + 0x10],	%f13
	nop
	set	0x20, %i2
	std	%g2,	[%l7 + %i2]
	set	0x40, %i1
	stba	%l6,	[%l7 + %i1] 0x88
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0
	set	0x14, %l4
	stha	%o5,	[%l7 + %l4] 0x81
	nop
	set	0x52, %o0
	sth	%i7,	[%l7 + %o0]
	nop
	set	0x20, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x38, %i7
	prefetcha	[%l7 + %i7] 0x81,	 1
	nop
	set	0x4B, %g4
	stb	%o6,	[%l7 + %g4]
	nop
	set	0x40, %g2
	ldsw	[%l7 + %g2],	%i0
	set	0x5D, %l2
	stba	%g4,	[%l7 + %l2] 0xe2
	membar	#Sync
	or	%i2,	%i3,	%l4
	and	%o0,	%i4,	%g2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x20D, 	%tick_cmpr
	nop
	set	0x45, %g6
	ldub	[%l7 + %g6],	%o2
	nop
	set	0x30, %i3
	sth	%i1,	[%l7 + %i3]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%i6
	nop
	set	0x48, %l6
	lduw	[%l7 + %l6],	%g1
	nop
	set	0x26, %o3
	ldsh	[%l7 + %o3],	%o1
	nop
	set	0x4C, %o4
	lduh	[%l7 + %o4],	%l5
	or	%l2,	%l0,	%i5
	set	0x10, %i4
	stda	%g6,	[%l7 + %i4] 0x80
	set	0x48, %g1
	stda	%l0,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x52, %o5
	ldstub	[%l7 + %o5],	%o4
	nop
	set	0x30, %o7
	stx	%l6,	[%l7 + %o7]
	nop
	set	0x30, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x10, %i0
	prefetch	[%l7 + %i0],	 2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%g3
	set	0x48, %g7
	stxa	%i7,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x5D, %l0
	stba	%o5,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x5A, %l1
	lduh	[%l7 + %l1],	%g5
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%i0
	set	0x18, %o2
	ldstuba	[%l7 + %o2] 0x80,	%g4
	nop
	set	0x60, %l3
	prefetch	[%l7 + %l3],	 3
	add	%i2,	%o6,	%i3
	set	0x72, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o0
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%l4
	fpadd16s	%f26,	%f6,	%f8
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf8
	membar	#Sync
	fpsub32	%f10,	%f8,	%f12
	nop
	set	0x74, %i1
	lduw	[%l7 + %i1],	%i4
	nop
	set	0x5F, %o6
	ldsb	[%l7 + %o6],	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%g6
	wr	%i1,	%o2,	%ccr
	and	%i6,	%l3,	%g1
	set	0x18, %i5
	stxa	%l5,	[%l7 + %i5] 0x89
	nop
	set	0x28, %l4
	ldsw	[%l7 + %l4],	%l2
	nop
	set	0x48, %o0
	std	%l0,	[%l7 + %o0]
	set	0x58, %i6
	stda	%i4,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x78, %g4
	stw	%g7,	[%l7 + %g4]
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%o0
	set	0x4A, %g6
	stba	%l1,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%o4
	set	0x28, %l6
	stxa	%l6,	[%l7 + %l6] 0x81
	nop
	set	0x60, %i3
	std	%g2,	[%l7 + %i3]
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%i6
	st	%f3,	[%l7 + 0x48]
	set	0x28, %o3
	stha	%o3,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x45, %g1
	ldstuba	[%l7 + %g1] 0x80,	%g5
	nop
	set	0x58, %i4
	lduw	[%l7 + %i4],	%i0
	st	%fsr,	[%l7 + 0x78]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf0
	membar	#Sync
	set	0x38, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	nop
	set	0x1A, %o7
	ldsb	[%l7 + %o7],	%g4
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x80
	set	0x60, %g7
	stba	%i2,	[%l7 + %g7] 0x88
	nop
	set	0x16, %l0
	ldsh	[%l7 + %l0],	%o6
	nop
	set	0x50, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x0C, %o1
	ldsw	[%l7 + %o1],	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%i4
	nop
	set	0x24, %l3
	lduw	[%l7 + %l3],	%g2
	bge	%xcc,	loop_76
	nop
	set	0x4A, %g3
	lduh	[%l7 + %g3],	%o0
	nop
	set	0x44, %o2
	stw	%g6,	[%l7 + %o2]
	nop
	set	0x44, %i2
	lduw	[%l7 + %i2],	%o7
loop_76:
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%o2
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x88,	%i1
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%l3
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf1
	membar	#Sync
	set	0x48, %o0
	stwa	%i6,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x7C, %i5
	sta	%f21,	[%l7 + %i5] 0x81
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x81,	%l5
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f0
	nop
	set	0x18, %i6
	swap	[%l7 + %i6],	%l2
	nop
	set	0x58, %g2
	std	%g0,	[%l7 + %g2]
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%l0
	set	0x45, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i5
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81
	nop
	set	0x0F, %g6
	ldstub	[%l7 + %g6],	%o1
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x81
	nop
	set	0x2F, %g1
	stb	%g7,	[%l7 + %g1]
	nop
	set	0x14, %i4
	ldstub	[%l7 + %i4],	%o4
	nop
	set	0x7E, %o5
	ldsh	[%l7 + %o5],	%l6
	nop
	set	0x36, %o3
	ldub	[%l7 + %o3],	%g3
	nop
	set	0x3A, %o7
	ldub	[%l7 + %o7],	%l1
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%o3
	nop
	set	0x39, %g7
	ldub	[%l7 + %g7],	%i7
	set	0x10, %l0
	ldda	[%l7 + %l0] 0xe3,	%i0
	nop
	set	0x10, %g5
	ldsh	[%l7 + %g5],	%g5
	wr	%g4,	%i2,	%clear_softint
	nop
	set	0x24, %o1
	swap	[%l7 + %o1],	%o6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	nop
	set	0x28, %l1
	stx	%o5,	[%l7 + %l1]
	nop
	set	0x76, %g3
	ldsh	[%l7 + %g3],	%l4
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x0E, %i2
	stha	%i4,	[%l7 + %i2] 0x81
	set	0x7C, %i1
	sta	%f25,	[%l7 + %i1] 0x89
	nop
	set	0x6C, %l5
	prefetch	[%l7 + %l5],	 4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f16
	wr	%g2,	%i3,	%softint
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%o7
	add	%o0,	%o2,	%l3
	nop
	set	0x6D, %l4
	stb	%i6,	[%l7 + %l4]
	nop
	set	0x70, %i5
	lduw	[%l7 + %i5],	%i1
	nop
	set	0x40, %g4
	stx	%l5,	[%l7 + %g4]
	set	0x38, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g1
	set	0x58, %i7
	stda	%l0,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x68, %g2
	prefetcha	[%l7 + %g2] 0x81,	 3
	nop
	set	0x38, %i6
	std	%i4,	[%l7 + %i6]
	set	0x18, %l2
	sta	%f14,	[%l7 + %l2] 0x80
	nop
	set	0x1B, %l6
	ldsb	[%l7 + %l6],	%o1
	set	0x14, %g6
	sta	%f6,	[%l7 + %g6] 0x80
	nop
	set	0x29, %i3
	ldsb	[%l7 + %i3],	%g7
	or	%l6,	%o4,	%l1
	nop
	set	0x30, %o4
	swap	[%l7 + %o4],	%o3
	nop
	set	0x48, %g1
	std	%f10,	[%l7 + %g1]
	nop
	set	0x36, %i4
	stb	%g3,	[%l7 + %i4]
	bne,a	%xcc,	loop_77
	nop
	set	0x6A, %o5
	sth	%i0,	[%l7 + %o5]
	set	0x38, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
loop_77:
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%g4
	set	0x6C, %i0
	swapa	[%l7 + %i0] 0x81,	%g5
	set	0x0C, %l0
	lda	[%l7 + %l0] 0x80,	%f17
	nop
	set	0x30, %g7
	ldsh	[%l7 + %g7],	%o6
	set	0x43, %g5
	stba	%o5,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x60, %o1
	ldda	[%l7 + %o1] 0xe2,	%l4
	set	0x18, %l1
	ldstuba	[%l7 + %l1] 0x80,	%i4
	nop
	set	0x64, %g3
	prefetch	[%l7 + %g3],	 1
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc0
	wr	%i2,	%i3,	%softint
	nop
	set	0x52, %i2
	ldsh	[%l7 + %i2],	%g6
	set	0x50, %l3
	lda	[%l7 + %l3] 0x89,	%f27
	set	0x78, %i1
	stxa	%o7,	[%l7 + %i1] 0xea
	membar	#Sync
	wr	%g2,	%o0,	%ccr
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%i6
	set	0x50, %o6
	ldda	[%l7 + %o6] 0xe3,	%i0
	nop
	set	0x38, %l5
	std	%l2,	[%l7 + %l5]
	nop
	set	0x50, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%g1
	nop
	set	0x7D, %i5
	ldub	[%l7 + %i5],	%l0
	set	0x13, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i5
	nop
	set	0x14, %g4
	ldsh	[%l7 + %g4],	%o1
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%g7
	nop
	set	0x58, %i7
	lduw	[%l7 + %i7],	%o4
	st	%f6,	[%l7 + 0x60]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x80
	set	0x0C, %i6
	stba	%l6,	[%l7 + %i6] 0x89
	set	0x57, %g6
	stba	%l1,	[%l7 + %g6] 0xe3
	membar	#Sync
	ld	[%l7 + 0x34],	%f14
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%g2
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x81,	%o3
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f18
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc0
	or	%i0,	%i7,	%g5
	set	0x3C, %i4
	lda	[%l7 + %i4] 0x80,	%f15
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%o6
	add	%o5,	%l4,	%i4
	nop
	set	0x40, %o5
	ldsb	[%l7 + %o5],	%i2
	and	%i3,	%g6,	%o7
	or	%g2,	%g4,	%o2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f0
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x4E, %i0
	stb	%i6,	[%l7 + %i0]
	nop
	set	0x39, %g7
	stb	%o0,	[%l7 + %g7]
	wr	%i1,	%l5,	%ccr
	nop
	set	0x68, %l0
	ldsb	[%l7 + %l0],	%g1
	nop
	set	0x21, %g5
	ldub	[%l7 + %g5],	%l3
	or	%i5,	%o1,	%l2
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	nop
	set	0x6E, %l1
	sth	%o4,	[%l7 + %l1]
	nop
	set	0x78, %o2
	lduh	[%l7 + %o2],	%g7
	add	%l6,	%l1,	%o3
	set	0x08, %g3
	lda	[%l7 + %g3] 0x88,	%f15
	nop
	set	0x14, %i2
	sth	%i0,	[%l7 + %i2]
	nop
	set	0x38, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x1C, %o6
	ldsw	[%l7 + %o6],	%g5
	set	0x58, %l5
	lda	[%l7 + %l5] 0x81,	%f26
	set	0x68, %l4
	prefetcha	[%l7 + %l4] 0x89,	 3
	nop
	set	0x7E, %i5
	ldsb	[%l7 + %i5],	%o6
	set	0x40, %o0
	lda	[%l7 + %o0] 0x89,	%f26
	or	%l4,	%i4,	%o5
	set	0x7C, %i1
	swapa	[%l7 + %i1] 0x89,	%i2
	nop
	set	0x1C, %g4
	swap	[%l7 + %g4],	%g6
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xe2,	%o6
	set	0x50, %i7
	stwa	%g2,	[%l7 + %i7] 0x89
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x89,	 4
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%f24
	set	0x44, %l6
	swapa	[%l7 + %l6] 0x81,	%g4
	be,a	%icc,	loop_78
	nop
	set	0x10, %l2
	std	%f4,	[%l7 + %l2]
	set	0x10, %o4
	ldxa	[%l7 + %o4] 0x81,	%o2
loop_78:
	nop
	set	0x28, %i3
	lduw	[%l7 + %i3],	%o0
	nop
	set	0x60, %i4
	lduw	[%l7 + %i4],	%i6
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc2
	set	0x20, %g1
	stwa	%i1,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x60, %o5
	std	%f10,	[%l7 + %o5]
	ble,a	%icc,	loop_79
	nop
	set	0x60, %i0
	stx	%fsr,	[%l7 + %i0]
	ld	[%l7 + 0x60],	%f18
	set	0x6F, %o3
	stba	%l5,	[%l7 + %o3] 0x80
loop_79:
	nop
	set	0x14, %g7
	lda	[%l7 + %g7] 0x81,	%f21
	nop
	set	0x60, %l0
	stx	%l3,	[%l7 + %l0]
	set	0x08, %o1
	swapa	[%l7 + %o1] 0x81,	%g1
	nop
	set	0x3C, %l1
	prefetch	[%l7 + %l1],	 0
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x88,	 0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%l0
	set	0x58, %g5
	stda	%o0,	[%l7 + %g5] 0xeb
	membar	#Sync
	wr 	%g0, 	0x6, 	%fprs
	wr	%l1,	%l6,	%ccr
	set	0x68, %i2
	stxa	%i0,	[%l7 + %i2] 0x81
	nop
	set	0x1F, %g3
	ldstub	[%l7 + %g3],	%i7
	nop
	set	0x40, %l3
	std	%f14,	[%l7 + %l3]
	nop
	set	0x7C, %l5
	stw	%g5,	[%l7 + %l5]
	nop
	set	0x3C, %o6
	swap	[%l7 + %o6],	%o3
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%o6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%l4
	nop
	set	0x78, %o0
	stx	%i4,	[%l7 + %o0]
	add	%i2,	%o5,	%g6
	set	0x0C, %i5
	lda	[%l7 + %i5] 0x80,	%f6
	nop
	set	0x14, %i1
	lduh	[%l7 + %i1],	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%g4
	set	0x38, %g4
	stxa	%o7,	[%l7 + %g4] 0x81
	set	0x3C, %g2
	stwa	%o0,	[%l7 + %g2] 0x89
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0
	nop
	set	0x78, %g6
	std	%f0,	[%l7 + %g6]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f16
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%l5
	nop
	set	0x69, %l2
	stb	%l3,	[%l7 + %l2]
	nop
	set	0x18, %o4
	lduh	[%l7 + %o4],	%g1
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%i1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%l2
	nop
	set	0x2A, %i7
	ldsh	[%l7 + %i7],	%o1
	nop
	set	0x6A, %o7
	sth	%l0,	[%l7 + %o7]
	set	0x6A, %g1
	stba	%g7,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x54, %o5
	stwa	%l1,	[%l7 + %o5] 0x80
	set	0x54, %i4
	swapa	[%l7 + %i4] 0x81,	%o4
	nop
	set	0x71, %i0
	ldub	[%l7 + %i0],	%l6
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%f14
	nop
	set	0x6C, %l0
	ldsw	[%l7 + %l0],	%i0
	nop
	set	0x35, %o3
	ldstub	[%l7 + %o3],	%g5
	nop
	set	0x2C, %o1
	lduw	[%l7 + %o1],	%o3
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x78, %l1
	stb	%i7,	[%l7 + %l1]
	nop
	set	0x70, %g5
	lduw	[%l7 + %g5],	%g3
	nop
	set	0x1E, %o2
	stb	%l4,	[%l7 + %o2]
	nop
	set	0x61, %g3
	stb	%o6,	[%l7 + %g3]
	set	0x3C, %i2
	lda	[%l7 + %i2] 0x80,	%f2
	fpadd16s	%f21,	%f5,	%f12
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%f22
	nop
	set	0x50, %o6
	swap	[%l7 + %o6],	%i4
	nop
	set	0x48, %l4
	std	%i2,	[%l7 + %l4]
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x88,	%o5
	set	0x73, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g2
	nop
	set	0x74, %o0
	prefetch	[%l7 + %o0],	 1
	nop
	set	0x74, %i1
	ldsh	[%l7 + %i1],	%g6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%o7
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc4
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x50, %g6
	swapa	[%l7 + %g6] 0x89,	%o0
	nop
	set	0x16, %l6
	ldsh	[%l7 + %l6],	%g4
	set	0x7C, %l2
	stwa	%i6,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x60, %o4
	stda	%l4,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x70, %i3
	stx	%o2,	[%l7 + %i3]
	set	0x54, %i6
	stha	%g1,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	st	%f11,	[%l7 + 0x74]
	nop
	set	0x18, %g1
	std	%l2,	[%l7 + %g1]
	set	0x58, %o5
	ldxa	[%l7 + %o5] 0x88,	%i1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd0
	nop
	set	0x4D, %i0
	ldsb	[%l7 + %i0],	%i5
	fpsub32	%f0,	%f14,	%f0
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf0
	membar	#Sync
	set	0x20, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o1
	and	%l2,	%g7,	%l1
	nop
	set	0x70, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 2
	or	%o4,	%l0,	%l6
	wr	%g5,	%i0,	%pic
	st	%fsr,	[%l7 + 0x78]
	bge,a	%icc,	loop_80
	wr	%i7,	%g3,	%pic
	nop
	set	0x39, %o3
	ldstub	[%l7 + %o3],	%l4
	add	%o3,	%i4,	%o6
loop_80:
	nop
	set	0x68, %g5
	stxa	%i2,	[%l7 + %g5] 0x81
	nop
	set	0x27, %o2
	ldub	[%l7 + %o2],	%g2
	set	0x49, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g6
	nop
	set	0x0C, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x66, %l1
	sth	%i3,	[%l7 + %l1]
	nop
	set	0x18, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x70, %l4
	stb	%o7,	[%l7 + %l4]
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%o4
	nop
	set	0x5E, %i5
	ldub	[%l7 + %i5],	%g4
	nop
	set	0x68, %l3
	swap	[%l7 + %l3],	%o0
	set	0x58, %o0
	stda	%l4,	[%l7 + %o0] 0x81
	nop
	set	0x60, %g4
	stx	%o2,	[%l7 + %g4]
	nop
	set	0x40, %g2
	sth	%i6,	[%l7 + %g2]
	set	0x60, %g6
	stha	%l3,	[%l7 + %g6] 0x89
	nop
	set	0x40, %i1
	stx	%i1,	[%l7 + %i1]
	nop
	set	0x28, %l2
	std	%g0,	[%l7 + %l2]
	nop
	set	0x56, %l6
	ldsh	[%l7 + %l6],	%i5
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xda
	and	%o1,	%l2,	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l0
	st	%f10,	[%l7 + 0x28]
	nop
	set	0x3E, %i6
	ldsh	[%l7 + %i6],	%l6
	nop
	set	0x59, %i3
	ldstub	[%l7 + %i3],	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%g7
	set	0x22, %o7
	stha	%g3,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x4C, %g1
	ldsw	[%l7 + %g1],	%l4
	nop
	set	0x14, %o5
	lduh	[%l7 + %o5],	%i7
	nop
	set	0x38, %i4
	ldx	[%l7 + %i4],	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%i4
	ld	[%l7 + 0x08],	%f2
	nop
	set	0x70, %i7
	stw	%g2,	[%l7 + %i7]
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%i2
	nop
	set	0x38, %i0
	std	%g6,	[%l7 + %i0]
	nop
	set	0x44, %l0
	swap	[%l7 + %l0],	%o7
	set	0x40, %o3
	lda	[%l7 + %o3] 0x81,	%f25
	set	0x7E, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o5
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%i3
	and	%g4,	%o0,	%l5
	nop
	set	0x30, %g5
	stx	%o2,	[%l7 + %g5]
	or	%i6,	%l3,	%g1
	nop
	set	0x76, %i2
	ldub	[%l7 + %i2],	%i1
	nop
	set	0x54, %l1
	swap	[%l7 + %l1],	%o1
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x81,	%i5
	nop
	nop
	setx	0xED887E54E687464D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x6AD9C09E53BC2E3C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f4,	%f4
	fpsub32s	%f31,	%f10,	%f27
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%l2
	nop
	set	0x42, %l4
	ldsb	[%l7 + %l4],	%l1
	set	0x08, %i5
	sta	%f26,	[%l7 + %i5] 0x81
	set	0x6C, %l5
	swapa	[%l7 + %l5] 0x88,	%l0
	fpadd16	%f16,	%f6,	%f16
	set	0x14, %o0
	stha	%o4,	[%l7 + %o0] 0x80
	set	0x28, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	nop
	set	0x13, %l3
	ldstub	[%l7 + %l3],	%g5
	set	0x6C, %g2
	lda	[%l7 + %g2] 0x89,	%f10
	set	0x0C, %i1
	lda	[%l7 + %i1] 0x89,	%f24
	fpadd32	%f16,	%f8,	%f26
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%g3
	nop
	set	0x24, %l2
	prefetch	[%l7 + %l2],	 4
	set	0x60, %l6
	swapa	[%l7 + %l6] 0x89,	%l4
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%f22
	set	0x71, %i6
	ldstuba	[%l7 + %i6] 0x88,	%g7
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%i6
	fpsub16	%f4,	%f16,	%f0
	set	0x0C, %o7
	sta	%f21,	[%l7 + %o7] 0x81
	nop
	set	0x7E, %o4
	ldstub	[%l7 + %o4],	%o6
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%i4
	set	0x58, %o5
	stxa	%g2,	[%l7 + %o5] 0x88
	nop
	set	0x58, %i4
	std	%f2,	[%l7 + %i4]
	set	0x10, %i7
	stda	%o2,	[%l7 + %i7] 0xe3
	membar	#Sync
	ld	[%l7 + 0x40],	%f22
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x18, %g7
	stda	%i2,	[%l7 + %g7] 0x89
	ld	[%l7 + 0x74],	%f24
	st	%fsr,	[%l7 + 0x5C]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f16
	nop
	set	0x24, %o3
	sth	%o7,	[%l7 + %o3]
	st	%f6,	[%l7 + 0x1C]
	nop
	set	0x6F, %o2
	stb	%g6,	[%l7 + %o2]
	nop
	set	0x56, %g5
	lduh	[%l7 + %g5],	%o5
	set	0x44, %o1
	lda	[%l7 + %o1] 0x89,	%f24
	st	%fsr,	[%l7 + 0x5C]
	set	0x30, %l1
	prefetcha	[%l7 + %l1] 0x89,	 4
	nop
	set	0x79, %i2
	ldsb	[%l7 + %i2],	%i3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xda,	%f16
	nop
	set	0x0F, %g3
	ldsb	[%l7 + %g3],	%o0
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%l4
	nop
	set	0x5C, %l5
	stw	%o2,	[%l7 + %l5]
	nop
	set	0x30, %o0
	ldsh	[%l7 + %o0],	%i6
	nop
	set	0x38, %g4
	stb	%g1,	[%l7 + %g4]
	ld	[%l7 + 0x0C],	%f6
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%i0
	bn	%xcc,	loop_81
	add	%l3,	%i5,	%l2
	set	0x68, %l4
	stxa	%l1,	[%l7 + %l4] 0x81
loop_81:
	nop
	set	0x5C, %g2
	stb	%l0,	[%l7 + %g2]
	set	0x7C, %i1
	stwa	%o1,	[%l7 + %i1] 0xe2
	membar	#Sync
	and	%o4,	%g5,	%l6
	st	%fsr,	[%l7 + 0x58]
	set	0x24, %l2
	stwa	%i0,	[%l7 + %l2] 0x88
	nop
	set	0x62, %g6
	sth	%l4,	[%l7 + %g6]
	fpsub32	%f2,	%f24,	%f6
	set	0x54, %i6
	swapa	[%l7 + %i6] 0x89,	%g7
	and	%g3,	%o6,	%i4
	or	%i7,	%g2,	%i2
	and	%o7,	%g6,	%o5
	set	0x6C, %l6
	lda	[%l7 + %l6] 0x89,	%f6
	add	%g4,	%o3,	%i3
	set	0x20, %i3
	ldda	[%l7 + %i3] 0xea,	%l4
	nop
	set	0x28, %o4
	sth	%o0,	[%l7 + %o4]
	nop
	set	0x0C, %g1
	stw	%o2,	[%l7 + %g1]
	and	%i6,	%g1,	%l3
	set	0x40, %o5
	stda	%i4,	[%l7 + %o5] 0x89
	set	0x0C, %o7
	lda	[%l7 + %o7] 0x88,	%f24
	nop
	set	0x3A, %i7
	stb	%l2,	[%l7 + %i7]
	nop
	set	0x0C, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%i0
	st	%f8,	[%l7 + 0x70]
	ld	[%l7 + 0x6C],	%f1
	ld	[%l7 + 0x78],	%f27
	set	0x18, %l0
	stda	%l0,	[%l7 + %l0] 0x81
	nop
	set	0x70, %o3
	stx	%o1,	[%l7 + %o3]
	and	%o4,	%l0,	%g5
	nop
	set	0x50, %g7
	std	%f10,	[%l7 + %g7]
	fpadd32s	%f11,	%f25,	%f15
	st	%f30,	[%l7 + 0x2C]
	nop
	set	0x50, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x4A, %o1
	ldsh	[%l7 + %o1],	%i0
	set	0x54, %o2
	lda	[%l7 + %o2] 0x89,	%f22
	set	0x40, %l1
	sta	%f5,	[%l7 + %l1] 0x80
	nop
	set	0x40, %o6
	lduw	[%l7 + %o6],	%l4
	nop
	set	0x58, %g3
	std	%i6,	[%l7 + %g3]
	set	0x38, %i2
	ldxa	[%l7 + %i2] 0x88,	%g7
	nop
	set	0x68, %l5
	stw	%o6,	[%l7 + %l5]
	nop
	set	0x29, %i5
	ldsb	[%l7 + %i5],	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%g2
	nop
	set	0x68, %g4
	stw	%i2,	[%l7 + %g4]
	set	0x24, %o0
	stha	%o7,	[%l7 + %o0] 0x89
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%g6
	ld	[%l7 + 0x38],	%f7
	nop
	set	0x19, %l3
	ldstub	[%l7 + %l3],	%o5
	set	0x38, %i1
	swapa	[%l7 + %i1] 0x80,	%g4
	nop
	set	0x28, %l2
	stw	%g3,	[%l7 + %l2]
	nop
	set	0x1C, %g2
	ldsw	[%l7 + %g2],	%i3
	set	0x40, %g6
	lda	[%l7 + %g6] 0x89,	%f16
	set	0x08, %l6
	stxa	%l5,	[%l7 + %l6] 0x88
	set	0x2C, %i3
	sta	%f11,	[%l7 + %i3] 0x89
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x38, %o4
	sta	%f5,	[%l7 + %o4] 0x81
	nop
	set	0x60, %g1
	stx	%i6,	[%l7 + %g1]
	st	%f14,	[%l7 + 0x14]
	and	%g1,	%o0,	%i5
	nop
	set	0x70, %i6
	ldstub	[%l7 + %i6],	%l2
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x88,	 1
	ld	[%l7 + 0x24],	%f27
	nop
	set	0x0C, %o7
	swap	[%l7 + %o7],	%l1
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x54, %i0
	lduw	[%l7 + %i0],	%o1
	wr	%i1,	%o4,	%ccr
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%g5
	nop
	set	0x30, %i7
	lduw	[%l7 + %i7],	%l0
	nop
	set	0x18, %g7
	lduh	[%l7 + %g7],	%i0
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x89,	%i6
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f20
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%l4
	nop
	set	0x18, %o2
	std	%f12,	[%l7 + %o2]
	nop
	set	0x68, %o1
	stw	%i4,	[%l7 + %o1]
	set	0x14, %o6
	sta	%f30,	[%l7 + %o6] 0x88
	nop
	set	0x09, %l1
	ldub	[%l7 + %l1],	%i7
	nop
	set	0x1E, %g3
	ldstub	[%l7 + %g3],	%g2
	nop
	set	0x68, %l5
	ldub	[%l7 + %l5],	%o6
	nop
	set	0x11, %i2
	ldstub	[%l7 + %i2],	%o7
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x88,	%g6
	st	%f9,	[%l7 + 0x34]
	nop
	set	0x50, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x10, %l4
	std	%f26,	[%l7 + %l4]
	set	0x08, %l3
	ldstuba	[%l7 + %l3] 0x80,	%o5
	nop
	set	0x28, %i1
	ldsb	[%l7 + %i1],	%g4
	set	0x60, %l2
	stba	%g3,	[%l7 + %l2] 0x80
	set	0x5C, %g4
	lda	[%l7 + %g4] 0x89,	%f10
	or	%i2,	%i3,	%l5
	ld	[%l7 + 0x10],	%f7
	nop
	set	0x4C, %g2
	stw	%o2,	[%l7 + %g2]
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%o2
	set	0x7E, %o4
	ldstuba	[%l7 + %o4] 0x88,	%i6
	nop
	set	0x63, %g6
	stb	%g1,	[%l7 + %g6]
	set	0x68, %i6
	swapa	[%l7 + %i6] 0x81,	%o0
	nop
	set	0x40, %g1
	lduw	[%l7 + %g1],	%i5
	add	%l3,	%l1,	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%o1
	add	%o4,	%l0,	%g5
	nop
	set	0x64, %o7
	stb	%i0,	[%l7 + %o7]
	set	0x08, %i4
	stda	%g6,	[%l7 + %i4] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%i4
	set	0x55, %o5
	stba	%g2,	[%l7 + %o5] 0x80
	nop
	set	0x60, %i7
	ldub	[%l7 + %i7],	%o6
	nop
	set	0x4C, %g7
	ldsb	[%l7 + %g7],	%o7
	or	%g6,	%o5,	%g4
	nop
	set	0x10, %l0
	swap	[%l7 + %l0],	%i7
	set	0x20, %o3
	stda	%g2,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x45, %o2
	stb	%i2,	[%l7 + %o2]
	nop
	set	0x7D, %g5
	ldsb	[%l7 + %g5],	%i3
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f0
	nop
	set	0x62, %l1
	lduh	[%l7 + %l1],	%o2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%i6
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x80,	 3
	nop
	set	0x58, %g3
	std	%g0,	[%l7 + %g3]
	set	0x2B, %l5
	ldstuba	[%l7 + %l5] 0x80,	%i5
	nop
	set	0x1C, %i2
	stw	%o0,	[%l7 + %i2]
	set	0x58, %i5
	stwa	%l3,	[%l7 + %i5] 0x81
	set	0x70, %o0
	stda	%l2,	[%l7 + %o0] 0x81
	nop
	set	0x42, %l4
	ldsb	[%l7 + %l4],	%l1
	nop
	set	0x24, %i1
	lduw	[%l7 + %i1],	%o1
	nop
	set	0x38, %l3
	std	%f0,	[%l7 + %l3]
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x88,	%o4
	bne,pt	%xcc,	loop_82
	wr	%l0,	%i1,	%clear_softint
	ld	[%l7 + 0x08],	%f26
	set	0x78, %l2
	stwa	%g5,	[%l7 + %l2] 0x81
loop_82:
	nop
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x88,	 4
	nop
	set	0x30, %g2
	std	%f24,	[%l7 + %g2]
	nop
	set	0x76, %o4
	ldsh	[%l7 + %o4],	%i0
	set	0x58, %i3
	lda	[%l7 + %i3] 0x81,	%f7
	nop
	set	0x40, %g6
	std	%f28,	[%l7 + %g6]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i4
	nop
	set	0x58, %i6
	prefetch	[%l7 + %i6],	 4
	set	0x54, %o7
	stwa	%g2,	[%l7 + %o7] 0x80
	nop
	set	0x0A, %i4
	ldsh	[%l7 + %i4],	%l4
	st	%f8,	[%l7 + 0x2C]
	nop
	set	0x65, %i0
	ldub	[%l7 + %i0],	%o6
	nop
	set	0x38, %g1
	sth	%g6,	[%l7 + %g1]
	set	0x14, %i7
	lda	[%l7 + %i7] 0x89,	%f6
	and	%o7,	%o5,	%i7
	nop
	set	0x5E, %g7
	ldsh	[%l7 + %g7],	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%g4
	set	0x20, %o5
	prefetcha	[%l7 + %o5] 0x80,	 2
	set	0x3C, %o3
	stwa	%o2,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x18, %o2
	stx	%l5,	[%l7 + %o2]
	add	%o3,	%g1,	%i5
	nop
	set	0x16, %l0
	stb	%o0,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x50, %o1
	std	%i6,	[%l7 + %o1]
	set	0x28, %g5
	lda	[%l7 + %g5] 0x89,	%f9
	nop
	set	0x4C, %o6
	swap	[%l7 + %o6],	%l3
	set	0x78, %l1
	swapa	[%l7 + %l1] 0x89,	%l1
	be	%xcc,	loop_83
	nop
	set	0x10, %g3
	ldsw	[%l7 + %g3],	%l2
	nop
	set	0x74, %l5
	prefetch	[%l7 + %l5],	 0
	set	0x1C, %i2
	swapa	[%l7 + %i2] 0x81,	%o1
loop_83:
	nop
	set	0x39, %o0
	ldub	[%l7 + %o0],	%o4
	nop
	set	0x2E, %l4
	ldsb	[%l7 + %l4],	%l0
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf1
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%g7
	set	0x38, %g4
	stda	%i0,	[%l7 + %g4] 0x81
	nop
	set	0x6E, %l2
	ldstub	[%l7 + %l2],	%l6
	nop
	set	0x7F, %i5
	ldsb	[%l7 + %i5],	%g5
	set	0x34, %g2
	sta	%f12,	[%l7 + %g2] 0x80
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	ld	[%l7 + 0x48],	%f14
	nop
	nop
	setx	0xA1B48EDF0AAF3A16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1B0CFE5D7136CBA7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f22,	%f2
	nop
	set	0x6C, %o4
	swap	[%l7 + %o4],	%g2
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f10
	set	0x38, %g6
	sta	%f7,	[%l7 + %g6] 0x88
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f0
	nop
	set	0x0E, %i6
	lduh	[%l7 + %i6],	%l4
	set	0x24, %i4
	sta	%f6,	[%l7 + %i4] 0x80
	set	0x38, %g1
	swapa	[%l7 + %g1] 0x81,	%i4
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf1
	membar	#Sync
	or	%o6,	%o7,	%g6
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%o5
	set	0x16, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g3
	st	%fsr,	[%l7 + 0x2C]
	set	0x78, %o5
	stha	%i2,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x2F, %o2
	stba	%i7,	[%l7 + %o2] 0x88
	set	0x09, %l0
	stba	%g4,	[%l7 + %l0] 0x80
	set	0x59, %o1
	stba	%o2,	[%l7 + %o1] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x62, %g5
	sth	%i3,	[%l7 + %g5]
	nop
	set	0x38, %o3
	swap	[%l7 + %o3],	%o3
	set	0x18, %l1
	stda	%l4,	[%l7 + %l1] 0x81
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%i4
	set	0x57, %l5
	ldstuba	[%l7 + %l5] 0x89,	%o0
	nop
	set	0x38, %i2
	swap	[%l7 + %i2],	%g1
	nop
	set	0x58, %g3
	stx	%i6,	[%l7 + %g3]
	set	0x4C, %o0
	stwa	%l3,	[%l7 + %o0] 0x81
	set	0x0C, %i1
	stwa	%l1,	[%l7 + %i1] 0x88
	nop
	set	0x50, %l3
	swap	[%l7 + %l3],	%l2
	nop
	set	0x60, %g4
	std	%f16,	[%l7 + %g4]
	set	0x4C, %l2
	sta	%f4,	[%l7 + %l2] 0x81
	set	0x60, %l4
	stxa	%o4,	[%l7 + %l4] 0x80
	set	0x74, %i5
	swapa	[%l7 + %i5] 0x80,	%l0
	nop
	set	0x14, %g2
	sth	%o1,	[%l7 + %g2]
	nop
	set	0x40, %o4
	ldsh	[%l7 + %o4],	%i1
	nop
	set	0x58, %l6
	lduw	[%l7 + %l6],	%g7
	set	0x7A, %i3
	stha	%i0,	[%l7 + %i3] 0x88
	or	%l6,	%g2,	%l4
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x81,	 4
	nop
	set	0x74, %i6
	ldstub	[%l7 + %i6],	%g5
	set	0x30, %g6
	ldda	[%l7 + %g6] 0xea,	%o6
	nop
	set	0x50, %g1
	std	%f14,	[%l7 + %g1]
	set	0x39, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%i7
	and	%g4,	%o2,	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x81
	nop
	set	0x30, %g7
	std	%f24,	[%l7 + %g7]
	set	0x20, %i4
	prefetcha	[%l7 + %i4] 0x89,	 0
	nop
	set	0x64, %o2
	sth	%o0,	[%l7 + %o2]
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%i5
	nop
	set	0x68, %o5
	stx	%i6,	[%l7 + %o5]
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x29, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g1
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%f8
	set	0x12, %o6
	stha	%l3,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x42, %l5
	stha	%l2,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x60, %i2
	stb	%o4,	[%l7 + %i2]
	set	0x78, %o3
	stxa	%l1,	[%l7 + %o3] 0x80
	or	%o1,	%i1,	%l0
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc4
	nop
	set	0x24, %i1
	ldstub	[%l7 + %i1],	%g7
	and	%i0,	%l6,	%l4
	add	%g2,	%i4,	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%o7
	nop
	set	0x44, %o0
	stb	%g3,	[%l7 + %o0]
	nop
	set	0x10, %l3
	std	%g6,	[%l7 + %l3]
	nop
	set	0x72, %l2
	lduh	[%l7 + %l2],	%i7
	set	0x38, %l4
	stwa	%g4,	[%l7 + %l4] 0x81
	ld	[%l7 + 0x44],	%f30
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x81,	 2
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x89,	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%i3
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xe2,	%l4
	nop
	set	0x40, %g2
	std	%f14,	[%l7 + %g2]
	and	%o0,	%o5,	%i6
	set	0x64, %i3
	stwa	%g1,	[%l7 + %i3] 0x81
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f30
	be	%xcc,	loop_84
	nop
	set	0x60, %i6
	stx	%l3,	[%l7 + %i6]
	set	0x67, %g6
	ldstuba	[%l7 + %g6] 0x80,	%l2
loop_84:
	nop
	set	0x78, %g1
	stda	%i4,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x08, %o7
	sta	%f9,	[%l7 + %o7] 0x89
	set	0x7C, %i7
	stwa	%o4,	[%l7 + %i7] 0x88
	nop
	set	0x38, %i0
	stx	%o1,	[%l7 + %i0]
	nop
	set	0x18, %i4
	std	%f24,	[%l7 + %i4]
	st	%f25,	[%l7 + 0x44]
	nop
	set	0x38, %o2
	std	%l0,	[%l7 + %o2]
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x80,	 3
	nop
	set	0x7A, %o5
	stb	%l0,	[%l7 + %o5]
	set	0x2C, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i0
	nop
	set	0x27, %g5
	ldsb	[%l7 + %g5],	%l6
	wr	%g7,	%g2,	%sys_tick
	nop
	set	0x3C, %l1
	sth	%l4,	[%l7 + %l1]
	and	%g5,	%i4,	%o7
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	st	%f25,	[%l7 + 0x30]
	set	0x48, %l5
	stda	%g2,	[%l7 + %l5] 0x80
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x1C, %o1
	stw	%g6,	[%l7 + %o1]
	nop
	set	0x43, %i2
	ldstub	[%l7 + %i2],	%i7
	nop
	set	0x6A, %g3
	lduh	[%l7 + %g3],	%o6
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x88,	%g4
	set	0x48, %o3
	stxa	%i2,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%o2
	nop
	set	0x10, %l2
	std	%f8,	[%l7 + %l2]
	set	0x58, %o0
	stxa	%i3,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x20, %l4
	sta	%f31,	[%l7 + %l4] 0x89
	set	0x14, %g4
	swapa	[%l7 + %g4] 0x88,	%o3
	or	%l5,	%o5,	%i6
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x89,	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%l2
	add	%l3,	%i5,	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%i1
	nop
	set	0x60, %i5
	std	%f8,	[%l7 + %i5]
	wr	%o4,	%i0,	%y
	st	%f26,	[%l7 + 0x2C]
	ld	[%l7 + 0x54],	%f27
	nop
	set	0x60, %g2
	swap	[%l7 + %g2],	%l0
	set	0x60, %l6
	stxa	%g7,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
	set	0x0C, %g6
	stha	%l6,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x34, %g1
	stw	%l4,	[%l7 + %g1]
	nop
	set	0x30, %i3
	std	%f0,	[%l7 + %i3]
	nop
	set	0x5D, %o7
	ldub	[%l7 + %o7],	%g2
	set	0x3A, %i7
	stha	%g5,	[%l7 + %i7] 0x88
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd0,	%f0
	nop
	set	0x42, %o2
	sth	%i4,	[%l7 + %o2]
	and	%g3,	%o7,	%i7
	nop
	set	0x6E, %l0
	lduh	[%l7 + %l0],	%g6
	ld	[%l7 + 0x0C],	%f8
	set	0x70, %o5
	lda	[%l7 + %o5] 0x88,	%f25
	set	0x10, %i0
	stwa	%g4,	[%l7 + %i0] 0x81
	nop
	set	0x08, %g5
	std	%i2,	[%l7 + %g5]
	nop
	set	0x6C, %g7
	swap	[%l7 + %g7],	%o6
	set	0x28, %l1
	sta	%f24,	[%l7 + %l1] 0x89
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xea,	%i2
	set	0x78, %l5
	prefetcha	[%l7 + %l5] 0x81,	 1
	and	%l5,	%o5,	%i6
	nop
	set	0x48, %i2
	swap	[%l7 + %i2],	%o0
	nop
	set	0x2A, %g3
	ldsh	[%l7 + %g3],	%g1
	nop
	set	0x0C, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x7C, %o1
	stha	%o2,	[%l7 + %o1] 0x81
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f0
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x81,	%l2
	ld	[%l7 + 0x24],	%f9
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x80,	%l2
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x80,	%i5
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x81,	 1
	set	0x50, %g4
	ldda	[%l7 + %g4] 0xe2,	%i0
	or	%o1,	%i0,	%o4
	st	%f26,	[%l7 + 0x24]
	nop
	set	0x58, %i5
	stw	%g7,	[%l7 + %i5]
	ld	[%l7 + 0x4C],	%f18
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd2,	%f16
	nop
	set	0x48, %o4
	prefetch	[%l7 + %o4],	 0
	set	0x18, %i6
	lda	[%l7 + %i6] 0x80,	%f4
	nop
	set	0x7C, %l6
	lduh	[%l7 + %l6],	%l6
	set	0x58, %g6
	lda	[%l7 + %g6] 0x81,	%f30
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%l4
	set	0x3C, %i3
	swapa	[%l7 + %i3] 0x81,	%g5
	set	0x44, %o7
	sta	%f15,	[%l7 + %o7] 0x89
	wr	%i4,	%g2,	%y
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%g3
	st	%f0,	[%l7 + 0x20]
	add	%i7,	%g6,	%g4
	nop
	set	0x50, %i7
	std	%o6,	[%l7 + %i7]
	wr	%i2,	%i3,	%set_softint
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x89
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f8
	nop
	set	0x44, %o5
	stw	%o6,	[%l7 + %o5]
	nop
	set	0x6C, %i0
	lduw	[%l7 + %i0],	%o3
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x30, %g7
	lduw	[%l7 + %g7],	%l5
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x12, %l1
	sth	%i6,	[%l7 + %l1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x50, %i4
	ldx	[%l7 + %i4],	%o2
	nop
	set	0x48, %l5
	ldsw	[%l7 + %l5],	%o0
	set	0x0C, %o6
	stwa	%l3,	[%l7 + %o6] 0xe2
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%l2
	nop
	set	0x50, %i2
	stx	%i1,	[%l7 + %i2]
	nop
	set	0x38, %g3
	ldx	[%l7 + %g3],	%o1
	nop
	set	0x78, %o1
	prefetch	[%l7 + %o1],	 1
	st	%f1,	[%l7 + 0x0C]
	set	0x28, %l3
	stxa	%l1,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x44, %l2
	swapa	[%l7 + %l2] 0x88,	%o4
	set	0x20, %o0
	sta	%f30,	[%l7 + %o0] 0x80
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f16
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd0
	nop
	set	0x60, %g4
	std	%f12,	[%l7 + %g4]
	nop
	set	0x7A, %l4
	lduh	[%l7 + %l4],	%i0
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x88,	%g6
	nop
	set	0x44, %g2
	ldsw	[%l7 + %g2],	%l0
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x6E, %i6
	stb	%l4,	[%l7 + %i6]
	set	0x14, %l6
	sta	%f25,	[%l7 + %l6] 0x81
	nop
	nop
	setx	0x6205CE528317E42C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x4503067CA325359A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f0,	%f10
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	nop
	set	0x18, %i3
	lduh	[%l7 + %i3],	%g5
	nop
	set	0x48, %g1
	prefetch	[%l7 + %g1],	 4
	set	0x1C, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g2
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x80,	%i4
	nop
	set	0x28, %l0
	std	%f0,	[%l7 + %l0]
	nop
	set	0x40, %o5
	ldx	[%l7 + %o5],	%g3
	nop
	set	0x54, %i0
	swap	[%l7 + %i0],	%g6
	nop
	set	0x2C, %g5
	swap	[%l7 + %g5],	%g4
	bne	%icc,	loop_85
	wr 	%g0, 	0x4, 	%fprs
	set	0x20, %g7
	lda	[%l7 + %g7] 0x80,	%f21
loop_85:
	nop
	set	0x54, %o2
	lduw	[%l7 + %o2],	%o7
	set	0x2C, %l1
	stba	%o6,	[%l7 + %l1] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x4C]
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x88,	%i3
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xcc
	nop
	set	0x74, %i2
	lduw	[%l7 + %i2],	%l5
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x50, %o1
	std	%o2,	[%l7 + %o1]
	set	0x30, %l3
	swapa	[%l7 + %l3] 0x80,	%i6
	add	%g1,	%o2,	%o5
	nop
	set	0x78, %l2
	lduw	[%l7 + %l2],	%l3
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x89,	%i4
	be,a	%icc,	loop_86
	st	%fsr,	[%l7 + 0x4C]
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x81
loop_86:
	st	%f4,	[%l7 + 0x58]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%o0
	nop
	set	0x6C, %o0
	ldsw	[%l7 + %o0],	%i1
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%l1
	set	0x18, %g4
	stda	%o4,	[%l7 + %g4] 0x88
	nop
	set	0x62, %l4
	lduh	[%l7 + %l4],	%o1
	set	0x3E, %i5
	stha	%g7,	[%l7 + %i5] 0x81
	nop
	set	0x50, %o4
	std	%f12,	[%l7 + %o4]
	wr	%l0,	%l4,	%softint
	nop
	set	0x3A, %g2
	ldub	[%l7 + %g2],	%l6
	nop
	set	0x20, %i6
	std	%f30,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x26, %l6
	ldsh	[%l7 + %l6],	%i0
	nop
	set	0x16, %i3
	ldub	[%l7 + %i3],	%g2
	st	%f23,	[%l7 + 0x7C]
	set	0x24, %g1
	lda	[%l7 + %g1] 0x80,	%f16
	set	0x48, %i7
	stwa	%i4,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xcc
	nop
	set	0x70, %l0
	ldsh	[%l7 + %l0],	%g5
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x89,	%g2
	nop
	set	0x24, %i0
	swap	[%l7 + %i0],	%g6
	ba,a,pt	%xcc,	loop_87
	fpadd32s	%f29,	%f7,	%f1
	set	0x54, %o5
	lda	[%l7 + %o5] 0x88,	%f8
loop_87:
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%i6
	set	0x30, %g7
	ldda	[%l7 + %g7] 0xeb,	%g4
	and	%o7,	%o6,	%i3
	set	0x30, %l1
	stxa	%i2,	[%l7 + %l1] 0xeb
	membar	#Sync
	or	%o3,	%l5,	%g1
	wr	%i6,	%o5,	%softint
	or	%o2,	%i5,	%l3
	set	0x38, %l5
	prefetcha	[%l7 + %l5] 0x89,	 2
	and	%i1,	%l2,	%o4
	or	%o1,	%g7,	%l1
	wr	%l0,	%l4,	%y
	nop
	set	0x22, %o2
	sth	%l6,	[%l7 + %o2]
	set	0x34, %i2
	stwa	%i0,	[%l7 + %i2] 0x80
	set	0x54, %g3
	swapa	[%l7 + %g3] 0x80,	%i4
	nop
	set	0x18, %i4
	std	%g4,	[%l7 + %i4]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xca
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x89
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%g2
	nop
	set	0x08, %l3
	stx	%fsr,	[%l7 + %l3]
	and	%g6,	%i7,	%g2
	nop
	set	0x6E, %o3
	sth	%g4,	[%l7 + %o3]
	or	%o7,	%i3,	%o6
	wr	%o3,	%l5,	%ccr
	fpsub32s	%f18,	%f26,	%f7
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	ld	[%l7 + 0x50],	%f26
	add	%g1,	%i2,	%i6
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x60, %i1
	ldsb	[%l7 + %i1],	%o2
	nop
	set	0x7C, %l4
	lduw	[%l7 + %l4],	%o5
	nop
	set	0x64, %i5
	lduw	[%l7 + %i5],	%i5
	nop
	set	0x44, %g4
	sth	%l3,	[%l7 + %g4]
	set	0x48, %o4
	stda	%o0,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x88,	%l2
	nop
	set	0x10, %i6
	stx	%i1,	[%l7 + %i6]
	set	0x40, %i3
	sta	%f4,	[%l7 + %i3] 0x88
	ld	[%l7 + 0x30],	%f12
	nop
	set	0x58, %g1
	lduw	[%l7 + %g1],	%o4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%l1
	set	0x08, %i7
	sta	%f26,	[%l7 + %i7] 0x89
	ld	[%l7 + 0x58],	%f31
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x81,	%g7
	nop
	set	0x68, %g6
	lduh	[%l7 + %g6],	%l0
	nop
	set	0x44, %l0
	swap	[%l7 + %l0],	%l6
	nop
	set	0x33, %o7
	stb	%i0,	[%l7 + %o7]
	fpsub32	%f18,	%f30,	%f10
	bn,a	%icc,	loop_88
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%f28
	set	0x30, %o5
	stba	%l4,	[%l7 + %o5] 0xe2
	membar	#Sync
loop_88:
	nop
	set	0x4A, %g5
	sth	%i4,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%g5
	or	%g6,	%i7,	%g3
	nop
	set	0x6C, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x38, %l5
	sta	%f14,	[%l7 + %l5] 0x88
	set	0x70, %i2
	stda	%g2,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x0C, %o2
	swapa	[%l7 + %o2] 0x89,	%o7
	set	0x14, %i4
	ldstuba	[%l7 + %i4] 0x88,	%i3
	set	0x4C, %g3
	lda	[%l7 + %g3] 0x80,	%f1
	wr	%o6,	%o3,	%y
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf8
	membar	#Sync
	st	%f7,	[%l7 + 0x64]
	set	0x48, %o1
	stda	%l4,	[%l7 + %o1] 0xe3
	membar	#Sync
	fpadd32s	%f5,	%f13,	%f2
	set	0x30, %l3
	sta	%f21,	[%l7 + %l3] 0x80
	or	%g4,	%g1,	%i2
	nop
	set	0x69, %o6
	ldstub	[%l7 + %o6],	%i6
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%o5
	nop
	set	0x3E, %i1
	lduh	[%l7 + %i1],	%i5
	nop
	set	0x48, %o0
	std	%o2,	[%l7 + %o0]
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x80,	%l3
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf8
	membar	#Sync
	set	0x10, %o4
	stwa	%o0,	[%l7 + %o4] 0x81
	set	0x50, %g4
	stxa	%i1,	[%l7 + %g4] 0x81
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%o4
	set	0x3C, %i3
	stwa	%o1,	[%l7 + %i3] 0x88
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x80,	%l0
	nop
	set	0x10, %i6
	stw	%g7,	[%l7 + %i6]
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xeb,	%l0
	set	0x55, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l6
	nop
	set	0x30, %g6
	std	%l2,	[%l7 + %g6]
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x88,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%g5
	nop
	set	0x20, %i0
	ldstub	[%l7 + %i0],	%g6
	nop
	set	0x34, %o5
	sth	%i7,	[%l7 + %o5]
	set	0x30, %g5
	stda	%i0,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%g2
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	fpadd16	%f26,	%f6,	%f28
	fpadd16s	%f31,	%f20,	%f23
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xe3,	%i2
	nop
	set	0x74, %i2
	stw	%o6,	[%l7 + %i2]
	ld	[%l7 + 0x70],	%f26
	st	%f17,	[%l7 + 0x1C]
	nop
	set	0x70, %g7
	ldsw	[%l7 + %g7],	%o3
	nop
	set	0x58, %i4
	std	%f28,	[%l7 + %i4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%l5
	bgu,pt	%xcc,	loop_89
	nop
	set	0x4A, %o2
	lduh	[%l7 + %o2],	%g4
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xca
loop_89:
	st	%f0,	[%l7 + 0x20]
	set	0x24, %o1
	lda	[%l7 + %o1] 0x89,	%f11
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f8
	nop
	set	0x08, %o6
	ldsb	[%l7 + %o6],	%i2
	nop
	set	0x30, %o3
	std	%f12,	[%l7 + %o3]
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	and	%i6,	%g1,	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l3
	ld	[%l7 + 0x50],	%f4
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%o0
	or	%o2,	%i1,	%o4
	nop
	set	0x10, %i5
	stx	%l1,	[%l7 + %i5]
	nop
	set	0x68, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x62, %l4
	ldsb	[%l7 + %l4],	%g7
	nop
	set	0x34, %g4
	prefetch	[%l7 + %g4],	 1
	nop
	set	0x68, %g2
	std	%l0,	[%l7 + %g2]
	nop
	set	0x10, %i3
	lduw	[%l7 + %i3],	%l6
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%f12
	st	%fsr,	[%l7 + 0x7C]
	set	0x78, %o4
	stda	%o0,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc2
	nop
	set	0x46, %l6
	ldstub	[%l7 + %l6],	%l4
	nop
	set	0x18, %i6
	ldsh	[%l7 + %i6],	%i4
	set	0x3C, %g6
	ldstuba	[%l7 + %g6] 0x81,	%l2
	bge,a	%xcc,	loop_90
	nop
	set	0x60, %l0
	std	%f4,	[%l7 + %l0]
	set	0x30, %o5
	sta	%f17,	[%l7 + %o5] 0x89
loop_90:
	and	%g5,	%i7,	%g6
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%f24
	nop
	set	0x30, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x42, %o7
	ldsb	[%l7 + %o7],	%g3
	set	0x7A, %g5
	stba	%i0,	[%l7 + %g5] 0xea
	membar	#Sync
	add	%i3,	%o7,	%o6
	nop
	set	0x38, %l5
	stx	%o3,	[%l7 + %l5]
	nop
	set	0x20, %g7
	stx	%fsr,	[%l7 + %g7]
	or	%l5,	%g4,	%i2
	and	%g2,	%g1,	%i5
	set	0x36, %i2
	stba	%o5,	[%l7 + %i2] 0x80
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o0
	set	0x3B, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o2
	nop
	set	0x44, %o2
	ldsw	[%l7 + %o2],	%l3
	and	%o4,	%l1,	%i1
	nop
	set	0x50, %o1
	sth	%l0,	[%l7 + %o1]
	nop
	set	0x3F, %l3
	ldstub	[%l7 + %l3],	%g7
	nop
	set	0x4A, %o6
	sth	%o1,	[%l7 + %o6]
	set	0x10, %g3
	stda	%i6,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x1C, %i1
	ldsw	[%l7 + %i1],	%l4
	nop
	set	0x58, %o0
	ldsw	[%l7 + %o0],	%i4
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x89,	%l2
	nop
	set	0x48, %l2
	lduh	[%l7 + %l2],	%g5
	nop
	set	0x78, %o3
	ldsw	[%l7 + %o3],	%g6
	set	0x58, %g4
	stha	%i7,	[%l7 + %g4] 0x88
	st	%f2,	[%l7 + 0x24]
	nop
	set	0x38, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x5E, %g2
	lduh	[%l7 + %g2],	%g3
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%i3
	set	0x6C, %o4
	lda	[%l7 + %o4] 0x81,	%f22
	set	0x78, %i7
	stda	%i0,	[%l7 + %i7] 0xe3
	membar	#Sync
	wr	%o7,	%o3,	%pic
	nop
	set	0x60, %l6
	std	%f16,	[%l7 + %l6]
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%o6
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x60, %i6
	std	%f28,	[%l7 + %i6]
	nop
	set	0x28, %o5
	stx	%g4,	[%l7 + %o5]
	nop
	set	0x73, %i0
	ldstub	[%l7 + %i0],	%i2
	nop
	set	0x58, %l0
	ldsh	[%l7 + %l0],	%l5
	set	0x08, %l1
	lda	[%l7 + %l1] 0x89,	%f10
	nop
	set	0x48, %o7
	swap	[%l7 + %o7],	%g2
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%f14
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%g1
	or	%i6,	%o5,	%o0
	set	0x5F, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o2
	nop
	set	0x1C, %i2
	ldsb	[%l7 + %i2],	%o4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%i1
	add	%l3,	%g7,	%o1
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%l0
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f18
	set	0x34, %g7
	stwa	%l4,	[%l7 + %g7] 0x81
	or	%i4,	%l2,	%g5
	nop
	set	0x60, %l3
	std	%f24,	[%l7 + %l3]
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%l6
	ld	[%l7 + 0x78],	%f15
	bn,a	%icc,	loop_91
	or	%i7,	%g3,	%i3
	set	0x4C, %o6
	stwa	%i0,	[%l7 + %o6] 0xe2
	membar	#Sync
loop_91:
	or	%g6,	%o7,	%o3
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x89,	 4
	nop
	set	0x08, %g3
	ldsh	[%l7 + %g3],	%i2
	add	%o6,	%l5,	%g2
	add	%g1,	%i6,	%o5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%o0
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x88,	 2
	ld	[%l7 + 0x58],	%f30
	set	0x78, %o0
	stwa	%o2,	[%l7 + %o0] 0x80
	nop
	set	0x5F, %o3
	stb	%i1,	[%l7 + %o3]
	nop
	set	0x78, %g4
	ldub	[%l7 + %g4],	%l1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	st	%f21,	[%l7 + 0x58]
	nop
	set	0x48, %l2
	std	%f26,	[%l7 + %l2]
	and	%l0,	%l3,	%l4
	add	%i4,	%g5,	%l6
	set	0x28, %l4
	stwa	%l2,	[%l7 + %l4] 0x81
	bl,a,pt	%icc,	loop_92
	wr	%g3,	%i7,	%set_softint
	set	0x14, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i0
loop_92:
	nop
	set	0x48, %g1
	sta	%f20,	[%l7 + %g1] 0x89
	set	0x40, %o4
	lda	[%l7 + %o4] 0x81,	%f0
	bgu,pn	%icc,	loop_93
	nop
	set	0x6C, %l6
	ldub	[%l7 + %l6],	%i3
	fpadd16	%f16,	%f0,	%f8
	ld	[%l7 + 0x10],	%f13
loop_93:
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	fpsub32	%f22,	%f8,	%f24
	nop
	set	0x0E, %i3
	ldsb	[%l7 + %i3],	%o7
	set	0x78, %g6
	stda	%o2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x74, %i6
	swap	[%l7 + %i6],	%g4
	set	0x38, %o5
	stxa	%i2,	[%l7 + %o5] 0x80
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	and	%g6,	%o6,	%l5
	nop
	set	0x4F, %i0
	stb	%g1,	[%l7 + %i0]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f0
	nop
	set	0x54, %g5
	ldsw	[%l7 + %g5],	%g2
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x89,	 3
	nop
	set	0x3C, %l5
	lduh	[%l7 + %l5],	%o5
	wr	%i5,	%o4,	%sys_tick
	and	%o0,	%i1,	%l1
	nop
	set	0x70, %i4
	std	%g6,	[%l7 + %i4]
	set	0x40, %i2
	stda	%o0,	[%l7 + %i2] 0x89
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%o2
	nop
	set	0x54, %g7
	stb	%l3,	[%l7 + %g7]
	nop
	set	0x2A, %o1
	ldsh	[%l7 + %o1],	%l4
	and	%l0,	%i4,	%g5
	set	0x7E, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l2
	nop
	set	0x57, %l3
	ldsb	[%l7 + %l3],	%l6
	nop
	set	0x60, %g3
	std	%f8,	[%l7 + %g3]
	nop
	set	0x68, %i5
	lduw	[%l7 + %i5],	%i7
	set	0x48, %o0
	stha	%i0,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%g2
	and	%i3,	%o3,	%o7
	set	0x5C, %o3
	swapa	[%l7 + %o3] 0x81,	%g4
	set	0x70, %l2
	ldda	[%l7 + %l2] 0xe2,	%g6
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f0
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f16
	set	0x1E, %l4
	ldstuba	[%l7 + %l4] 0x88,	%o6
	nop
	set	0x58, %g1
	std	%i2,	[%l7 + %g1]
	nop
	set	0x2E, %l6
	ldsh	[%l7 + %l6],	%l5
	set	0x18, %o4
	stwa	%g2,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x08, %i3
	swapa	[%l7 + %i3] 0x80,	%i6
	nop
	set	0x10, %g6
	std	%f2,	[%l7 + %g6]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc8
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xcc
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%o5
	set	0x7B, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o4
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%i5
	nop
	set	0x1C, %i0
	lduw	[%l7 + %i0],	%o0
	nop
	set	0x37, %o7
	ldsb	[%l7 + %o7],	%l1
	set	0x20, %l1
	stxa	%i1,	[%l7 + %l1] 0x81
	set	0x40, %l5
	stda	%g6,	[%l7 + %l5] 0x81
	nop
	set	0x78, %i4
	std	%o0,	[%l7 + %i4]
	nop
	set	0x70, %i2
	swap	[%l7 + %i2],	%l3
	set	0x54, %o2
	stha	%o2,	[%l7 + %o2] 0x88
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x81,	%l0
	st	%f28,	[%l7 + 0x64]
	ld	[%l7 + 0x20],	%f21
	st	%f3,	[%l7 + 0x34]
	nop
	set	0x18, %o1
	swap	[%l7 + %o1],	%i4
	nop
	set	0x74, %g7
	ldub	[%l7 + %g7],	%l4
	set	0x58, %l3
	lda	[%l7 + %l3] 0x88,	%f17
	nop
	set	0x1B, %o6
	stb	%g5,	[%l7 + %o6]
	or	%l6,	%l2,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%i7
	nop
	set	0x24, %i5
	prefetch	[%l7 + %i5],	 3
	set	0x0C, %g3
	sta	%f29,	[%l7 + %g3] 0x80
	set	0x4D, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o3
	nop
	set	0x30, %o0
	ldstub	[%l7 + %o0],	%i3
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xeb,	%o6
	set	0x40, %g4
	swapa	[%l7 + %g4] 0x89,	%g6
	nop
	set	0x10, %g2
	std	%f12,	[%l7 + %g2]
	st	%f21,	[%l7 + 0x58]
	nop
	set	0x23, %l4
	ldub	[%l7 + %l4],	%g4
	set	0x37, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i2
	nop
	set	0x6E, %l6
	sth	%o6,	[%l7 + %l6]
	set	0x08, %l2
	stxa	%g2,	[%l7 + %l2] 0x88
	ld	[%l7 + 0x44],	%f8
	and	%l5,	%g1,	%i6
	nop
	set	0x38, %o4
	std	%o4,	[%l7 + %o4]
	set	0x48, %g6
	sta	%f6,	[%l7 + %g6] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%o0
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x80,	%o5
	nop
	set	0x6C, %i7
	lduw	[%l7 + %i7],	%i1
	nop
	set	0x44, %o5
	stw	%l1,	[%l7 + %o5]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%f0
	set	0x39, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o1
	nop
	set	0x5B, %o7
	stb	%l3,	[%l7 + %o7]
	nop
	set	0x68, %l1
	ldsw	[%l7 + %l1],	%o2
	nop
	set	0x58, %l5
	std	%f22,	[%l7 + %l5]
	set	0x6C, %i4
	stba	%g7,	[%l7 + %i4] 0x81
	set	0x7F, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l0
	nop
	set	0x74, %g5
	ldsh	[%l7 + %g5],	%l4
	nop
	set	0x58, %i2
	ldsw	[%l7 + %i2],	%g5
	fpadd32s	%f7,	%f16,	%f5
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x10, %g7
	sta	%f25,	[%l7 + %g7] 0x89
	nop
	set	0x29, %l3
	ldstub	[%l7 + %l3],	%i4
	nop
	set	0x6C, %i5
	ldsh	[%l7 + %i5],	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%l2
	nop
	set	0x76, %o6
	sth	%i7,	[%l7 + %o6]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	add	%g3,	%i3,	%o3
	nop
	set	0x66, %o0
	ldstub	[%l7 + %o0],	%g6
	and	%o7,	%g4,	%o6
	and	%i2,	%l5,	%g2
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x88,	%g0
	nop
	set	0x4F, %o3
	stb	%o4,	[%l7 + %o3]
	set	0x1C, %g4
	sta	%f30,	[%l7 + %g4] 0x88
	set	0x68, %l4
	stda	%i4,	[%l7 + %l4] 0x80
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%o0
	nop
	set	0x5E, %l6
	ldsh	[%l7 + %l6],	%o5
	set	0x2B, %l2
	stba	%i6,	[%l7 + %l2] 0x81
	and	%i1,	%l1,	%o1
	set	0x42, %g1
	stha	%l3,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc8
	nop
	set	0x54, %i6
	lduw	[%l7 + %i6],	%g7
	nop
	set	0x59, %o4
	ldsb	[%l7 + %o4],	%l0
	nop
	set	0x75, %o5
	ldub	[%l7 + %o5],	%o2
	nop
	set	0x1D, %i7
	stb	%l4,	[%l7 + %i7]
	nop
	set	0x48, %i3
	prefetch	[%l7 + %i3],	 1
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc0
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%g4
	nop
	nop
	setx	0xB21D724CE0E6130C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x5904765B129BED23,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f26,	%f8
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0
	nop
	set	0x5A, %l5
	sth	%i0,	[%l7 + %l5]
	set	0x14, %l1
	lda	[%l7 + %l1] 0x81,	%f1
	ld	[%l7 + 0x40],	%f12
	nop
	set	0x68, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x34, %g5
	swap	[%l7 + %g5],	%l6
	nop
	set	0x68, %i2
	prefetch	[%l7 + %i2],	 4
	or	%l2,	%i7,	%i3
	be,a,pt	%icc,	loop_94
	nop
	set	0x48, %o1
	stw	%o3,	[%l7 + %o1]
	set	0x18, %o2
	stda	%g6,	[%l7 + %o2] 0xeb
	membar	#Sync
loop_94:
	nop
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf0,	%f16
	set	0x68, %l3
	swapa	[%l7 + %l3] 0x89,	%o7
	st	%f3,	[%l7 + 0x14]
	nop
	nop
	setx	0xFC1CB4BEEEAA25C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x415BA6A6CC6C824A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f10
	nop
	set	0x49, %i5
	ldub	[%l7 + %i5],	%g4
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%f30
	nop
	set	0x18, %g3
	ldsh	[%l7 + %g3],	%g3
	or	%o6,	%i2,	%g2
	ld	[%l7 + 0x6C],	%f20
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc4
	nop
	set	0x18, %o3
	std	%f24,	[%l7 + %o3]
	nop
	set	0x50, %i1
	ldsw	[%l7 + %i1],	%g1
	wr	%o4,	%i5,	%clear_softint
	nop
	set	0x74, %g4
	stw	%l5,	[%l7 + %g4]
	set	0x18, %l4
	stda	%o4,	[%l7 + %l4] 0x89
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xeb,	%i6
	nop
	set	0x78, %g2
	std	%f6,	[%l7 + %g2]
	nop
	set	0x70, %l2
	sth	%o0,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x4A, %g6
	ldub	[%l7 + %g6],	%i1
	set	0x30, %g1
	stha	%l1,	[%l7 + %g1] 0x89
	set	0x38, %o4
	stba	%l3,	[%l7 + %o4] 0x80
	nop
	set	0x48, %i6
	ldstub	[%l7 + %i6],	%g7
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f30
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f16
	set	0x38, %o5
	lda	[%l7 + %o5] 0x89,	%f26
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%l0
	nop
	set	0x2D, %o7
	ldub	[%l7 + %o7],	%o1
	st	%f26,	[%l7 + 0x2C]
	nop
	set	0x37, %i0
	ldstub	[%l7 + %i0],	%l4
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x2E, %i4
	ldsh	[%l7 + %i4],	%g5
	nop
	set	0x16, %g5
	ldsh	[%l7 + %g5],	%o2
	add	%i0,	%i4,	%l6
	nop
	set	0x28, %l1
	std	%i6,	[%l7 + %l1]
	set	0x6C, %i2
	sta	%f29,	[%l7 + %i2] 0x88
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x81,	%i2
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x88,	%l2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%g6
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x89,	%f7
	nop
	set	0x78, %l3
	ldstub	[%l7 + %l3],	%g4
	set	0x3C, %i5
	sta	%f2,	[%l7 + %i5] 0x81
	nop
	set	0x0C, %o6
	ldsw	[%l7 + %o6],	%o7
	ld	[%l7 + 0x5C],	%f27
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f12
	nop
	set	0x32, %g3
	sth	%o6,	[%l7 + %g3]
	st	%f21,	[%l7 + 0x78]
	set	0x78, %i1
	stda	%g2,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x20, %g4
	ldxa	[%l7 + %g4] 0x88,	%g2
	set	0x5C, %o3
	lda	[%l7 + %o3] 0x80,	%f22
	nop
	set	0x3C, %l4
	ldsw	[%l7 + %l4],	%g1
	nop
	set	0x78, %g2
	stw	%i2,	[%l7 + %g2]
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%o4
	be,pt	%xcc,	loop_95
	nop
	set	0x70, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x6A, %g6
	lduh	[%l7 + %g6],	%i5
	nop
	set	0x63, %g1
	ldsb	[%l7 + %g1],	%o5
loop_95:
	st	%f25,	[%l7 + 0x38]
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x12, %i6
	ldub	[%l7 + %i6],	%i6
	nop
	set	0x50, %i7
	swap	[%l7 + %i7],	%o0
	nop
	set	0x60, %i3
	std	%i0,	[%l7 + %i3]
	nop
	set	0x31, %l0
	stb	%l1,	[%l7 + %l0]
	st	%f6,	[%l7 + 0x10]
	nop
	set	0x7C, %o5
	ldub	[%l7 + %o5],	%l5
	st	%fsr,	[%l7 + 0x68]
	or	%l3,	%l0,	%o1
	nop
	set	0x78, %i0
	stx	%l4,	[%l7 + %i0]
	set	0x30, %l5
	ldda	[%l7 + %l5] 0x81,	%g4
	and	%g7,	%i0,	%i4
	nop
	set	0x30, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f2
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f12
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%i7
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f2
	nop
	set	0x67, %o1
	ldsb	[%l7 + %o1],	%i3
	set	0x6E, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o2
	nop
	set	0x68, %g7
	ldsw	[%l7 + %g7],	%o3
	nop
	set	0x6E, %i2
	ldstub	[%l7 + %i2],	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%o7
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xda
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f28
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x80,	 2
	nop
	set	0x08, %o6
	stx	%g3,	[%l7 + %o6]
	nop
	set	0x10, %g3
	stw	%g2,	[%l7 + %g3]
	nop
	set	0x50, %g4
	std	%f6,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x24]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%i2
	set	0x23, %i1
	ldstuba	[%l7 + %i1] 0x89,	%o6
	nop
	set	0x0D, %l4
	ldsb	[%l7 + %l4],	%i5
	st	%fsr,	[%l7 + 0x5C]
	set	0x48, %o3
	stha	%o5,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xea,	%i6
	and	%o0,	%i1,	%l1
	nop
	set	0x40, %l2
	ldstub	[%l7 + %l2],	%l5
	set	0x60, %g2
	lda	[%l7 + %g2] 0x81,	%f15
	nop
	set	0x70, %g1
	stx	%o4,	[%l7 + %g1]
	nop
	set	0x0C, %o4
	sth	%l3,	[%l7 + %o4]
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	nop
	set	0x40, %i6
	lduw	[%l7 + %i6],	%o1
	set	0x60, %i3
	lda	[%l7 + %i3] 0x80,	%f28
	set	0x35, %i7
	ldstuba	[%l7 + %i7] 0x80,	%g5
	add	%g7,	%l4,	%i0
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f16
	set	0x70, %o5
	ldda	[%l7 + %o5] 0xeb,	%i6
	bl	%icc,	loop_96
	nop
	set	0x14, %i0
	ldub	[%l7 + %i0],	%i7
	set	0x50, %o7
	stda	%i4,	[%l7 + %o7] 0xea
	membar	#Sync
loop_96:
	nop
	set	0x58, %g5
	prefetch	[%l7 + %g5],	 0
	set	0x34, %l1
	sta	%f6,	[%l7 + %l1] 0x88
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x89,	 3
	wr	%o3,	%l2,	%softint
	nop
	set	0x60, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x1D, %o2
	ldstuba	[%l7 + %o2] 0x89,	%g4
	nop
	set	0x18, %o1
	stx	%o7,	[%l7 + %o1]
	ba	%xcc,	loop_97
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%g6
	nop
	set	0x40, %i5
	std	%f30,	[%l7 + %i5]
	set	0x50, %l3
	sta	%f17,	[%l7 + %l3] 0x81
loop_97:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xED4, 	%sys_tick_cmpr
	nop
	set	0x50, %o0
	ldx	[%l7 + %o0],	%g3
	nop
	nop
	setx	0x99AE18B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x2EA5CB42,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f16,	%f28
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%g0
	ld	[%l7 + 0x08],	%f27
	nop
	set	0x4B, %g3
	ldstub	[%l7 + %g3],	%i2
	set	0x20, %o6
	ldxa	[%l7 + %o6] 0x80,	%i5
	nop
	set	0x08, %g4
	std	%o4,	[%l7 + %g4]
	set	0x68, %l4
	stwa	%i6,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%o6
	nop
	set	0x58, %o3
	lduw	[%l7 + %o3],	%o0
	nop
	set	0x68, %l6
	stw	%i1,	[%l7 + %l6]
	nop
	set	0x20, %g2
	stb	%l1,	[%l7 + %g2]
	nop
	set	0x38, %g1
	swap	[%l7 + %g1],	%l5
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xe2,	%l2
	set	0x3C, %g6
	stwa	%l0,	[%l7 + %g6] 0x80
	set	0x60, %i6
	ldda	[%l7 + %i6] 0x88,	%o4
	set	0x32, %l2
	stba	%o1,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x78, %i3
	std	%f22,	[%l7 + %i3]
	set	0x18, %i7
	lda	[%l7 + %i7] 0x88,	%f20
	set	0x48, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0
	nop
	set	0x0C, %i0
	swap	[%l7 + %i0],	%l4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%l6
	nop
	set	0x50, %o7
	std	%g6,	[%l7 + %o7]
	ld	[%l7 + 0x0C],	%f8
	nop
	set	0x61, %g5
	ldstub	[%l7 + %g5],	%i7
	set	0x5C, %o5
	swapa	[%l7 + %o5] 0x80,	%i3
	nop
	set	0x40, %l1
	std	%o2,	[%l7 + %l1]
	set	0x15, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i4
	nop
	set	0x70, %i4
	std	%f2,	[%l7 + %i4]
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%g4
	and	%l2,	%o7,	%g6
	nop
	set	0x64, %o1
	ldsw	[%l7 + %o1],	%g2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f16
	set	0x1E, %g7
	stba	%o2,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x12, %l3
	stb	%g3,	[%l7 + %l3]
	nop
	set	0x48, %o0
	std	%f30,	[%l7 + %o0]
	set	0x18, %g3
	stwa	%i2,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x7E, %o6
	lduh	[%l7 + %o6],	%i5
	wr	%o5,	%g1,	%sys_tick
	st	%f24,	[%l7 + 0x30]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%i6
	set	0x2A, %g4
	stha	%o0,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x38, %i2
	ldxa	[%l7 + %i2] 0x88,	%l1
	nop
	set	0x53, %i1
	stb	%l5,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x2C]
	ba,pt	%xcc,	loop_98
	nop
	set	0x2A, %o3
	ldsh	[%l7 + %o3],	%i1
	nop
	set	0x6E, %l4
	ldub	[%l7 + %l4],	%l0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%l3
loop_98:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%l4
	nop
	set	0x40, %l6
	swap	[%l7 + %l6],	%g5
	nop
	set	0x60, %g2
	stw	%i0,	[%l7 + %g2]
	set	0x58, %o4
	swapa	[%l7 + %o4] 0x89,	%l6
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x56, %g6
	ldsh	[%l7 + %g6],	%i7
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf9
	membar	#Sync
	set	0x7C, %i6
	stha	%g7,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x48, %i3
	stda	%i2,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x7E, %i7
	ldstub	[%l7 + %i7],	%i4
	fpadd16	%f20,	%f0,	%f12
	fpsub16s	%f24,	%f17,	%f4
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%f24
	nop
	set	0x2C, %l0
	lduw	[%l7 + %l0],	%g4
	set	0x2C, %i0
	stwa	%l2,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x41, %o7
	ldsb	[%l7 + %o7],	%o3
	or	%g6,	%g2,	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%o2
	nop
	set	0x2C, %g5
	ldsw	[%l7 + %g5],	%i2
	set	0x78, %o5
	stha	%i5,	[%l7 + %o5] 0x89
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%o5
	add	%o6,	%g1,	%i6
	set	0x24, %i4
	stha	%o0,	[%l7 + %i4] 0x88
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x88,	%l5
	add	%l1,	%i1,	%o4
	set	0x28, %o2
	swapa	[%l7 + %o2] 0x81,	%l0
	nop
	set	0x40, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x16, %g7
	lduh	[%l7 + %g7],	%l3
	set	0x38, %i5
	lda	[%l7 + %i5] 0x88,	%f28
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	wr	%l4,	%g5,	%softint
	set	0x7C, %g3
	stha	%i0,	[%l7 + %g3] 0x81
	set	0x5C, %l3
	sta	%f13,	[%l7 + %l3] 0x88
	st	%f17,	[%l7 + 0x54]
	add	%o1,	%l6,	%i7
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x38, %o6
	std	%f0,	[%l7 + %o6]
	nop
	set	0x40, %g4
	lduh	[%l7 + %g4],	%i3
	and	%g7,	%g4,	%l2
	add	%i4,	%g6,	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%g3
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%o2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f16
	set	0x0C, %l4
	stwa	%i2,	[%l7 + %l4] 0x81
	and	%o7,	%i5,	%o5
	or	%g1,	%o6,	%i6
	set	0x34, %l6
	lda	[%l7 + %l6] 0x81,	%f11
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x89,	 1
	wr	%o0,	%i1,	%pic
	nop
	set	0x38, %o4
	stx	%o4,	[%l7 + %o4]
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%l0
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%l2
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x24, %g1
	stw	%g5,	[%l7 + %g1]
	nop
	set	0x18, %i3
	ldsw	[%l7 + %i3],	%i0
	nop
	set	0x60, %i6
	stw	%l6,	[%l7 + %i6]
	nop
	set	0x20, %l2
	ldsw	[%l7 + %l2],	%o1
	nop
	set	0x70, %l0
	ldsw	[%l7 + %l0],	%i7
	set	0x44, %i7
	stwa	%g7,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x80,	%i3
	nop
	set	0x10, %g5
	swap	[%l7 + %g5],	%l2
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%g4
	set	0x68, %o5
	sta	%f22,	[%l7 + %o5] 0x80
	set	0x14, %i4
	sta	%f2,	[%l7 + %i4] 0x89
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f0
	set	0x3C, %o1
	sta	%f21,	[%l7 + %o1] 0x89
	nop
	set	0x2C, %o2
	ldstub	[%l7 + %o2],	%g6
	nop
	set	0x1B, %g7
	ldstub	[%l7 + %g7],	%g2
	set	0x68, %o0
	sta	%f5,	[%l7 + %o0] 0x80
	nop
	set	0x6E, %g3
	stb	%o3,	[%l7 + %g3]
	nop
	set	0x20, %i5
	lduw	[%l7 + %i5],	%g3
	fpsub16s	%f2,	%f28,	%f18
	nop
	set	0x18, %l3
	stx	%o2,	[%l7 + %l3]
	nop
	set	0x08, %g4
	stx	%i2,	[%l7 + %g4]
	set	0x48, %o6
	stwa	%o7,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f0
	or	%i5,	%i4,	%o5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%i6
	or	%o6,	%l5,	%o0
	set	0x38, %l4
	stda	%o4,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x34, %l6
	stb	%i1,	[%l7 + %l6]
	set	0x40, %o3
	sta	%f25,	[%l7 + %o3] 0x80
	ld	[%l7 + 0x34],	%f1
	set	0x37, %i2
	stba	%l3,	[%l7 + %i2] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x5C]
	set	0x34, %o4
	stwa	%l0,	[%l7 + %o4] 0x81
	set	0x70, %g6
	stwa	%l1,	[%l7 + %g6] 0x88
	set	0x2E, %g1
	stha	%l4,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x1A, %g2
	sth	%i0,	[%l7 + %g2]
	nop
	set	0x35, %i6
	stb	%g5,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x38, %i3
	std	%o0,	[%l7 + %i3]
	nop
	set	0x7C, %l0
	ldstub	[%l7 + %l0],	%l6
	st	%f19,	[%l7 + 0x44]
	set	0x6C, %l2
	stba	%g7,	[%l7 + %l2] 0xe3
	membar	#Sync
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1273
!	Type a   	: 36
!	Type cti   	: 23
!	Type x   	: 533
!	Type f   	: 28
!	Type i   	: 107
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 4 Start
!
.global thread_4
thread_4:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0x2,	%g2
	set	0x3,	%g3
	set	0xC,	%g4
	set	0xD,	%g5
	set	0x6,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x2,	%i1
	set	-0x2,	%i2
	set	-0x5,	%i3
	set	-0x8,	%i4
	set	-0x2,	%i5
	set	-0x3,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x24F1AF01,	%l0
	set	0x5C922699,	%l1
	set	0x565466EE,	%l2
	set	0x0C19FC53,	%l3
	set	0x6B7E6432,	%l4
	set	0x570FEF6C,	%l5
	set	0x59563000,	%l6
	!# Output registers
	set	0x1CB4,	%o0
	set	0x15CA,	%o1
	set	0x036F,	%o2
	set	0x0AA6,	%o3
	set	-0x05DE,	%o4
	set	0x09DB,	%o5
	set	0x18B0,	%o6
	set	-0x1C63,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA52B36A3745B7D0F)
	INIT_TH_FP_REG(%l7,%f2,0xF56E0DA3B90577AE)
	INIT_TH_FP_REG(%l7,%f4,0x402D7DAC36E9E004)
	INIT_TH_FP_REG(%l7,%f6,0x3E7BF54684D0E162)
	INIT_TH_FP_REG(%l7,%f8,0x28D8FFEFD3AADC85)
	INIT_TH_FP_REG(%l7,%f10,0xCB7B13CDA6BF8DEA)
	INIT_TH_FP_REG(%l7,%f12,0xFBE4579F62424EC9)
	INIT_TH_FP_REG(%l7,%f14,0x0803BB4F6DA96F25)
	INIT_TH_FP_REG(%l7,%f16,0x8C8CF0668AFE08A2)
	INIT_TH_FP_REG(%l7,%f18,0xA553375C4CDAC316)
	INIT_TH_FP_REG(%l7,%f20,0x08DDCB6D2CEAA72B)
	INIT_TH_FP_REG(%l7,%f22,0x33B2375325954A03)
	INIT_TH_FP_REG(%l7,%f24,0xBE22DBBDCE6BB10C)
	INIT_TH_FP_REG(%l7,%f26,0xD5B7E828433B5701)
	INIT_TH_FP_REG(%l7,%f28,0xEE1A081B36C4A381)
	INIT_TH_FP_REG(%l7,%f30,0xB3D02AD26C75010E)

	!# Execute Main Diag ..

	or	%i3,	%i7,	%g4
	nop
	set	0x5D, %i0
	ldstub	[%l7 + %i0],	%l2
	and	%g2,	%o3,	%g3
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xd0
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x20, %l1
	swapa	[%l7 + %l1] 0x88,	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%g6
	nop
	set	0x3C, %o5
	ldsh	[%l7 + %o5],	%i5
	st	%f0,	[%l7 + 0x40]
	nop
	set	0x58, %o7
	std	%f20,	[%l7 + %o7]
	nop
	set	0x70, %i4
	stx	%fsr,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x24]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x1E, %o1
	ldsb	[%l7 + %o1],	%i4
	nop
	set	0x6E, %l5
	ldub	[%l7 + %l5],	%o7
	nop
	set	0x1C, %g7
	ldsh	[%l7 + %g7],	%o5
	nop
	set	0x08, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%i6
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%g0
	set	0x10, %l3
	stxa	%o6,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x39, %g4
	ldub	[%l7 + %g4],	%o0
	st	%fsr,	[%l7 + 0x20]
	or	%o4,	%l5,	%i1
	nop
	set	0x74, %o6
	ldsw	[%l7 + %o6],	%l0
	set	0x70, %i1
	stxa	%l1,	[%l7 + %i1] 0x80
	ld	[%l7 + 0x20],	%f7
	set	0x2F, %i5
	stba	%l4,	[%l7 + %i5] 0x80
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f12
	set	0x1A, %l4
	stha	%l3,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x30, %i2
	ldxa	[%l7 + %i2] 0x81,	%g5
	add	%i0,	%o1,	%l6
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%g7
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x81,	%i3
	nop
	set	0x44, %g1
	ldsw	[%l7 + %g1],	%i7
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%l2
	st	%fsr,	[%l7 + 0x18]
	add	%g4,	%o3,	%g3
	st	%f23,	[%l7 + 0x50]
	set	0x6D, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o2
	add	%i2,	%g2,	%i5
	ld	[%l7 + 0x1C],	%f2
	set	0x78, %i3
	stba	%g6,	[%l7 + %i3] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f0
	fpsub16s	%f15,	%f10,	%f0
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f16
	set	0x50, %l2
	stwa	%i4,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x20, %i7
	ldda	[%l7 + %i7] 0xea,	%o6
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf8
	membar	#Sync
	or	%i6,	%g1,	%o5
	nop
	set	0x68, %g5
	std	%f8,	[%l7 + %g5]
	nop
	set	0x42, %l1
	lduh	[%l7 + %l1],	%o6
	or	%o0,	%o4,	%i1
	and	%l5,	%l1,	%l0
	st	%f2,	[%l7 + 0x20]
	set	0x50, %o7
	ldda	[%l7 + %o7] 0xea,	%l2
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%l4
	nop
	set	0x54, %o1
	lduw	[%l7 + %o1],	%i0
	nop
	set	0x40, %i4
	prefetch	[%l7 + %i4],	 2
	st	%fsr,	[%l7 + 0x70]
	set	0x30, %g7
	stda	%g4,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%o1
	nop
	set	0x14, %l5
	swap	[%l7 + %l5],	%g7
	ld	[%l7 + 0x2C],	%f4
	nop
	set	0x50, %o2
	prefetch	[%l7 + %o2],	 2
	set	0x14, %g3
	stha	%i3,	[%l7 + %g3] 0x89
	nop
	set	0x18, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x50, %o6
	std	%f16,	[%l7 + %o6]
	set	0x58, %g4
	stda	%i6,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x40, %i1
	swapa	[%l7 + %i1] 0x89,	%g4
	set	0x30, %i5
	stwa	%o3,	[%l7 + %i5] 0x88
	nop
	set	0x4C, %l6
	sth	%g3,	[%l7 + %l6]
	nop
	set	0x30, %l4
	std	%o2,	[%l7 + %l4]
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%i2
	nop
	set	0x22, %o3
	sth	%l2,	[%l7 + %o3]
	fpsub16	%f2,	%f28,	%f12
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%i4
	nop
	set	0x58, %g6
	ldsw	[%l7 + %g6],	%g2
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x89,	 3
	nop
	set	0x16, %g1
	ldub	[%l7 + %g1],	%g6
	nop
	set	0x30, %i3
	sth	%o7,	[%l7 + %i3]
	nop
	set	0x70, %g2
	std	%g0,	[%l7 + %g2]
	set	0x30, %l2
	stxa	%i6,	[%l7 + %l2] 0xea
	membar	#Sync
	add	%o5,	%o0,	%o6
	nop
	set	0x6C, %i7
	ldsb	[%l7 + %i7],	%o4
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f6
	nop
	set	0x60, %g5
	std	%l4,	[%l7 + %g5]
	add	%l1,	%i1,	%l0
	nop
	set	0x40, %l0
	lduw	[%l7 + %l0],	%l3
	set	0x28, %l1
	stda	%i0,	[%l7 + %l1] 0x88
	set	0x7E, %o7
	stha	%g5,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x14, %o5
	lduw	[%l7 + %o5],	%l4
	nop
	set	0x67, %i4
	ldub	[%l7 + %i4],	%o1
	nop
	nop
	setx	0xCBF36C563B9AA3F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD6AD418B11DD9642,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f16,	%f28
	nop
	set	0x60, %g7
	stw	%i3,	[%l7 + %g7]
	nop
	set	0x28, %o1
	ldsb	[%l7 + %o1],	%g7
	set	0x37, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i7
	nop
	set	0x51, %l5
	stb	%g4,	[%l7 + %l5]
	set	0x18, %o2
	ldxa	[%l7 + %o2] 0x89,	%o3
	set	0x38, %g3
	swapa	[%l7 + %g3] 0x80,	%l6
	st	%fsr,	[%l7 + 0x3C]
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x88,	%g2
	set	0x38, %i1
	stxa	%i2,	[%l7 + %i1] 0x80
	ld	[%l7 + 0x1C],	%f4
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x7C, %l6
	swapa	[%l7 + %l6] 0x88,	%l2
	nop
	set	0x64, %l4
	sth	%g2,	[%l7 + %l4]
	nop
	set	0x6C, %g4
	stw	%i4,	[%l7 + %g4]
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f26
	nop
	set	0x60, %i2
	ldsw	[%l7 + %i2],	%g6
	nop
	set	0x2E, %o4
	stb	%i5,	[%l7 + %o4]
	nop
	set	0x30, %g6
	lduw	[%l7 + %g6],	%g1
	nop
	set	0x50, %i6
	lduh	[%l7 + %i6],	%i6
	nop
	set	0x31, %i3
	ldsb	[%l7 + %i3],	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o7
	nop
	set	0x18, %g2
	stw	%o6,	[%l7 + %g2]
	set	0x50, %l2
	swapa	[%l7 + %l2] 0x89,	%l5
	bgu	%xcc,	loop_99
	nop
	set	0x68, %i7
	std	%f8,	[%l7 + %i7]
	set	0x10, %g1
	swapa	[%l7 + %g1] 0x89,	%o4
loop_99:
	nop
	set	0x10, %g5
	prefetch	[%l7 + %g5],	 0
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f16
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%l1
	set	0x08, %o7
	ldxa	[%l7 + %o7] 0x81,	%i1
	and	%l3,	%l0,	%i0
	set	0x44, %o5
	stha	%l4,	[%l7 + %o5] 0x89
	nop
	set	0x4C, %i4
	lduh	[%l7 + %i4],	%o1
	add	%g5,	%g7,	%i3
	nop
	set	0x1C, %l0
	stb	%i7,	[%l7 + %l0]
	nop
	set	0x40, %g7
	prefetch	[%l7 + %g7],	 4
	nop
	set	0x78, %o0
	lduw	[%l7 + %o0],	%g4
	nop
	set	0x5C, %o1
	ldsb	[%l7 + %o1],	%o3
	nop
	set	0x5C, %l5
	lduh	[%l7 + %l5],	%o2
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%l6
	nop
	set	0x4C, %l3
	stb	%g3,	[%l7 + %l3]
	set	0x20, %o6
	sta	%f1,	[%l7 + %o6] 0x81
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%l2
	nop
	set	0x26, %g3
	lduh	[%l7 + %g3],	%i4
	set	0x38, %i1
	stwa	%g2,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xea,	%g6
	nop
	set	0x57, %i5
	stb	%g1,	[%l7 + %i5]
	add	%i5,	%o5,	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%o7
	ld	[%l7 + 0x64],	%f14
	st	%fsr,	[%l7 + 0x0C]
	set	0x20, %l4
	stxa	%o6,	[%l7 + %l4] 0x81
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f8
	wr	%l5,	%o4,	%y
	set	0x5C, %o3
	lda	[%l7 + %o3] 0x80,	%f23
	set	0x3F, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i1
	set	0x08, %g6
	ldxa	[%l7 + %g6] 0x88,	%l1
	set	0x48, %o4
	stda	%l0,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x30, %i6
	ldx	[%l7 + %i6],	%l3
	and	%l4,	%o1,	%i0
	nop
	set	0x74, %g2
	ldsw	[%l7 + %g2],	%g5
	ld	[%l7 + 0x48],	%f22
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%g7
	set	0x58, %i3
	ldxa	[%l7 + %i3] 0x89,	%g4
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x40, %l2
	ldx	[%l7 + %l2],	%o3
	nop
	set	0x79, %g1
	ldstub	[%l7 + %g1],	%o2
	nop
	set	0x50, %g5
	std	%f8,	[%l7 + %g5]
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%i6
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%i7
	nop
	set	0x4C, %l1
	ldsh	[%l7 + %l1],	%g3
	set	0x28, %o7
	ldxa	[%l7 + %o7] 0x81,	%i2
	ld	[%l7 + 0x7C],	%f17
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%g2
	set	0x38, %o5
	lda	[%l7 + %o5] 0x88,	%f9
	nop
	set	0x18, %l0
	ldsw	[%l7 + %l0],	%g6
	set	0x70, %i4
	stha	%g1,	[%l7 + %i4] 0x89
	nop
	set	0x58, %o0
	ldub	[%l7 + %o0],	%l2
	nop
	set	0x48, %o1
	stx	%i5,	[%l7 + %o1]
	nop
	set	0x7C, %g7
	ldsb	[%l7 + %g7],	%o5
	set	0x10, %l5
	lda	[%l7 + %l5] 0x80,	%f25
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd0,	%f16
	nop
	set	0x68, %l3
	std	%o0,	[%l7 + %l3]
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0
	set	0x58, %o6
	stda	%o6,	[%l7 + %o6] 0x88
	set	0x38, %i1
	lda	[%l7 + %i1] 0x80,	%f0
	set	0x1D, %i5
	ldstuba	[%l7 + %i5] 0x89,	%l5
	nop
	set	0x48, %l6
	std	%f14,	[%l7 + %l6]
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x80,	 1
	nop
	set	0x42, %g4
	ldsh	[%l7 + %g4],	%o6
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x58, %g6
	lduw	[%l7 + %g6],	%i1
	nop
	set	0x58, %o3
	ldsh	[%l7 + %o3],	%l0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	st	%f21,	[%l7 + 0x68]
	or	%l3,	%l4,	%l1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o1
	or	%i3,	%g5,	%g7
	or	%o3,	%g4,	%o2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc2
	nop
	set	0x20, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%g2
	set	0x34, %g1
	sta	%f8,	[%l7 + %g1] 0x81
	nop
	set	0x18, %g5
	std	%f16,	[%l7 + %g5]
	or	%i7,	%i4,	%g2
	set	0x26, %i7
	stha	%i2,	[%l7 + %i7] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%g1
	ld	[%l7 + 0x54],	%f10
	nop
	set	0x64, %l1
	swap	[%l7 + %l1],	%g6
	and	%i5,	%l2,	%o5
	add	%i6,	%o7,	%l5
	nop
	set	0x54, %o7
	lduw	[%l7 + %o7],	%o4
	set	0x20, %l0
	ldxa	[%l7 + %l0] 0x88,	%o6
	st	%fsr,	[%l7 + 0x10]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%f16
	nop
	set	0x3E, %i4
	ldsh	[%l7 + %i4],	%i1
	nop
	set	0x1C, %o0
	sth	%l0,	[%l7 + %o0]
	nop
	set	0x37, %g7
	ldub	[%l7 + %g7],	%o0
	set	0x40, %l5
	lda	[%l7 + %l5] 0x81,	%f3
	ld	[%l7 + 0x2C],	%f0
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%l3
	nop
	set	0x28, %o1
	ldstub	[%l7 + %o1],	%l4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x88
	nop
	set	0x4E, %g3
	ldstub	[%l7 + %g3],	%l1
	and	%o1,	%i3,	%g5
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x80,	%g6
	nop
	set	0x6C, %i5
	ldstub	[%l7 + %i5],	%o3
	and	%g4,	%i0,	%o2
	add	%g3,	%i7,	%l6
	nop
	set	0x50, %i1
	std	%i4,	[%l7 + %i1]
	set	0x6C, %l6
	stba	%g2,	[%l7 + %l6] 0x88
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x88,	%i2
	set	0x10, %i2
	stwa	%g6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%g1
	nop
	set	0x34, %o3
	stw	%o5,	[%l7 + %o3]
	add	%l2,	%o7,	%l5
	nop
	set	0x28, %o4
	std	%i6,	[%l7 + %o4]
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x89,	 2
	set	0x16, %i6
	stba	%o4,	[%l7 + %i6] 0x88
	or	%i1,	%l0,	%l3
	nop
	set	0x3C, %l2
	stb	%l4,	[%l7 + %l2]
	set	0x68, %g2
	stda	%l0,	[%l7 + %g2] 0x89
	nop
	set	0x10, %g5
	ldx	[%l7 + %g5],	%o0
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xea,	%i2
	add	%o1,	%g5,	%g7
	nop
	set	0x50, %i0
	std	%o2,	[%l7 + %i0]
	nop
	set	0x1C, %g1
	stw	%i0,	[%l7 + %g1]
	set	0x34, %l1
	sta	%f14,	[%l7 + %l1] 0x89
	ld	[%l7 + 0x60],	%f14
	set	0x38, %i3
	swapa	[%l7 + %i3] 0x89,	%o2
	nop
	set	0x48, %l0
	stw	%g3,	[%l7 + %l0]
	nop
	set	0x48, %o5
	stx	%g4,	[%l7 + %o5]
	set	0x09, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i7
	nop
	set	0x40, %o0
	std	%f24,	[%l7 + %o0]
	nop
	set	0x64, %g7
	lduw	[%l7 + %g7],	%i4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%l6
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%g6
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf1,	%f16
	set	0x5F, %o2
	stba	%i5,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x7C, %o1
	swap	[%l7 + %o1],	%g1
	set	0x10, %l3
	swapa	[%l7 + %l3] 0x80,	%i2
	ld	[%l7 + 0x08],	%f31
	nop
	set	0x54, %o6
	swap	[%l7 + %o6],	%o5
	set	0x08, %i5
	stda	%l2,	[%l7 + %i5] 0x80
	nop
	set	0x74, %i1
	lduh	[%l7 + %i1],	%o7
	nop
	set	0x5C, %g3
	sth	%i6,	[%l7 + %g3]
	nop
	set	0x3A, %l6
	sth	%o6,	[%l7 + %l6]
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x81,	%l5
	set	0x38, %l4
	stxa	%i1,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x50, %g4
	std	%o4,	[%l7 + %g4]
	nop
	set	0x63, %o3
	stb	%l0,	[%l7 + %o3]
	nop
	set	0x78, %o4
	lduh	[%l7 + %o4],	%l4
	wr	%l1,	%o0,	%clear_softint
	nop
	set	0x64, %i6
	stw	%i3,	[%l7 + %i6]
	nop
	set	0x14, %l2
	ldsh	[%l7 + %l2],	%l3
	set	0x2F, %g6
	ldstuba	[%l7 + %g6] 0x89,	%o1
	wr	%g5,	%g7,	%pic
	set	0x4C, %g2
	stwa	%i0,	[%l7 + %g2] 0x80
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x80,	%o2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%g3
	nop
	set	0x38, %i0
	std	%i6,	[%l7 + %i0]
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x80,	 3
	nop
	set	0x77, %i7
	stb	%i4,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x4C]
	set	0x10, %i3
	stda	%g2,	[%l7 + %i3] 0x88
	or	%l6,	%i5,	%g6
	nop
	set	0x24, %l1
	lduw	[%l7 + %l1],	%g1
	set	0x4D, %o5
	stba	%o5,	[%l7 + %o5] 0x80
	and	%i2,	%o7,	%l2
	set	0x20, %l0
	ldxa	[%l7 + %l0] 0x88,	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i1
	nop
	set	0x5E, %o0
	stb	%o4,	[%l7 + %o0]
	nop
	set	0x64, %g7
	lduw	[%l7 + %g7],	%l0
	nop
	set	0x74, %i4
	ldstub	[%l7 + %i4],	%i6
	nop
	set	0x78, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%l0
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f2
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%l4
	nop
	set	0x50, %l5
	prefetch	[%l7 + %l5],	 2
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f0
	add	%i3,	%l3,	%o1
	set	0x2C, %g3
	swapa	[%l7 + %g3] 0x88,	%g5
	ld	[%l7 + 0x3C],	%f3
	add	%o0,	%i0,	%o3
	set	0x7C, %l6
	swapa	[%l7 + %l6] 0x80,	%o2
	nop
	set	0x7D, %i5
	ldub	[%l7 + %i5],	%g7
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xca
	and	%i7,	%g4,	%g3
	nop
	set	0x40, %i2
	stb	%g2,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x18, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%i4
	nop
	set	0x35, %i6
	stb	%i5,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x0C, %o4
	stw	%l6,	[%l7 + %o4]
	set	0x18, %g6
	lda	[%l7 + %g6] 0x88,	%f15
	nop
	set	0x64, %l2
	prefetch	[%l7 + %l2],	 3
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x88,	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%i2
	st	%f24,	[%l7 + 0x58]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o7,	%o5
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	set	0x4F, %g2
	stba	%o6,	[%l7 + %g2] 0x80
	nop
	set	0x08, %g1
	ldsh	[%l7 + %g1],	%l2
	nop
	set	0x78, %i3
	prefetch	[%l7 + %i3],	 3
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x80,	%i0
	nop
	set	0x0C, %l1
	swap	[%l7 + %l1],	%l5
	nop
	set	0x24, %l0
	ldsh	[%l7 + %l0],	%l0
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f10
	st	%fsr,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%o4
	nop
	set	0x10, %o0
	swap	[%l7 + %o0],	%i6
	set	0x10, %i4
	stha	%l1,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x40, %o2
	ldsw	[%l7 + %o2],	%l4
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%i2
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f12
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x89,	%l3
	or	%g5,	%o1,	%i0
	nop
	set	0x10, %l5
	stx	%o3,	[%l7 + %l5]
	nop
	set	0x08, %o6
	stx	%o2,	[%l7 + %o6]
	set	0x48, %g3
	stha	%o0,	[%l7 + %g3] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x7A, %l6
	ldsh	[%l7 + %l6],	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%g3
	nop
	set	0x40, %i5
	std	%f18,	[%l7 + %i5]
	nop
	set	0x74, %l4
	swap	[%l7 + %l4],	%g2
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%g4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%i4
	nop
	nop
	setx	0x2BD021FE3AD43433,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5566C9DB041BCBE3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f0,	%f24
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xea,	%g0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%i2
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%l6
	nop
	set	0x20, %i6
	lduh	[%l7 + %i6],	%o7
	nop
	set	0x48, %o4
	stx	%o5,	[%l7 + %o4]
	and	%l2,	%i1,	%l5
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f16
	nop
	set	0x28, %i1
	swap	[%l7 + %i1],	%l0
	set	0x68, %l2
	stxa	%o4,	[%l7 + %l2] 0xe3
	membar	#Sync
	or	%o6,	%i6,	%l1
	nop
	set	0x60, %g5
	ldsw	[%l7 + %g5],	%i3
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x80,	%l3
	set	0x5F, %g2
	stba	%g5,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x40, %g1
	stw	%o1,	[%l7 + %g1]
	nop
	set	0x08, %i3
	std	%i0,	[%l7 + %i3]
	set	0x0C, %i7
	sta	%f6,	[%l7 + %i7] 0x80
	nop
	set	0x74, %l1
	ldsw	[%l7 + %l1],	%o3
	wr 	%g0, 	0x6, 	%fprs
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%i7
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f28
	nop
	set	0x68, %g7
	std	%f10,	[%l7 + %g7]
	nop
	set	0x64, %o0
	lduw	[%l7 + %o0],	%g3
	nop
	set	0x70, %l0
	stw	%g7,	[%l7 + %l0]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%g2
	nop
	set	0x3A, %o2
	lduh	[%l7 + %o2],	%i4
	add	%i5,	%g1,	%g6
	or	%l6,	%i2,	%o5
	set	0x50, %o7
	stxa	%l2,	[%l7 + %o7] 0x80
	nop
	set	0x32, %i4
	ldsh	[%l7 + %i4],	%o7
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x30, %l5
	stha	%i1,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x88,	%l5
	nop
	set	0x70, %l3
	std	%f18,	[%l7 + %l3]
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x80,	%l0
	st	%f23,	[%l7 + 0x3C]
	nop
	set	0x3D, %g3
	ldsb	[%l7 + %g3],	%o4
	nop
	set	0x60, %l4
	ldstub	[%l7 + %l4],	%i6
	nop
	set	0x62, %i2
	lduh	[%l7 + %i2],	%o6
	nop
	set	0x40, %i5
	ldsw	[%l7 + %i5],	%i3
	nop
	set	0x70, %o3
	std	%f0,	[%l7 + %o3]
	set	0x49, %i6
	stba	%l1,	[%l7 + %i6] 0x80
	st	%fsr,	[%l7 + 0x10]
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x81,	 1
	st	%fsr,	[%l7 + 0x30]
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x88,	%l3
	set	0x70, %g4
	swapa	[%l7 + %g4] 0x89,	%o1
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%o3
	and	%o2,	%i0,	%o0
	set	0x2B, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i7
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x89,	%g3
	set	0x48, %g2
	stha	%g7,	[%l7 + %g2] 0x80
	st	%f25,	[%l7 + 0x28]
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x89,	%g4
	set	0x60, %i0
	stwa	%l4,	[%l7 + %i0] 0x81
	and	%g2,	%i5,	%g1
	nop
	set	0x3C, %i7
	lduh	[%l7 + %i7],	%i4
	nop
	set	0x58, %i3
	lduh	[%l7 + %i3],	%g6
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%i2
	nop
	set	0x7C, %g7
	lduh	[%l7 + %g7],	%o5
	nop
	set	0x48, %o0
	std	%i6,	[%l7 + %o0]
	nop
	set	0x20, %l0
	ldub	[%l7 + %l0],	%l2
	set	0x71, %l1
	ldstuba	[%l7 + %l1] 0x89,	%i1
	nop
	set	0x74, %o7
	ldstub	[%l7 + %o7],	%l5
	set	0x4E, %i4
	stba	%o7,	[%l7 + %i4] 0x80
	nop
	set	0x11, %o1
	ldstub	[%l7 + %o1],	%o4
	nop
	set	0x38, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x20, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x3C, %l3
	lduw	[%l7 + %l3],	%l0
	set	0x70, %l6
	sta	%f10,	[%l7 + %l6] 0x81
	nop
	set	0x17, %o2
	stb	%i6,	[%l7 + %o2]
	set	0x18, %l4
	prefetcha	[%l7 + %l4] 0x80,	 4
	nop
	set	0x18, %i2
	ldsh	[%l7 + %i2],	%i3
	nop
	set	0x48, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x74, %o3
	lduw	[%l7 + %o3],	%l1
	set	0x38, %g3
	stwa	%l3,	[%l7 + %g3] 0x88
	nop
	set	0x4C, %o4
	lduw	[%l7 + %o4],	%o1
	nop
	set	0x6A, %g6
	ldsh	[%l7 + %g6],	%o3
	nop
	set	0x70, %g4
	ldsw	[%l7 + %g4],	%g5
	nop
	set	0x74, %i6
	lduw	[%l7 + %i6],	%o2
	nop
	set	0x38, %i1
	swap	[%l7 + %i1],	%o0
	add	%i7,	%i0,	%g3
	nop
	set	0x54, %g5
	ldub	[%l7 + %g5],	%g7
	set	0x40, %g2
	sta	%f31,	[%l7 + %g2] 0x81
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x30, %l2
	stba	%l4,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x60, %i7
	ldsw	[%l7 + %i7],	%g4
	set	0x56, %i0
	stha	%g2,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x1C, %i3
	ldstub	[%l7 + %i3],	%i5
	nop
	set	0x7C, %o5
	swap	[%l7 + %o5],	%i4
	wr	%g1,	%i2,	%sys_tick
	nop
	set	0x78, %o0
	ldstub	[%l7 + %o0],	%o5
	set	0x0F, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l6
	set	0x30, %l1
	swapa	[%l7 + %l1] 0x80,	%g6
	nop
	set	0x78, %l0
	stx	%i1,	[%l7 + %l0]
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xe3,	%l4
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x89
	ld	[%l7 + 0x68],	%f23
	set	0x34, %l5
	ldstuba	[%l7 + %l5] 0x88,	%o7
	nop
	set	0x60, %o6
	swap	[%l7 + %o6],	%l2
	set	0x7C, %i4
	lda	[%l7 + %i4] 0x88,	%f10
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xcc
	nop
	set	0x39, %o2
	ldub	[%l7 + %o2],	%l0
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf8
	membar	#Sync
	wr	%i6,	%o4,	%y
	nop
	set	0x60, %l4
	stx	%o6,	[%l7 + %l4]
	fpadd16	%f2,	%f4,	%f14
	st	%f1,	[%l7 + 0x0C]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf0
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x74, %o3
	prefetch	[%l7 + %o3],	 3
	set	0x60, %g3
	stxa	%l1,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x74, %o4
	lduw	[%l7 + %o4],	%i3
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%o1
	set	0x70, %g4
	sta	%f6,	[%l7 + %g4] 0x88
	set	0x68, %i6
	ldxa	[%l7 + %i6] 0x80,	%l3
	nop
	set	0x44, %g6
	ldub	[%l7 + %g6],	%o3
	nop
	set	0x6C, %g5
	stw	%g5,	[%l7 + %g5]
	or	%o2,	%i7,	%o0
	nop
	set	0x18, %i1
	ldub	[%l7 + %i1],	%i0
	nop
	set	0x16, %g1
	sth	%g7,	[%l7 + %g1]
	or	%g3,	%g4,	%g2
	set	0x50, %l2
	ldxa	[%l7 + %l2] 0x81,	%i5
	set	0x20, %i7
	stda	%l4,	[%l7 + %i7] 0x81
	nop
	set	0x6C, %g2
	lduw	[%l7 + %g2],	%i4
	nop
	set	0x20, %i3
	ldstub	[%l7 + %i3],	%g1
	ld	[%l7 + 0x1C],	%f21
	set	0x3E, %i0
	stba	%o5,	[%l7 + %i0] 0xeb
	membar	#Sync
	and	%i2,	%l6,	%g6
	st	%f6,	[%l7 + 0x48]
	set	0x7C, %o5
	stwa	%l5,	[%l7 + %o5] 0x81
	or	%i1,	%l2,	%o7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%o4
	and	%i6,	%l1,	%i3
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%o6
	set	0x10, %o0
	stwa	%l3,	[%l7 + %o0] 0x88
	nop
	set	0x10, %l1
	lduh	[%l7 + %l1],	%o3
	fpadd16	%f24,	%f20,	%f6
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%o1
	set	0x4D, %l0
	ldstuba	[%l7 + %l0] 0x89,	%g5
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f18
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f26
	nop
	set	0x38, %i4
	std	%f20,	[%l7 + %i4]
	set	0x60, %l3
	stda	%o2,	[%l7 + %l3] 0xe2
	membar	#Sync
	and	%o0,	%i0,	%i7
	nop
	set	0x08, %l5
	swap	[%l7 + %l5],	%g7
	nop
	set	0x10, %l6
	std	%f20,	[%l7 + %l6]
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x89,	%g4
	and	%g2,	%i5,	%l4
	st	%fsr,	[%l7 + 0x20]
	bne,pn	%icc,	loop_100
	nop
	set	0x0C, %i2
	ldsw	[%l7 + %i2],	%g3
	nop
	set	0x18, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	nop
	setx	0x7E31E75AEF91C91B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC2CE421CC4C5FCC6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f26,	%f0
loop_100:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%g1
	nop
	set	0x22, %g3
	ldstub	[%l7 + %g3],	%o5
	nop
	set	0x38, %l4
	stw	%i2,	[%l7 + %l4]
	nop
	set	0x34, %i5
	ldsb	[%l7 + %i5],	%g6
	nop
	set	0x7C, %g4
	lduh	[%l7 + %g4],	%l6
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%i0
	ld	[%l7 + 0x4C],	%f7
	set	0x2B, %i6
	stba	%l2,	[%l7 + %i6] 0x89
	nop
	set	0x10, %g5
	swap	[%l7 + %g5],	%o7
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f0
	nop
	set	0x40, %i1
	stw	%l5,	[%l7 + %i1]
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%f22
	fpadd16s	%f24,	%f11,	%f6
	set	0x38, %i7
	sta	%f23,	[%l7 + %i7] 0x88
	st	%fsr,	[%l7 + 0x70]
	set	0x68, %g2
	sta	%f0,	[%l7 + %g2] 0x80
	fpadd16	%f2,	%f16,	%f28
	nop
	set	0x12, %l2
	lduh	[%l7 + %l2],	%o4
	nop
	set	0x0C, %i3
	stw	%l0,	[%l7 + %i3]
	nop
	set	0x6C, %i0
	swap	[%l7 + %i0],	%i6
	nop
	set	0x4C, %o5
	ldsw	[%l7 + %o5],	%l1
	ld	[%l7 + 0x40],	%f21
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x6C, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x80,	%o6
	nop
	set	0x7D, %l1
	stb	%i3,	[%l7 + %l1]
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x1E, %o1
	lduh	[%l7 + %o1],	%l3
	set	0x40, %o6
	stxa	%o1,	[%l7 + %o6] 0x88
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f0
	set	0x3E, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o3
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%f28
	st	%f4,	[%l7 + 0x14]
	nop
	set	0x08, %l6
	ldsh	[%l7 + %l6],	%g5
	nop
	set	0x14, %o2
	ldsh	[%l7 + %o2],	%o0
	add	%i0,	%o2,	%g7
	set	0x28, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	nop
	set	0x5B, %o3
	ldsb	[%l7 + %o3],	%g4
	nop
	set	0x50, %g3
	prefetch	[%l7 + %g3],	 2
	and	%g2,	%i5,	%g3
	nop
	set	0x2C, %l5
	lduw	[%l7 + %l5],	%l4
	set	0x40, %i5
	stxa	%g1,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x19, %g4
	ldub	[%l7 + %g4],	%o5
	st	%f1,	[%l7 + 0x50]
	nop
	set	0x19, %o4
	ldsb	[%l7 + %o4],	%i4
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%g6
	fpadd32s	%f23,	%f11,	%f15
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xea,	%i2
	set	0x5C, %g6
	swapa	[%l7 + %g6] 0x80,	%l6
	st	%f22,	[%l7 + 0x20]
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x81,	 4
	nop
	set	0x67, %g1
	stb	%i1,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x1C]
	fpsub32s	%f21,	%f2,	%f0
	nop
	set	0x70, %i7
	std	%f16,	[%l7 + %i7]
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%l4
	set	0x40, %g2
	prefetcha	[%l7 + %g2] 0x80,	 3
	bleu,a	%icc,	loop_101
	nop
	set	0x49, %i3
	ldsb	[%l7 + %i3],	%o7
	nop
	set	0x4C, %l2
	ldub	[%l7 + %l2],	%i6
	nop
	set	0x60, %o5
	ldsh	[%l7 + %o5],	%l0
loop_101:
	nop
	set	0x08, %o0
	std	%l0,	[%l7 + %o0]
	nop
	set	0x15, %i0
	stb	%o6,	[%l7 + %i0]
	nop
	set	0x59, %g7
	ldstub	[%l7 + %g7],	%i3
	set	0x78, %l0
	stda	%o0,	[%l7 + %l0] 0xe3
	membar	#Sync
	add	%o3,	%l3,	%g5
	nop
	set	0x1E, %l1
	lduh	[%l7 + %l1],	%o0
	ble,pt	%xcc,	loop_102
	st	%f24,	[%l7 + 0x78]
	nop
	set	0x0C, %o6
	swap	[%l7 + %o6],	%i0
	set	0x60, %i4
	ldda	[%l7 + %i4] 0xeb,	%o2
loop_102:
	nop
	set	0x38, %o1
	ldsw	[%l7 + %o1],	%g7
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x74, %l6
	lduw	[%l7 + %l6],	%i7
	nop
	set	0x4D, %l3
	ldub	[%l7 + %l3],	%g4
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x58, %o3
	stx	%g2,	[%l7 + %o3]
	set	0x48, %i2
	lda	[%l7 + %i2] 0x89,	%f1
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf9,	%f16
	nop
	set	0x40, %g3
	ldsw	[%l7 + %g3],	%i5
	ld	[%l7 + 0x64],	%f25
	nop
	set	0x5A, %i5
	stb	%g3,	[%l7 + %i5]
	nop
	set	0x40, %o4
	ldstub	[%l7 + %o4],	%l4
	set	0x68, %g4
	sta	%f10,	[%l7 + %g4] 0x88
	nop
	set	0x6C, %l4
	ldsh	[%l7 + %l4],	%g1
	wr	%i4,	%o5,	%set_softint
	nop
	set	0x18, %g6
	stx	%i2,	[%l7 + %g6]
	set	0x18, %g5
	stda	%g6,	[%l7 + %g5] 0x81
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i1
	set	0x78, %i6
	stxa	%l2,	[%l7 + %i6] 0x81
	nop
	set	0x44, %i7
	ldsh	[%l7 + %i7],	%l5
	wr	%o7,	%i6,	%clear_softint
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x89,	%l0
	nop
	set	0x64, %g2
	stw	%o4,	[%l7 + %g2]
	set	0x19, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l1
	and	%i3,	%o1,	%o3
	set	0x70, %i1
	stwa	%o6,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x74, %o5
	stwa	%l3,	[%l7 + %o5] 0x88
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x89,	%o0
	wr	%i0,	%g5,	%set_softint
	bg	%xcc,	loop_103
	bgu,pt	%xcc,	loop_104
	nop
	set	0x4F, %i0
	ldub	[%l7 + %i0],	%o2
	nop
	set	0x5E, %l2
	ldsh	[%l7 + %l2],	%i7
loop_103:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%g2
loop_104:
	st	%f22,	[%l7 + 0x2C]
	set	0x18, %g7
	stxa	%g4,	[%l7 + %g7] 0xea
	membar	#Sync
	ld	[%l7 + 0x4C],	%f29
	set	0x61, %l0
	ldstuba	[%l7 + %l0] 0x81,	%g3
	nop
	set	0x68, %l1
	prefetch	[%l7 + %l1],	 1
	ld	[%l7 + 0x74],	%f8
	set	0x38, %o6
	lda	[%l7 + %o6] 0x88,	%f26
	nop
	set	0x78, %o1
	swap	[%l7 + %o1],	%i5
	nop
	set	0x74, %i4
	ldsh	[%l7 + %i4],	%g1
	set	0x54, %l6
	lda	[%l7 + %l6] 0x80,	%f26
	nop
	set	0x4D, %o7
	ldstub	[%l7 + %o7],	%l4
	nop
	set	0x66, %l3
	ldstub	[%l7 + %l3],	%o5
	st	%f6,	[%l7 + 0x08]
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x81,	 4
	set	0x32, %i2
	stba	%i2,	[%l7 + %i2] 0xea
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%l5
	set	0x3D, %o2
	stba	%l2,	[%l7 + %o2] 0x88
	nop
	set	0x78, %l5
	stb	%o7,	[%l7 + %l5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%i6
	nop
	set	0x08, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x48, %g3
	lduw	[%l7 + %g3],	%l1
	set	0x1E, %g4
	ldstuba	[%l7 + %g4] 0x81,	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x57F, 	%sys_tick_cmpr
	or	%o6,	%o1,	%o0
	set	0x45, %o4
	stba	%i0,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x74, %l4
	sth	%g5,	[%l7 + %l4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%o2,	%g2,	%g7
	set	0x50, %g6
	ldda	[%l7 + %g6] 0xe2,	%g2
	st	%f15,	[%l7 + 0x18]
	set	0x38, %i6
	sta	%f1,	[%l7 + %i6] 0x89
	nop
	set	0x17, %i7
	ldstub	[%l7 + %i7],	%i5
	wr	%g4,	%g1,	%sys_tick
	nop
	set	0x18, %g1
	std	%f24,	[%l7 + %g1]
	set	0x64, %g5
	lda	[%l7 + %g5] 0x80,	%f29
	add	%o5,	%l4,	%i4
	nop
	set	0x40, %i3
	ldsh	[%l7 + %i3],	%l6
	set	0x38, %g2
	swapa	[%l7 + %g2] 0x80,	%i1
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x89,	 4
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g6
	wr	%l5,	%o7,	%ccr
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x89,	%l2
	nop
	set	0x58, %l2
	std	%f30,	[%l7 + %l2]
	set	0x74, %i1
	lda	[%l7 + %i1] 0x89,	%f5
	nop
	set	0x09, %l0
	stb	%i6,	[%l7 + %l0]
	nop
	set	0x32, %g7
	sth	%l0,	[%l7 + %g7]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%l1
	nop
	set	0x60, %o6
	ldsh	[%l7 + %o6],	%o4
	nop
	set	0x20, %o1
	std	%f26,	[%l7 + %o1]
	set	0x1C, %i4
	lda	[%l7 + %i4] 0x81,	%f6
	wr	%o3,	%o6,	%y
	set	0x5C, %l1
	swapa	[%l7 + %l1] 0x81,	%o0
	set	0x28, %o7
	stxa	%i0,	[%l7 + %o7] 0x88
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x88,	%g5
	set	0x74, %l6
	lda	[%l7 + %l6] 0x81,	%f1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%o1
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x78, %o3
	ldxa	[%l7 + %o3] 0x88,	%i7
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%o2
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%f6
	set	0x0E, %g3
	stba	%g2,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%g3
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%i4
	nop
	set	0x58, %o4
	ldub	[%l7 + %o4],	%g7
	nop
	set	0x68, %l4
	sth	%g4,	[%l7 + %l4]
	set	0x20, %i6
	sta	%f3,	[%l7 + %i6] 0x89
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf0
	membar	#Sync
	ld	[%l7 + 0x30],	%f13
	nop
	set	0x78, %g1
	ldsw	[%l7 + %g1],	%g1
	set	0x64, %g6
	stwa	%o5,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x6A, %g5
	lduh	[%l7 + %g5],	%i4
	nop
	set	0x48, %i3
	std	%f20,	[%l7 + %i3]
	nop
	set	0x58, %g2
	stw	%l4,	[%l7 + %g2]
	nop
	set	0x30, %o5
	ldstub	[%l7 + %o5],	%l6
	nop
	set	0x7C, %o0
	ldub	[%l7 + %o0],	%i2
	nop
	set	0x4C, %i0
	lduw	[%l7 + %i0],	%g6
	set	0x08, %l2
	stda	%i0,	[%l7 + %l2] 0x80
	set	0x40, %l0
	stxa	%o7,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x17, %g7
	stb	%l5,	[%l7 + %g7]
	set	0x64, %o6
	stwa	%l2,	[%l7 + %o6] 0xea
	membar	#Sync
	ld	[%l7 + 0x2C],	%f9
	nop
	set	0x38, %i1
	ldstub	[%l7 + %i1],	%l0
	nop
	set	0x1B, %i4
	ldub	[%l7 + %i4],	%i6
	set	0x14, %l1
	sta	%f2,	[%l7 + %l1] 0x89
	or	%i3,	%l1,	%o4
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x88,	 1
	nop
	set	0x23, %l3
	ldub	[%l7 + %l3],	%o0
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xe2,	%o2
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f16
	nop
	set	0x28, %o3
	std	%f8,	[%l7 + %o3]
	nop
	set	0x20, %i2
	ldsw	[%l7 + %i2],	%g5
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x88,	%l2
	nop
	set	0x3A, %g3
	ldsb	[%l7 + %g3],	%i0
	nop
	set	0x1C, %o2
	prefetch	[%l7 + %o2],	 4
	nop
	set	0x62, %g4
	ldub	[%l7 + %g4],	%o1
	nop
	set	0x4C, %i5
	prefetch	[%l7 + %i5],	 3
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%f2
	set	0x66, %i6
	stha	%o2,	[%l7 + %i6] 0x80
	ble,a	%icc,	loop_105
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x37, %l4
	stb	%i7,	[%l7 + %l4]
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
loop_105:
	nop
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x89,	%g2
	ld	[%l7 + 0x68],	%f30
	ld	[%l7 + 0x44],	%f4
	nop
	set	0x70, %g5
	ldsh	[%l7 + %g5],	%i5
	st	%f2,	[%l7 + 0x2C]
	nop
	set	0x7A, %g1
	sth	%g3,	[%l7 + %g1]
	set	0x44, %g2
	lda	[%l7 + %g2] 0x89,	%f15
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc0
	set	0x44, %o0
	stwa	%g7,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%g4
	add	%g1,	%i4,	%o5
	ble,a	%xcc,	loop_106
	or	%l4,	%l6,	%g6
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%f8
	nop
	set	0x40, %l0
	ldub	[%l7 + %l0],	%i2
loop_106:
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%o6
	nop
	set	0x4F, %o6
	stb	%l5,	[%l7 + %o6]
	fpadd32s	%f20,	%f20,	%f1
	set	0x10, %g7
	swapa	[%l7 + %g7] 0x80,	%i1
	nop
	set	0x68, %i4
	stx	%l0,	[%l7 + %i4]
	st	%f26,	[%l7 + 0x4C]
	set	0x18, %i1
	stwa	%i6,	[%l7 + %i1] 0x81
	wr	%i3,	%l1,	%softint
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%o4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%o0
	nop
	set	0x10, %o1
	std	%o6,	[%l7 + %o1]
	and	%o3,	%g5,	%l3
	set	0x08, %l3
	stda	%i0,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x52, %o7
	stha	%o2,	[%l7 + %o7] 0xeb
	membar	#Sync
	add	%i7,	%o1,	%i5
	set	0x38, %l6
	sta	%f27,	[%l7 + %l6] 0x88
	set	0x66, %o3
	stha	%g2,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x10, %l5
	prefetch	[%l7 + %l5],	 4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%g7
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x89,	%g1
	st	%f0,	[%l7 + 0x64]
	nop
	set	0x38, %o2
	stx	%fsr,	[%l7 + %o2]
	st	%f31,	[%l7 + 0x7C]
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%g4
	or	%i4,	%o5,	%l4
	fpsub32s	%f22,	%f0,	%f1
	nop
	set	0x50, %i5
	stx	%g6,	[%l7 + %i5]
	fpadd16	%f14,	%f10,	%f22
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%i6
	ld	[%l7 + 0x68],	%f20
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f16
	wr	%i2,	%l5,	%set_softint
	nop
	set	0x68, %i2
	stx	%i1,	[%l7 + %i2]
	set	0x7B, %i7
	ldstuba	[%l7 + %i7] 0x81,	%o7
	set	0x78, %l4
	lda	[%l7 + %l4] 0x81,	%f22
	wr	%i6,	%i3,	%ccr
	nop
	set	0x36, %g5
	ldsh	[%l7 + %g5],	%l0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f16
	nop
	set	0x64, %g6
	lduh	[%l7 + %g6],	%l1
	set	0x28, %g2
	ldxa	[%l7 + %g2] 0x81,	%o4
	nop
	set	0x78, %i3
	stx	%fsr,	[%l7 + %i3]
	ld	[%l7 + 0x78],	%f22
	nop
	set	0x78, %o5
	std	%f10,	[%l7 + %o5]
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%o0
	set	0x34, %l2
	swapa	[%l7 + %l2] 0x80,	%l2
	wr	%o3,	%o6,	%y
	nop
	set	0x4C, %l0
	prefetch	[%l7 + %l0],	 1
	set	0x58, %o6
	stxa	%l3,	[%l7 + %o6] 0x89
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%g4
	set	0x08, %i4
	stha	%o2,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x38, %i1
	stwa	%i7,	[%l7 + %i1] 0x88
	fpsub32s	%f10,	%f20,	%f20
	nop
	set	0x3C, %l1
	ldsb	[%l7 + %l1],	%i0
	st	%fsr,	[%l7 + 0x58]
	set	0x22, %o1
	stha	%i5,	[%l7 + %o1] 0x89
	nop
	set	0x4C, %l3
	ldsw	[%l7 + %l3],	%o1
	set	0x28, %i0
	stba	%g3,	[%l7 + %i0] 0x81
	set	0x3C, %l6
	ldstuba	[%l7 + %l6] 0x88,	%g7
	set	0x68, %o3
	stha	%g1,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x39, %o7
	ldstuba	[%l7 + %o7] 0x81,	%g2
	set	0x75, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g4
	set	0x50, %o2
	stxa	%i4,	[%l7 + %o2] 0xeb
	membar	#Sync
	or	%o5,	%g6,	%l4
	nop
	set	0x15, %g3
	ldstub	[%l7 + %g3],	%i2
	nop
	set	0x13, %i5
	ldstub	[%l7 + %i5],	%l6
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xca
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x89,	%i1
	set	0x6F, %i2
	ldstuba	[%l7 + %i2] 0x81,	%o7
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xda,	%f16
	nop
	set	0x40, %i7
	std	%f26,	[%l7 + %i7]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%i3
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x81,	%l0
	nop
	set	0x30, %g1
	ldx	[%l7 + %g1],	%l1
	set	0x58, %l4
	stda	%o4,	[%l7 + %l4] 0x89
	set	0x60, %g6
	stda	%o0,	[%l7 + %g6] 0xe3
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%i6
	nop
	set	0x6A, %i3
	ldsh	[%l7 + %i3],	%o3
	set	0x48, %g2
	ldxa	[%l7 + %g2] 0x88,	%l3
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x34, %o5
	stba	%g5,	[%l7 + %o5] 0x81
	nop
	set	0x7F, %l0
	stb	%o6,	[%l7 + %l0]
	nop
	set	0x38, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x4A, %l2
	sth	%i7,	[%l7 + %l2]
	set	0x13, %g7
	stba	%i0,	[%l7 + %g7] 0x88
	nop
	set	0x38, %i4
	ldsw	[%l7 + %i4],	%i5
	nop
	set	0x08, %i1
	ldx	[%l7 + %i1],	%o1
	and	%o2,	%g3,	%g1
	nop
	set	0x74, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x24, %l3
	sth	%g7,	[%l7 + %l3]
	nop
	set	0x64, %i0
	lduh	[%l7 + %i0],	%g2
	set	0x09, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i4
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f12
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f0
	st	%fsr,	[%l7 + 0x40]
	st	%f9,	[%l7 + 0x08]
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%o5
	nop
	set	0x30, %l1
	std	%f4,	[%l7 + %l1]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%l4
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%i2
	set	0x4C, %o2
	stba	%g4,	[%l7 + %o2] 0x80
	nop
	set	0x38, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x10, %i6
	ldda	[%l7 + %i6] 0xeb,	%i0
	nop
	set	0x12, %i2
	ldsh	[%l7 + %i2],	%l6
	add	%l5,	%o7,	%i3
	nop
	set	0x48, %o4
	stw	%l0,	[%l7 + %o4]
	nop
	set	0x74, %i7
	ldsw	[%l7 + %i7],	%o4
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x81,	%l0
	set	0x38, %g5
	sta	%f16,	[%l7 + %g5] 0x80
	set	0x10, %l4
	sta	%f1,	[%l7 + %l4] 0x89
	nop
	set	0x48, %g6
	stw	%o0,	[%l7 + %g6]
	st	%f24,	[%l7 + 0x78]
	nop
	set	0x70, %g2
	std	%f16,	[%l7 + %g2]
	set	0x32, %o0
	stha	%l2,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x78, %o5
	std	%f24,	[%l7 + %o5]
	add	%i6,	%l3,	%g5
	nop
	set	0x38, %i3
	swap	[%l7 + %i3],	%o6
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x81,	%o2
	set	0x58, %l2
	lda	[%l7 + %l2] 0x80,	%f17
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%i0
	or	%i5,	%o2,	%o1
	nop
	set	0x10, %l0
	ldsh	[%l7 + %l0],	%g3
	nop
	set	0x38, %i4
	ldx	[%l7 + %i4],	%g1
	nop
	set	0x2D, %g7
	stb	%g7,	[%l7 + %g7]
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%i4
	nop
	set	0x78, %l3
	std	%f14,	[%l7 + %l3]
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f10
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%o4
	ld	[%l7 + 0x78],	%f8
	nop
	set	0x17, %l6
	ldub	[%l7 + %l6],	%g6
	st	%fsr,	[%l7 + 0x20]
	set	0x74, %o7
	sta	%f23,	[%l7 + %o7] 0x81
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i2
	fpsub32s	%f3,	%f23,	%f19
	nop
	set	0x08, %l5
	stw	%l4,	[%l7 + %l5]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%l6
	nop
	set	0x4C, %o3
	ldsw	[%l7 + %o3],	%l5
	set	0x26, %l1
	stha	%o7,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x63, %o2
	ldsb	[%l7 + %o2],	%i1
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xe3,	%l0
	set	0x60, %g4
	lda	[%l7 + %g4] 0x88,	%f25
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%i2
	nop
	set	0x74, %o4
	ldsw	[%l7 + %o4],	%o4
	set	0x20, %i7
	stda	%o0,	[%l7 + %i7] 0x81
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%i6
	nop
	set	0x4C, %i2
	prefetch	[%l7 + %i2],	 3
	st	%fsr,	[%l7 + 0x24]
	set	0x4B, %i5
	ldstuba	[%l7 + %i5] 0x88,	%l3
	add	%g5,	%o6,	%o3
	nop
	set	0x78, %g5
	stx	%fsr,	[%l7 + %g5]
	st	%f23,	[%l7 + 0x78]
	add	%i7,	%l2,	%i5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%i0
	set	0x58, %l4
	lda	[%l7 + %l4] 0x80,	%f21
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f14
	st	%f22,	[%l7 + 0x18]
	set	0x41, %g6
	ldstuba	[%l7 + %g6] 0x80,	%g3
	ble,a	%icc,	loop_107
	or	%g1,	%o1,	%g7
	nop
	set	0x20, %o0
	stb	%o5,	[%l7 + %o0]
	nop
	set	0x1C, %g2
	stw	%g6,	[%l7 + %g2]
loop_107:
	nop
	set	0x0E, %o5
	stha	%g2,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x1C, %i3
	lduw	[%l7 + %i3],	%i2
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x80,	 3
	or	%g4,	%i4,	%l5
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%o7
	add	%i1,	%l6,	%i3
	and	%l0,	%o4,	%o0
	nop
	set	0x14, %l0
	ldsw	[%l7 + %l0],	%l1
	set	0x75, %g7
	stba	%l3,	[%l7 + %g7] 0x81
	set	0x4C, %i4
	sta	%f7,	[%l7 + %i4] 0x89
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x60, %l3
	stxa	%g5,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x70, %o1
	stxa	%o6,	[%l7 + %o1] 0x89
	set	0x2B, %l6
	stba	%o3,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x08, %i0
	stx	%i7,	[%l7 + %i0]
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f0
	nop
	set	0x50, %l1
	prefetch	[%l7 + %l1],	 0
	nop
	set	0x3E, %o3
	sth	%l2,	[%l7 + %o3]
	nop
	set	0x6A, %g3
	sth	%i6,	[%l7 + %g3]
	nop
	set	0x20, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x44, %o2
	ldsw	[%l7 + %o2],	%o2
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%i5
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%g2
	nop
	set	0x68, %i2
	std	%i0,	[%l7 + %i2]
	bne,pn	%xcc,	loop_108
	fpadd16	%f0,	%f18,	%f30
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xda
loop_108:
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	wr	%o1,	%g1,	%sys_tick
	add	%o5,	%g7,	%g2
	or	%g6,	%i2,	%l4
	set	0x20, %i5
	stxa	%i4,	[%l7 + %i5] 0x81
	set	0x48, %g1
	ldxa	[%l7 + %g1] 0x89,	%g4
	nop
	set	0x1B, %l4
	stb	%l5,	[%l7 + %l4]
	nop
	set	0x58, %o0
	std	%f28,	[%l7 + %o0]
	set	0x64, %g6
	stha	%o7,	[%l7 + %g6] 0x89
	st	%f31,	[%l7 + 0x68]
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%i1
	add	%l6,	%i3,	%o4
	nop
	set	0x30, %o5
	swap	[%l7 + %o5],	%o0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f0
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%f2
	nop
	set	0x58, %l0
	stx	%l0,	[%l7 + %l0]
	set	0x58, %g7
	stwa	%l3,	[%l7 + %g7] 0x89
	or	%g5,	%o6,	%l1
	nop
	set	0x40, %l2
	ldsw	[%l7 + %l2],	%o3
	nop
	set	0x10, %i4
	ldsb	[%l7 + %i4],	%l2
	nop
	set	0x7A, %l3
	lduh	[%l7 + %l3],	%i6
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xe2,	%i6
	add	%i5,	%g3,	%i0
	set	0x10, %o1
	stha	%o1,	[%l7 + %o1] 0x81
	set	0x31, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o2
	st	%f3,	[%l7 + 0x34]
	nop
	set	0x38, %o7
	ldsh	[%l7 + %o7],	%g1
	nop
	set	0x14, %l5
	sth	%o5,	[%l7 + %l5]
	nop
	set	0x20, %l1
	std	%f24,	[%l7 + %l1]
	nop
	set	0x30, %o3
	lduw	[%l7 + %o3],	%g7
	nop
	nop
	setx	0xE600E6EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xD7DFB95C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f11,	%f3
	nop
	set	0x08, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x42, %g3
	ldsb	[%l7 + %g3],	%g2
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x81,	 1
	set	0x10, %o2
	stha	%l4,	[%l7 + %o2] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5C7, 	%sys_tick_cmpr
	set	0x70, %i6
	stda	%g6,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x37, %i2
	stb	%o7,	[%l7 + %i2]
	fpadd16	%f6,	%f26,	%f24
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%i1
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%i3
	set	0x38, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l6
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%o0
	set	0x48, %g1
	ldxa	[%l7 + %g1] 0x80,	%o4
	nop
	set	0x20, %l4
	lduw	[%l7 + %l4],	%l3
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f0
	nop
	set	0x3C, %g6
	ldsh	[%l7 + %g6],	%g5
	set	0x17, %o4
	stba	%o6,	[%l7 + %o4] 0xe2
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%l1
	nop
	set	0x40, %o5
	stx	%fsr,	[%l7 + %o5]
	bne	%icc,	loop_109
	st	%f14,	[%l7 + 0x48]
	ld	[%l7 + 0x70],	%f28
	and	%o3,	%i6,	%l2
loop_109:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%i5
	nop
	set	0x6C, %i3
	stw	%i0,	[%l7 + %i3]
	nop
	set	0x18, %o6
	std	%f2,	[%l7 + %o6]
	add	%g3,	%o2,	%o1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%o5
	nop
	set	0x5D, %l0
	stb	%g7,	[%l7 + %l0]
	set	0x78, %g7
	stda	%g2,	[%l7 + %g7] 0x80
	set	0x70, %l2
	ldda	[%l7 + %l2] 0xe3,	%i2
	set	0x60, %g2
	stxa	%i4,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x89,	 2
	set	0x38, %i1
	stda	%l4,	[%l7 + %i1] 0x89
	nop
	set	0x3C, %o1
	ldsw	[%l7 + %o1],	%o7
	nop
	set	0x4C, %i4
	lduh	[%l7 + %i4],	%g6
	nop
	set	0x14, %l6
	ldsh	[%l7 + %l6],	%l5
	nop
	set	0x56, %o7
	ldsh	[%l7 + %o7],	%i1
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%l6
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f0
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%o0
	nop
	set	0x30, %l1
	stx	%o4,	[%l7 + %l1]
	set	0x7C, %g3
	sta	%f5,	[%l7 + %g3] 0x88
	fpsub16s	%f12,	%f8,	%f8
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%l3
	add	%o6,	%g5,	%l1
	nop
	set	0x2A, %g4
	sth	%o3,	[%l7 + %g4]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%l2
	fpsub32s	%f7,	%f19,	%f10
	nop
	set	0x20, %i6
	stx	%i7,	[%l7 + %i6]
	set	0x60, %i2
	stda	%l0,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x36, %o2
	sth	%i5,	[%l7 + %o2]
	st	%f24,	[%l7 + 0x64]
	set	0x40, %g5
	stxa	%g3,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x6C, %i7
	swap	[%l7 + %i7],	%i0
	bgu,pn	%xcc,	loop_110
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%o1
	nop
	set	0x72, %g1
	ldsh	[%l7 + %g1],	%g1
	nop
	set	0x6D, %o0
	ldub	[%l7 + %o0],	%o2
loop_110:
	nop
	set	0x08, %l4
	ldstub	[%l7 + %l4],	%g7
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x58, %g6
	lduw	[%l7 + %g6],	%g2
	nop
	set	0x24, %o4
	stw	%o5,	[%l7 + %o4]
	nop
	set	0x09, %i3
	stb	%i4,	[%l7 + %i3]
	or	%g4,	%l4,	%i2
	nop
	set	0x66, %o5
	lduh	[%l7 + %o5],	%o7
	set	0x7C, %o6
	stwa	%g6,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x4E, %l0
	ldsh	[%l7 + %l0],	%l5
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f10
	set	0x50, %g2
	stxa	%l6,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x08, %l2
	stda	%o0,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x64, %i1
	lduw	[%l7 + %i1],	%i1
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc2
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%f20
	nop
	set	0x13, %l6
	ldstub	[%l7 + %l6],	%i3
	nop
	set	0x10, %o7
	lduw	[%l7 + %o7],	%l3
	nop
	set	0x30, %l5
	std	%f22,	[%l7 + %l5]
	ld	[%l7 + 0x44],	%f18
	nop
	set	0x60, %o3
	swap	[%l7 + %o3],	%o6
	nop
	set	0x48, %i4
	std	%o4,	[%l7 + %i4]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f16
	set	0x78, %i0
	ldxa	[%l7 + %i0] 0x80,	%l1
	nop
	set	0x3E, %g4
	lduh	[%l7 + %g4],	%g5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%f0
	nop
	nop
	setx	0xE4B28CA44DFB0CCB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xEAB1F1C60C423E08,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f24,	%f26
	nop
	set	0x1A, %i6
	ldsh	[%l7 + %i6],	%o3
	nop
	set	0x62, %o2
	stb	%i6,	[%l7 + %o2]
	nop
	set	0x1C, %g5
	lduh	[%l7 + %g5],	%i7
	set	0x08, %i7
	stxa	%l2,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x18, %g1
	sth	%l0,	[%l7 + %g1]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x89
	ld	[%l7 + 0x74],	%f25
	nop
	set	0x10, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x60, %l4
	stda	%i4,	[%l7 + %l4] 0x81
	and	%i0,	%g3,	%g1
	nop
	set	0x4F, %g6
	ldub	[%l7 + %g6],	%o1
	nop
	set	0x77, %i3
	ldsb	[%l7 + %i3],	%g7
	nop
	set	0x60, %o4
	sth	%g2,	[%l7 + %o4]
	set	0x6C, %o6
	swapa	[%l7 + %o6] 0x81,	%o2
	or	%i4,	%g4,	%l4
	set	0x30, %o5
	ldxa	[%l7 + %o5] 0x80,	%o5
	st	%fsr,	[%l7 + 0x24]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%o7
	nop
	set	0x14, %g7
	ldsw	[%l7 + %g7],	%l5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%o0
	nop
	set	0x34, %l0
	swap	[%l7 + %l0],	%l6
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xe3,	%i0
	set	0x48, %i1
	ldxa	[%l7 + %i1] 0x88,	%i3
	or	%l3,	%o4,	%l1
	and	%o6,	%o3,	%i6
	nop
	set	0x08, %l2
	std	%f8,	[%l7 + %l2]
	nop
	set	0x7E, %l3
	stb	%i7,	[%l7 + %l3]
	nop
	set	0x77, %l6
	ldsb	[%l7 + %l6],	%g5
	nop
	set	0x58, %o7
	prefetch	[%l7 + %o7],	 2
	st	%fsr,	[%l7 + 0x1C]
	set	0x61, %l5
	stba	%l2,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x55, %o1
	ldub	[%l7 + %o1],	%l0
	set	0x4C, %i4
	sta	%f22,	[%l7 + %i4] 0x89
	nop
	set	0x5F, %o3
	stb	%i0,	[%l7 + %o3]
	set	0x30, %i0
	prefetcha	[%l7 + %i0] 0x88,	 2
	set	0x5C, %l1
	ldstuba	[%l7 + %l1] 0x81,	%g3
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f30
	set	0x50, %g3
	stda	%g0,	[%l7 + %g3] 0x88
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x88
	nop
	set	0x14, %g5
	ldsw	[%l7 + %g5],	%o1
	set	0x40, %i7
	stwa	%g7,	[%l7 + %i7] 0x89
	and	%o2,	%i4,	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%o5
	add	%i2,	%l4,	%l5
	nop
	set	0x74, %i2
	lduw	[%l7 + %i2],	%o7
	nop
	set	0x1A, %g1
	ldsb	[%l7 + %g1],	%g6
	fpadd32s	%f29,	%f6,	%f0
	set	0x62, %i5
	stha	%l6,	[%l7 + %i5] 0xea
	membar	#Sync
	and	%o0,	%i3,	%l3
	nop
	set	0x36, %o0
	ldsh	[%l7 + %o0],	%i1
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x81,	%o4
	nop
	set	0x18, %l4
	stw	%o6,	[%l7 + %l4]
	set	0x58, %g6
	stwa	%l1,	[%l7 + %g6] 0xea
	membar	#Sync
	be,pt	%xcc,	loop_111
	nop
	set	0x08, %i3
	std	%i6,	[%l7 + %i3]
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x89,	 1
loop_111:
	nop
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf9
	membar	#Sync
	nop
	set	0x34, %g7
	sth	%o3,	[%l7 + %g7]
	set	0x16, %o6
	ldstuba	[%l7 + %o6] 0x89,	%l2
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%g4
	nop
	set	0x44, %g2
	swap	[%l7 + %g2],	%i0
	set	0x40, %i1
	stda	%l0,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x50, %l3
	std	%g2,	[%l7 + %l3]
	nop
	set	0x14, %l6
	swap	[%l7 + %l6],	%g1
	set	0x3C, %l2
	swapa	[%l7 + %l2] 0x80,	%i5
	and	%g7,	%o2,	%o1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%g4
	or	%o5,	%g2,	%l4
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x81,	 3
	or	%i2,	%g6,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i3
	set	0x40, %l5
	stwa	%l3,	[%l7 + %l5] 0x89
	st	%fsr,	[%l7 + 0x10]
	set	0x4C, %o1
	stwa	%o0,	[%l7 + %o1] 0x81
	nop
	set	0x50, %o3
	std	%f24,	[%l7 + %o3]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xca
	or	%i1,	%o6,	%l1
	nop
	set	0x40, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x70, %g4
	sta	%f4,	[%l7 + %g4] 0x88
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f22
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	or	%o4,	%i7,	%i6
	add	%l2,	%g5,	%o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	and	%g1,	%g3,	%i5
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x89,	 1
	nop
	set	0x21, %g5
	ldstub	[%l7 + %g5],	%o1
	set	0x48, %i2
	stwa	%g7,	[%l7 + %i2] 0x80
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x88,	%i4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%g2
	set	0x40, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o5
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%l4
	st	%fsr,	[%l7 + 0x50]
	and	%i2,	%g6,	%l6
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%l4
	nop
	set	0x28, %i6
	sth	%o7,	[%l7 + %i6]
	and	%i3,	%o0,	%l3
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x89,	%i1
	st	%fsr,	[%l7 + 0x4C]
	or	%o6,	%o4,	%i7
	nop
	set	0x2C, %l4
	swap	[%l7 + %l4],	%l1
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x89,	 2
	nop
	set	0x4C, %o5
	lduh	[%l7 + %o5],	%l2
	ld	[%l7 + 0x10],	%f30
	nop
	set	0x50, %g7
	std	%f8,	[%l7 + %g7]
	ld	[%l7 + 0x2C],	%f28
	set	0x0D, %o6
	ldstuba	[%l7 + %o6] 0x81,	%g5
	nop
	set	0x10, %i3
	ldsw	[%l7 + %i3],	%i0
	nop
	set	0x24, %l0
	lduw	[%l7 + %l0],	%l0
	set	0x78, %i1
	lda	[%l7 + %i1] 0x81,	%f10
	and	%o3,	%g1,	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%o1
	nop
	set	0x2C, %l3
	ldsw	[%l7 + %l3],	%g3
	and	%g7,	%g4,	%i4
	nop
	set	0x22, %l6
	sth	%g2,	[%l7 + %l6]
	set	0x60, %g2
	stwa	%o5,	[%l7 + %g2] 0xe3
	membar	#Sync
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%g6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%l4
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x88,	 3
	nop
	set	0x54, %o7
	swap	[%l7 + %o7],	%i3
	nop
	set	0x7C, %l5
	ldub	[%l7 + %l5],	%o7
	nop
	set	0x50, %o1
	std	%f6,	[%l7 + %o1]
	set	0x40, %i0
	swapa	[%l7 + %i0] 0x88,	%l3
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f6
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x80,	 4
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf9
	membar	#Sync
	nop
	set	0x4C, %o3
	stw	%o6,	[%l7 + %o3]
	nop
	set	0x70, %o2
	stb	%o4,	[%l7 + %o2]
	nop
	set	0x4F, %g3
	ldub	[%l7 + %g3],	%o0
	nop
	set	0x19, %i2
	stb	%l1,	[%l7 + %i2]
	ld	[%l7 + 0x0C],	%f0
	st	%fsr,	[%l7 + 0x24]
	set	0x44, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i7
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x89,	 3
	set	0x44, %i5
	swapa	[%l7 + %i5] 0x88,	%g5
	or	%i6,	%l0,	%o3
	and	%g1,	%i0,	%o2
	and	%o1,	%g3,	%i5
	set	0x3C, %g1
	swapa	[%l7 + %g1] 0x80,	%g4
	set	0x14, %i6
	stwa	%i4,	[%l7 + %i6] 0x81
	nop
	set	0x50, %g6
	stw	%g7,	[%l7 + %g6]
	set	0x50, %o0
	ldxa	[%l7 + %o0] 0x81,	%o5
	nop
	set	0x28, %l4
	ldsw	[%l7 + %l4],	%i2
	set	0x10, %o5
	lda	[%l7 + %o5] 0x81,	%f9
	set	0x60, %g7
	stda	%g6,	[%l7 + %g7] 0x80
	nop
	set	0x20, %o4
	swap	[%l7 + %o4],	%l5
	nop
	set	0x20, %i3
	stx	%fsr,	[%l7 + %i3]
	add	%l4,	%g2,	%i3
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%o7
	fpadd16	%f14,	%f20,	%f16
	and	%l3,	%l6,	%i1
	set	0x14, %o6
	swapa	[%l7 + %o6] 0x89,	%o4
	set	0x5F, %i1
	stba	%o6,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%o0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x80
	ld	[%l7 + 0x38],	%f27
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xca
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xd8
	set	0x34, %l3
	lda	[%l7 + %l3] 0x88,	%f15
	set	0x64, %o1
	sta	%f6,	[%l7 + %o1] 0x81
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%i7
	or	%g5,	%i6,	%l0
	bleu	%xcc,	loop_112
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f6
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd8
loop_112:
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xeb,	%o2
	set	0x33, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g1
	nop
	set	0x30, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x70, %i4
	ldstuba	[%l7 + %i4] 0x88,	%i0
	set	0x38, %g3
	stxa	%l2,	[%l7 + %g3] 0x81
	st	%f6,	[%l7 + 0x30]
	or	%o1,	%o2,	%i5
	nop
	set	0x78, %i2
	sth	%g4,	[%l7 + %i2]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%g7
	set	0x0C, %i7
	swapa	[%l7 + %i7] 0x80,	%i4
	add	%o5,	%i2,	%g6
	set	0x30, %g5
	stxa	%l4,	[%l7 + %g5] 0x88
	set	0x0C, %o2
	lda	[%l7 + %o2] 0x80,	%f18
	nop
	set	0x24, %g1
	ldsb	[%l7 + %g1],	%g2
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x80,	%i2
	set	0x24, %i5
	lda	[%l7 + %i5] 0x81,	%f1
	set	0x3E, %g6
	ldstuba	[%l7 + %g6] 0x81,	%l5
	nop
	set	0x6F, %l4
	ldsb	[%l7 + %l4],	%l3
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%o6
	and	%i1,	%o4,	%l6
	set	0x1A, %g7
	stba	%o6,	[%l7 + %g7] 0x88
	nop
	set	0x47, %o4
	ldstub	[%l7 + %o4],	%o0
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xeb,	%i6
	nop
	set	0x14, %l0
	lduw	[%l7 + %l0],	%l1
	st	%fsr,	[%l7 + 0x0C]
	set	0x50, %o6
	stwa	%i6,	[%l7 + %o6] 0x80
	set	0x70, %i3
	lda	[%l7 + %i3] 0x89,	%f11
	nop
	set	0x63, %l6
	ldstub	[%l7 + %l6],	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFC9, 	%tick_cmpr
	nop
	set	0x30, %g2
	lduh	[%l7 + %g2],	%i0
	nop
	set	0x73, %l2
	ldsb	[%l7 + %l2],	%g1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%o1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%g4
	nop
	set	0x17, %o7
	ldstub	[%l7 + %o7],	%i5
	set	0x76, %i1
	stha	%g7,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x6C, %l3
	ldsw	[%l7 + %l3],	%i4
	set	0x48, %o1
	lda	[%l7 + %o1] 0x80,	%f9
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%g3
	nop
	set	0x08, %l1
	ldsw	[%l7 + %l1],	%o5
	set	0x50, %i0
	stwa	%g6,	[%l7 + %i0] 0x88
	nop
	set	0x24, %g4
	swap	[%l7 + %g4],	%l4
	or	%g2,	%i2,	%l5
	nop
	set	0x20, %i4
	std	%f24,	[%l7 + %i4]
	set	0x2C, %o3
	stwa	%l3,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x48, %g3
	swap	[%l7 + %g3],	%o7
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd8
	nop
	set	0x10, %g5
	std	%i0,	[%l7 + %g5]
	or	%o4,	%l6,	%i3
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc2
	nop
	set	0x31, %i7
	ldsb	[%l7 + %i7],	%o0
	nop
	set	0x41, %g1
	stb	%i7,	[%l7 + %g1]
	set	0x10, %i6
	stwa	%o6,	[%l7 + %i6] 0x80
	set	0x6C, %g6
	swapa	[%l7 + %g6] 0x80,	%i6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%o3
	nop
	set	0x7C, %l4
	lduh	[%l7 + %l4],	%g5
	ld	[%l7 + 0x0C],	%f6
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x19, %i5
	ldstub	[%l7 + %i5],	%l0
	set	0x50, %g7
	ldda	[%l7 + %g7] 0x80,	%g0
	set	0x57, %o4
	ldstuba	[%l7 + %o4] 0x80,	%l2
	wr	%o1,	%o2,	%set_softint
	add	%i0,	%g4,	%g7
	nop
	set	0x37, %l0
	ldub	[%l7 + %l0],	%i4
	nop
	set	0x28, %o6
	std	%f26,	[%l7 + %o6]
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%g3
	nop
	set	0x60, %o5
	stx	%fsr,	[%l7 + %o5]
	fpsub16s	%f12,	%f18,	%f12
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x80,	%i4
	nop
	set	0x58, %l6
	std	%g6,	[%l7 + %l6]
	set	0x18, %o7
	stba	%o5,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%l4
	set	0x78, %l2
	stba	%g2,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%i2
	set	0x1F, %l5
	ldstuba	[%l7 + %l5] 0x88,	%l5
	nop
	set	0x64, %l1
	ldsh	[%l7 + %l1],	%l3
	set	0x4C, %o1
	stha	%o7,	[%l7 + %o1] 0x88
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%o4
	nop
	set	0x5B, %i0
	ldub	[%l7 + %i0],	%l6
	add	%i3,	%o0,	%i1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%o3
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x18, %i4
	stx	%g5,	[%l7 + %i4]
	set	0x2C, %g3
	sta	%f29,	[%l7 + %g3] 0x80
	set	0x0C, %i2
	stha	%i6,	[%l7 + %i2] 0xeb
	membar	#Sync
	add	%l0,	%l2,	%o1
	nop
	nop
	setx	0x63966871,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xD9B04849,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f10,	%f1
	nop
	set	0x54, %o3
	prefetch	[%l7 + %o3],	 0
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd0,	%f16
	set	0x1A, %o2
	stba	%g1,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x4A, %g1
	stba	%i0,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc8
	add	%g4,	%o2,	%i4
	ba,pn	%xcc,	loop_113
	or	%g3,	%g7,	%g6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%o5
loop_113:
	st	%fsr,	[%l7 + 0x50]
	set	0x78, %g6
	stda	%g2,	[%l7 + %g6] 0x81
	nop
	set	0x6C, %l4
	lduw	[%l7 + %l4],	%i2
	nop
	set	0x18, %i6
	lduh	[%l7 + %i6],	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%l5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%l6
	set	0x60, %i5
	stha	%i3,	[%l7 + %i5] 0x89
	nop
	set	0x30, %g7
	std	%f0,	[%l7 + %g7]
	nop
	set	0x20, %o0
	std	%o0,	[%l7 + %o0]
	nop
	set	0x68, %o4
	std	%o4,	[%l7 + %o4]
	set	0x58, %l0
	stda	%i6,	[%l7 + %l0] 0x89
	nop
	set	0x44, %i3
	swap	[%l7 + %i3],	%i1
	set	0x48, %o5
	stxa	%l1,	[%l7 + %o5] 0x80
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xe3,	%o2
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x88,	%o6
	wr	%g5,	%i6,	%clear_softint
	nop
	set	0x5C, %l6
	swap	[%l7 + %l6],	%l2
	bgu,pt	%icc,	loop_114
	fpsub32s	%f18,	%f18,	%f7
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x81,	%o1
loop_114:
	nop
	set	0x58, %l2
	stxa	%l0,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x7A, %i1
	stha	%g1,	[%l7 + %i1] 0x81
	nop
	set	0x08, %l5
	std	%i0,	[%l7 + %l5]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%f0
	nop
	set	0x7C, %o1
	sth	%g4,	[%l7 + %o1]
	set	0x0C, %g4
	stha	%o2,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x23, %i0
	ldub	[%l7 + %i0],	%i4
	nop
	set	0x10, %i4
	ldsw	[%l7 + %i4],	%g7
	or	%g6,	%g3,	%o5
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f16
	nop
	set	0x48, %i2
	stw	%g2,	[%l7 + %i2]
	set	0x28, %o3
	stxa	%i2,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x10, %o2
	swapa	[%l7 + %o2] 0x88,	%l4
	nop
	set	0x40, %l1
	stw	%i5,	[%l7 + %l1]
	or	%l3,	%l5,	%o7
	add	%i3,	%o0,	%l6
	set	0x78, %g1
	ldxa	[%l7 + %g1] 0x88,	%i7
	nop
	set	0x38, %g6
	ldstub	[%l7 + %g6],	%o4
	nop
	set	0x52, %l4
	lduh	[%l7 + %l4],	%i1
	and	%l1,	%o6,	%g5
	set	0x27, %i6
	stba	%i6,	[%l7 + %i6] 0x89
	set	0x74, %i7
	stwa	%o3,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x2C, %i5
	sta	%f27,	[%l7 + %i5] 0x88
	set	0x40, %g7
	ldxa	[%l7 + %g7] 0x80,	%l2
	nop
	set	0x38, %o0
	stx	%fsr,	[%l7 + %o0]
	and	%l0,	%o1,	%g1
	nop
	set	0x70, %l0
	std	%f24,	[%l7 + %l0]
	nop
	set	0x2F, %o4
	ldub	[%l7 + %o4],	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%i4
	nop
	set	0x0E, %i3
	ldsh	[%l7 + %i3],	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%g6
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f0
	set	0x66, %g2
	stha	%o5,	[%l7 + %g2] 0xea
	membar	#Sync
	fpadd32s	%f29,	%f8,	%f2
	nop
	set	0x10, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x2C, %l6
	swapa	[%l7 + %l6] 0x88,	%g2
	add	%i2,	%g3,	%l4
	nop
	set	0x2A, %l2
	ldstub	[%l7 + %l2],	%i5
	set	0x60, %i1
	stwa	%l5,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x10, %o7
	std	%f8,	[%l7 + %o7]
	nop
	set	0x70, %l5
	ldstub	[%l7 + %l5],	%l3
	set	0x5C, %o1
	sta	%f22,	[%l7 + %o1] 0x80
	nop
	set	0x38, %l3
	std	%f20,	[%l7 + %l3]
	nop
	set	0x48, %g4
	std	%i2,	[%l7 + %g4]
	nop
	set	0x28, %i0
	stx	%o7,	[%l7 + %i0]
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%l6
	ble,pt	%xcc,	loop_115
	nop
	set	0x68, %g3
	stx	%o0,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x50]
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0
loop_115:
	nop
	set	0x21, %g5
	stb	%i1,	[%l7 + %g5]
	add	%l1,	%i7,	%g5
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x81,	%f2
	nop
	set	0x36, %o2
	lduh	[%l7 + %o2],	%o6
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xe3,	%i6
	nop
	set	0x50, %g6
	stx	%l2,	[%l7 + %g6]
	set	0x58, %l1
	stwa	%o3,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%l0
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f14
	nop
	set	0x18, %i5
	sth	%o1,	[%l7 + %i5]
	set	0x28, %g7
	prefetcha	[%l7 + %g7] 0x89,	 1
	add	%g4,	%i0,	%g7
	and	%o2,	%g6,	%i4
	nop
	set	0x20, %l4
	lduh	[%l7 + %l4],	%o5
	nop
	set	0x2C, %l0
	sth	%g2,	[%l7 + %l0]
	nop
	set	0x5E, %o0
	ldsh	[%l7 + %o0],	%g3
	set	0x74, %o4
	stwa	%i2,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x74, %o6
	stha	%i5,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x40, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%l4
	or	%l3,	%l5,	%i3
	set	0x18, %l6
	stba	%l6,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x70, %i3
	sta	%f11,	[%l7 + %i3] 0x81
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	set	0x1D, %i1
	ldstuba	[%l7 + %i1] 0x89,	%o7
	nop
	set	0x70, %o7
	std	%f8,	[%l7 + %o7]
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe3,	%o4
	nop
	set	0x68, %o1
	prefetch	[%l7 + %o1],	 2
	fpadd16	%f0,	%f10,	%f28
	nop
	set	0x4A, %l3
	ldstub	[%l7 + %l3],	%o0
	nop
	set	0x3C, %g4
	stw	%i1,	[%l7 + %g4]
	bge	%icc,	loop_116
	bn,pn	%icc,	loop_117
	nop
	set	0x14, %i4
	stw	%i7,	[%l7 + %i4]
	nop
	set	0x52, %i0
	ldsh	[%l7 + %i0],	%g5
loop_116:
	nop
	set	0x10, %i2
	sta	%f29,	[%l7 + %i2] 0x89
loop_117:
	nop
	set	0x66, %g3
	lduh	[%l7 + %g3],	%o6
	bgu,pn	%icc,	loop_118
	nop
	set	0x08, %o3
	prefetch	[%l7 + %o3],	 4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%i6
loop_118:
	nop
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x88,	 1
	set	0x60, %o2
	lda	[%l7 + %o2] 0x89,	%f12
	nop
	set	0x3A, %g6
	ldsh	[%l7 + %g6],	%l2
	set	0x60, %g1
	ldxa	[%l7 + %g1] 0x88,	%o1
	nop
	set	0x40, %l1
	stx	%g1,	[%l7 + %l1]
	set	0x1C, %i7
	stwa	%g4,	[%l7 + %i7] 0x88
	or	%l0,	%g7,	%i0
	nop
	set	0x1C, %i5
	ldsw	[%l7 + %i5],	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%o5
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%f14
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x1B, %l4
	ldsb	[%l7 + %l4],	%g2
	set	0x58, %g7
	stwa	%g3,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x38, %o0
	stx	%fsr,	[%l7 + %o0]
	add	%o2,	%i2,	%l4
	nop
	set	0x21, %o4
	ldstub	[%l7 + %o4],	%i5
	bne,a	%xcc,	loop_119
	nop
	set	0x66, %l0
	stb	%l5,	[%l7 + %l0]
	nop
	set	0x34, %o6
	lduw	[%l7 + %o6],	%l3
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
loop_119:
	st	%fsr,	[%l7 + 0x58]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%l6
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f0
	nop
	set	0x18, %i3
	sth	%o7,	[%l7 + %i3]
	nop
	set	0x22, %l2
	ldsh	[%l7 + %l2],	%o0
	set	0x2C, %i1
	lda	[%l7 + %i1] 0x81,	%f7
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x80,	 2
	nop
	set	0x54, %l6
	ldsw	[%l7 + %l6],	%i1
	set	0x30, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g5
	nop
	set	0x4C, %o1
	ldsh	[%l7 + %o1],	%o6
	set	0x64, %g4
	swapa	[%l7 + %g4] 0x88,	%l1
	nop
	set	0x48, %i4
	std	%i6,	[%l7 + %i4]
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%i6
	or	%l2,	%o1,	%o3
	set	0x14, %i0
	lda	[%l7 + %i0] 0x88,	%f24
	wr	%g4,	%l0,	%y
	set	0x14, %g3
	lda	[%l7 + %g3] 0x89,	%f9
	nop
	set	0x58, %i2
	prefetch	[%l7 + %i2],	 1
	nop
	set	0x78, %g5
	sth	%g1,	[%l7 + %g5]
	nop
	set	0x59, %o3
	ldsb	[%l7 + %o3],	%i0
	nop
	set	0x20, %o2
	std	%f2,	[%l7 + %o2]
	set	0x0C, %g6
	stwa	%g7,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%i4
	nop
	set	0x70, %l1
	std	%g6,	[%l7 + %l1]
	set	0x40, %i5
	stxa	%o5,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x10, %i7
	std	%g2,	[%l7 + %i7]
	nop
	set	0x24, %l4
	lduw	[%l7 + %l4],	%o2
	nop
	set	0x08, %g7
	ldsh	[%l7 + %g7],	%i2
	nop
	set	0x4F, %i6
	ldub	[%l7 + %i6],	%l4
	fpadd32	%f18,	%f30,	%f12
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%l5
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%i3
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%l3
	nop
	set	0x60, %o0
	std	%o6,	[%l7 + %o0]
	set	0x64, %l0
	stwa	%l6,	[%l7 + %l0] 0x80
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xda
	nop
	set	0x4E, %g2
	ldsh	[%l7 + %g2],	%o4
	nop
	set	0x40, %o5
	sth	%o0,	[%l7 + %o5]
	set	0x44, %l2
	stwa	%i1,	[%l7 + %l2] 0xeb
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%g5
	nop
	set	0x0C, %i1
	lduw	[%l7 + %i1],	%i7
	set	0x50, %i3
	lda	[%l7 + %i3] 0x80,	%f15
	nop
	set	0x78, %l6
	stx	%l1,	[%l7 + %l6]
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x52, %o1
	ldsh	[%l7 + %o1],	%l2
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x5C, %g4
	stha	%i6,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x57, %i4
	stba	%o1,	[%l7 + %i4] 0x81
	set	0x28, %l3
	lda	[%l7 + %l3] 0x89,	%f10
	nop
	set	0x36, %i0
	sth	%g4,	[%l7 + %i0]
	nop
	set	0x20, %i2
	ldub	[%l7 + %i2],	%l0
	set	0x50, %g5
	stda	%o2,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x08, %o3
	sta	%f9,	[%l7 + %o3] 0x80
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1272
!	Type a   	: 25
!	Type cti   	: 21
!	Type x   	: 524
!	Type f   	: 30
!	Type i   	: 128
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 5 Start
!
.global thread_5
thread_5:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0x5,	%g2
	set	0x8,	%g3
	set	0x8,	%g4
	set	0xA,	%g5
	set	0x5,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x0,	%i1
	set	-0x2,	%i2
	set	-0x1,	%i3
	set	-0x0,	%i4
	set	-0x1,	%i5
	set	-0xF,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x74D33538,	%l0
	set	0x77A1FDD6,	%l1
	set	0x640E11FA,	%l2
	set	0x7B5FB234,	%l3
	set	0x5A0CE778,	%l4
	set	0x4B57C5F2,	%l5
	set	0x64607B7B,	%l6
	!# Output registers
	set	-0x15ED,	%o0
	set	0x0F68,	%o1
	set	-0x1CD2,	%o2
	set	-0x1636,	%o3
	set	-0x0FAA,	%o4
	set	-0x0E8E,	%o5
	set	-0x127D,	%o6
	set	0x1034,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA52B36A3745B7D0F)
	INIT_TH_FP_REG(%l7,%f2,0xF56E0DA3B90577AE)
	INIT_TH_FP_REG(%l7,%f4,0x402D7DAC36E9E004)
	INIT_TH_FP_REG(%l7,%f6,0x3E7BF54684D0E162)
	INIT_TH_FP_REG(%l7,%f8,0x28D8FFEFD3AADC85)
	INIT_TH_FP_REG(%l7,%f10,0xCB7B13CDA6BF8DEA)
	INIT_TH_FP_REG(%l7,%f12,0xFBE4579F62424EC9)
	INIT_TH_FP_REG(%l7,%f14,0x0803BB4F6DA96F25)
	INIT_TH_FP_REG(%l7,%f16,0x8C8CF0668AFE08A2)
	INIT_TH_FP_REG(%l7,%f18,0xA553375C4CDAC316)
	INIT_TH_FP_REG(%l7,%f20,0x08DDCB6D2CEAA72B)
	INIT_TH_FP_REG(%l7,%f22,0x33B2375325954A03)
	INIT_TH_FP_REG(%l7,%f24,0xBE22DBBDCE6BB10C)
	INIT_TH_FP_REG(%l7,%f26,0xD5B7E828433B5701)
	INIT_TH_FP_REG(%l7,%f28,0xEE1A081B36C4A381)
	INIT_TH_FP_REG(%l7,%f30,0xB3D02AD26C75010E)

	!# Execute Main Diag ..

	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f0
	set	0x50, %g1
	ldda	[%l7 + %g1] 0xeb,	%i0
	ld	[%l7 + 0x48],	%f30
	set	0x2E, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g7
	nop
	set	0x10, %l1
	sth	%g1,	[%l7 + %l1]
	set	0x68, %i5
	ldxa	[%l7 + %i5] 0x89,	%i4
	set	0x21, %l4
	stba	%o5,	[%l7 + %l4] 0x89
	set	0x52, %g7
	stba	%g6,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x1C, %i6
	stw	%g3,	[%l7 + %i6]
	nop
	set	0x24, %i7
	prefetch	[%l7 + %i7],	 0
	add	%o2,	%l4,	%g2
	nop
	set	0x5B, %o0
	stb	%l5,	[%l7 + %o0]
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%i5
	nop
	set	0x20, %l0
	std	%i2,	[%l7 + %l0]
	nop
	set	0x28, %g2
	lduh	[%l7 + %g2],	%l3
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x80
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x88,	%o7
	nop
	set	0x74, %o5
	swap	[%l7 + %o5],	%i2
	and	%l6,	%o4,	%i1
	nop
	set	0x70, %i3
	lduw	[%l7 + %i3],	%o6
	nop
	set	0x68, %l6
	swap	[%l7 + %l6],	%o0
	or	%g5,	%l1,	%l2
	set	0x38, %l5
	stxa	%i7,	[%l7 + %l5] 0x81
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f16
	st	%fsr,	[%l7 + 0x18]
	set	0x34, %i1
	stwa	%i6,	[%l7 + %i1] 0x80
	nop
	set	0x18, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x59, %i4
	ldub	[%l7 + %i4],	%g4
	add	%l0,	%o3,	%o1
	nop
	set	0x37, %l3
	ldsb	[%l7 + %l3],	%g7
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i4
	bl,pn	%xcc,	loop_120
	nop
	set	0x68, %o7
	ldub	[%l7 + %o7],	%i0
	nop
	nop
	setx	0xEB2C855CC8D2FE29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xF04E320624C3348B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f6,	%f28
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%g6
loop_120:
	nop
	set	0x0D, %i2
	ldstub	[%l7 + %i2],	%o2
	nop
	set	0x1B, %g5
	ldsb	[%l7 + %g5],	%g3
	nop
	nop
	setx	0xC1FCB866A4D4D762,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9ED669403ECC5988,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f4,	%f16
	nop
	set	0x1B, %o3
	ldsb	[%l7 + %o3],	%l4
	nop
	set	0x20, %i0
	std	%f12,	[%l7 + %i0]
	nop
	set	0x68, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x20, %o2
	lduh	[%l7 + %o2],	%g2
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x81,	 0
	nop
	set	0x71, %l1
	ldsb	[%l7 + %l1],	%i3
	wr	%i5,	%l3,	%clear_softint
	nop
	set	0x70, %i5
	ldsw	[%l7 + %i5],	%o7
	set	0x40, %l4
	stxa	%i2,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x1C, %g6
	stha	%l6,	[%l7 + %g6] 0x80
	nop
	set	0x58, %i6
	sth	%o4,	[%l7 + %i6]
	nop
	set	0x1C, %i7
	stw	%o6,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x68]
	and	%o0,	%i1,	%g5
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf9
	membar	#Sync
	nop
	set	0x30, %o4
	stb	%l1,	[%l7 + %o4]
	set	0x38, %g7
	swapa	[%l7 + %g7] 0x81,	%l2
	nop
	set	0x25, %g2
	stb	%i7,	[%l7 + %g2]
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%i6
	nop
	set	0x48, %l2
	ldsw	[%l7 + %l2],	%l0
	set	0x78, %o5
	stda	%o2,	[%l7 + %o5] 0x89
	set	0x6C, %i3
	stwa	%g4,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x47, %o6
	ldstub	[%l7 + %o6],	%g7
	set	0x46, %l6
	stha	%g1,	[%l7 + %l6] 0xe3
	membar	#Sync
	and	%o1,	%i4,	%o5
	set	0x70, %l5
	stxa	%i0,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x1C, %o1
	ldsh	[%l7 + %o1],	%g6
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x81,	%g2
	set	0x70, %i4
	stxa	%o2,	[%l7 + %i4] 0x89
	nop
	set	0x60, %g4
	std	%l4,	[%l7 + %g4]
	or	%g2,	%i3,	%i5
	set	0x2C, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l5
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x81,	 3
	set	0x28, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	nop
	set	0x74, %o3
	ldsw	[%l7 + %o3],	%l6
	st	%fsr,	[%l7 + 0x58]
	set	0x31, %g5
	stba	%o4,	[%l7 + %g5] 0x89
	nop
	set	0x2C, %g3
	stw	%o6,	[%l7 + %g3]
	nop
	set	0x68, %o2
	std	%o0,	[%l7 + %o2]
	ble,a	%icc,	loop_121
	and	%i1,	%g5,	%l1
	set	0x10, %i0
	sta	%f6,	[%l7 + %i0] 0x81
loop_121:
	nop
	set	0x78, %l1
	stx	%l2,	[%l7 + %l1]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd0
	nop
	set	0x38, %i5
	std	%i6,	[%l7 + %i5]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%i2
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x89,	%l0
	set	0x48, %i6
	stba	%g4,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x44, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x08, %o0
	stx	%g7,	[%l7 + %o0]
	set	0x20, %o4
	stda	%o2,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x68, %g7
	lduw	[%l7 + %g7],	%g1
	nop
	set	0x54, %i7
	prefetch	[%l7 + %i7],	 4
	set	0x58, %g2
	stda	%o0,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x08, %l2
	ldx	[%l7 + %l2],	%o5
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%f22
	and	%i4,	%i0,	%g3
	st	%f23,	[%l7 + 0x64]
	nop
	set	0x08, %i3
	ldsw	[%l7 + %i3],	%g6
	ld	[%l7 + 0x60],	%f4
	nop
	set	0x33, %o5
	stb	%o2,	[%l7 + %o5]
	nop
	set	0x41, %l6
	stb	%g2,	[%l7 + %l6]
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x88,	%i3
	ld	[%l7 + 0x74],	%f16
	nop
	set	0x60, %o6
	lduh	[%l7 + %o6],	%l4
	nop
	set	0x08, %o1
	stx	%i5,	[%l7 + %o1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l3
	nop
	set	0x44, %i4
	lduw	[%l7 + %i4],	%o7
	nop
	set	0x0A, %g4
	sth	%o4,	[%l7 + %g4]
	nop
	set	0x6C, %i1
	sth	%l6,	[%l7 + %i1]
	nop
	set	0x64, %l3
	stw	%o6,	[%l7 + %l3]
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x33, %o3
	stb	%i1,	[%l7 + %o3]
	st	%f16,	[%l7 + 0x40]
	set	0x5E, %g5
	stha	%g5,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x21, %g3
	ldstub	[%l7 + %g3],	%l1
	set	0x52, %i2
	stha	%l2,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xea,	%o0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%i6
	nop
	set	0x1C, %g1
	ldstub	[%l7 + %g1],	%l0
	set	0x48, %l1
	sta	%f23,	[%l7 + %l1] 0x80
	set	0x18, %i5
	stxa	%g7,	[%l7 + %i5] 0xe3
	membar	#Sync
	and	%o3,	%g4,	%o1
	set	0x60, %i6
	sta	%f14,	[%l7 + %i6] 0x81
	nop
	set	0x48, %l4
	stx	%g1,	[%l7 + %l4]
	fpadd32s	%f22,	%f13,	%f3
	nop
	set	0x24, %g6
	lduw	[%l7 + %g6],	%i4
	nop
	set	0x50, %o4
	swap	[%l7 + %o4],	%o5
	nop
	set	0x48, %g7
	stx	%i0,	[%l7 + %g7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%g3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f16
	set	0x20, %o0
	stda	%o2,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x80,	%i3
	nop
	set	0x62, %l0
	ldsh	[%l7 + %l0],	%g2
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x80,	 1
	set	0x20, %o5
	prefetcha	[%l7 + %o5] 0x80,	 3
	nop
	set	0x1E, %l2
	sth	%l3,	[%l7 + %l2]
	nop
	nop
	setx	0xF7FA08C5EA1997C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x6FFFB4F307878638,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f16,	%f18
	and	%o7,	%o4,	%l6
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x50, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x88,	%o6
	set	0x58, %o1
	stda	%i0,	[%l7 + %o1] 0xea
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%l1
	nop
	set	0x38, %i4
	stx	%l2,	[%l7 + %i4]
	set	0x0D, %o6
	stba	%o0,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x68, %g4
	lduw	[%l7 + %g4],	%l5
	or	%i2,	%i6,	%i7
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x81,	%l0
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%g7
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x88,	 1
	and	%o1,	%g1,	%g4
	or	%o5,	%i0,	%i4
	set	0x27, %g5
	ldstuba	[%l7 + %g5] 0x89,	%g3
	set	0x3E, %i1
	stha	%o2,	[%l7 + %i1] 0x88
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%g6
	nop
	set	0x58, %g3
	stx	%g2,	[%l7 + %g3]
	set	0x08, %i0
	stda	%i2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x16, %g1
	sth	%l4,	[%l7 + %g1]
	nop
	set	0x52, %o2
	lduh	[%l7 + %o2],	%l3
	set	0x62, %i5
	stha	%o7,	[%l7 + %i5] 0x88
	wr	%o4,	%i5,	%y
	set	0x72, %i6
	stha	%l6,	[%l7 + %i6] 0x81
	ld	[%l7 + 0x20],	%f5
	set	0x7A, %l4
	stba	%i1,	[%l7 + %l4] 0x81
	nop
	set	0x60, %g6
	ldsw	[%l7 + %g6],	%g5
	nop
	set	0x08, %l1
	ldsh	[%l7 + %l1],	%l1
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%f22
	nop
	set	0x20, %i7
	std	%o6,	[%l7 + %i7]
	add	%o0,	%l5,	%i2
	set	0x67, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l2
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x80,	%i7
	nop
	set	0x33, %g2
	ldsb	[%l7 + %g2],	%l0
	ld	[%l7 + 0x60],	%f9
	nop
	set	0x24, %i3
	lduw	[%l7 + %i3],	%g7
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%i6
	set	0x60, %o5
	ldxa	[%l7 + %o5] 0x81,	%o3
	nop
	set	0x38, %l5
	sth	%g1,	[%l7 + %l5]
	set	0x3C, %l2
	stwa	%g4,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x88,	%o1
	nop
	set	0x44, %i4
	sth	%o5,	[%l7 + %i4]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%g3
	nop
	set	0x72, %o6
	ldsb	[%l7 + %o6],	%i0
	or	%o2,	%g6,	%i3
	or	%l4,	%l3,	%g2
	set	0x10, %g4
	stda	%o4,	[%l7 + %g4] 0x88
	ld	[%l7 + 0x54],	%f19
	nop
	set	0x1E, %l3
	lduh	[%l7 + %l3],	%i5
	st	%fsr,	[%l7 + 0x38]
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x89,	%o7
	nop
	nop
	setx	0x0147EEBCC633A150,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x0CFD4185FB890AA3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f30,	%f24
	set	0x1A, %l6
	stba	%i1,	[%l7 + %l6] 0x81
	nop
	set	0x20, %g5
	lduh	[%l7 + %g5],	%l6
	nop
	set	0x0C, %i1
	lduw	[%l7 + %i1],	%l1
	nop
	set	0x28, %o3
	std	%f0,	[%l7 + %o3]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc0
	set	0x5F, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o6
	or	%g5,	%o0,	%i2
	nop
	set	0x78, %g3
	std	%f0,	[%l7 + %g3]
	set	0x68, %o2
	swapa	[%l7 + %o2] 0x80,	%l5
	set	0x56, %g1
	stha	%i7,	[%l7 + %g1] 0x88
	nop
	nop
	setx	0x5C15D70A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x925CB037,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f1,	%f25
	set	0x34, %i6
	stha	%l0,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%g7,	%i6,	%o3
	set	0x08, %g6
	swapa	[%l7 + %g6] 0x81,	%l2
	add	%g4,	%g1,	%o1
	nop
	set	0x68, %l1
	std	%f14,	[%l7 + %l1]
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x89,	 3
	and	%i4,	%g3,	%o2
	nop
	set	0x32, %i7
	ldsh	[%l7 + %i7],	%g6
	nop
	set	0x28, %g7
	swap	[%l7 + %g7],	%i0
	set	0x2C, %o0
	lda	[%l7 + %o0] 0x89,	%f14
	bgu,a,pt	%xcc,	loop_122
	or	%i3,	%l3,	%l4
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
loop_122:
	nop
	set	0x38, %i3
	swapa	[%l7 + %i3] 0x88,	%g2
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%i5
	set	0x18, %l0
	stda	%o6,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x60, %l5
	std	%f4,	[%l7 + %l5]
	st	%f11,	[%l7 + 0x40]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	set	0x28, %o1
	stxa	%i1,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%i6
	nop
	set	0x38, %o6
	lduw	[%l7 + %o6],	%l1
	ld	[%l7 + 0x10],	%f19
	set	0x20, %l3
	stxa	%o6,	[%l7 + %l3] 0x81
	set	0x60, %o7
	prefetcha	[%l7 + %o7] 0x81,	 4
	set	0x50, %g4
	ldxa	[%l7 + %g4] 0x81,	%o0
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc4
	bgu	%icc,	loop_123
	nop
	set	0x24, %g5
	lduw	[%l7 + %g5],	%o4
	nop
	set	0x54, %i1
	ldsw	[%l7 + %i1],	%l5
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x81,	%i2
loop_123:
	st	%f28,	[%l7 + 0x74]
	nop
	set	0x60, %i2
	swap	[%l7 + %i2],	%l0
	set	0x4B, %i0
	stba	%g7,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x48, %o2
	std	%i6,	[%l7 + %o2]
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	nop
	set	0x50, %g1
	stx	%i7,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x60]
	set	0x58, %i6
	stxa	%g4,	[%l7 + %i6] 0x89
	wr	%l2,	%o1,	%pic
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x81,	%o5
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%i4
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x80,	%g3
	nop
	set	0x7C, %i5
	lduw	[%l7 + %i5],	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%g6
	fpsub16s	%f10,	%f13,	%f27
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f4
	set	0x34, %o0
	swapa	[%l7 + %o0] 0x81,	%i0
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x1C, %o4
	ldstub	[%l7 + %o4],	%l3
	nop
	set	0x16, %g7
	ldsb	[%l7 + %g7],	%l4
	nop
	set	0x5C, %i3
	stw	%g2,	[%l7 + %i3]
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x1C, %l5
	swapa	[%l7 + %l5] 0x80,	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA60, 	%tick_cmpr
	set	0x38, %l2
	prefetcha	[%l7 + %l2] 0x80,	 1
	set	0x58, %o5
	stba	%l6,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x80,	%o6
	and	%g5,	%l1,	%o0
	nop
	set	0x1D, %o6
	ldub	[%l7 + %o6],	%l5
	and	%o4,	%l0,	%g7
	set	0x08, %l3
	stxa	%i6,	[%l7 + %l3] 0x89
	set	0x38, %i4
	lda	[%l7 + %i4] 0x81,	%f21
	fpsub32	%f14,	%f6,	%f16
	wr	%o3,	%i7,	%clear_softint
	fpsub16	%f10,	%f16,	%f2
	nop
	set	0x58, %o7
	ldsh	[%l7 + %o7],	%g4
	st	%f20,	[%l7 + 0x38]
	set	0x29, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l2
	set	0x10, %g4
	sta	%f8,	[%l7 + %g4] 0x88
	nop
	set	0x2B, %i1
	ldsb	[%l7 + %i1],	%o1
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x08, %o3
	stha	%o5,	[%l7 + %o3] 0x80
	nop
	set	0x38, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x80,	%i4
	nop
	set	0x5C, %g3
	stw	%i2,	[%l7 + %g3]
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x88,	%o2
	nop
	set	0x40, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x2D, %i6
	ldsb	[%l7 + %i6],	%g1
	fpadd16	%f2,	%f8,	%f26
	set	0x38, %g6
	stwa	%g6,	[%l7 + %g6] 0x81
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x89,	%g2
	set	0x44, %i5
	lda	[%l7 + %i5] 0x81,	%f17
	st	%f13,	[%l7 + 0x38]
	set	0x30, %i7
	stda	%i0,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x44, %o0
	prefetch	[%l7 + %o0],	 0
	set	0x60, %l1
	stxa	%l4,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x30, %g2
	stx	%l3,	[%l7 + %g2]
	fpadd16s	%f15,	%f22,	%f19
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd0,	%f16
	set	0x70, %i3
	stwa	%i3,	[%l7 + %i3] 0x81
	add	%g2,	%o7,	%i5
	add	%i1,	%o6,	%l6
	and	%g5,	%o0,	%l5
	nop
	set	0x60, %o4
	ldsw	[%l7 + %o4],	%o4
	nop
	set	0x64, %l0
	sth	%l1,	[%l7 + %l0]
	nop
	set	0x40, %l2
	swap	[%l7 + %l2],	%g7
	fpsub16s	%f14,	%f23,	%f13
	set	0x55, %l5
	ldstuba	[%l7 + %l5] 0x89,	%l0
	nop
	set	0x31, %o1
	ldstub	[%l7 + %o1],	%o3
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f20
	nop
	set	0x50, %l3
	stx	%i6,	[%l7 + %l3]
	nop
	set	0x28, %i4
	swap	[%l7 + %i4],	%g4
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%f0
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%f14
	set	0x55, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l2
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%i6
	set	0x50, %g4
	prefetcha	[%l7 + %g4] 0x81,	 2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf1
	membar	#Sync
	set	0x68, %o3
	stda	%i4,	[%l7 + %o3] 0x80
	nop
	set	0x78, %i2
	stb	%i2,	[%l7 + %i2]
	nop
	set	0x70, %g3
	std	%o2,	[%l7 + %g3]
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf8,	%f16
	and	%o5,	%g6,	%g3
	wr	%i0,	%g1,	%ccr
	ld	[%l7 + 0x34],	%f5
	nop
	set	0x3C, %o2
	ldsw	[%l7 + %o2],	%l4
	nop
	set	0x64, %g1
	lduw	[%l7 + %g1],	%l3
	set	0x58, %g6
	swapa	[%l7 + %g6] 0x80,	%g2
	set	0x44, %i6
	swapa	[%l7 + %i6] 0x89,	%i3
	add	%o7,	%i1,	%i5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0C2, 	%sys_tick_cmpr
	bge,pt	%icc,	loop_124
	nop
	set	0x4C, %i5
	ldsh	[%l7 + %i5],	%o6
	nop
	set	0x10, %l4
	stx	%l5,	[%l7 + %l4]
	nop
	set	0x58, %o0
	std	%o0,	[%l7 + %o0]
loop_124:
	nop
	set	0x37, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l1
	set	0x1C, %g2
	stwa	%o4,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	nop
	setx	0x1BFD8FD8BA092C52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x0C9D69BC6B0903AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f22,	%f24
	nop
	set	0x18, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x28, %i3
	sta	%f2,	[%l7 + %i3] 0x80
	nop
	set	0x58, %g7
	std	%l0,	[%l7 + %g7]
	and	%o3,	%i6,	%g4
	nop
	set	0x78, %l0
	stx	%g7,	[%l7 + %l0]
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f8
	st	%fsr,	[%l7 + 0x24]
	set	0x40, %l5
	lda	[%l7 + %l5] 0x81,	%f8
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x88,	%i7
	nop
	set	0x68, %o6
	stx	%o1,	[%l7 + %o6]
	set	0x20, %l2
	stda	%l2,	[%l7 + %l2] 0x89
	fpadd32s	%f23,	%f17,	%f16
	set	0x67, %l3
	ldstuba	[%l7 + %l3] 0x80,	%i2
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x80,	%o2
	or	%i4,	%g6,	%o5
	bn,a	%icc,	loop_125
	nop
	set	0x64, %o7
	lduw	[%l7 + %o7],	%i0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%l4
loop_125:
	fpsub16	%f4,	%f28,	%f28
	set	0x38, %l6
	swapa	[%l7 + %l6] 0x81,	%l3
	set	0x0F, %o5
	ldstuba	[%l7 + %o5] 0x88,	%g2
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f22
	nop
	set	0x0B, %g5
	stb	%i3,	[%l7 + %g5]
	set	0x7C, %i1
	swapa	[%l7 + %i1] 0x80,	%o7
	nop
	set	0x08, %o3
	std	%i0,	[%l7 + %o3]
	set	0x14, %g3
	stwa	%g3,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%i5
	set	0x08, %i0
	stwa	%l6,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc8
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xe3,	%g4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f0
	set	0x7D, %i5
	stba	%l5,	[%l7 + %i5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x70],	%f16
	set	0x60, %l4
	stwa	%o6,	[%l7 + %l4] 0x89
	and	%l1,	%o4,	%l0
	st	%f9,	[%l7 + 0x3C]
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%o3
	wr	%i6,	%g4,	%ccr
	nop
	set	0x34, %o0
	lduw	[%l7 + %o0],	%o0
	nop
	set	0x1C, %g2
	swap	[%l7 + %g2],	%g7
	set	0x48, %l1
	stda	%i6,	[%l7 + %l1] 0x80
	nop
	nop
	setx	0x8C6CA3A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x8B34C591,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f7,	%f1
	set	0x08, %i3
	stda	%l2,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x48, %i7
	stw	%o1,	[%l7 + %i7]
	ld	[%l7 + 0x70],	%f1
	nop
	set	0x66, %l0
	lduh	[%l7 + %l0],	%i2
	nop
	set	0x5A, %g7
	sth	%i4,	[%l7 + %g7]
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xea,	%g6
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x88,	%o2
	and	%o5,	%i0,	%l4
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x28, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x24, %l2
	stb	%l3,	[%l7 + %l2]
	nop
	set	0x48, %i4
	ldstub	[%l7 + %i4],	%g2
	nop
	set	0x38, %o7
	std	%g0,	[%l7 + %o7]
	nop
	set	0x38, %l3
	std	%o6,	[%l7 + %l3]
	set	0x42, %l6
	stha	%i3,	[%l7 + %l6] 0x88
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x81,	%i1
	nop
	set	0x60, %g4
	std	%f4,	[%l7 + %g4]
	or	%i5,	%g3,	%l6
	set	0x47, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g5
	and	%l5,	%l1,	%o4
	nop
	set	0x14, %o3
	lduw	[%l7 + %o3],	%o6
	nop
	set	0x3E, %i1
	sth	%l0,	[%l7 + %i1]
	and	%i6,	%g4,	%o3
	nop
	set	0x22, %g3
	lduh	[%l7 + %g3],	%g7
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd8
	set	0x70, %i2
	stxa	%o0,	[%l7 + %i2] 0x89
	set	0x28, %o2
	lda	[%l7 + %o2] 0x89,	%f13
	set	0x0C, %g6
	stba	%i7,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x78, %i5
	sta	%f30,	[%l7 + %i5] 0x89
	st	%fsr,	[%l7 + 0x3C]
	or	%l2,	%i2,	%o1
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%o5
	bne,a,pn	%xcc,	loop_126
	nop
	set	0x6C, %i6
	stw	%i0,	[%l7 + %i6]
	fpadd16	%f6,	%f4,	%f22
	set	0x14, %l4
	stba	%o2,	[%l7 + %l4] 0xeb
	membar	#Sync
loop_126:
	nop
	set	0x48, %g2
	prefetch	[%l7 + %g2],	 0
	nop
	set	0x6A, %o0
	sth	%l4,	[%l7 + %o0]
	set	0x3C, %l1
	sta	%f21,	[%l7 + %l1] 0x80
	nop
	set	0x7C, %i7
	stw	%l3,	[%l7 + %i7]
	nop
	set	0x40, %i3
	stx	%g2,	[%l7 + %i3]
	nop
	set	0x0F, %g7
	stb	%o7,	[%l7 + %g7]
	ld	[%l7 + 0x24],	%f3
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x81
	or	%g1,	%i1,	%i3
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x89,	 0
	nop
	set	0x28, %o6
	stx	%g3,	[%l7 + %o6]
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%i6
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x81,	%l5
	nop
	set	0x5B, %l2
	ldsb	[%l7 + %l2],	%l1
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%o4
	nop
	set	0x47, %i4
	stb	%o6,	[%l7 + %i4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%l0
	nop
	set	0x08, %l3
	std	%f10,	[%l7 + %l3]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f16
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x88
	nop
	set	0x6A, %g5
	ldsh	[%l7 + %g5],	%i6
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%o2
	nop
	set	0x50, %i1
	std	%g6,	[%l7 + %i1]
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xea,	%g4
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	set	0x5C, %i2
	swapa	[%l7 + %i2] 0x88,	%o0
	set	0x78, %i0
	sta	%f21,	[%l7 + %i0] 0x88
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%l2
	nop
	set	0x4C, %g6
	swap	[%l7 + %g6],	%o1
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%i0
	nop
	set	0x58, %o2
	swap	[%l7 + %o2],	%o2
	set	0x38, %g1
	lda	[%l7 + %g1] 0x80,	%f11
	nop
	set	0x20, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x6C, %l4
	lduh	[%l7 + %l4],	%o5
	add	%l4,	%l3,	%o7
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x89,	%g1
	and	%g2,	%i3,	%i5
	nop
	set	0x38, %g2
	stx	%g3,	[%l7 + %g2]
	set	0x70, %l1
	stda	%i6,	[%l7 + %l1] 0xe3
	membar	#Sync
	st	%f9,	[%l7 + 0x70]
	set	0x5D, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l5
	set	0x50, %g7
	ldda	[%l7 + %g7] 0x80,	%i0
	set	0x48, %i7
	lda	[%l7 + %i7] 0x89,	%f24
	fpadd32s	%f7,	%f14,	%f4
	nop
	set	0x3C, %l5
	stw	%l1,	[%l7 + %l5]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f0
	ld	[%l7 + 0x34],	%f6
	nop
	set	0x20, %o4
	stx	%fsr,	[%l7 + %o4]
	fpadd16	%f14,	%f12,	%f26
	set	0x28, %l0
	swapa	[%l7 + %l0] 0x88,	%o6
	nop
	set	0x39, %l2
	stb	%o4,	[%l7 + %l2]
	set	0x4A, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g5
	set	0x0A, %i4
	stha	%i6,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x08, %l3
	swap	[%l7 + %l3],	%l0
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x89,	 1
	add	%g4,	%i7,	%g7
	nop
	set	0x38, %l6
	ldsw	[%l7 + %l6],	%i2
	nop
	set	0x46, %o7
	sth	%l2,	[%l7 + %o7]
	and	%o1,	%o0,	%i4
	wr	%g6,	%o2,	%ccr
	nop
	set	0x74, %g4
	ldub	[%l7 + %g4],	%i0
	set	0x7C, %i1
	stba	%o5,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%l4
	set	0x10, %g3
	stxa	%l3,	[%l7 + %g3] 0x89
	set	0x40, %i2
	sta	%f16,	[%l7 + %i2] 0x80
	nop
	set	0x40, %i0
	std	%f6,	[%l7 + %i0]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
	nop
	set	0x3E, %i5
	ldsh	[%l7 + %i5],	%o7
	nop
	set	0x44, %o2
	stw	%g1,	[%l7 + %o2]
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f24
	nop
	set	0x64, %g5
	stb	%g2,	[%l7 + %g5]
	nop
	set	0x6C, %i6
	ldsh	[%l7 + %i6],	%i3
	set	0x1C, %o0
	stwa	%g3,	[%l7 + %o0] 0xeb
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%l5
	set	0x5A, %l4
	stha	%i1,	[%l7 + %l4] 0xea
	membar	#Sync
	add	%i5,	%o6,	%o4
	set	0x79, %l1
	stba	%g5,	[%l7 + %l1] 0x89
	nop
	set	0x58, %i3
	std	%i6,	[%l7 + %i3]
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf8
	membar	#Sync
	add	%l1,	%l0,	%g4
	set	0x18, %g2
	prefetcha	[%l7 + %g2] 0x81,	 1
	nop
	set	0x10, %l5
	stw	%o3,	[%l7 + %l5]
	wr	%g7,	%i2,	%pic
	nop
	set	0x10, %o6
	stx	%l2,	[%l7 + %o6]
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x5D, %o4
	stb	%o1,	[%l7 + %o4]
	set	0x40, %l0
	stda	%i4,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xe3,	%g6
	and	%o2,	%o0,	%i0
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f26
	set	0x48, %o1
	swapa	[%l7 + %o1] 0x89,	%l4
	nop
	set	0x3E, %l3
	lduh	[%l7 + %l3],	%l3
	set	0x68, %o5
	stxa	%o5,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xda
	nop
	set	0x2B, %l6
	ldstub	[%l7 + %l6],	%o7
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%g1
	nop
	set	0x53, %i1
	ldub	[%l7 + %i1],	%i3
	nop
	set	0x58, %o7
	ldub	[%l7 + %o7],	%g2
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%i6
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x10, %i0
	stx	%g3,	[%l7 + %i0]
	ld	[%l7 + 0x20],	%f21
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%l4
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%i4
	or	%i1,	%o6,	%o4
	nop
	set	0x38, %o2
	swap	[%l7 + %o2],	%g5
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%f24
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xd8
	nop
	set	0x78, %i5
	stw	%l1,	[%l7 + %i5]
	nop
	set	0x64, %o0
	ldsw	[%l7 + %o0],	%l0
	nop
	set	0x76, %l4
	sth	%g4,	[%l7 + %l4]
	nop
	set	0x58, %i6
	ldsw	[%l7 + %i6],	%i6
	fpsub32	%f2,	%f6,	%f8
	nop
	set	0x08, %i3
	std	%f0,	[%l7 + %i3]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc8
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f0
	set	0x70, %g2
	swapa	[%l7 + %g2] 0x88,	%o3
	nop
	set	0x36, %o6
	stb	%g7,	[%l7 + %o6]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%i7
	wr	%l2,	%o1,	%set_softint
	set	0x10, %l5
	stda	%g6,	[%l7 + %l5] 0xea
	membar	#Sync
	and	%i4,	%o2,	%i0
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x88
	and	%l4,	%o0,	%l3
	nop
	set	0x46, %i7
	lduh	[%l7 + %i7],	%o5
	set	0x18, %o4
	lda	[%l7 + %o4] 0x81,	%f20
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%g1
	add	%i3,	%o7,	%l6
	nop
	set	0x59, %l3
	ldstub	[%l7 + %l3],	%g2
	st	%f15,	[%l7 + 0x60]
	set	0x74, %l2
	sta	%f20,	[%l7 + %l2] 0x81
	nop
	set	0x40, %i4
	ldsw	[%l7 + %i4],	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%i1
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%o6
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x46, %g4
	sth	%i5,	[%l7 + %g4]
	ld	[%l7 + 0x50],	%f26
	set	0x60, %i1
	prefetcha	[%l7 + %i1] 0x80,	 4
	nop
	set	0x54, %o7
	prefetch	[%l7 + %o7],	 0
	set	0x68, %i2
	ldxa	[%l7 + %i2] 0x88,	%l1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%g4
	nop
	set	0x60, %i0
	std	%f4,	[%l7 + %i0]
	set	0x68, %g6
	stwa	%i6,	[%l7 + %g6] 0x80
	set	0x30, %g3
	stda	%o2,	[%l7 + %g3] 0x88
	fpsub32	%f26,	%f24,	%f12
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd0
	nop
	set	0x39, %g1
	ldsb	[%l7 + %g1],	%g5
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x81,	%i2
	set	0x08, %i5
	ldxa	[%l7 + %i5] 0x88,	%g7
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f28
	ld	[%l7 + 0x10],	%f26
	nop
	set	0x57, %l4
	ldstub	[%l7 + %l4],	%i7
	set	0x50, %i6
	lda	[%l7 + %i6] 0x88,	%f14
	or	%o1,	%g6,	%l2
	nop
	nop
	setx	0x4B8EB707,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x1539E433,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f0,	%f6
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	st	%fsr,	[%l7 + 0x48]
	set	0x64, %i3
	swapa	[%l7 + %i3] 0x88,	%o2
	nop
	set	0x11, %g7
	ldsb	[%l7 + %g7],	%i0
	nop
	set	0x30, %g2
	ldsb	[%l7 + %g2],	%i4
	nop
	set	0x18, %o6
	stx	%o0,	[%l7 + %o6]
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xea,	%l2
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x48, %l5
	std	%f20,	[%l7 + %l5]
	nop
	set	0x32, %i7
	ldub	[%l7 + %i7],	%o5
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%g0
	set	0x78, %o1
	stba	%l4,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x121, 	%tick_cmpr
	set	0x17, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g2
	nop
	set	0x42, %l2
	stb	%l5,	[%l7 + %l2]
	nop
	set	0x30, %i4
	stx	%g3,	[%l7 + %i4]
	set	0x58, %l6
	stda	%o6,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x20, %l3
	swap	[%l7 + %l3],	%i1
	add	%o6,	%o4,	%l1
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd8
	nop
	set	0x74, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	set	0x30, %o5
	std	%f22,	[%l7 + %o5]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x88
	set	0x18, %o7
	stba	%l0,	[%l7 + %o7] 0x89
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x80,	%i5
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xca
	nop
	set	0x48, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x0C, %g1
	prefetch	[%l7 + %g1],	 0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%g5
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f6
	set	0x43, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i2
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%o3
	or	%g7,	%i7,	%g6
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x81,	%o1
	and	%l2,	%o2,	%i4
	wr	%i0,	%o0,	%set_softint
	nop
	set	0x6C, %i6
	ldsw	[%l7 + %i6],	%l3
	or	%o5,	%g1,	%i3
	nop
	set	0x10, %o0
	std	%i6,	[%l7 + %o0]
	nop
	set	0x50, %g5
	swap	[%l7 + %g5],	%g2
	st	%fsr,	[%l7 + 0x38]
	be,a	%icc,	loop_127
	nop
	set	0x30, %g7
	stx	%l5,	[%l7 + %g7]
	set	0x62, %g2
	stha	%g3,	[%l7 + %g2] 0x88
loop_127:
	and	%l4,	%o7,	%i1
	set	0x48, %i3
	prefetcha	[%l7 + %i3] 0x89,	 4
	nop
	set	0x79, %o6
	stb	%o4,	[%l7 + %o6]
	nop
	set	0x08, %l5
	swap	[%l7 + %l5],	%l0
	nop
	set	0x3C, %l1
	ldsh	[%l7 + %l1],	%l1
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f22
	set	0x32, %l0
	stha	%g4,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x78, %o4
	stwa	%i6,	[%l7 + %o4] 0x81
	nop
	set	0x74, %l2
	lduh	[%l7 + %l2],	%i5
	nop
	set	0x70, %i4
	std	%i2,	[%l7 + %i4]
	set	0x58, %o1
	sta	%f31,	[%l7 + %o1] 0x88
	set	0x38, %l3
	stda	%o2,	[%l7 + %l3] 0x80
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%f2
	nop
	set	0x28, %l6
	std	%f22,	[%l7 + %l6]
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x89,	%g5
	bg	%xcc,	loop_128
	nop
	set	0x54, %i2
	ldsh	[%l7 + %i2],	%i7
	set	0x74, %o7
	stwa	%g6,	[%l7 + %o7] 0x80
loop_128:
	nop
	set	0x28, %i0
	lduw	[%l7 + %i0],	%g7
	nop
	set	0x5C, %i1
	ldsb	[%l7 + %i1],	%o1
	nop
	set	0x68, %o2
	stw	%o2,	[%l7 + %o2]
	nop
	set	0x70, %g3
	stb	%l2,	[%l7 + %g3]
	nop
	set	0x60, %o3
	stx	%i0,	[%l7 + %o3]
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x89,	%i4
	nop
	set	0x6E, %g1
	ldsh	[%l7 + %g1],	%l3
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%o5
	nop
	set	0x10, %i6
	swap	[%l7 + %i6],	%g1
	nop
	set	0x78, %o0
	ldsw	[%l7 + %o0],	%o0
	set	0x30, %g5
	lda	[%l7 + %g5] 0x89,	%f1
	set	0x08, %g7
	stda	%i6,	[%l7 + %g7] 0xea
	membar	#Sync
	or	%i3,	%l5,	%g2
	nop
	set	0x5F, %i5
	ldsb	[%l7 + %i5],	%g3
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x88,	%l4
	nop
	set	0x18, %g2
	std	%f14,	[%l7 + %g2]
	set	0x0C, %o6
	stha	%o7,	[%l7 + %o6] 0x89
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f8
	nop
	set	0x5C, %l1
	stw	%o6,	[%l7 + %l1]
	set	0x1C, %i7
	sta	%f30,	[%l7 + %i7] 0x88
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%o4
	st	%f15,	[%l7 + 0x54]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%l1
	add	%g4,	%i6,	%l0
	set	0x10, %l2
	sta	%f4,	[%l7 + %l2] 0x80
	set	0x64, %o4
	sta	%f21,	[%l7 + %o4] 0x89
	fpadd32	%f20,	%f20,	%f24
	set	0x1C, %i4
	swapa	[%l7 + %i4] 0x81,	%i5
	set	0x44, %l3
	stha	%i2,	[%l7 + %l3] 0x80
	nop
	set	0x24, %o1
	ldub	[%l7 + %o1],	%o3
	and	%i7,	%g5,	%g6
	set	0x20, %g4
	stda	%g6,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x2F, %o5
	ldstub	[%l7 + %o5],	%o1
	st	%f25,	[%l7 + 0x20]
	set	0x30, %i2
	stda	%l2,	[%l7 + %i2] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	set	0x46, %l6
	stba	%o2,	[%l7 + %l6] 0x81
	wr	%i0,	%l3,	%sys_tick
	nop
	set	0x58, %o7
	ldstub	[%l7 + %o7],	%o5
	nop
	nop
	setx	0x96C95A8745BCD50B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x13E7374FCD5456BD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f28
	nop
	set	0x46, %i0
	sth	%i4,	[%l7 + %i0]
	nop
	set	0x48, %o2
	sth	%o0,	[%l7 + %o2]
	and	%l6,	%i3,	%l5
	set	0x5C, %i1
	stwa	%g1,	[%l7 + %i1] 0x81
	nop
	set	0x62, %o3
	ldsh	[%l7 + %o3],	%g2
	bgu,a	%xcc,	loop_129
	nop
	set	0x16, %g6
	ldsb	[%l7 + %g6],	%g3
	and	%o7,	%l4,	%o6
	nop
	set	0x18, %g1
	ldsh	[%l7 + %g1],	%o4
loop_129:
	fpadd16	%f18,	%f10,	%f0
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%i1
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%l1
	nop
	set	0x61, %i6
	ldsb	[%l7 + %i6],	%g4
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%f24
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%i6
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xda,	%f0
	nop
	set	0x10, %i5
	ldsw	[%l7 + %i5],	%l0
	set	0x34, %g2
	swapa	[%l7 + %g2] 0x81,	%i5
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 0
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x89,	%i2
	or	%o3,	%i7,	%g6
	nop
	set	0x53, %l1
	stb	%g7,	[%l7 + %l1]
	nop
	set	0x28, %i7
	stx	%o1,	[%l7 + %i7]
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x48, %l5
	stda	%l2,	[%l7 + %l5] 0x88
	nop
	set	0x4D, %l2
	stb	%o2,	[%l7 + %l2]
	nop
	set	0x1E, %i4
	sth	%g5,	[%l7 + %i4]
	nop
	set	0x6A, %o4
	ldsb	[%l7 + %o4],	%i0
	nop
	set	0x66, %l3
	ldsb	[%l7 + %l3],	%o5
	nop
	set	0x70, %g4
	lduw	[%l7 + %g4],	%i4
	set	0x40, %o5
	lda	[%l7 + %o5] 0x81,	%f28
	nop
	set	0x28, %o1
	ldsb	[%l7 + %o1],	%o0
	set	0x28, %l6
	stba	%l3,	[%l7 + %l6] 0x89
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%f18
	set	0x10, %i0
	stha	%l6,	[%l7 + %i0] 0x88
	st	%f11,	[%l7 + 0x08]
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f22
	nop
	set	0x7D, %i1
	ldsb	[%l7 + %i1],	%i3
	nop
	set	0x68, %o3
	stx	%l5,	[%l7 + %o3]
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x88,	%g1
	set	0x45, %o7
	ldstuba	[%l7 + %o7] 0x81,	%g2
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%o6
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%f8
	set	0x6B, %g3
	stba	%g3,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x1C, %i6
	ldsw	[%l7 + %i6],	%o6
	wr	%l4,	%o4,	%pic
	or	%l1,	%g4,	%i6
	nop
	set	0x48, %o0
	prefetch	[%l7 + %o0],	 1
	or	%i1,	%l0,	%i2
	wr	%i5,	%i7,	%ccr
	nop
	set	0x08, %g5
	stx	%o3,	[%l7 + %g5]
	set	0x60, %g7
	swapa	[%l7 + %g7] 0x89,	%g7
	and	%g6,	%l2,	%o2
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%g4
	nop
	set	0x60, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x81,	 4
	set	0x6C, %l1
	sta	%f29,	[%l7 + %l1] 0x89
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x21, %o6
	ldub	[%l7 + %o6],	%i0
	and	%o5,	%o0,	%i4
	nop
	set	0x78, %l0
	stx	%l3,	[%l7 + %l0]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i3
	or	%l5,	%g2,	%g1
	or	%g3,	%o6,	%l4
	add	%o7,	%l1,	%g4
	fpadd32	%f28,	%f10,	%f14
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x89
	add	%o4,	%i6,	%l0
	nop
	set	0x24, %l5
	ldsw	[%l7 + %l5],	%i2
	nop
	set	0x0F, %i4
	stb	%i1,	[%l7 + %i4]
	nop
	set	0x1C, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x58, %l3
	std	%f20,	[%l7 + %l3]
	nop
	set	0x22, %l2
	ldstub	[%l7 + %l2],	%i7
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f26
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf9
	membar	#Sync
	nop
	set	0x74, %l6
	lduw	[%l7 + %l6],	%i5
	nop
	set	0x4E, %o1
	ldub	[%l7 + %o1],	%o3
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x81,	 4
	nop
	set	0x08, %o2
	stx	%g7,	[%l7 + %o2]
	add	%o2,	%g5,	%o1
	nop
	set	0x31, %i0
	ldub	[%l7 + %i0],	%i0
	or	%l2,	%o0,	%o5
	st	%fsr,	[%l7 + 0x4C]
	add	%l3,	%l6,	%i3
	nop
	set	0x26, %o3
	lduh	[%l7 + %o3],	%i4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f0
	nop
	set	0x7A, %g6
	sth	%l5,	[%l7 + %g6]
	nop
	set	0x40, %g1
	sth	%g2,	[%l7 + %g1]
	nop
	set	0x68, %l4
	ldx	[%l7 + %l4],	%g3
	fpadd32	%f6,	%f30,	%f10
	set	0x3E, %o7
	stba	%g1,	[%l7 + %o7] 0x81
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%o6
	set	0x2C, %g3
	swapa	[%l7 + %g3] 0x80,	%l1
	nop
	set	0x58, %o0
	stx	%g4,	[%l7 + %o0]
	nop
	set	0x1F, %i6
	ldsb	[%l7 + %i6],	%o4
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%i6
	ld	[%l7 + 0x34],	%f7
	add	%l0,	%i2,	%o7
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd0,	%f0
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd0
	nop
	set	0x40, %g7
	std	%i6,	[%l7 + %g7]
	nop
	nop
	setx	0xB50916B2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x296DA77F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f28,	%f28
	set	0x2C, %i3
	stwa	%i5,	[%l7 + %i3] 0x80
	set	0x74, %l1
	sta	%f14,	[%l7 + %l1] 0x89
	set	0x70, %o6
	stha	%i1,	[%l7 + %o6] 0x81
	add	%g6,	%o3,	%o2
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x21, %l5
	ldstub	[%l7 + %l5],	%g7
	set	0x34, %i4
	sta	%f2,	[%l7 + %i4] 0x80
	nop
	set	0x58, %o4
	stx	%o1,	[%l7 + %o4]
	nop
	set	0x32, %l0
	sth	%i0,	[%l7 + %l0]
	nop
	set	0x7E, %l3
	lduh	[%l7 + %l3],	%l2
	nop
	set	0x44, %g4
	swap	[%l7 + %g4],	%g5
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x80,	 4
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f22
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f0
	nop
	set	0x2C, %i2
	stw	%o0,	[%l7 + %i2]
	nop
	set	0x12, %o2
	lduh	[%l7 + %o2],	%l3
	st	%f14,	[%l7 + 0x58]
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%i6
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xeb,	%i4
	set	0x0C, %i1
	stha	%l5,	[%l7 + %i1] 0x80
	set	0x20, %g6
	stwa	%g2,	[%l7 + %g6] 0x88
	nop
	set	0x40, %g1
	ldsw	[%l7 + %g1],	%i3
	set	0x30, %o3
	stxa	%g3,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0
	nop
	set	0x38, %l4
	stw	%o6,	[%l7 + %l4]
	set	0x10, %g3
	lda	[%l7 + %g3] 0x80,	%f22
	set	0x68, %i6
	swapa	[%l7 + %i6] 0x88,	%g1
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x81,	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%i6
	nop
	set	0x40, %g2
	std	%l0,	[%l7 + %g2]
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%f28
	nop
	set	0x34, %g7
	prefetch	[%l7 + %g7],	 1
	nop
	set	0x7E, %i3
	ldstub	[%l7 + %i3],	%o4
	set	0x35, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o7
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x81,	%i2
	and	%i5,	%i7,	%g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%i1
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xe3,	%o2
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xe2,	%o0
	set	0x2C, %i4
	stwa	%g7,	[%l7 + %i4] 0xe2
	membar	#Sync
	and	%i0,	%g5,	%l2
	nop
	set	0x50, %o4
	ldx	[%l7 + %o4],	%o5
	set	0x60, %l0
	ldxa	[%l7 + %l0] 0x89,	%o0
	add	%l3,	%i4,	%l6
	or	%g2,	%i3,	%g3
	set	0x58, %l3
	stxa	%l4,	[%l7 + %l3] 0x80
	nop
	set	0x6C, %l5
	stw	%l5,	[%l7 + %l5]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	nop
	set	0x40, %o5
	stx	%o6,	[%l7 + %o5]
	fpsub32s	%f22,	%f30,	%f9
	nop
	set	0x24, %l2
	lduw	[%l7 + %l2],	%g1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f0
	nop
	set	0x68, %o1
	std	%f2,	[%l7 + %o1]
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%l1
	nop
	set	0x1C, %l6
	prefetch	[%l7 + %l6],	 2
	and	%i6,	%g4,	%o4
	nop
	set	0x4F, %i1
	stb	%l0,	[%l7 + %i1]
	set	0x41, %g6
	ldstuba	[%l7 + %g6] 0x89,	%o7
	nop
	set	0x60, %i0
	stx	%i5,	[%l7 + %i0]
	bn,pt	%icc,	loop_130
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f8
	bgu,a,pn	%xcc,	loop_131
	be,a	%icc,	loop_132
loop_130:
	add	%i7,	%g6,	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%o2
loop_131:
	nop
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc8
loop_132:
	nop
	set	0x6E, %g1
	stha	%o1,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x50, %l4
	std	%i0,	[%l7 + %l4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA65, 	%sys_tick_cmpr
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%l2
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%i0
	nop
	set	0x10, %g2
	lduh	[%l7 + %g2],	%o5
	nop
	set	0x38, %o0
	ldstub	[%l7 + %o0],	%o0
	nop
	set	0x1D, %g7
	ldub	[%l7 + %g7],	%i4
	wr	%l6,	%g2,	%clear_softint
	nop
	set	0x3B, %i3
	stb	%i3,	[%l7 + %i3]
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x88,	 1
	and	%l4,	%l5,	%o6
	set	0x74, %g5
	stwa	%g1,	[%l7 + %g5] 0x80
	set	0x60, %i5
	stda	%l2,	[%l7 + %i5] 0x80
	set	0x08, %i7
	stba	%l1,	[%l7 + %i7] 0x89
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%i6
	nop
	set	0x54, %o4
	ldsw	[%l7 + %o4],	%o4
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x88,	%l0
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xe2,	%g4
	set	0x48, %l5
	stxa	%o7,	[%l7 + %l5] 0x81
	nop
	set	0x3C, %g4
	ldsh	[%l7 + %g4],	%i5
	nop
	set	0x12, %i4
	ldsh	[%l7 + %i4],	%i7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDBF, 	%tick_cmpr
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf8
	membar	#Sync
	and	%i2,	%o1,	%o2
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%i1
	nop
	nop
	setx	0xD2A6FCF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xB5768629,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f27,	%f24
	nop
	set	0x28, %i2
	stx	%g5,	[%l7 + %i2]
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%l2
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%i0
	set	0x5C, %i1
	sta	%f17,	[%l7 + %i1] 0x81
	nop
	set	0x2D, %g6
	stb	%g7,	[%l7 + %g6]
	set	0x70, %i0
	stda	%o4,	[%l7 + %i0] 0x88
	nop
	set	0x15, %o3
	ldsb	[%l7 + %o3],	%i4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	or	%l6,	%g2,	%i3
	nop
	set	0x3C, %o7
	lduh	[%l7 + %o7],	%o0
	set	0x10, %l4
	sta	%f4,	[%l7 + %l4] 0x80
	nop
	set	0x7A, %g1
	ldsh	[%l7 + %g1],	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7FC, 	%tick_cmpr
	set	0x70, %g3
	stxa	%o6,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x60, %i6
	ldx	[%l7 + %i6],	%g1
	or	%l1,	%l3,	%o4
	nop
	set	0x3A, %o0
	lduh	[%l7 + %o0],	%i6
	nop
	set	0x54, %g2
	ldsh	[%l7 + %g2],	%l0
	set	0x70, %i3
	swapa	[%l7 + %i3] 0x81,	%g4
	nop
	set	0x30, %l1
	sth	%i5,	[%l7 + %l1]
	nop
	set	0x14, %g7
	ldsw	[%l7 + %g7],	%i7
	set	0x7C, %g5
	sta	%f17,	[%l7 + %g5] 0x88
	nop
	set	0x24, %i5
	lduw	[%l7 + %i5],	%o7
	nop
	set	0x08, %i7
	std	%f16,	[%l7 + %i7]
	set	0x14, %o6
	stwa	%g6,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x30, %o4
	stxa	%o3,	[%l7 + %o4] 0x81
	set	0x42, %l0
	stha	%o1,	[%l7 + %l0] 0x88
	nop
	set	0x69, %l5
	stb	%i2,	[%l7 + %l5]
	nop
	set	0x44, %l3
	lduw	[%l7 + %l3],	%i1
	nop
	set	0x54, %g4
	stw	%g5,	[%l7 + %g4]
	nop
	set	0x14, %o5
	stb	%l2,	[%l7 + %o5]
	nop
	set	0x28, %l2
	std	%f10,	[%l7 + %l2]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xda,	%f16
	nop
	set	0x22, %i4
	ldstub	[%l7 + %i4],	%i0
	add	%o2,	%o5,	%g7
	set	0x08, %o1
	stxa	%i4,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x53, %i1
	ldstuba	[%l7 + %i1] 0x80,	%l6
	nop
	set	0x10, %l6
	prefetch	[%l7 + %l6],	 2
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%g2
	and	%o0,	%i3,	%l4
	nop
	set	0x24, %o3
	ldsw	[%l7 + %o3],	%l5
	nop
	set	0x70, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x28, %o7
	prefetch	[%l7 + %o7],	 0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f0
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x1A, %g1
	sth	%g3,	[%l7 + %g1]
	wr	%g1,	%o6,	%y
	nop
	set	0x58, %g3
	stx	%l3,	[%l7 + %g3]
	nop
	set	0x38, %l4
	prefetch	[%l7 + %l4],	 2
	ld	[%l7 + 0x54],	%f14
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%i6
	nop
	set	0x09, %i6
	ldsb	[%l7 + %i6],	%l0
	nop
	set	0x3C, %o0
	ldsh	[%l7 + %o0],	%o4
	nop
	set	0x34, %g2
	ldsw	[%l7 + %g2],	%g4
	and	%i7,	%o7,	%i5
	set	0x48, %l1
	stda	%o2,	[%l7 + %l1] 0x88
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%i2
	nop
	set	0x28, %g7
	ldsw	[%l7 + %g7],	%i1
	set	0x29, %i3
	ldstuba	[%l7 + %i3] 0x81,	%o1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%g5
	ld	[%l7 + 0x34],	%f7
	set	0x58, %i5
	stxa	%i0,	[%l7 + %i5] 0x88
	st	%f6,	[%l7 + 0x18]
	set	0x48, %g5
	stwa	%o2,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x59, %o6
	stb	%g7,	[%l7 + %o6]
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x80,	%o4
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xe2,	%i4
	fpsub16s	%f19,	%f15,	%f15
	set	0x30, %l0
	stha	%l6,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe3,	%o0
	nop
	set	0x44, %g4
	ldsh	[%l7 + %g4],	%g2
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x80,	%l4
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%i2
	nop
	set	0x20, %o5
	stx	%g3,	[%l7 + %o5]
	nop
	set	0x38, %i4
	ldsh	[%l7 + %i4],	%g1
	nop
	set	0x78, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x58, %i1
	stxa	%l5,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x0E, %i2
	sth	%o6,	[%l7 + %i2]
	set	0x60, %i0
	stha	%l1,	[%l7 + %i0] 0xe3
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%l0
	nop
	set	0x50, %o3
	std	%f30,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x70, %o2
	stw	%l3,	[%l7 + %o2]
	nop
	set	0x44, %o7
	stw	%g4,	[%l7 + %o7]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%o7
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f12
	nop
	set	0x28, %g6
	ldsw	[%l7 + %g6],	%o4
	set	0x10, %g1
	sta	%f27,	[%l7 + %g1] 0x81
	nop
	set	0x54, %l4
	ldsw	[%l7 + %l4],	%i5
	set	0x70, %g3
	sta	%f16,	[%l7 + %g3] 0x88
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o3
	st	%fsr,	[%l7 + 0x14]
	set	0x30, %i6
	ldda	[%l7 + %i6] 0x80,	%i2
	wr	%i1,	%o1,	%softint
	nop
	set	0x78, %g2
	std	%f20,	[%l7 + %g2]
	nop
	set	0x7D, %l1
	ldstub	[%l7 + %l1],	%l2
	set	0x28, %o0
	stda	%i0,	[%l7 + %o0] 0x88
	nop
	set	0x78, %g7
	std	%f30,	[%l7 + %g7]
	nop
	set	0x50, %i5
	std	%f26,	[%l7 + %i5]
	nop
	set	0x44, %g5
	sth	%g5,	[%l7 + %g5]
	and	%g7,	%o2,	%i4
	set	0x14, %o6
	swapa	[%l7 + %o6] 0x89,	%o5
	nop
	set	0x4B, %i3
	ldstub	[%l7 + %i3],	%l6
	nop
	set	0x1A, %o4
	ldsh	[%l7 + %o4],	%g2
	nop
	set	0x5A, %i7
	lduh	[%l7 + %i7],	%l4
	wr	%i3,	%o0,	%y
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x68, %l0
	std	%f20,	[%l7 + %l0]
	wr	%g3,	%g1,	%sys_tick
	st	%fsr,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x48]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%l1
	nop
	set	0x58, %l5
	stw	%i6,	[%l7 + %l5]
	nop
	set	0x70, %l3
	ldstub	[%l7 + %l3],	%l5
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x52, %g4
	ldsh	[%l7 + %g4],	%l3
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x88,	 4
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f4
	add	%g4,	%o7,	%o4
	add	%i5,	%g6,	%i7
	ld	[%l7 + 0x10],	%f5
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf1
	membar	#Sync
	nop
	set	0x78, %o1
	ldsw	[%l7 + %o1],	%o3
	ld	[%l7 + 0x10],	%f19
	nop
	set	0x28, %i2
	lduh	[%l7 + %i2],	%i2
	nop
	set	0x52, %i0
	sth	%i1,	[%l7 + %i0]
	nop
	set	0x58, %i1
	std	%f22,	[%l7 + %i1]
	nop
	set	0x30, %o2
	stw	%o1,	[%l7 + %o2]
	nop
	set	0x4C, %o7
	lduh	[%l7 + %o7],	%l2
	nop
	set	0x18, %o3
	std	%i0,	[%l7 + %o3]
	ld	[%l7 + 0x70],	%f17
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x17, %g6
	stb	%g5,	[%l7 + %g6]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf0
	membar	#Sync
	set	0x45, %l4
	ldstuba	[%l7 + %l4] 0x89,	%g7
	set	0x60, %l6
	ldstuba	[%l7 + %l6] 0x88,	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x45, %g3
	ldstuba	[%l7 + %g3] 0x89,	%g2
	set	0x44, %g2
	lda	[%l7 + %g2] 0x89,	%f10
	st	%fsr,	[%l7 + 0x58]
	set	0x20, %l1
	stda	%o4,	[%l7 + %l1] 0x81
	nop
	set	0x24, %i6
	lduw	[%l7 + %i6],	%i3
	nop
	set	0x60, %g7
	ldx	[%l7 + %g7],	%l4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f0
	set	0x46, %g5
	stba	%g3,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x89,	 1
	wr	%o6,	%l1,	%pic
	nop
	set	0x38, %i5
	stx	%o0,	[%l7 + %i5]
	set	0x7C, %o4
	sta	%f1,	[%l7 + %o4] 0x89
	nop
	set	0x18, %i7
	ldstub	[%l7 + %i7],	%l5
	wr	%i6,	%l0,	%ccr
	set	0x74, %i3
	lda	[%l7 + %i3] 0x80,	%f16
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x89,	%g4
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f10
	nop
	set	0x7F, %g4
	ldstub	[%l7 + %g4],	%l3
	nop
	set	0x0E, %l0
	sth	%o7,	[%l7 + %l0]
	nop
	set	0x10, %l2
	sth	%i5,	[%l7 + %l2]
	set	0x30, %o5
	stda	%g6,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x3A, %o1
	sth	%i7,	[%l7 + %o1]
	nop
	set	0x14, %i2
	ldsw	[%l7 + %i2],	%o3
	set	0x58, %i0
	sta	%f3,	[%l7 + %i0] 0x89
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x81,	%i2
	nop
	set	0x6E, %o2
	ldsb	[%l7 + %o2],	%i1
	nop
	set	0x14, %i4
	ldsw	[%l7 + %i4],	%o4
	set	0x08, %o7
	stda	%o0,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x42, %g6
	lduh	[%l7 + %g6],	%l2
	and	%i0,	%g7,	%g5
	nop
	set	0x68, %g1
	stx	%i4,	[%l7 + %g1]
	nop
	set	0x18, %l4
	std	%f0,	[%l7 + %l4]
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xe3,	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%g2
	nop
	set	0x58, %l6
	lduw	[%l7 + %l6],	%i3
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%l4
	nop
	set	0x68, %l1
	stw	%g3,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x2C]
	set	0x7B, %g2
	stba	%o5,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x89,	%g1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%o0
	nop
	set	0x7C, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x5E, %g7
	stba	%o6,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x74, %g5
	stha	%l5,	[%l7 + %g5] 0x81
	set	0x60, %o6
	stda	%i6,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x5C, %i5
	lduw	[%l7 + %i5],	%g4
	nop
	set	0x10, %i7
	ldub	[%l7 + %i7],	%l3
	st	%f24,	[%l7 + 0x0C]
	nop
	set	0x10, %o4
	prefetch	[%l7 + %o4],	 1
	set	0x70, %l5
	stda	%o6,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xea,	%i4
	set	0x4A, %g4
	stba	%l0,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x50, %l0
	std	%i6,	[%l7 + %l0]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf1
	membar	#Sync
	nop
	set	0x4E, %o5
	ldsh	[%l7 + %o5],	%o3
	set	0x5E, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i2
	set	0x50, %i2
	stxa	%g6,	[%l7 + %i2] 0x88
	nop
	set	0x20, %i0
	ldx	[%l7 + %i0],	%i1
	nop
	set	0x63, %i1
	ldsb	[%l7 + %i1],	%o1
	nop
	set	0x70, %l2
	prefetch	[%l7 + %l2],	 4
	ld	[%l7 + 0x74],	%f9
	set	0x58, %o2
	stda	%l2,	[%l7 + %o2] 0x89
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x80,	%o4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc8
	set	0x08, %g1
	stda	%i0,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x30, %l4
	ldsw	[%l7 + %l4],	%g7
	nop
	set	0x5B, %o7
	ldstub	[%l7 + %o7],	%g5
	nop
	set	0x14, %l6
	ldub	[%l7 + %l6],	%i4
	set	0x18, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	set	0x7A, %o3
	stba	%o2,	[%l7 + %o3] 0x89
	set	0x50, %g2
	stha	%i3,	[%l7 + %g2] 0x81
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xeb,	%l4
	nop
	set	0x2A, %o0
	ldub	[%l7 + %o0],	%g3
	or	%g2,	%g1,	%l1
	nop
	set	0x78, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x30, %l1
	sta	%f25,	[%l7 + %l1] 0x88
	nop
	set	0x2F, %o6
	stb	%o0,	[%l7 + %o6]
	bgu,a	%xcc,	loop_133
	nop
	set	0x48, %g5
	lduh	[%l7 + %g5],	%o6
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%f10
loop_133:
	nop
	set	0x4C, %o4
	stwa	%l5,	[%l7 + %o4] 0xe3
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%l0
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xd0
	nop
	set	0x78, %i7
	std	%i6,	[%l7 + %i7]
	set	0x30, %g4
	stwa	%o3,	[%l7 + %g4] 0x80
	nop
	set	0x78, %i3
	ldsw	[%l7 + %i3],	%i5
	nop
	set	0x30, %l3
	ldsh	[%l7 + %l3],	%i2
	set	0x10, %o5
	ldda	[%l7 + %o5] 0x81,	%i0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%l2
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%o4
	set	0x58, %l0
	stwa	%g6,	[%l7 + %l0] 0x81
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f0
	nop
	set	0x30, %i0
	std	%f20,	[%l7 + %i0]
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%g7
	nop
	set	0x7C, %o2
	ldsw	[%l7 + %o2],	%g5
	nop
	set	0x2B, %l2
	stb	%i4,	[%l7 + %l2]
	and	%i0,	%l6,	%o2
	nop
	set	0x18, %g6
	std	%f16,	[%l7 + %g6]
	nop
	set	0x70, %g1
	stw	%i3,	[%l7 + %g1]
	set	0x1A, %i4
	stba	%g3,	[%l7 + %i4] 0x88
	nop
	set	0x48, %l4
	lduw	[%l7 + %l4],	%g2
	nop
	set	0x08, %o7
	ldx	[%l7 + %o7],	%l4
	set	0x30, %g3
	stxa	%g1,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x30, %l6
	stda	%l0,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%o0
	nop
	set	0x3C, %i6
	lduh	[%l7 + %i6],	%o6
	nop
	set	0x60, %g2
	std	%o4,	[%l7 + %g2]
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f30
	nop
	set	0x24, %l1
	ldsw	[%l7 + %l1],	%l5
	nop
	set	0x5A, %g7
	lduh	[%l7 + %g7],	%l3
	fpsub16	%f4,	%f4,	%f30
	nop
	set	0x24, %g5
	swap	[%l7 + %g5],	%g4
	set	0x28, %o6
	stda	%o6,	[%l7 + %o6] 0x80
	or	%i6,	%l0,	%i7
	add	%i5,	%o3,	%i1
	nop
	set	0x60, %i5
	lduw	[%l7 + %i5],	%i2
	nop
	set	0x38, %l5
	stx	%o1,	[%l7 + %l5]
	and	%o4,	%l2,	%g6
	nop
	set	0x17, %i7
	ldstub	[%l7 + %i7],	%g5
	set	0x0C, %g4
	sta	%f9,	[%l7 + %g4] 0x80
	set	0x18, %o4
	sta	%f3,	[%l7 + %o4] 0x88
	ld	[%l7 + 0x18],	%f1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%i0
	set	0x68, %l3
	sta	%f8,	[%l7 + %l3] 0x88
	wr	%g7,	%l6,	%set_softint
	nop
	set	0x70, %i3
	stw	%i3,	[%l7 + %i3]
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%g2
	nop
	set	0x2D, %o1
	ldub	[%l7 + %o1],	%o2
	set	0x0E, %i2
	stha	%l4,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x72, %l0
	ldsh	[%l7 + %l0],	%g1
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x80,	 3
	nop
	set	0x38, %i1
	ldsh	[%l7 + %i1],	%g2
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%o0
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%o4
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%l5
	set	0x50, %g6
	prefetcha	[%l7 + %g6] 0x88,	 4
	nop
	set	0x34, %o7
	ldsw	[%l7 + %o7],	%g4
	set	0x10, %g3
	stda	%o6,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x1C, %l6
	stha	%i6,	[%l7 + %l6] 0x80
	fpsub32	%f22,	%f28,	%f10
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xea,	%o6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%i7
	nop
	set	0x58, %l4
	prefetch	[%l7 + %l4],	 0
	nop
	set	0x60, %g2
	ldd	[%l7 + %g2],	%i4
	set	0x70, %o0
	swapa	[%l7 + %o0] 0x81,	%i1
	st	%f14,	[%l7 + 0x2C]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f16
	nop
	set	0x75, %i6
	ldstub	[%l7 + %i6],	%i2
	st	%f6,	[%l7 + 0x10]
	set	0x49, %g7
	stba	%o3,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x08, %g5
	stha	%o4,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%l2
	st	%fsr,	[%l7 + 0x08]
	nop
	nop
	setx	0x81739077,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x36623E68,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f13,	%f5
	set	0x48, %i5
	ldxa	[%l7 + %i5] 0x80,	%g6
	set	0x78, %i7
	sta	%f31,	[%l7 + %i7] 0x89
	set	0x2C, %l5
	lda	[%l7 + %l5] 0x88,	%f8
	nop
	set	0x5C, %o4
	ldub	[%l7 + %o4],	%g5
	set	0x60, %l3
	lda	[%l7 + %l3] 0x81,	%f28
	nop
	set	0x38, %g4
	std	%i4,	[%l7 + %g4]
	nop
	set	0x52, %i3
	stb	%i0,	[%l7 + %i3]
	or	%o1,	%g7,	%i3
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%g2
	nop
	set	0x56, %i2
	stb	%l6,	[%l7 + %i2]
	set	0x1C, %l0
	stha	%l4,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x10, %o1
	swapa	[%l7 + %o1] 0x81,	%o2
	st	%f16,	[%l7 + 0x38]
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%l1
	nop
	set	0x29, %l2
	ldub	[%l7 + %l2],	%g1
	and	%g2,	%o5,	%o0
	nop
	nop
	setx	0xB744A2A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xBEC9723E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f5,	%f7
	or	%l5,	%l3,	%g4
	nop
	set	0x34, %o2
	sth	%i6,	[%l7 + %o2]
	set	0x10, %i0
	sta	%f1,	[%l7 + %i0] 0x88
	set	0x68, %i4
	stxa	%o7,	[%l7 + %i4] 0xeb
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%i7
	nop
	set	0x48, %g1
	ldsw	[%l7 + %g1],	%o6
	set	0x40, %o7
	stxa	%i1,	[%l7 + %o7] 0x89
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x80,	 1
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x5E, %l6
	stb	%i2,	[%l7 + %l6]
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x78, %l4
	std	%o2,	[%l7 + %l4]
	nop
	set	0x77, %g2
	ldsb	[%l7 + %g2],	%o4
	set	0x28, %g3
	stxa	%g6,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x65, %l1
	stba	%g5,	[%l7 + %l1] 0x80
	ba,pn	%icc,	loop_134
	nop
	set	0x10, %o0
	lduw	[%l7 + %o0],	%i4
	nop
	set	0x35, %g7
	ldub	[%l7 + %g7],	%l2
	or	%i0,	%o1,	%g7
loop_134:
	nop
	set	0x74, %g5
	swapa	[%l7 + %g5] 0x89,	%g3
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%i6
	nop
	nop
	setx	0xE5FD4162,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xA58687C1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f13,	%f27
	nop
	set	0x78, %i5
	sth	%i3,	[%l7 + %i5]
	nop
	set	0x5F, %i7
	ldub	[%l7 + %i7],	%o2
	wr	%l4,	%l1,	%clear_softint
	ld	[%l7 + 0x70],	%f25
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%g1
	nop
	set	0x21, %l5
	ldsb	[%l7 + %l5],	%o5
	set	0x10, %i6
	stha	%l5,	[%l7 + %i6] 0xe3
	membar	#Sync
	st	%f26,	[%l7 + 0x4C]
	nop
	set	0x5A, %l3
	lduh	[%l7 + %l3],	%o0
	nop
	set	0x78, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%f8
	set	0x4E, %o5
	ldstuba	[%l7 + %o5] 0x88,	%g4
	and	%i6,	%l3,	%l0
	and	%i7,	%o7,	%o6
	nop
	set	0x40, %i2
	stw	%i1,	[%l7 + %i2]
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xeb,	%i4
	set	0x10, %o1
	stxa	%o3,	[%l7 + %o1] 0x80
	wr	%o4,	%g6,	%clear_softint
	nop
	set	0x60, %l0
	std	%f16,	[%l7 + %l0]
	nop
	set	0x58, %l2
	std	%f0,	[%l7 + %l2]
	set	0x14, %i1
	stwa	%g5,	[%l7 + %i1] 0xe3
	membar	#Sync
	fpsub16	%f6,	%f10,	%f24
	st	%f21,	[%l7 + 0x0C]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd8
	nop
	set	0x38, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x0F, %g1
	stba	%i4,	[%l7 + %g1] 0xea
	membar	#Sync
	add	%l2,	%i2,	%o1
	set	0x45, %i4
	stba	%g7,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x1C, %o7
	sth	%i0,	[%l7 + %o7]
	set	0x10, %l6
	stda	%g2,	[%l7 + %l6] 0x80
	nop
	set	0x68, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x68, %l4
	prefetcha	[%l7 + %l4] 0x80,	 1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%l4
	nop
	set	0x7A, %g2
	ldsh	[%l7 + %g2],	%l1
	nop
	set	0x2C, %g3
	stw	%g2,	[%l7 + %g3]
	set	0x40, %g6
	swapa	[%l7 + %g6] 0x89,	%l6
	set	0x3C, %o0
	swapa	[%l7 + %o0] 0x88,	%o5
	nop
	set	0x74, %l1
	swap	[%l7 + %l1],	%g1
	nop
	set	0x13, %g7
	ldub	[%l7 + %g7],	%l5
	nop
	set	0x2A, %g5
	ldsh	[%l7 + %g5],	%g4
	set	0x38, %i5
	lda	[%l7 + %i5] 0x81,	%f22
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x19, %i7
	ldstub	[%l7 + %i7],	%o0
	nop
	set	0x70, %i6
	std	%f6,	[%l7 + %i6]
	nop
	set	0x30, %l5
	std	%f30,	[%l7 + %l5]
	nop
	set	0x3B, %l3
	ldsb	[%l7 + %l3],	%i6
	nop
	set	0x3C, %g4
	stw	%l0,	[%l7 + %g4]
	nop
	set	0x18, %o4
	stx	%i7,	[%l7 + %o4]
	nop
	set	0x6A, %i2
	ldub	[%l7 + %i2],	%l3
	wr	%o6,	%o7,	%clear_softint
	set	0x4C, %i3
	stwa	%i5,	[%l7 + %i3] 0x88
	nop
	set	0x38, %o5
	lduw	[%l7 + %o5],	%i1
	set	0x50, %o1
	sta	%f26,	[%l7 + %o1] 0x80
	set	0x50, %l0
	stxa	%o3,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x40, %i1
	stx	%o4,	[%l7 + %i1]
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x80,	%g5
	nop
	set	0x40, %l2
	stw	%i4,	[%l7 + %l2]
	st	%f4,	[%l7 + 0x68]
	nop
	set	0x28, %i0
	stw	%l2,	[%l7 + %i0]
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x88,	 1
	or	%o1,	%g6,	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%i3
	set	0x38, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g3
	set	0x14, %l6
	lda	[%l7 + %l6] 0x80,	%f13
	nop
	set	0x58, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x76, %o7
	ldstub	[%l7 + %o7],	%o2
	set	0x20, %l4
	stxa	%l4,	[%l7 + %l4] 0x89
	and	%g2,	%l1,	%l6
	nop
	set	0x20, %g2
	ldsh	[%l7 + %g2],	%o5
	set	0x0C, %g3
	stwa	%g1,	[%l7 + %g3] 0x89
	nop
	set	0x60, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x79, %o0
	stba	%g4,	[%l7 + %o0] 0x81
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf9
	membar	#Sync
	nop
	set	0x50, %l1
	std	%o0,	[%l7 + %l1]
	st	%f12,	[%l7 + 0x28]
	nop
	set	0x40, %i5
	ldub	[%l7 + %i5],	%l5
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x88,	%l0
	nop
	set	0x44, %i7
	swap	[%l7 + %i7],	%i6
	set	0x34, %i6
	stha	%i7,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x7B, %o6
	stba	%l3,	[%l7 + %o6] 0x89
	set	0x18, %l5
	stba	%o6,	[%l7 + %l5] 0xeb
	membar	#Sync
	ld	[%l7 + 0x70],	%f21
	nop
	set	0x0C, %l3
	stw	%o7,	[%l7 + %l3]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xca
	or	%i5,	%i1,	%o4
	or	%o3,	%i4,	%g5
	set	0x10, %g4
	sta	%f22,	[%l7 + %g4] 0x80
	nop
	set	0x64, %i2
	lduh	[%l7 + %i2],	%i2
	set	0x20, %o5
	prefetcha	[%l7 + %o5] 0x88,	 1
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x80
	set	0x10, %l0
	sta	%f9,	[%l7 + %l0] 0x80
	add	%g6,	%i0,	%g7
	wr	%i3,	%g3,	%y
	add	%o1,	%l4,	%o2
	nop
	set	0x1C, %o1
	ldub	[%l7 + %o1],	%l1
	st	%f22,	[%l7 + 0x20]
	st	%f27,	[%l7 + 0x38]
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%i6
	st	%fsr,	[%l7 + 0x20]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%g1
	nop
	set	0x2B, %l2
	stb	%g2,	[%l7 + %l2]
	fpsub16s	%f5,	%f26,	%f20
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%l5
	nop
	set	0x48, %i0
	lduw	[%l7 + %i0],	%l0
	set	0x30, %i1
	prefetcha	[%l7 + %i1] 0x88,	 4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%i6
	nop
	nop
	setx	0xB338A2FD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xA9261B7A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f22,	%f26
	nop
	set	0x78, %i4
	sth	%l3,	[%l7 + %i4]
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x80,	%i6
	set	0x30, %o3
	swapa	[%l7 + %o3] 0x88,	%o6
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%i4
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x89
	st	%f5,	[%l7 + 0x3C]
	nop
	set	0x4D, %g3
	ldub	[%l7 + %g3],	%o7
	bg,a	%xcc,	loop_135
	nop
	set	0x73, %g6
	ldstub	[%l7 + %g6],	%i1
	set	0x58, %g2
	lda	[%l7 + %g2] 0x81,	%f22
loop_135:
	bgu,a,pn	%icc,	loop_136
	nop
	set	0x3E, %o0
	lduh	[%l7 + %o0],	%o4
	set	0x22, %g7
	ldstuba	[%l7 + %g7] 0x89,	%o3
loop_136:
	nop
	set	0x08, %i5
	ldub	[%l7 + %i5],	%g5
	or	%i4,	%i2,	%g6
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f10
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%i0
	or	%i3,	%g3,	%g7
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xe2,	%o0
	set	0x48, %g5
	sta	%f24,	[%l7 + %g5] 0x89
	set	0x34, %o6
	sta	%f16,	[%l7 + %o6] 0x88
	set	0x5D, %i6
	ldstuba	[%l7 + %i6] 0x81,	%l4
	nop
	set	0x20, %l5
	swap	[%l7 + %l5],	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o5
	nop
	set	0x40, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x0C, %g4
	prefetch	[%l7 + %g4],	 1
	nop
	set	0x3C, %i2
	ldsw	[%l7 + %i2],	%l1
	set	0x28, %o5
	stba	%g1,	[%l7 + %o5] 0x80
	nop
	set	0x49, %i3
	stb	%g4,	[%l7 + %i3]
	nop
	set	0x28, %l0
	stw	%g2,	[%l7 + %l0]
	nop
	set	0x24, %l3
	sth	%l5,	[%l7 + %l3]
	nop
	set	0x28, %o2
	swap	[%l7 + %o2],	%l0
	nop
	set	0x20, %o1
	std	%o0,	[%l7 + %o1]
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f26
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x55, %l2
	ldstub	[%l7 + %l2],	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x78, %i1
	std	%i4,	[%l7 + %i1]
	set	0x54, %g1
	swapa	[%l7 + %g1] 0x80,	%o6
	set	0x48, %i4
	ldxa	[%l7 + %i4] 0x89,	%i1
	nop
	set	0x78, %l6
	std	%f0,	[%l7 + %l6]
	set	0x75, %o3
	stba	%o7,	[%l7 + %o3] 0x81
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i4
	set	0x78, %g3
	lda	[%l7 + %g3] 0x80,	%f18
	and	%i2,	%o3,	%g6
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	st	%f13,	[%l7 + 0x10]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%i3
	st	%fsr,	[%l7 + 0x34]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%l2
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	nop
	set	0x70, %o7
	std	%o0,	[%l7 + %o7]
	st	%f28,	[%l7 + 0x58]
	nop
	set	0x68, %o0
	std	%f20,	[%l7 + %o0]
	nop
	set	0x78, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x10, %l1
	std	%f0,	[%l7 + %l1]
	nop
	set	0x4A, %i7
	lduh	[%l7 + %i7],	%l4
	or	%g7,	%l6,	%o5
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x81,	%l0
	or	%g1,	%g4,	%o2
	nop
	set	0x6C, %o6
	sth	%l5,	[%l7 + %o6]
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f14
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%l0
	and	%l3,	%i6,	%i7
	or	%o0,	%i5,	%i1
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd8,	%f0
	set	0x7E, %l5
	stha	%o6,	[%l7 + %l5] 0xe3
	membar	#Sync
	fpsub32s	%f28,	%f16,	%f22
	nop
	set	0x08, %o4
	lduh	[%l7 + %o4],	%o7
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x48, %o5
	std	%f30,	[%l7 + %o5]
	nop
	set	0x40, %i3
	std	%f0,	[%l7 + %i3]
	set	0x3C, %g4
	sta	%f15,	[%l7 + %g4] 0x80
	st	%f13,	[%l7 + 0x60]
	nop
	set	0x1F, %l0
	stb	%g5,	[%l7 + %l0]
	nop
	set	0x60, %o2
	std	%o4,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x43, %l3
	ldstub	[%l7 + %l3],	%i2
	set	0x20, %i0
	stxa	%o3,	[%l7 + %i0] 0xea
	membar	#Sync
	add	%g6,	%i0,	%i4
	set	0x3E, %l2
	stha	%g3,	[%l7 + %l2] 0x88
	nop
	set	0x44, %i1
	swap	[%l7 + %i1],	%l2
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x88,	%i3
	set	0x20, %o1
	stda	%l4,	[%l7 + %o1] 0x81
	set	0x2C, %i4
	sta	%f3,	[%l7 + %i4] 0x89
	set	0x17, %l6
	ldstuba	[%l7 + %l6] 0x88,	%o1
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	wr	%o5,	%l1,	%set_softint
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%g1
	ld	[%l7 + 0x38],	%f4
	nop
	set	0x18, %g3
	ldx	[%l7 + %g3],	%g4
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f24
	ld	[%l7 + 0x68],	%f16
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	nop
	set	0x28, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x38, %o0
	ldsw	[%l7 + %o0],	%l5
	nop
	set	0x4A, %g7
	lduh	[%l7 + %g7],	%g2
	nop
	set	0x28, %i7
	lduw	[%l7 + %i7],	%l0
	set	0x08, %i5
	stda	%l2,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x3C, %o6
	stwa	%i7,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x28, %l1
	lduh	[%l7 + %l1],	%o0
	nop
	set	0x7E, %i6
	ldstub	[%l7 + %i6],	%i6
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%i4
	add	%i1,	%o7,	%o6
	nop
	set	0x4C, %o4
	ldsw	[%l7 + %o4],	%g5
	nop
	set	0x40, %i2
	sth	%o4,	[%l7 + %i2]
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%f24
	nop
	set	0x0C, %g4
	lduh	[%l7 + %g4],	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x88,	%g6,	%i2
	nop
	set	0x5C, %i3
	ldsw	[%l7 + %i3],	%i0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xca
	nop
	set	0x18, %l0
	ldx	[%l7 + %l0],	%g3
	st	%f16,	[%l7 + 0x7C]
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f10
	set	0x2E, %l2
	stha	%l2,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x50, %l3
	ldxa	[%l7 + %l3] 0x81,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%l4
	nop
	set	0x78, %i1
	lduw	[%l7 + %i1],	%o1
	set	0x0C, %o1
	lda	[%l7 + %o1] 0x88,	%f11
	nop
	set	0x40, %i4
	std	%f12,	[%l7 + %i4]
	set	0x2D, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g7
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f22
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%l0
	nop
	set	0x33, %o3
	ldstub	[%l7 + %o3],	%o5
	nop
	set	0x60, %g6
	std	%i6,	[%l7 + %g6]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%g4
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x80,	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%l0
	set	0x4A, %g2
	stha	%g2,	[%l7 + %g2] 0x80
	set	0x30, %o7
	swapa	[%l7 + %o7] 0x80,	%i7
	nop
	set	0x30, %o0
	ldsh	[%l7 + %o0],	%l3
	nop
	set	0x44, %i7
	lduh	[%l7 + %i7],	%o0
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%i5
	nop
	set	0x7C, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%i0
	set	0x20, %i6
	ldxa	[%l7 + %i6] 0x88,	%o7
	add	%i6,	%g5,	%o6
	nop
	set	0x30, %l1
	lduw	[%l7 + %l1],	%o4
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%o2
	nop
	set	0x4E, %i2
	sth	%g6,	[%l7 + %i2]
	st	%f17,	[%l7 + 0x10]
	nop
	set	0x14, %g5
	stw	%i0,	[%l7 + %g5]
	nop
	set	0x10, %l5
	swap	[%l7 + %l5],	%g3
	set	0x34, %o5
	lda	[%l7 + %o5] 0x88,	%f21
	set	0x1A, %i3
	stba	%l2,	[%l7 + %i3] 0x81
	nop
	set	0x30, %o2
	std	%i2,	[%l7 + %o2]
	nop
	set	0x30, %g4
	lduh	[%l7 + %g4],	%i4
	nop
	set	0x60, %i0
	std	%i2,	[%l7 + %i0]
	nop
	set	0x50, %l0
	prefetch	[%l7 + %l0],	 1
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	set	0x4C, %i1
	swapa	[%l7 + %i1] 0x89,	%o1
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x81,	%l4
	set	0x19, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g7
	nop
	set	0x14, %l6
	swap	[%l7 + %l6],	%l1
	set	0x52, %i4
	stha	%l6,	[%l7 + %i4] 0x80
	st	%fsr,	[%l7 + 0x18]
	ld	[%l7 + 0x30],	%f13
	set	0x56, %g3
	stha	%g1,	[%l7 + %g3] 0x81
	nop
	set	0x78, %o3
	std	%o4,	[%l7 + %o3]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1259
!	Type a   	: 35
!	Type cti   	: 17
!	Type x   	: 530
!	Type f   	: 40
!	Type i   	: 119
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 6 Start
!
.global thread_6
thread_6:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xB,	%g1
	set	0xF,	%g2
	set	0x6,	%g3
	set	0xA,	%g4
	set	0x8,	%g5
	set	0x7,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x1,	%i1
	set	-0x2,	%i2
	set	-0x2,	%i3
	set	-0x4,	%i4
	set	-0x8,	%i5
	set	-0xF,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x5DC03CCA,	%l0
	set	0x0431D5E1,	%l1
	set	0x6A08E703,	%l2
	set	0x22F46998,	%l3
	set	0x603D747F,	%l4
	set	0x5571EB9C,	%l5
	set	0x0D60AC92,	%l6
	!# Output registers
	set	0x0B51,	%o0
	set	-0x020D,	%o1
	set	0x0632,	%o2
	set	0x0773,	%o3
	set	-0x04ED,	%o4
	set	-0x0CB1,	%o5
	set	-0x126D,	%o6
	set	-0x0BCE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA52B36A3745B7D0F)
	INIT_TH_FP_REG(%l7,%f2,0xF56E0DA3B90577AE)
	INIT_TH_FP_REG(%l7,%f4,0x402D7DAC36E9E004)
	INIT_TH_FP_REG(%l7,%f6,0x3E7BF54684D0E162)
	INIT_TH_FP_REG(%l7,%f8,0x28D8FFEFD3AADC85)
	INIT_TH_FP_REG(%l7,%f10,0xCB7B13CDA6BF8DEA)
	INIT_TH_FP_REG(%l7,%f12,0xFBE4579F62424EC9)
	INIT_TH_FP_REG(%l7,%f14,0x0803BB4F6DA96F25)
	INIT_TH_FP_REG(%l7,%f16,0x8C8CF0668AFE08A2)
	INIT_TH_FP_REG(%l7,%f18,0xA553375C4CDAC316)
	INIT_TH_FP_REG(%l7,%f20,0x08DDCB6D2CEAA72B)
	INIT_TH_FP_REG(%l7,%f22,0x33B2375325954A03)
	INIT_TH_FP_REG(%l7,%f24,0xBE22DBBDCE6BB10C)
	INIT_TH_FP_REG(%l7,%f26,0xD5B7E828433B5701)
	INIT_TH_FP_REG(%l7,%f28,0xEE1A081B36C4A381)
	INIT_TH_FP_REG(%l7,%f30,0xB3D02AD26C75010E)

	!# Execute Main Diag ..

	set	0x68, %l4
	lda	[%l7 + %l4] 0x81,	%f17
	set	0x40, %g6
	stxa	%o2,	[%l7 + %g6] 0x89
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f16
	nop
	set	0x7C, %o7
	lduw	[%l7 + %o7],	%l5
	nop
	set	0x22, %o0
	ldub	[%l7 + %o0],	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%g2
	nop
	set	0x7E, %i5
	ldsh	[%l7 + %i5],	%i7
	set	0x30, %i7
	sta	%f27,	[%l7 + %i7] 0x88
	st	%f13,	[%l7 + 0x50]
	nop
	set	0x60, %g7
	ldsw	[%l7 + %g7],	%o0
	nop
	set	0x50, %o6
	std	%i4,	[%l7 + %o6]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f16
	nop
	set	0x7C, %l1
	prefetch	[%l7 + %l1],	 2
	and	%l3,	%i1,	%i6
	set	0x48, %i2
	stda	%o6,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x20, %o4
	prefetch	[%l7 + %o4],	 1
	and	%g5,	%o6,	%o4
	and	%g6,	%i0,	%o3
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%g2
	st	%f30,	[%l7 + 0x24]
	set	0x2C, %o5
	stwa	%i2,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x18, %i3
	stw	%i4,	[%l7 + %i3]
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%l2
	nop
	set	0x38, %o2
	ldx	[%l7 + %o2],	%i3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%l4
	st	%fsr,	[%l7 + 0x1C]
	set	0x6C, %i0
	lda	[%l7 + %i0] 0x80,	%f18
	and	%l1,	%l6,	%g1
	nop
	set	0x10, %g4
	ldx	[%l7 + %g4],	%o5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc0
	set	0x10, %l2
	ldda	[%l7 + %l2] 0xe3,	%g6
	nop
	set	0x39, %l0
	ldstub	[%l7 + %l0],	%o2
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf1
	membar	#Sync
	set	0x1E, %g1
	stha	%l5,	[%l7 + %g1] 0x81
	nop
	set	0x4A, %l6
	ldsh	[%l7 + %l6],	%g4
	nop
	set	0x65, %g3
	stb	%g2,	[%l7 + %g3]
	set	0x68, %i4
	stxa	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x4C, %o3
	lduw	[%l7 + %o3],	%i7
	nop
	set	0x0E, %l4
	ldsb	[%l7 + %l4],	%o0
	bg	%icc,	loop_137
	nop
	set	0x4E, %g2
	lduh	[%l7 + %g2],	%i5
	set	0x50, %g6
	stxa	%l3,	[%l7 + %g6] 0xeb
	membar	#Sync
loop_137:
	nop
	set	0x18, %o7
	stda	%i6,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x10, %o0
	ldsh	[%l7 + %o0],	%o7
	nop
	set	0x44, %i5
	ldsw	[%l7 + %i5],	%i1
	fpsub32	%f6,	%f16,	%f4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xcc
	nop
	set	0x08, %i7
	stx	%g5,	[%l7 + %i7]
	and	%o4,	%o6,	%i0
	nop
	set	0x1C, %i6
	swap	[%l7 + %i6],	%o3
	set	0x54, %l1
	swapa	[%l7 + %l1] 0x80,	%g6
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x80
	add	%g3,	%i4,	%l2
	nop
	set	0x7A, %o6
	lduh	[%l7 + %o6],	%i3
	nop
	set	0x56, %l5
	sth	%o1,	[%l7 + %l5]
	nop
	set	0x08, %o4
	std	%i2,	[%l7 + %o4]
	wr	%l4,	%l6,	%ccr
	nop
	set	0x28, %i3
	std	%f26,	[%l7 + %i3]
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x88,	%l0
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f8
	nop
	set	0x10, %i0
	swap	[%l7 + %i0],	%o5
	nop
	set	0x58, %g4
	std	%g0,	[%l7 + %g4]
	set	0x68, %o2
	stda	%g6,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x46, %l3
	stba	%l5,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x38, %l2
	ldxa	[%l7 + %l2] 0x81,	%o2
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f18
	st	%fsr,	[%l7 + 0x5C]
	st	%f8,	[%l7 + 0x74]
	set	0x5E, %l0
	stba	%g2,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x48, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x0C, %g1
	prefetch	[%l7 + %g1],	 0
	nop
	set	0x20, %l6
	swap	[%l7 + %l6],	%l0
	nop
	set	0x12, %i4
	ldstub	[%l7 + %i4],	%i7
	nop
	set	0x5A, %g3
	sth	%o0,	[%l7 + %g3]
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f22
	set	0x10, %g2
	ldda	[%l7 + %g2] 0xe3,	%i4
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc4
	set	0x21, %o7
	stba	%g4,	[%l7 + %o7] 0xeb
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%o7
	nop
	set	0x58, %o0
	stx	%i1,	[%l7 + %o0]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%o4
	set	0x68, %i5
	lda	[%l7 + %i5] 0x80,	%f27
	set	0x30, %o3
	ldxa	[%l7 + %o3] 0x89,	%o6
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f0
	nop
	set	0x6C, %i7
	lduw	[%l7 + %i7],	%g5
	nop
	set	0x44, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x4D, %i6
	ldstuba	[%l7 + %i6] 0x88,	%i0
	bn	%xcc,	loop_138
	nop
	set	0x1C, %i2
	lduw	[%l7 + %i2],	%g6
	nop
	set	0x08, %o6
	std	%f26,	[%l7 + %o6]
	ld	[%l7 + 0x4C],	%f25
loop_138:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%g3
	set	0x12, %l5
	stba	%o1,	[%l7 + %l5] 0x88
	nop
	set	0x58, %i3
	std	%i2,	[%l7 + %i3]
	nop
	set	0x5E, %o4
	sth	%i2,	[%l7 + %o4]
	set	0x30, %o5
	stda	%l4,	[%l7 + %o5] 0xea
	membar	#Sync
	st	%f10,	[%l7 + 0x18]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%l1
	and	%g1,	%o5,	%l5
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x88,	%f0
	set	0x20, %g4
	ldxa	[%l7 + %g4] 0x81,	%o2
	and	%g2,	%g7,	%i7
	nop
	set	0x69, %i0
	ldstub	[%l7 + %i0],	%l0
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f16
	set	0x20, %l3
	ldxa	[%l7 + %l3] 0x81,	%i5
	nop
	set	0x48, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x4C, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%g4
	nop
	set	0x08, %o1
	stx	%l3,	[%l7 + %o1]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f16
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc4
	nop
	set	0x38, %g3
	ldx	[%l7 + %g3],	%o7
	add	%i1,	%o0,	%i6
	st	%fsr,	[%l7 + 0x50]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%g5
	nop
	set	0x60, %g1
	lduh	[%l7 + %g1],	%o4
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0
	set	0x28, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	set	0x60, %g6
	stxa	%i0,	[%l7 + %g6] 0x80
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%l2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f16
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f16
	set	0x62, %o0
	ldstuba	[%l7 + %o0] 0x80,	%i4
	set	0x28, %i7
	lda	[%l7 + %i7] 0x80,	%f23
	nop
	set	0x64, %l1
	swap	[%l7 + %l1],	%g3
	nop
	set	0x0C, %g7
	ldub	[%l7 + %g7],	%o1
	or	%i3,	%i2,	%l6
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x81,	 3
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf1
	membar	#Sync
	set	0x4C, %o6
	lda	[%l7 + %o6] 0x89,	%f12
	set	0x40, %l5
	lda	[%l7 + %l5] 0x89,	%f24
	nop
	set	0x3C, %o4
	ldsw	[%l7 + %o4],	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%g1
	set	0x54, %o5
	swapa	[%l7 + %o5] 0x81,	%o2
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%f8
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%l5
	set	0x1C, %g4
	stwa	%g7,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x78, %g5
	stba	%l0,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x89,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%l3
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%o7
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x88,	%i6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%o0
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x77, %i1
	ldub	[%l7 + %i1],	%o6
	nop
	set	0x40, %o1
	stx	%g5,	[%l7 + %o1]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xe2,	%o4
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x80,	%g6
	nop
	set	0x48, %g3
	std	%f10,	[%l7 + %g3]
	set	0x78, %l0
	stda	%o2,	[%l7 + %l0] 0x80
	set	0x10, %g1
	ldda	[%l7 + %g1] 0xeb,	%i6
	nop
	set	0x74, %l4
	ldsh	[%l7 + %l4],	%i0
	add	%i4,	%l2,	%o1
	ba,a	%icc,	loop_139
	nop
	set	0x50, %g6
	sth	%i3,	[%l7 + %g6]
	nop
	nop
	setx	0xF86152738C5A6495,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x2541027BC130DF9A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f12,	%f26
	st	%f26,	[%l7 + 0x38]
loop_139:
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f22
	nop
	set	0x58, %o7
	ldsw	[%l7 + %o7],	%i2
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f16
	add	%l6,	%g3,	%l1
	set	0x28, %i5
	stxa	%l4,	[%l7 + %i5] 0x88
	nop
	set	0x58, %i7
	stx	%g1,	[%l7 + %i7]
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x88,	 2
	nop
	set	0x14, %g7
	ldsw	[%l7 + %g7],	%o2
	nop
	set	0x10, %i2
	stx	%g2,	[%l7 + %i2]
	set	0x30, %l1
	prefetcha	[%l7 + %l1] 0x81,	 3
	nop
	set	0x30, %o6
	std	%f18,	[%l7 + %o6]
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x88,	%l0
	nop
	set	0x08, %o4
	stx	%i5,	[%l7 + %o4]
	nop
	set	0x0C, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x4C, %i3
	swap	[%l7 + %i3],	%g4
	set	0x10, %o5
	lda	[%l7 + %o5] 0x88,	%f5
	bgu,a,pt	%xcc,	loop_140
	nop
	set	0x20, %g5
	stx	%l5,	[%l7 + %g5]
	ld	[%l7 + 0x10],	%f6
	and	%o7,	%l3,	%i1
loop_140:
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%i7
	nop
	set	0x58, %g4
	ldx	[%l7 + %g4],	%o6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%o4
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%g6
	fpsub16	%f16,	%f18,	%f24
	wr	%g5,	%i6,	%y
	fpsub16s	%f2,	%f23,	%f15
	nop
	set	0x2C, %l2
	stw	%i0,	[%l7 + %l2]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%l2
	nop
	set	0x34, %l3
	ldsb	[%l7 + %l3],	%o3
	nop
	set	0x4E, %o1
	lduh	[%l7 + %o1],	%o1
	add	%i2,	%i3,	%g3
	nop
	set	0x3E, %i1
	ldsh	[%l7 + %i1],	%l6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g1
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x80,	%o5
	nop
	set	0x5E, %l6
	stb	%l1,	[%l7 + %l6]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f0
	nop
	set	0x4C, %g1
	lduh	[%l7 + %g1],	%g2
	nop
	set	0x5E, %g3
	lduh	[%l7 + %g3],	%g7
	set	0x5E, %g6
	ldstuba	[%l7 + %g6] 0x89,	%l0
	nop
	set	0x70, %l4
	sth	%o2,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x54]
	bleu,a	%xcc,	loop_141
	nop
	set	0x75, %o7
	ldstub	[%l7 + %o7],	%g4
	st	%f20,	[%l7 + 0x48]
	nop
	set	0x18, %o3
	sth	%l5,	[%l7 + %o3]
loop_141:
	nop
	set	0x5A, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i5
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x89,	 3
	set	0x48, %o0
	sta	%f18,	[%l7 + %o0] 0x81
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xe2,	%l2
	nop
	set	0x68, %i7
	ldsw	[%l7 + %i7],	%i1
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%i6
	nop
	set	0x5E, %o6
	lduh	[%l7 + %o6],	%o6
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%f10
	set	0x38, %o4
	stda	%o0,	[%l7 + %o4] 0xe3
	membar	#Sync
	ld	[%l7 + 0x2C],	%f30
	nop
	set	0x70, %i6
	swap	[%l7 + %i6],	%g6
	nop
	set	0x33, %i3
	ldstub	[%l7 + %i3],	%g5
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%o4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xda,	%f16
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd8
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f18
	nop
	set	0x11, %g5
	ldub	[%l7 + %g5],	%i6
	and	%i0,	%i4,	%l2
	set	0x40, %o2
	stda	%o0,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x30, %l3
	std	%f28,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x68]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf0
	membar	#Sync
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x88,	 1
	set	0x1B, %i4
	stba	%i2,	[%l7 + %i4] 0x80
	nop
	set	0x74, %i1
	swap	[%l7 + %i1],	%i3
	and	%g3,	%l6,	%l4
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%f22
	set	0x08, %l6
	stxa	%g1,	[%l7 + %l6] 0x80
	nop
	set	0x30, %g3
	std	%f0,	[%l7 + %g3]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x80
	nop
	set	0x0C, %g6
	lduh	[%l7 + %g6],	%l1
	nop
	set	0x68, %l4
	std	%g2,	[%l7 + %l4]
	set	0x68, %o7
	stda	%o4,	[%l7 + %o7] 0xe3
	membar	#Sync
	add	%g7,	%o2,	%l0
	nop
	set	0x63, %i5
	stb	%l5,	[%l7 + %i5]
	nop
	set	0x10, %g2
	ldsh	[%l7 + %g2],	%g4
	set	0x08, %o0
	sta	%f13,	[%l7 + %o0] 0x81
	set	0x74, %g7
	stha	%i5,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x40, %o3
	swapa	[%l7 + %o3] 0x88,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%i7
	nop
	set	0x78, %i7
	std	%f18,	[%l7 + %i7]
	set	0x62, %l1
	stba	%o6,	[%l7 + %l1] 0xe2
	membar	#Sync
	fpsub16	%f24,	%f10,	%f28
	nop
	set	0x08, %o6
	std	%o6,	[%l7 + %o6]
	nop
	set	0x70, %o4
	ldsh	[%l7 + %o4],	%g6
	nop
	set	0x10, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%o0
	set	0x3C, %i2
	swapa	[%l7 + %i2] 0x81,	%o4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g5,	%i4,	%ccr
	nop
	set	0x6C, %o5
	ldsw	[%l7 + %o5],	%l2
	fpsub16s	%f22,	%f6,	%f14
	add	%o1,	%i2,	%o3
	set	0x48, %i3
	stxa	%g3,	[%l7 + %i3] 0x88
	st	%fsr,	[%l7 + 0x60]
	add	%l6,	%l4,	%i3
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%l0
	wr	%g1,	%o5,	%ccr
	ld	[%l7 + 0x10],	%f4
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x89,	%g7
	nop
	set	0x08, %g5
	ldx	[%l7 + %g5],	%o2
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x89,	%g2
	set	0x50, %o2
	swapa	[%l7 + %o2] 0x88,	%l0
	nop
	set	0x7C, %o1
	ldsw	[%l7 + %o1],	%g4
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%l4
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xeb,	%l2
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f10
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x10, %l2
	std	%i0,	[%l7 + %l2]
	nop
	set	0x44, %g3
	stw	%i7,	[%l7 + %g3]
	nop
	set	0x54, %l6
	ldsw	[%l7 + %l6],	%i5
	nop
	set	0x75, %g6
	ldsb	[%l7 + %g6],	%o7
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xeb,	%g6
	set	0x50, %l4
	stba	%o0,	[%l7 + %l4] 0xe3
	membar	#Sync
	st	%f2,	[%l7 + 0x20]
	add	%o4,	%i6,	%o6
	st	%f13,	[%l7 + 0x5C]
	set	0x14, %o7
	stba	%i0,	[%l7 + %o7] 0x81
	set	0x24, %i5
	lda	[%l7 + %i5] 0x88,	%f31
	nop
	set	0x4C, %o0
	lduh	[%l7 + %o0],	%g5
	or	%l2,	%o1,	%i4
	st	%fsr,	[%l7 + 0x08]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%g3
	nop
	set	0x4C, %g7
	sth	%l6,	[%l7 + %g7]
	set	0x58, %g2
	prefetcha	[%l7 + %g2] 0x80,	 2
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xd0
	add	%i3,	%l1,	%g1
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x18, %o3
	std	%l4,	[%l7 + %o3]
	set	0x08, %l1
	stwa	%o5,	[%l7 + %l1] 0x89
	nop
	set	0x78, %o4
	std	%o2,	[%l7 + %o4]
	set	0x40, %o6
	lda	[%l7 + %o6] 0x81,	%f9
	nop
	set	0x74, %i6
	stw	%g2,	[%l7 + %i6]
	nop
	set	0x49, %i2
	ldstub	[%l7 + %i2],	%l0
	nop
	set	0x18, %o5
	std	%f28,	[%l7 + %o5]
	nop
	nop
	setx	0x20ADBFAD6F621722,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xE92F79680E3AFCEF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f4
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f0
	nop
	set	0x30, %i0
	std	%f22,	[%l7 + %i0]
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	set	0x4C, %g5
	swapa	[%l7 + %g5] 0x89,	%g7
	set	0x1C, %l3
	stba	%l3,	[%l7 + %l3] 0x80
	and	%i1,	%i7,	%l5
	nop
	set	0x4A, %o2
	sth	%i5,	[%l7 + %o2]
	set	0x30, %o1
	prefetcha	[%l7 + %o1] 0x81,	 3
	nop
	set	0x10, %l5
	prefetch	[%l7 + %l5],	 2
	st	%fsr,	[%l7 + 0x74]
	set	0x68, %i4
	lda	[%l7 + %i4] 0x89,	%f30
	nop
	set	0x40, %l0
	std	%f14,	[%l7 + %l0]
	or	%o7,	%o0,	%o4
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	fpsub32	%f10,	%f12,	%f20
	nop
	set	0x70, %g3
	stx	%i6,	[%l7 + %g3]
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f22
	set	0x30, %g6
	stxa	%o6,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%g4
	set	0x10, %g1
	ldxa	[%l7 + %g1] 0x81,	%l2
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x89,	%i0
	nop
	set	0x68, %l4
	ldsw	[%l7 + %l4],	%i4
	nop
	set	0x5C, %o0
	swap	[%l7 + %o0],	%o1
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i2
	set	0x70, %g2
	stba	%o3,	[%l7 + %g2] 0x88
	set	0x60, %g7
	stxa	%i3,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x64, %i7
	ldub	[%l7 + %i7],	%l1
	nop
	set	0x3A, %o3
	lduh	[%l7 + %o3],	%l4
	nop
	set	0x34, %l1
	ldstub	[%l7 + %l1],	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%g2
	or	%l0,	%g4,	%o2
	nop
	set	0x6C, %o6
	ldsh	[%l7 + %o6],	%l3
	nop
	set	0x68, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x12, %i2
	ldsh	[%l7 + %i2],	%i1
	nop
	set	0x60, %o5
	stx	%i7,	[%l7 + %o5]
	nop
	set	0x44, %o4
	prefetch	[%l7 + %o4],	 1
	and	%g7,	%i5,	%l5
	and	%g6,	%o0,	%o7
	nop
	set	0x16, %i3
	ldstub	[%l7 + %i3],	%o4
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f22
	set	0x58, %i0
	stha	%o6,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x18, %g5
	stda	%i6,	[%l7 + %g5] 0x81
	wr	%g5,	%i0,	%pic
	set	0x68, %l3
	stda	%i4,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x14, %o2
	prefetch	[%l7 + %o2],	 4
	set	0x28, %o1
	lda	[%l7 + %o1] 0x80,	%f7
	nop
	set	0x5A, %i4
	ldub	[%l7 + %i4],	%l2
	nop
	set	0x70, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x10, %l5
	stxa	%g3,	[%l7 + %l5] 0x88
	nop
	set	0x28, %l2
	std	%f16,	[%l7 + %l2]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xd0
	nop
	set	0x60, %g6
	stx	%l6,	[%l7 + %g6]
	nop
	set	0x1C, %i1
	lduh	[%l7 + %i1],	%i2
	nop
	set	0x38, %g3
	sth	%o1,	[%l7 + %g3]
	nop
	set	0x74, %o7
	prefetch	[%l7 + %o7],	 3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%l1
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%f0
	nop
	set	0x58, %o0
	std	%f2,	[%l7 + %o0]
	nop
	set	0x39, %i5
	ldstub	[%l7 + %i5],	%i3
	nop
	set	0x7E, %l4
	lduh	[%l7 + %l4],	%l4
	bg	%xcc,	loop_142
	nop
	set	0x68, %g7
	std	%o4,	[%l7 + %g7]
	nop
	set	0x22, %i7
	stb	%g2,	[%l7 + %i7]
	nop
	set	0x23, %o3
	ldsb	[%l7 + %o3],	%g1
loop_142:
	nop
	set	0x10, %g2
	stda	%l0,	[%l7 + %g2] 0x80
	nop
	set	0x79, %l1
	ldsb	[%l7 + %l1],	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%i1
	set	0x25, %o6
	stba	%i7,	[%l7 + %o6] 0xe2
	membar	#Sync
	st	%f1,	[%l7 + 0x68]
	nop
	set	0x64, %i2
	ldsw	[%l7 + %i2],	%g7
	set	0x20, %i6
	prefetcha	[%l7 + %i6] 0x88,	 3
	nop
	set	0x0C, %o5
	stw	%l5,	[%l7 + %o5]
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%g4
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%f6
	set	0x73, %i0
	stba	%g6,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x2C, %g5
	swap	[%l7 + %g5],	%o0
	set	0x58, %i3
	swapa	[%l7 + %i3] 0x81,	%o7
	nop
	set	0x48, %o2
	ldsh	[%l7 + %o2],	%o6
	nop
	set	0x30, %l3
	ldsw	[%l7 + %l3],	%o4
	nop
	set	0x68, %o1
	ldsw	[%l7 + %o1],	%i6
	or	%i0,	%i4,	%g5
	nop
	set	0x4C, %i4
	swap	[%l7 + %i4],	%l2
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f26
	set	0x24, %l2
	lda	[%l7 + %l2] 0x89,	%f6
	fpsub32	%f0,	%f16,	%f28
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x89,	%g3
	set	0x30, %l6
	lda	[%l7 + %l6] 0x88,	%f25
	nop
	set	0x58, %g6
	stw	%l6,	[%l7 + %g6]
	nop
	set	0x51, %g3
	ldstub	[%l7 + %g3],	%o1
	nop
	set	0x38, %i1
	ldsw	[%l7 + %i1],	%i2
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x88,	%o3
	nop
	set	0x5F, %g1
	stb	%i3,	[%l7 + %g1]
	nop
	set	0x0C, %o0
	stw	%l1,	[%l7 + %o0]
	set	0x18, %i5
	stxa	%l4,	[%l7 + %i5] 0x81
	set	0x50, %g7
	stxa	%o5,	[%l7 + %g7] 0x88
	set	0x3C, %l4
	swapa	[%l7 + %l4] 0x89,	%g2
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%f20
	nop
	set	0x44, %g2
	swap	[%l7 + %g2],	%g1
	nop
	set	0x60, %l1
	ldsh	[%l7 + %l1],	%l0
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%l2
	add	%o2,	%i7,	%i1
	nop
	set	0x68, %i2
	stx	%i5,	[%l7 + %i2]
	ld	[%l7 + 0x70],	%f14
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%g4
	ld	[%l7 + 0x38],	%f1
	set	0x50, %i6
	stwa	%g7,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x20, %o6
	stda	%g6,	[%l7 + %o6] 0x88
	ble	%xcc,	loop_143
	nop
	set	0x22, %o4
	ldstub	[%l7 + %o4],	%o7
	set	0x58, %g4
	sta	%f16,	[%l7 + %g4] 0x89
loop_143:
	nop
	set	0x18, %o5
	stw	%o0,	[%l7 + %o5]
	nop
	set	0x70, %g5
	ldx	[%l7 + %g5],	%o4
	set	0x40, %i3
	stxa	%i6,	[%l7 + %i3] 0x80
	nop
	set	0x78, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x48, %i0
	std	%f10,	[%l7 + %i0]
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f18
	fpsub16s	%f27,	%f5,	%f10
	wr	%o6,	%i4,	%sys_tick
	nop
	set	0x0A, %l3
	ldsh	[%l7 + %l3],	%i0
	nop
	set	0x10, %l0
	stb	%g5,	[%l7 + %l0]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x88
	nop
	set	0x40, %l5
	stx	%g3,	[%l7 + %l5]
	nop
	set	0x28, %l2
	swap	[%l7 + %l2],	%l2
	set	0x38, %g6
	sta	%f5,	[%l7 + %g6] 0x88
	nop
	nop
	setx	0xC9BE3437,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x21A04BA1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f21,	%f10
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%i6
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f0
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x81,	%o1
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%o2
	st	%fsr,	[%l7 + 0x18]
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x81,	 3
	nop
	set	0x64, %g1
	ldsw	[%l7 + %g1],	%l1
	nop
	set	0x1D, %g7
	ldsb	[%l7 + %g7],	%l4
	nop
	set	0x64, %l4
	swap	[%l7 + %l4],	%i3
	nop
	set	0x11, %g2
	ldstub	[%l7 + %g2],	%g2
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xeb,	%g0
	nop
	set	0x4C, %o3
	ldsh	[%l7 + %o3],	%o5
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x88,	 2
	nop
	set	0x20, %i2
	std	%o2,	[%l7 + %i2]
	nop
	set	0x56, %i6
	ldstub	[%l7 + %i6],	%l3
	set	0x24, %o6
	stwa	%i1,	[%l7 + %o6] 0x81
	set	0x74, %g4
	stwa	%i5,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x5C, %o4
	ldstub	[%l7 + %o4],	%l5
	set	0x58, %o5
	stda	%i6,	[%l7 + %o5] 0x88
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x80,	 3
	set	0x60, %o2
	stwa	%g4,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x10, %i0
	ldstuba	[%l7 + %i0] 0x80,	%g6
	or	%o7,	%o0,	%i6
	set	0x32, %i3
	stha	%o6,	[%l7 + %i3] 0xeb
	membar	#Sync
	ld	[%l7 + 0x50],	%f29
	nop
	set	0x2A, %l3
	ldsh	[%l7 + %l3],	%i4
	nop
	set	0x37, %l0
	ldsb	[%l7 + %l0],	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%g5
	nop
	set	0x08, %i4
	prefetch	[%l7 + %i4],	 2
	nop
	set	0x70, %l5
	std	%f4,	[%l7 + %l5]
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x88,	 4
	nop
	set	0x20, %l2
	lduh	[%l7 + %l2],	%l6
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x58, %g6
	std	%f24,	[%l7 + %g6]
	nop
	set	0x20, %l6
	std	%f26,	[%l7 + %l6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%o1
	set	0x70, %i1
	stda	%o2,	[%l7 + %i1] 0xea
	membar	#Sync
	fpsub16s	%f13,	%f11,	%f17
	nop
	set	0x4C, %o7
	ldsh	[%l7 + %o7],	%l1
	nop
	set	0x30, %g3
	lduw	[%l7 + %g3],	%l4
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x81,	%i3
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%g2
	set	0x30, %g1
	stxa	%i2,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x68, %l4
	stx	%o5,	[%l7 + %l4]
	nop
	set	0x20, %g2
	std	%f28,	[%l7 + %g2]
	set	0x20, %g7
	stda	%g0,	[%l7 + %g7] 0x80
	nop
	set	0x0B, %o3
	stb	%o2,	[%l7 + %o3]
	nop
	set	0x40, %l1
	sth	%l0,	[%l7 + %l1]
	set	0x68, %i7
	prefetcha	[%l7 + %i7] 0x80,	 1
	nop
	set	0x30, %i6
	lduw	[%l7 + %i6],	%i5
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x80,	%l5
	nop
	set	0x60, %i2
	prefetch	[%l7 + %i2],	 2
	add	%i7,	%l3,	%g4
	set	0x40, %o4
	prefetcha	[%l7 + %o4] 0x80,	 4
	set	0x0C, %g4
	stwa	%g7,	[%l7 + %g4] 0x88
	st	%f7,	[%l7 + 0x08]
	add	%o0,	%o7,	%o6
	nop
	set	0x56, %g5
	stb	%i6,	[%l7 + %g5]
	nop
	set	0x3C, %o5
	stw	%o4,	[%l7 + %o5]
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%f4
	nop
	set	0x12, %o2
	ldsb	[%l7 + %o2],	%i4
	set	0x3C, %l3
	sta	%f18,	[%l7 + %l3] 0x88
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xc8
	ld	[%l7 + 0x44],	%f0
	nop
	set	0x73, %i4
	ldsb	[%l7 + %i4],	%i0
	bgu	%xcc,	loop_144
	st	%f8,	[%l7 + 0x68]
	nop
	set	0x18, %l0
	stw	%g5,	[%l7 + %l0]
	set	0x30, %o1
	ldxa	[%l7 + %o1] 0x81,	%g3
loop_144:
	fpsub16	%f0,	%f16,	%f24
	nop
	set	0x78, %l5
	std	%l2,	[%l7 + %l5]
	nop
	set	0x30, %g6
	stx	%l6,	[%l7 + %g6]
	set	0x7F, %l6
	ldstuba	[%l7 + %l6] 0x80,	%o1
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x80,	%o2
	and	%l1,	%i3,	%l4
	nop
	set	0x58, %l2
	std	%f4,	[%l7 + %l2]
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%f2
	set	0x68, %o0
	stxa	%g2,	[%l7 + %o0] 0x89
	nop
	set	0x71, %o7
	ldub	[%l7 + %o7],	%i2
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%g0
	nop
	set	0x1F, %l4
	stb	%o5,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x78]
	set	0x14, %g2
	stwa	%l0,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x13, %g1
	ldsb	[%l7 + %g1],	%o2
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf1,	%f0
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%f18
	or	%i1,	%i5,	%i7
	and	%l3,	%g4,	%g6
	nop
	set	0x14, %g7
	ldstub	[%l7 + %g7],	%l5
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%o7
	nop
	set	0x22, %i6
	sth	%o6,	[%l7 + %i6]
	set	0x0D, %o6
	stba	%i6,	[%l7 + %o6] 0x81
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x80,	%o4
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0
	and	%i4,	%g5,	%g3
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	or	%l2,	%i0,	%l6
	nop
	set	0x58, %g5
	std	%f16,	[%l7 + %g5]
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x89,	%o0
	nop
	set	0x68, %i0
	ldsh	[%l7 + %i0],	%o3
	set	0x24, %o5
	stha	%i3,	[%l7 + %o5] 0x88
	nop
	set	0x10, %l3
	sth	%l4,	[%l7 + %l3]
	set	0x23, %i3
	ldstuba	[%l7 + %i3] 0x88,	%g2
	nop
	set	0x60, %i4
	stx	%l1,	[%l7 + %i4]
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x89,	%g1
	and	%o5,	%i2,	%l0
	set	0x0B, %o2
	stba	%o2,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x4B, %l5
	stba	%i1,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x22, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i7
	nop
	set	0x78, %o1
	prefetch	[%l7 + %o1],	 4
	add	%l3,	%i5,	%g4
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x30, %l2
	lduh	[%l7 + %l2],	%l5
	nop
	set	0x08, %g3
	stx	%g6,	[%l7 + %g3]
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x88,	%o6
	nop
	set	0x74, %o0
	lduw	[%l7 + %o0],	%o7
	st	%f25,	[%l7 + 0x28]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc4
	nop
	set	0x7C, %g2
	ldstub	[%l7 + %g2],	%i6
	nop
	set	0x70, %l4
	std	%f4,	[%l7 + %l4]
	set	0x70, %g1
	stxa	%o4,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x1E, %o3
	sth	%i4,	[%l7 + %o3]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%g5
	nop
	set	0x15, %g7
	ldsb	[%l7 + %g7],	%l2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x1C, %i6
	stwa	%l6,	[%l7 + %i6] 0x80
	set	0x70, %o6
	stwa	%o3,	[%l7 + %o6] 0x81
	nop
	set	0x09, %i7
	stb	%o1,	[%l7 + %i7]
	nop
	set	0x30, %l1
	std	%l4,	[%l7 + %l1]
	set	0x28, %g4
	stba	%g2,	[%l7 + %g4] 0x88
	ld	[%l7 + 0x68],	%f8
	set	0x7D, %i2
	stba	%i3,	[%l7 + %i2] 0x89
	st	%fsr,	[%l7 + 0x08]
	set	0x30, %o4
	stwa	%g1,	[%l7 + %o4] 0xea
	membar	#Sync
	ld	[%l7 + 0x08],	%f24
	add	%l1,	%i2,	%o5
	fpsub32s	%f30,	%f8,	%f19
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf0
	membar	#Sync
	set	0x50, %o5
	ldda	[%l7 + %o5] 0xeb,	%o2
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f14
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xeb,	%l0
	nop
	set	0x34, %i0
	ldsh	[%l7 + %i0],	%i7
	nop
	set	0x60, %l0
	ldstub	[%l7 + %l0],	%l3
	nop
	set	0x14, %o2
	lduw	[%l7 + %o2],	%i1
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x2E, %l5
	ldstub	[%l7 + %l5],	%g4
	st	%fsr,	[%l7 + 0x70]
	st	%f12,	[%l7 + 0x50]
	nop
	set	0x78, %g6
	ldub	[%l7 + %g6],	%l5
	nop
	set	0x10, %o1
	std	%i4,	[%l7 + %o1]
	nop
	set	0x40, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x29, %i4
	ldstub	[%l7 + %i4],	%g6
	nop
	set	0x78, %g3
	stx	%o6,	[%l7 + %g3]
	set	0x38, %i1
	prefetcha	[%l7 + %i1] 0x80,	 0
	nop
	set	0x5C, %o7
	sth	%o7,	[%l7 + %o7]
	set	0x68, %l2
	stxa	%i6,	[%l7 + %l2] 0x81
	nop
	set	0x38, %i5
	stx	%i4,	[%l7 + %i5]
	set	0x72, %g2
	ldstuba	[%l7 + %g2] 0x80,	%g7
	nop
	set	0x50, %o0
	ldx	[%l7 + %o0],	%g5
	set	0x79, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o4
	or	%l2,	%i0,	%l6
	set	0x0A, %g1
	stba	%o3,	[%l7 + %g1] 0xeb
	membar	#Sync
	add	%o1,	%l4,	%g3
	add	%g2,	%i3,	%l1
	nop
	set	0x67, %o3
	ldsb	[%l7 + %o3],	%g1
	ld	[%l7 + 0x4C],	%f21
	nop
	set	0x40, %i6
	ldstub	[%l7 + %i6],	%o5
	nop
	set	0x6C, %g7
	lduh	[%l7 + %g7],	%i2
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f20
	bleu,a,pn	%icc,	loop_145
	nop
	set	0x5C, %l1
	stw	%o2,	[%l7 + %l1]
	nop
	set	0x46, %i7
	lduh	[%l7 + %i7],	%l0
	nop
	set	0x26, %i2
	sth	%l3,	[%l7 + %i2]
loop_145:
	fpadd32s	%f17,	%f8,	%f1
	bl,a,pt	%icc,	loop_146
	nop
	set	0x78, %g4
	lduh	[%l7 + %g4],	%i7
	set	0x28, %g5
	lda	[%l7 + %g5] 0x88,	%f8
loop_146:
	nop
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%f0
	nop
	set	0x1A, %l3
	ldsh	[%l7 + %l3],	%g4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i5
	set	0x78, %o5
	swapa	[%l7 + %o5] 0x81,	%i1
	nop
	set	0x24, %i3
	ldsh	[%l7 + %i3],	%o6
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x89,	%g6
	nop
	set	0x4C, %o2
	swap	[%l7 + %o2],	%o7
	nop
	set	0x39, %l5
	ldub	[%l7 + %l5],	%o0
	and	%i4,	%g7,	%i6
	nop
	set	0x20, %l0
	prefetch	[%l7 + %l0],	 3
	nop
	set	0x30, %o1
	swap	[%l7 + %o1],	%o4
	nop
	set	0x6C, %g6
	ldsb	[%l7 + %g6],	%g5
	nop
	set	0x16, %l6
	ldub	[%l7 + %l6],	%i0
	nop
	set	0x18, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x81
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x80,	 3
	nop
	set	0x5C, %o7
	lduw	[%l7 + %o7],	%l6
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf9
	membar	#Sync
	nop
	set	0x6E, %i5
	lduh	[%l7 + %i5],	%o3
	ld	[%l7 + 0x4C],	%f16
	set	0x10, %o0
	stwa	%l4,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x45, %g2
	ldsb	[%l7 + %g2],	%g3
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x89,	 4
	nop
	set	0x7C, %g1
	stb	%g2,	[%l7 + %g1]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f16
	set	0x48, %i6
	swapa	[%l7 + %i6] 0x88,	%i3
	nop
	set	0x37, %g7
	ldstub	[%l7 + %g7],	%g1
	nop
	set	0x58, %l1
	swap	[%l7 + %l1],	%o5
	nop
	set	0x70, %o6
	ldsw	[%l7 + %o6],	%i2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l0
	set	0x68, %i7
	stxa	%l1,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x4E, %g4
	stba	%i7,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x10, %i2
	std	%l2,	[%l7 + %i2]
	nop
	set	0x3C, %g5
	swap	[%l7 + %g5],	%l5
	set	0x38, %l3
	stda	%i4,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x31, %o5
	stba	%g4,	[%l7 + %o5] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x14]
	set	0x58, %i3
	swapa	[%l7 + %i3] 0x89,	%o6
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%g6
	st	%f0,	[%l7 + 0x40]
	set	0x14, %o2
	stwa	%o7,	[%l7 + %o2] 0xe2
	membar	#Sync
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%i4
	set	0x7C, %o4
	stha	%g7,	[%l7 + %o4] 0x88
	nop
	set	0x50, %l5
	ldub	[%l7 + %l5],	%i1
	nop
	set	0x4A, %l0
	sth	%o4,	[%l7 + %l0]
	nop
	set	0x20, %o1
	stx	%i6,	[%l7 + %o1]
	nop
	set	0x68, %g6
	ldsb	[%l7 + %g6],	%g5
	set	0x54, %g3
	lda	[%l7 + %g3] 0x81,	%f19
	set	0x0C, %i1
	stwa	%i0,	[%l7 + %i1] 0x80
	nop
	set	0x50, %i4
	lduw	[%l7 + %i4],	%l6
	nop
	set	0x6E, %l6
	lduh	[%l7 + %l6],	%o3
	set	0x50, %l2
	stda	%l2,	[%l7 + %l2] 0x88
	fpadd16	%f22,	%f28,	%f26
	or	%g3,	%l4,	%g2
	add	%i3,	%o1,	%g1
	nop
	set	0x18, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x48, %o0
	ldstub	[%l7 + %o0],	%i2
	nop
	set	0x34, %g2
	stw	%o2,	[%l7 + %g2]
	nop
	set	0x38, %i5
	stx	%fsr,	[%l7 + %i5]
	ld	[%l7 + 0x44],	%f14
	nop
	set	0x10, %g1
	swap	[%l7 + %g1],	%l0
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%o4
	set	0x10, %i6
	prefetcha	[%l7 + %i6] 0x88,	 3
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x88,	%i6
	st	%f22,	[%l7 + 0x68]
	nop
	set	0x50, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x20, %o6
	stba	%l5,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x58, %i7
	std	%f14,	[%l7 + %i7]
	nop
	set	0x0C, %g4
	ldstub	[%l7 + %g4],	%i5
	set	0x58, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0
	nop
	set	0x62, %g5
	ldsh	[%l7 + %g5],	%l3
	or	%o6,	%o7,	%g6
	set	0x6B, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i4
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x81,	%o0
	set	0x48, %i3
	prefetcha	[%l7 + %i3] 0x80,	 2
	nop
	set	0x20, %i2
	std	%f4,	[%l7 + %i2]
	set	0x10, %i0
	stda	%g6,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x38, %o4
	sta	%f3,	[%l7 + %o4] 0x88
	or	%i6,	%g5,	%i0
	set	0x38, %o2
	stda	%o4,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x30, %l5
	stxa	%o3,	[%l7 + %l5] 0x80
	nop
	set	0x48, %l0
	stx	%l2,	[%l7 + %l0]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f16
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x88,	%g3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd0
	st	%f3,	[%l7 + 0x2C]
	and	%g2,	%i3,	%o1
	nop
	set	0x2C, %i4
	ldub	[%l7 + %i4],	%g1
	nop
	set	0x19, %i1
	ldsb	[%l7 + %i1],	%i2
	set	0x40, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	set	0x50, %l2
	stwa	%l0,	[%l7 + %l2] 0x81
	nop
	set	0x58, %o7
	stx	%l1,	[%l7 + %o7]
	set	0x50, %o0
	stxa	%o5,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x28, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x6A, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l5
	set	0x50, %l4
	stha	%i5,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x74, %i6
	stba	%i7,	[%l7 + %i6] 0x81
	st	%f0,	[%l7 + 0x68]
	nop
	set	0x14, %o3
	lduw	[%l7 + %o3],	%g4
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x81,	%l3
	nop
	set	0x48, %l1
	swap	[%l7 + %l1],	%o7
	nop
	set	0x64, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x5C, %g4
	stwa	%g6,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x5E, %i7
	ldsh	[%l7 + %i7],	%o6
	nop
	set	0x24, %g5
	swap	[%l7 + %g5],	%i4
	nop
	set	0x26, %l3
	lduh	[%l7 + %l3],	%o0
	nop
	set	0x43, %g7
	stb	%i1,	[%l7 + %g7]
	and	%i6,	%g5,	%g7
	set	0x38, %o5
	prefetcha	[%l7 + %o5] 0x80,	 1
	nop
	set	0x3C, %i2
	swap	[%l7 + %i2],	%o3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%g3
	ld	[%l7 + 0x08],	%f1
	set	0x28, %i3
	stxa	%l6,	[%l7 + %i3] 0x81
	nop
	set	0x68, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x68, %o2
	prefetch	[%l7 + %o2],	 2
	set	0x18, %i0
	stxa	%l4,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x2C, %l0
	swapa	[%l7 + %l0] 0x80,	%i0
	nop
	set	0x30, %o1
	sth	%i3,	[%l7 + %o1]
	wr	%o1,	%g2,	%softint
	or	%g1,	%i2,	%o2
	nop
	set	0x46, %g6
	ldsb	[%l7 + %g6],	%l1
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xeb,	%l0
	set	0x08, %g3
	stda	%l4,	[%l7 + %g3] 0x81
	nop
	set	0x2E, %i4
	sth	%o5,	[%l7 + %i4]
	set	0x08, %i1
	stda	%i4,	[%l7 + %i1] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x6C]
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xeb,	%g4
	wr	%l3,	%o7,	%y
	nop
	set	0x60, %l2
	lduw	[%l7 + %l2],	%i7
	nop
	set	0x0F, %o0
	ldsb	[%l7 + %o0],	%g6
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xe3,	%o6
	set	0x20, %g2
	ldxa	[%l7 + %g2] 0x88,	%i4
	set	0x48, %l4
	prefetcha	[%l7 + %l4] 0x81,	 4
	nop
	set	0x3C, %i5
	lduh	[%l7 + %i5],	%i6
	nop
	set	0x68, %i6
	ldstub	[%l7 + %i6],	%i1
	st	%f12,	[%l7 + 0x34]
	nop
	set	0x38, %o3
	stx	%g7,	[%l7 + %o3]
	nop
	set	0x78, %l1
	stw	%g5,	[%l7 + %l1]
	nop
	set	0x70, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x20, %g4
	stb	%o3,	[%l7 + %g4]
	set	0x64, %g1
	stha	%l2,	[%l7 + %g1] 0x81
	set	0x70, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g3
	set	0x38, %g5
	stxa	%l6,	[%l7 + %g5] 0x88
	nop
	set	0x60, %g7
	ldub	[%l7 + %g7],	%l4
	nop
	set	0x3A, %o5
	sth	%i0,	[%l7 + %o5]
	set	0x40, %i2
	ldxa	[%l7 + %i2] 0x81,	%o4
	st	%fsr,	[%l7 + 0x54]
	or	%i3,	%o1,	%g2
	nop
	set	0x48, %i3
	stx	%g1,	[%l7 + %i3]
	set	0x3C, %o4
	lda	[%l7 + %o4] 0x89,	%f28
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd2,	%f0
	set	0x38, %i0
	stxa	%i2,	[%l7 + %i0] 0x81
	set	0x68, %l3
	stda	%o2,	[%l7 + %l3] 0x81
	nop
	set	0x42, %l0
	stb	%l0,	[%l7 + %l0]
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x89,	 0
	nop
	set	0x14, %o1
	stw	%o5,	[%l7 + %o1]
	nop
	set	0x78, %l5
	swap	[%l7 + %l5],	%l1
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf0
	membar	#Sync
	and	%g4,	%l3,	%i5
	nop
	set	0x0D, %i4
	ldsb	[%l7 + %i4],	%o7
	set	0x3E, %l6
	stha	%g6,	[%l7 + %l6] 0x80
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%i4
	nop
	set	0x14, %l2
	swap	[%l7 + %l2],	%o6
	nop
	set	0x20, %i1
	std	%f10,	[%l7 + %i1]
	nop
	set	0x4E, %o0
	ldub	[%l7 + %o0],	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%g7
	be,pn	%icc,	loop_147
	nop
	set	0x74, %g2
	ldsw	[%l7 + %g2],	%i1
	nop
	set	0x1A, %l4
	ldsb	[%l7 + %l4],	%o3
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x88,	%l2
loop_147:
	nop
	set	0x28, %o7
	stx	%g5,	[%l7 + %o7]
	set	0x0C, %i6
	lda	[%l7 + %i6] 0x88,	%f19
	set	0x7C, %o3
	swapa	[%l7 + %o3] 0x88,	%g3
	set	0x20, %o6
	lda	[%l7 + %o6] 0x80,	%f7
	st	%fsr,	[%l7 + 0x28]
	st	%f0,	[%l7 + 0x24]
	nop
	set	0x18, %l1
	sth	%l4,	[%l7 + %l1]
	nop
	set	0x4E, %g4
	ldub	[%l7 + %g4],	%i0
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x81,	 0
	nop
	set	0x48, %g5
	stx	%l6,	[%l7 + %g5]
	nop
	set	0x22, %i7
	ldsh	[%l7 + %i7],	%o1
	nop
	set	0x70, %o5
	std	%g2,	[%l7 + %o5]
	nop
	set	0x68, %i2
	std	%g0,	[%l7 + %i2]
	nop
	set	0x78, %g7
	ldsw	[%l7 + %g7],	%i2
	set	0x5E, %o4
	stba	%i3,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x74, %o2
	stha	%l0,	[%l7 + %o2] 0xe2
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%o5
	bleu,pt	%icc,	loop_148
	nop
	set	0x70, %i0
	std	%f16,	[%l7 + %i0]
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%o2
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x89,	%l0
loop_148:
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x7C, %i3
	swap	[%l7 + %i3],	%l3
	set	0x6C, %o1
	swapa	[%l7 + %o1] 0x88,	%i5
	ld	[%l7 + 0x44],	%f16
	nop
	set	0x55, %l5
	ldsb	[%l7 + %l5],	%g4
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%f2
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd2,	%f16
	nop
	set	0x7A, %l6
	ldsh	[%l7 + %l6],	%o7
	set	0x50, %l2
	ldxa	[%l7 + %l2] 0x88,	%i7
	nop
	set	0x40, %i1
	stx	%g6,	[%l7 + %i1]
	nop
	set	0x74, %i4
	lduw	[%l7 + %i4],	%i4
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%o0
	nop
	set	0x32, %l4
	ldstub	[%l7 + %l4],	%o6
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd8
	set	0x76, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%i1
	nop
	set	0x10, %i6
	swap	[%l7 + %i6],	%l2
	nop
	set	0x13, %o3
	ldstub	[%l7 + %o3],	%g5
	nop
	set	0x78, %o7
	lduw	[%l7 + %o7],	%g3
	fpadd16s	%f22,	%f18,	%f13
	set	0x33, %o6
	stba	%o3,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x0A, %l1
	ldub	[%l7 + %l1],	%l4
	set	0x64, %g4
	sta	%f25,	[%l7 + %g4] 0x80
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%o4
	set	0x58, %g5
	stxa	%l6,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x42, %i2
	ldsh	[%l7 + %i2],	%i0
	bl,a	%xcc,	loop_149
	nop
	set	0x63, %g7
	ldub	[%l7 + %g7],	%o1
	nop
	set	0x58, %o4
	std	%f22,	[%l7 + %o4]
	nop
	set	0x68, %o2
	stx	%g1,	[%l7 + %o2]
loop_149:
	nop
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x80,	 3
	ble,pt	%xcc,	loop_150
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x74, %l3
	swap	[%l7 + %l3],	%i2
	nop
	set	0x1C, %l0
	ldsh	[%l7 + %l0],	%l0
loop_150:
	nop
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xda
	ld	[%l7 + 0x40],	%f21
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%o5
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f4
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i2
	ble,pn	%icc,	loop_151
	nop
	set	0x4C, %g6
	lduw	[%l7 + %g6],	%o2
	nop
	set	0x24, %g3
	ldsw	[%l7 + %g3],	%l1
	nop
	set	0x70, %l6
	std	%f30,	[%l7 + %l6]
loop_151:
	nop
	set	0x56, %o1
	stha	%l3,	[%l7 + %o1] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f16
	or	%g4,	%o7,	%i5
	nop
	set	0x38, %i4
	stw	%g6,	[%l7 + %i4]
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x80,	 2
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x80,	 2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd8
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%o6
	set	0x54, %o3
	stwa	%i6,	[%l7 + %o3] 0x80
	nop
	set	0x62, %o7
	ldsh	[%l7 + %o7],	%g7
	nop
	set	0x3E, %i6
	sth	%i1,	[%l7 + %i6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0A1, 	%tick_cmpr
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%i6
	nop
	set	0x58, %o6
	lduw	[%l7 + %o6],	%o3
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%l4
	st	%fsr,	[%l7 + 0x0C]
	add	%o4,	%g3,	%i0
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f2
	set	0x30, %i7
	stxa	%o1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x48, %i2
	ldub	[%l7 + %i2],	%l6
	nop
	set	0x40, %g7
	std	%g2,	[%l7 + %g7]
	ld	[%l7 + 0x70],	%f18
	ld	[%l7 + 0x70],	%f14
	nop
	set	0x18, %o4
	std	%f16,	[%l7 + %o4]
	wr	%g1,	%i2,	%ccr
	set	0x08, %g5
	stda	%l0,	[%l7 + %g5] 0xe3
	membar	#Sync
	st	%f28,	[%l7 + 0x4C]
	wr	%l5,	%i3,	%sys_tick
	set	0x50, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o5
	nop
	set	0x78, %i0
	swap	[%l7 + %i0],	%l1
	and	%o2,	%l3,	%g4
	bge,a	%icc,	loop_152
	nop
	set	0x5E, %l0
	sth	%i5,	[%l7 + %l0]
	nop
	set	0x10, %l3
	std	%f12,	[%l7 + %l3]
	nop
	set	0x30, %i3
	swap	[%l7 + %i3],	%g6
loop_152:
	nop
	set	0x40, %l5
	std	%i4,	[%l7 + %l5]
	nop
	set	0x49, %g6
	ldsb	[%l7 + %g6],	%o7
	nop
	set	0x4C, %o5
	sth	%o0,	[%l7 + %o5]
	nop
	set	0x40, %l6
	std	%f6,	[%l7 + %l6]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o6
	nop
	set	0x54, %g3
	ldub	[%l7 + %g3],	%g7
	and	%i1,	%l2,	%g5
	set	0x78, %o1
	stwa	%o3,	[%l7 + %o1] 0x88
	nop
	set	0x3D, %i4
	stb	%l4,	[%l7 + %i4]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f16
	set	0x78, %g2
	sta	%f7,	[%l7 + %g2] 0x88
	nop
	set	0x78, %l2
	stx	%o4,	[%l7 + %l2]
	set	0x38, %i5
	stda	%g2,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x81,	%f16
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf0
	membar	#Sync
	or	%i7,	%i0,	%l6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%g1
	or	%g2,	%i2,	%l5
	nop
	set	0x58, %o7
	stw	%i3,	[%l7 + %o7]
	nop
	set	0x1C, %o3
	ldsh	[%l7 + %o3],	%l0
	nop
	set	0x42, %i6
	sth	%l1,	[%l7 + %i6]
	nop
	set	0x48, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%o2
	set	0x4E, %g1
	stha	%o5,	[%l7 + %g1] 0xe2
	membar	#Sync
	and	%g4,	%i5,	%g6
	or	%l3,	%o7,	%o0
	nop
	set	0x38, %g4
	std	%f30,	[%l7 + %g4]
	and	%i4,	%o6,	%i6
	nop
	set	0x28, %i7
	lduw	[%l7 + %i7],	%g7
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x08, %i2
	swap	[%l7 + %i2],	%i1
	set	0x60, %g7
	stda	%g4,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd8,	%f16
	nop
	set	0x12, %o2
	ldsb	[%l7 + %o2],	%l2
	and	%o3,	%l4,	%g3
	nop
	set	0x70, %i0
	std	%i6,	[%l7 + %i0]
	fpsub32s	%f25,	%f19,	%f5
	set	0x50, %l0
	ldda	[%l7 + %l0] 0xeb,	%i0
	st	%fsr,	[%l7 + 0x24]
	set	0x61, %o4
	stba	%o4,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	ld	[%l7 + 0x70],	%f20
	add	%o1,	%l6,	%g2
	set	0x2A, %l5
	stba	%g1,	[%l7 + %l5] 0x88
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x88,	%l5
	nop
	set	0x08, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x7C, %l6
	ldsw	[%l7 + %l6],	%i2
	nop
	set	0x08, %o5
	std	%f28,	[%l7 + %o5]
	set	0x50, %g3
	swapa	[%l7 + %g3] 0x88,	%i3
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%l0
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%o2
	nop
	set	0x4E, %g2
	ldstub	[%l7 + %g2],	%l1
	wr	%o5,	%g4,	%clear_softint
	nop
	set	0x72, %i1
	sth	%i5,	[%l7 + %i1]
	set	0x54, %i5
	ldstuba	[%l7 + %i5] 0x88,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%o0
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x80,	 1
	nop
	set	0x7A, %l4
	lduh	[%l7 + %l4],	%i4
	nop
	set	0x1B, %l2
	ldub	[%l7 + %l2],	%i6
	nop
	set	0x30, %o3
	stw	%o6,	[%l7 + %o3]
	wr 	%g0, 	0x5, 	%fprs
	set	0x48, %o7
	stda	%l2,	[%l7 + %o7] 0x81
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%o2
	fpsub16	%f28,	%f18,	%f8
	set	0x5B, %o6
	stba	%l4,	[%l7 + %o6] 0x81
	nop
	set	0x48, %g1
	std	%f10,	[%l7 + %g1]
	nop
	set	0x78, %l1
	stx	%g5,	[%l7 + %l1]
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x81,	%g2
	set	0x44, %g4
	stwa	%i7,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x78, %i2
	lduw	[%l7 + %i2],	%i0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%l6
	nop
	set	0x65, %g5
	ldsb	[%l7 + %g5],	%o4
	nop
	set	0x7E, %o2
	sth	%g1,	[%l7 + %o2]
	nop
	set	0x30, %i0
	stx	%g2,	[%l7 + %i0]
	set	0x48, %g7
	stha	%l5,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x7A, %o4
	ldstuba	[%l7 + %o4] 0x88,	%i3
	and	%l0,	%i2,	%o2
	bl,a,pn	%xcc,	loop_153
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x40, %l0
	swap	[%l7 + %l0],	%o5
	nop
	set	0x70, %g6
	std	%f8,	[%l7 + %g6]
loop_153:
	nop
	set	0x30, %l5
	ldsh	[%l7 + %l5],	%l1
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%g4
	bgu	%xcc,	loop_154
	ble	%icc,	loop_155
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%l2
	add	%i5,	%g6,	%o7
loop_154:
	nop
	set	0x70, %g3
	stb	%o0,	[%l7 + %g3]
loop_155:
	nop
	set	0x48, %l6
	std	%f12,	[%l7 + %l6]
	nop
	set	0x18, %i4
	std	%f4,	[%l7 + %i4]
	set	0x48, %o1
	stwa	%i4,	[%l7 + %o1] 0xe2
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%g7
	nop
	set	0x74, %g2
	sth	%i6,	[%l7 + %g2]
	nop
	set	0x10, %i5
	ldsh	[%l7 + %i5],	%i1
	set	0x4C, %i1
	sta	%f25,	[%l7 + %i1] 0x80
	nop
	set	0x6E, %l4
	ldsb	[%l7 + %l4],	%o3
	nop
	set	0x18, %l2
	sth	%l4,	[%l7 + %l2]
	set	0x2C, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g5
	add	%g3,	%i7,	%i0
	nop
	set	0x7E, %o7
	ldub	[%l7 + %o7],	%o1
	nop
	set	0x42, %i6
	stb	%l6,	[%l7 + %i6]
	fpsub16s	%f6,	%f8,	%f9
	fpadd16s	%f25,	%f23,	%f18
	set	0x24, %o6
	sta	%f8,	[%l7 + %o6] 0x81
	set	0x48, %o3
	stxa	%o4,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x7C, %g1
	lduw	[%l7 + %g1],	%l2
	and	%g2,	%l5,	%g1
	nop
	set	0x40, %l1
	stw	%l0,	[%l7 + %l1]
	nop
	set	0x30, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x30, %i2
	stxa	%i2,	[%l7 + %i2] 0xea
	membar	#Sync
	ld	[%l7 + 0x74],	%f4
	set	0x10, %i7
	stda	%i2,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xda
	nop
	set	0x72, %g5
	ldsh	[%l7 + %g5],	%o2
	set	0x74, %g7
	swapa	[%l7 + %g7] 0x88,	%o5
	nop
	set	0x28, %i0
	swap	[%l7 + %i0],	%g4
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xda
	nop
	set	0x30, %l0
	std	%f20,	[%l7 + %l0]
	be,a,pn	%xcc,	loop_156
	or	%l3,	%l1,	%g6
	and	%o7,	%o0,	%i5
	nop
	set	0x34, %l3
	lduw	[%l7 + %l3],	%i4
loop_156:
	nop
	set	0x08, %l5
	swapa	[%l7 + %l5] 0x88,	%g7
	bge,a	%xcc,	loop_157
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%i6
	nop
	set	0x1C, %o5
	sth	%o6,	[%l7 + %o5]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd8
loop_157:
	nop
	set	0x6C, %g3
	stw	%o3,	[%l7 + %g3]
	set	0x08, %i4
	stwa	%l4,	[%l7 + %i4] 0x81
	st	%f24,	[%l7 + 0x60]
	set	0x24, %o1
	sta	%f1,	[%l7 + %o1] 0x88
	wr	%i1,	%g3,	%clear_softint
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x88,	%g5
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xda
	set	0x18, %i1
	prefetcha	[%l7 + %i1] 0x80,	 2
	set	0x60, %i5
	stxa	%i0,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%o1
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x80,	%l6
	set	0x48, %o0
	swapa	[%l7 + %o0] 0x81,	%o4
	and	%g2,	%l5,	%l2
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
	nop
	set	0x76, %o7
	lduh	[%l7 + %o7],	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%o2
	set	0x64, %o3
	lda	[%l7 + %o3] 0x89,	%f5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%g4
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%l3
	set	0x40, %l1
	ldxa	[%l7 + %l1] 0x80,	%l1
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x81,	%g6
	set	0x78, %g1
	stxa	%o7,	[%l7 + %g1] 0x80
	set	0x6C, %i2
	stwa	%o5,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x0C, %o2
	lda	[%l7 + %o2] 0x89,	%f24
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i4
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x89,	%i5
	nop
	set	0x08, %i0
	stx	%i6,	[%l7 + %i0]
	fpadd32	%f24,	%f6,	%f16
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf8
	membar	#Sync
	nop
	set	0x2F, %l0
	stb	%g7,	[%l7 + %l0]
	nop
	set	0x1C, %l3
	ldub	[%l7 + %l3],	%o3
	set	0x72, %l5
	stha	%l4,	[%l7 + %l5] 0x81
	set	0x4C, %g7
	stwa	%i1,	[%l7 + %g7] 0x88
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%g2
	nop
	set	0x5A, %i3
	sth	%o6,	[%l7 + %i3]
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x89,	%i6
	set	0x08, %i4
	stxa	%g5,	[%l7 + %i4] 0x81
	and	%o1,	%i0,	%o4
	nop
	set	0x10, %g3
	std	%f14,	[%l7 + %g3]
	or	%g2,	%l5,	%l6
	nop
	set	0x36, %l6
	lduh	[%l7 + %l6],	%l2
	nop
	set	0x38, %o1
	stw	%l0,	[%l7 + %o1]
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%i3
	nop
	set	0x08, %i1
	stx	%i2,	[%l7 + %i1]
	nop
	set	0x60, %l2
	sth	%g1,	[%l7 + %l2]
	nop
	set	0x7E, %l4
	ldsb	[%l7 + %l4],	%o2
	fpadd16	%f26,	%f16,	%f22
	st	%fsr,	[%l7 + 0x4C]
	set	0x54, %o0
	ldstuba	[%l7 + %o0] 0x81,	%l3
	and	%l1,	%g6,	%g4
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc8
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x81,	%o6
	ld	[%l7 + 0x44],	%f25
	nop
	set	0x5C, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%f26
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%o0
	nop
	set	0x70, %o6
	stw	%o5,	[%l7 + %o6]
	set	0x5F, %g1
	stba	%i4,	[%l7 + %g1] 0x80
	ld	[%l7 + 0x28],	%f10
	add	%i6,	%i5,	%o3
	nop
	set	0x4A, %i2
	ldub	[%l7 + %i2],	%g7
	nop
	set	0x2F, %o2
	ldsb	[%l7 + %o2],	%i1
	set	0x7C, %i7
	stwa	%g3,	[%l7 + %i7] 0x88
	nop
	set	0x18, %g4
	sth	%o6,	[%l7 + %g4]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	wr	%i7,	%l4,	%sys_tick
	or	%g5,	%o1,	%o4
	or	%i0,	%l5,	%g2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%l6
	set	0x14, %i0
	sta	%f1,	[%l7 + %i0] 0x89
	or	%l0,	%i3,	%g1
	or	%i2,	%l3,	%o2
	nop
	set	0x0C, %o4
	ldsh	[%l7 + %o4],	%g6
	wr	%l1,	%o7,	%clear_softint
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f12
	st	%f12,	[%l7 + 0x0C]
	bl,a,pn	%icc,	loop_158
	nop
	set	0x5A, %l5
	ldsh	[%l7 + %l5],	%o0
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%o4
	nop
	set	0x4C, %o5
	stw	%i4,	[%l7 + %o5]
loop_158:
	nop
	set	0x78, %i3
	std	%g4,	[%l7 + %i3]
	set	0x7C, %g7
	stba	%i5,	[%l7 + %g7] 0x80
	fpadd32	%f20,	%f2,	%f4
	set	0x10, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i6
	fpadd16	%f20,	%f16,	%f16
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%o3
	nop
	set	0x18, %g6
	stx	%g3,	[%l7 + %g6]
	nop
	set	0x54, %l6
	lduw	[%l7 + %l6],	%i1
	nop
	set	0x70, %o1
	stx	%o6,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x30]
	set	0x5C, %g2
	swapa	[%l7 + %g2] 0x88,	%l4
	set	0x0A, %g3
	stha	%i7,	[%l7 + %g3] 0x88
	and	%o1,	%g5,	%o4
	nop
	set	0x0F, %l2
	ldstub	[%l7 + %l2],	%i0
	nop
	set	0x3A, %l4
	ldub	[%l7 + %l4],	%g2
	st	%f8,	[%l7 + 0x10]
	nop
	set	0x70, %o0
	stx	%l2,	[%l7 + %o0]
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x81,	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i3
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%l0
	nop
	set	0x6D, %i5
	ldub	[%l7 + %i5],	%g1
	nop
	set	0x38, %o3
	std	%f8,	[%l7 + %o3]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%o2
	nop
	set	0x60, %o7
	sth	%g6,	[%l7 + %o7]
	nop
	set	0x60, %l1
	stx	%i2,	[%l7 + %l1]
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%o7
	nop
	set	0x2B, %g1
	ldstub	[%l7 + %g1],	%o0
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf0
	membar	#Sync
	set	0x3C, %i7
	sta	%f30,	[%l7 + %i7] 0x88
	ld	[%l7 + 0x4C],	%f10
	nop
	set	0x48, %g4
	std	%f14,	[%l7 + %g4]
	nop
	set	0x67, %i2
	stb	%l1,	[%l7 + %i2]
	nop
	set	0x51, %i0
	ldub	[%l7 + %i0],	%i4
	set	0x34, %o4
	lda	[%l7 + %o4] 0x80,	%f28
	set	0x20, %g5
	stxa	%o5,	[%l7 + %g5] 0x81
	nop
	set	0x56, %l5
	ldsh	[%l7 + %l5],	%g4
	add	%i5,	%g7,	%o3
	ld	[%l7 + 0x40],	%f13
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%i6
	set	0x30, %l3
	lda	[%l7 + %l3] 0x88,	%f12
	st	%f30,	[%l7 + 0x7C]
	bn,a,pt	%xcc,	loop_159
	or	%i1,	%o6,	%l4
	set	0x1C, %i3
	sta	%f16,	[%l7 + %i3] 0x89
loop_159:
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf0
	membar	#Sync
	nop
	set	0x18, %i4
	std	%f24,	[%l7 + %i4]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%f0
	ld	[%l7 + 0x5C],	%f8
	nop
	nop
	setx	0x529535B40B48CEBC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x79CB02E8600256A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f6,	%f6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%i7
	nop
	set	0x36, %g6
	ldsh	[%l7 + %g6],	%g5
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%o4
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x81,	%o0
	nop
	set	0x30, %g2
	ldx	[%l7 + %g2],	%i0
	nop
	set	0x30, %l2
	stx	%g2,	[%l7 + %l2]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%l6
	nop
	set	0x2A, %l4
	sth	%l2,	[%l7 + %l4]
	and	%i3,	%g1,	%l0
	set	0x0C, %o0
	ldstuba	[%l7 + %o0] 0x80,	%l3
	nop
	set	0x53, %i1
	ldub	[%l7 + %i1],	%g6
	ld	[%l7 + 0x14],	%f29
	set	0x44, %i5
	stwa	%o2,	[%l7 + %i5] 0x80
	and	%i2,	%o7,	%o0
	ld	[%l7 + 0x30],	%f13
	st	%fsr,	[%l7 + 0x1C]
	set	0x10, %i6
	stda	%i4,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x70, %o7
	stda	%o4,	[%l7 + %o7] 0x89
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f0
	nop
	set	0x64, %o6
	ldsb	[%l7 + %o6],	%l1
	nop
	set	0x60, %l1
	ldsh	[%l7 + %l1],	%g4
	add	%g7,	%o3,	%i5
	nop
	set	0x28, %o2
	stx	%i1,	[%l7 + %o2]
	nop
	set	0x5E, %i7
	stb	%i6,	[%l7 + %i7]
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%l4
	nop
	set	0x1C, %g4
	lduw	[%l7 + %g4],	%g3
	nop
	set	0x30, %i0
	std	%i6,	[%l7 + %i0]
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f0
	set	0x7C, %i2
	sta	%f12,	[%l7 + %i2] 0x89
	nop
	set	0x28, %l5
	ldsb	[%l7 + %l5],	%g5
	nop
	set	0x7A, %l0
	lduh	[%l7 + %l0],	%o6
	ld	[%l7 + 0x74],	%f17
	nop
	set	0x20, %l3
	stx	%o4,	[%l7 + %l3]
	set	0x7C, %g5
	stwa	%i0,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%g2
	set	0x43, %g7
	ldstuba	[%l7 + %g7] 0x80,	%l5
	nop
	set	0x08, %i4
	prefetch	[%l7 + %i4],	 2
	set	0x68, %l6
	stxa	%l6,	[%l7 + %l6] 0x81
	nop
	set	0x5C, %g6
	lduh	[%l7 + %g6],	%o1
	and	%i3,	%l2,	%l0
	nop
	set	0x6E, %o5
	stb	%g1,	[%l7 + %o5]
	nop
	set	0x40, %g3
	std	%l2,	[%l7 + %g3]
	ld	[%l7 + 0x44],	%f28
	set	0x78, %o1
	stwa	%o2,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%g6
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%o6
	bne,pn	%icc,	loop_160
	nop
	set	0x54, %o0
	swap	[%l7 + %o0],	%i2
	set	0x58, %i1
	stxa	%o0,	[%l7 + %i1] 0xe2
	membar	#Sync
loop_160:
	nop
	set	0x67, %i5
	stb	%i4,	[%l7 + %i5]
	nop
	set	0x40, %i6
	stx	%o5,	[%l7 + %i6]
	nop
	set	0x48, %o7
	lduw	[%l7 + %o7],	%g4
	set	0x34, %g2
	swapa	[%l7 + %g2] 0x89,	%l1
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd0
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xda
	fpadd32	%f24,	%f26,	%f6
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%g6
	set	0x70, %o2
	stxa	%i5,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x5A, %g1
	ldstuba	[%l7 + %g1] 0x80,	%o3
	nop
	set	0x40, %g4
	ldsh	[%l7 + %g4],	%i6
	nop
	set	0x34, %i7
	swap	[%l7 + %i7],	%i1
	nop
	set	0x58, %i0
	std	%l4,	[%l7 + %i0]
	nop
	set	0x7C, %i2
	lduw	[%l7 + %i2],	%g3
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xe2,	%i6
	nop
	set	0x64, %l5
	lduw	[%l7 + %l5],	%o6
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%o4
	nop
	set	0x28, %g5
	ldsb	[%l7 + %g5],	%i0
	bleu,pt	%icc,	loop_161
	nop
	set	0x44, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x78, %g7
	lduw	[%l7 + %g7],	%g5
	nop
	set	0x57, %i4
	ldub	[%l7 + %i4],	%l5
loop_161:
	nop
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x88,	%g2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f0
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%i6
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x80,	%o1
	or	%l2,	%l0,	%i3
	st	%f4,	[%l7 + 0x44]
	set	0x50, %l6
	lda	[%l7 + %l6] 0x89,	%f24
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%g1
	ld	[%l7 + 0x74],	%f11
	ld	[%l7 + 0x74],	%f26
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%l3
	set	0x30, %o0
	stxa	%o2,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x50, %o1
	stda	%g6,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x3C, %i1
	sth	%i2,	[%l7 + %i1]
	set	0x20, %i6
	stda	%o6,	[%l7 + %i6] 0xe2
	membar	#Sync
	or	%i4,	%o5,	%g4
	nop
	set	0x20, %o7
	sth	%o0,	[%l7 + %o7]
	nop
	set	0x30, %g2
	std	%f24,	[%l7 + %g2]
	nop
	set	0x5C, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xda
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f24
	nop
	set	0x44, %o2
	ldsw	[%l7 + %o2],	%g7
	wr	%l1,	%i5,	%softint
	nop
	set	0x30, %g1
	sth	%i6,	[%l7 + %g1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD61, 	%tick_cmpr
	set	0x50, %g4
	stwa	%g3,	[%l7 + %g4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x20, %i7
	ldx	[%l7 + %i7],	%l4
	add	%o6,	%i7,	%o4
	set	0x6B, %i0
	stba	%i0,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x2A, %i2
	ldstub	[%l7 + %i2],	%g5
	nop
	set	0x10, %o6
	stw	%g2,	[%l7 + %o6]
	nop
	set	0x50, %o4
	swap	[%l7 + %o4],	%l6
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%o1
	set	0x60, %g5
	stda	%l4,	[%l7 + %g5] 0x80
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x80,	%l2
	nop
	set	0x10, %l5
	std	%i2,	[%l7 + %l5]
	nop
	set	0x67, %i4
	ldub	[%l7 + %i4],	%g1
	st	%fsr,	[%l7 + 0x7C]
	set	0x40, %l0
	stxa	%l0,	[%l7 + %l0] 0x81
	and	%o2,	%l3,	%i2
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x88
	set	0x10, %o5
	prefetcha	[%l7 + %o5] 0x88,	 2
	set	0x54, %g6
	stha	%i4,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x30, %l6
	stda	%o4,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x64, %l2
	swap	[%l7 + %l2],	%g6
	set	0x58, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o0
	or	%g7,	%g4,	%i5
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%l0
	nop
	set	0x18, %o1
	stx	%i1,	[%l7 + %o1]
	and	%o3,	%i6,	%g3
	set	0x60, %i1
	ldxa	[%l7 + %i1] 0x88,	%l4
	st	%f30,	[%l7 + 0x50]
	set	0x30, %i6
	stwa	%i7,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x18, %o7
	stx	%o6,	[%l7 + %o7]
	set	0x0A, %o0
	stha	%i0,	[%l7 + %o0] 0xea
	membar	#Sync
	or	%o4,	%g5,	%l6
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x0C, %g2
	stw	%g2,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x70]
	bn,a,pt	%xcc,	loop_162
	st	%fsr,	[%l7 + 0x58]
	set	0x6F, %i5
	ldstuba	[%l7 + %i5] 0x88,	%l5
loop_162:
	ba,a,pn	%xcc,	loop_163
	nop
	set	0x59, %o3
	stb	%o1,	[%l7 + %o3]
	nop
	set	0x11, %o2
	ldstub	[%l7 + %o2],	%i3
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
loop_163:
	and	%g1,	%l0,	%l2
	nop
	set	0x74, %g4
	ldub	[%l7 + %g4],	%o2
	nop
	set	0x48, %i7
	std	%i2,	[%l7 + %i7]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%i4
	set	0x64, %l1
	sta	%f5,	[%l7 + %l1] 0x88
	nop
	set	0x08, %i2
	ldx	[%l7 + %i2],	%o0
	set	0x1F, %i0
	stba	%g7,	[%l7 + %i0] 0x88
	set	0x6D, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g6
	nop
	set	0x17, %o4
	stb	%g4,	[%l7 + %o4]
	nop
	set	0x24, %l3
	ldstub	[%l7 + %l3],	%i5
	nop
	set	0x44, %i3
	ldsw	[%l7 + %i3],	%l1
	st	%f8,	[%l7 + 0x7C]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%o3
	nop
	set	0x18, %g5
	stx	%g3,	[%l7 + %g5]
	or	%i6,	%l4,	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o6
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%f6
	nop
	set	0x30, %i4
	std	%g4,	[%l7 + %i4]
	fpadd16	%f12,	%f12,	%f30
	or	%o4,	%l6,	%g2
	set	0x46, %g7
	stha	%l5,	[%l7 + %g7] 0x89
	set	0x64, %o5
	stwa	%o1,	[%l7 + %o5] 0xe3
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%l0
	nop
	set	0x2E, %g6
	lduh	[%l7 + %g6],	%i3
	nop
	set	0x54, %l0
	stw	%o2,	[%l7 + %l0]
	nop
	set	0x1E, %l6
	lduh	[%l7 + %l6],	%i2
	set	0x50, %l4
	stda	%l2,	[%l7 + %l4] 0x88
	set	0x30, %g3
	stda	%o6,	[%l7 + %g3] 0xeb
	membar	#Sync
	or	%o5,	%i4,	%o0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%g6
	set	0x44, %l2
	sta	%f20,	[%l7 + %l2] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%g4
	nop
	set	0x70, %i1
	std	%f14,	[%l7 + %i1]
	or	%l3,	%l1,	%i1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%g3
	ld	[%l7 + 0x74],	%f25
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%l4
	nop
	set	0x17, %o7
	stb	%o3,	[%l7 + %o7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%i7
	nop
	set	0x70, %i6
	prefetch	[%l7 + %i6],	 3
	nop
	set	0x34, %o0
	lduw	[%l7 + %o0],	%o6
	nop
	set	0x2E, %g2
	ldsh	[%l7 + %g2],	%g5
	add	%l6,	%g2,	%o4
	nop
	set	0x57, %o3
	ldub	[%l7 + %o3],	%o1
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x89,	%l4
	set	0x28, %g1
	stwa	%l0,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f16
	or	%i3,	%g1,	%o2
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%l2
	ld	[%l7 + 0x74],	%f9
	set	0x18, %i2
	sta	%f15,	[%l7 + %i2] 0x89
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%o5
	nop
	set	0x44, %l1
	stw	%o7,	[%l7 + %l1]
	fpadd16	%f6,	%f22,	%f22
	nop
	set	0x5C, %i0
	lduw	[%l7 + %i0],	%o0
	nop
	set	0x70, %o4
	stx	%i4,	[%l7 + %o4]
	set	0x50, %l3
	stxa	%g7,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x2C, %i3
	prefetch	[%l7 + %i3],	 1
	set	0x26, %g5
	stha	%g6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x1C, %o6
	lduw	[%l7 + %o6],	%g4
	set	0x08, %l5
	lda	[%l7 + %l5] 0x88,	%f1
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x81,	%l0
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x50, %g6
	stda	%l2,	[%l7 + %g6] 0x81
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f16
	nop
	set	0x28, %l0
	std	%i0,	[%l7 + %l0]
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%i4
	set	0x38, %l4
	stwa	%g3,	[%l7 + %l4] 0xeb
	membar	#Sync
	and	%i6,	%o3,	%l4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%i7
	st	%f14,	[%l7 + 0x60]
	set	0x7A, %l2
	stha	%g5,	[%l7 + %l2] 0x89
	nop
	set	0x24, %i1
	sth	%l6,	[%l7 + %i1]
	add	%g2,	%o6,	%o4
	nop
	set	0x58, %g3
	stx	%l5,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x78]
	set	0x34, %i6
	sta	%f9,	[%l7 + %i6] 0x80
	fpsub16	%f0,	%f28,	%f2
	nop
	set	0x38, %o7
	std	%o0,	[%l7 + %o7]
	nop
	set	0x68, %g2
	std	%f12,	[%l7 + %g2]
	set	0x10, %o3
	lda	[%l7 + %o3] 0x89,	%f24
	nop
	set	0x60, %i5
	std	%i2,	[%l7 + %i5]
	set	0x74, %o0
	sta	%f23,	[%l7 + %o0] 0x88
	set	0x50, %o2
	stwa	%g1,	[%l7 + %o2] 0x89
	set	0x38, %g1
	stxa	%l0,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%o2
	nop
	set	0x48, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x60, %g4
	stx	%l2,	[%l7 + %g4]
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%o5
	nop
	set	0x58, %o4
	std	%f10,	[%l7 + %o4]
	set	0x58, %l3
	stxa	%i2,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x18, %l1
	stwa	%o7,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x14, %g5
	ldsh	[%l7 + %g5],	%o0
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x89,	 1
	set	0x30, %l5
	stxa	%g6,	[%l7 + %l5] 0x81
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%g4
	nop
	set	0x34, %i3
	swap	[%l7 + %i3],	%l1
	nop
	set	0x24, %g6
	ldsh	[%l7 + %g6],	%l3
	nop
	set	0x28, %i4
	ldsw	[%l7 + %i4],	%i4
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x80,	%i5
	nop
	set	0x2F, %o5
	ldub	[%l7 + %o5],	%i1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%g3
	set	0x40, %l4
	stda	%l4,	[%l7 + %l4] 0xea
	membar	#Sync
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i0
	nop
	set	0x38, %o1
	prefetch	[%l7 + %o1],	 2
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	set	0x63, %g3
	stba	%g5,	[%l7 + %g3] 0x81
	nop
	set	0x71, %i6
	stb	%i7,	[%l7 + %i6]
	set	0x30, %i1
	stda	%g2,	[%l7 + %i1] 0xe3
	membar	#Sync
	ld	[%l7 + 0x58],	%f18
	nop
	set	0x44, %g2
	stb	%l6,	[%l7 + %g2]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%l5
	nop
	set	0x38, %o7
	lduh	[%l7 + %o7],	%o6
	set	0x5C, %i5
	sta	%f15,	[%l7 + %i5] 0x89
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f30
	nop
	set	0x30, %o3
	lduh	[%l7 + %o3],	%i3
	nop
	set	0x30, %g1
	ldsw	[%l7 + %g1],	%g1
	nop
	set	0x34, %i7
	lduw	[%l7 + %i7],	%o1
	fpsub32	%f20,	%f10,	%f8
	nop
	set	0x28, %o2
	stx	%l0,	[%l7 + %o2]
	bge,a,pt	%icc,	loop_164
	nop
	set	0x22, %i2
	lduh	[%l7 + %i2],	%o2
	nop
	set	0x78, %g4
	stx	%o5,	[%l7 + %g4]
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%l2
loop_164:
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x58, %i0
	lduh	[%l7 + %i0],	%g7
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%o0
	nop
	set	0x37, %l3
	ldstub	[%l7 + %l3],	%g6
	set	0x40, %g5
	stwa	%g4,	[%l7 + %g5] 0x88
	nop
	set	0x1C, %o6
	sth	%l1,	[%l7 + %o6]
	set	0x14, %l5
	lda	[%l7 + %l5] 0x88,	%f13
	nop
	set	0x30, %i3
	stx	%l3,	[%l7 + %i3]
	wr	%i5,	%i4,	%ccr
	set	0x60, %g7
	stxa	%i1,	[%l7 + %g7] 0x80
	nop
	set	0x5C, %g6
	ldsh	[%l7 + %g6],	%i6
	nop
	set	0x6F, %l0
	stb	%l4,	[%l7 + %l0]
	set	0x40, %i4
	stwa	%o3,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x34, %o5
	stha	%g3,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%g5
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f2
	nop
	set	0x6C, %l2
	stw	%i0,	[%l7 + %l2]
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%f20
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd2
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x64, %i6
	swap	[%l7 + %i6],	%g2
	set	0x23, %g2
	ldstuba	[%l7 + %g2] 0x89,	%i7
	set	0x22, %i5
	stba	%l6,	[%l7 + %i5] 0x89
	nop
	set	0x50, %o0
	std	%l4,	[%l7 + %o0]
	set	0x0C, %o7
	stwa	%o4,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x2C, %o3
	stwa	%i3,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x20, %g1
	std	%f2,	[%l7 + %g1]
	set	0x28, %o2
	swapa	[%l7 + %o2] 0x88,	%g1
	st	%f4,	[%l7 + 0x20]
	set	0x58, %i2
	stda	%o0,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x7E, %g4
	ldsb	[%l7 + %g4],	%l0
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd8,	%f0
	nop
	set	0x50, %o4
	std	%o6,	[%l7 + %o4]
	set	0x4C, %i0
	stha	%o5,	[%l7 + %i0] 0x89
	set	0x30, %l3
	lda	[%l7 + %l3] 0x89,	%f30
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xda,	%f0
	st	%fsr,	[%l7 + 0x18]
	set	0x20, %o6
	ldxa	[%l7 + %o6] 0x80,	%o2
	nop
	set	0x5C, %l1
	ldstub	[%l7 + %l1],	%l2
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%o6
	nop
	set	0x68, %g7
	ldx	[%l7 + %g7],	%i2
	ld	[%l7 + 0x68],	%f20
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%o0
	nop
	set	0x4C, %i3
	ldstub	[%l7 + %i3],	%g4
	set	0x70, %g6
	stwa	%g6,	[%l7 + %g6] 0x88
	set	0x48, %i4
	stxa	%l3,	[%l7 + %i4] 0x88
	nop
	set	0x11, %l0
	ldub	[%l7 + %l0],	%l1
	set	0x3A, %l4
	stha	%i5,	[%l7 + %l4] 0xe2
	membar	#Sync
	or	%i4,	%i1,	%l4
	nop
	set	0x69, %o1
	ldsb	[%l7 + %o1],	%o3
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%g3
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x60, %l6
	prefetch	[%l7 + %l6],	 2
	nop
	set	0x48, %l2
	ldsw	[%l7 + %l2],	%g2
	nop
	set	0x1D, %g3
	ldstub	[%l7 + %g3],	%i0
	nop
	set	0x28, %i1
	std	%i6,	[%l7 + %i1]
	nop
	set	0x54, %g2
	swap	[%l7 + %g2],	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%i3
	set	0x40, %i5
	stwa	%g1,	[%l7 + %i5] 0x80
	nop
	set	0x47, %o0
	ldub	[%l7 + %o0],	%o1
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%l0
	bg	%xcc,	loop_165
	add	%o4,	%o6,	%o2
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf9
	membar	#Sync
loop_165:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1284
!	Type a   	: 24
!	Type cti   	: 29
!	Type x   	: 528
!	Type f   	: 31
!	Type i   	: 104
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 7 Start
!
.global thread_7
thread_7:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0xA,	%g2
	set	0x1,	%g3
	set	0x5,	%g4
	set	0x6,	%g5
	set	0x3,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x1,	%i1
	set	-0x8,	%i2
	set	-0x3,	%i3
	set	-0x9,	%i4
	set	-0x4,	%i5
	set	-0x2,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x0426F688,	%l0
	set	0x0A45C9ED,	%l1
	set	0x6B844B5B,	%l2
	set	0x6DD1A84A,	%l3
	set	0x791343C0,	%l4
	set	0x6FF5C2E4,	%l5
	set	0x70D05B2E,	%l6
	!# Output registers
	set	-0x1AC7,	%o0
	set	-0x04AD,	%o1
	set	-0x1C9D,	%o2
	set	-0x0143,	%o3
	set	-0x1F7E,	%o4
	set	0x1FBF,	%o5
	set	0x03D1,	%o6
	set	0x0627,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA52B36A3745B7D0F)
	INIT_TH_FP_REG(%l7,%f2,0xF56E0DA3B90577AE)
	INIT_TH_FP_REG(%l7,%f4,0x402D7DAC36E9E004)
	INIT_TH_FP_REG(%l7,%f6,0x3E7BF54684D0E162)
	INIT_TH_FP_REG(%l7,%f8,0x28D8FFEFD3AADC85)
	INIT_TH_FP_REG(%l7,%f10,0xCB7B13CDA6BF8DEA)
	INIT_TH_FP_REG(%l7,%f12,0xFBE4579F62424EC9)
	INIT_TH_FP_REG(%l7,%f14,0x0803BB4F6DA96F25)
	INIT_TH_FP_REG(%l7,%f16,0x8C8CF0668AFE08A2)
	INIT_TH_FP_REG(%l7,%f18,0xA553375C4CDAC316)
	INIT_TH_FP_REG(%l7,%f20,0x08DDCB6D2CEAA72B)
	INIT_TH_FP_REG(%l7,%f22,0x33B2375325954A03)
	INIT_TH_FP_REG(%l7,%f24,0xBE22DBBDCE6BB10C)
	INIT_TH_FP_REG(%l7,%f26,0xD5B7E828433B5701)
	INIT_TH_FP_REG(%l7,%f28,0xEE1A081B36C4A381)
	INIT_TH_FP_REG(%l7,%f30,0xB3D02AD26C75010E)

	!# Execute Main Diag ..

	nop
	set	0x50, %g1
	std	%f18,	[%l7 + %g1]
	nop
	set	0x70, %o7
	stx	%l2,	[%l7 + %o7]
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f26
	nop
	set	0x48, %g4
	swap	[%l7 + %g4],	%o7
	nop
	set	0x1C, %i2
	lduh	[%l7 + %i2],	%i2
	set	0x24, %o4
	lda	[%l7 + %o4] 0x81,	%f28
	nop
	set	0x08, %i7
	std	%g6,	[%l7 + %i7]
	set	0x58, %i0
	stxa	%o5,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x6C, %l3
	sta	%f26,	[%l7 + %l3] 0x80
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%g4
	nop
	set	0x40, %o6
	std	%f26,	[%l7 + %o6]
	nop
	set	0x6C, %l1
	sth	%o0,	[%l7 + %l1]
	nop
	set	0x08, %l5
	stx	%l3,	[%l7 + %l5]
	set	0x1B, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g6
	set	0x58, %i3
	ldxa	[%l7 + %i3] 0x89,	%i5
	nop
	set	0x28, %g6
	std	%l0,	[%l7 + %g6]
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%i4
	nop
	set	0x14, %l0
	lduh	[%l7 + %l0],	%i1
	set	0x50, %l4
	ldda	[%l7 + %l4] 0x89,	%o2
	set	0x78, %o1
	stxa	%l4,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x10, %o5
	stwa	%g5,	[%l7 + %o5] 0x88
	set	0x14, %l6
	stwa	%g3,	[%l7 + %l6] 0x80
	nop
	set	0x20, %g3
	std	%f2,	[%l7 + %g3]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	nop
	set	0x55, %l2
	stb	%g2,	[%l7 + %l2]
	nop
	set	0x10, %g2
	std	%f6,	[%l7 + %g2]
	nop
	set	0x1C, %i5
	stw	%i0,	[%l7 + %i5]
	nop
	set	0x49, %i6
	ldstub	[%l7 + %i6],	%i6
	nop
	set	0x5E, %o3
	lduh	[%l7 + %o3],	%l6
	set	0x30, %g1
	sta	%f11,	[%l7 + %g1] 0x88
	set	0x78, %o0
	stwa	%l5,	[%l7 + %o0] 0x89
	nop
	nop
	setx	0x8AA48281,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x7957EFC0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f4,	%f12
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%i2
	nop
	set	0x48, %g4
	ldsh	[%l7 + %g4],	%i7
	set	0x26, %i2
	stba	%o1,	[%l7 + %i2] 0x80
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%f0
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%l0
	nop
	set	0x10, %i0
	prefetch	[%l7 + %i0],	 0
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x18, %l3
	stx	%o4,	[%l7 + %l3]
	nop
	set	0x38, %i7
	ldsb	[%l7 + %i7],	%g1
	nop
	set	0x48, %g5
	ldstub	[%l7 + %g5],	%o6
	set	0x70, %l1
	stda	%l2,	[%l7 + %l1] 0x80
	bl	%xcc,	loop_166
	nop
	set	0x68, %o6
	stx	%o7,	[%l7 + %o6]
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x80,	%i2
loop_166:
	nop
	set	0x14, %i3
	ldsw	[%l7 + %i3],	%g7
	fpsub16	%f24,	%f10,	%f26
	ba	%icc,	loop_167
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f30
	set	0x20, %i4
	prefetcha	[%l7 + %i4] 0x88,	 1
loop_167:
	nop
	set	0x0B, %g6
	ldsb	[%l7 + %g6],	%g4
	nop
	nop
	setx	0xEC1D77D981923C1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB4CE710F71713128,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f18,	%f20
	set	0x4C, %l0
	stha	%o2,	[%l7 + %l0] 0x80
	nop
	set	0x29, %l4
	stb	%o0,	[%l7 + %l4]
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x89,	 2
	nop
	set	0x54, %o1
	ldsb	[%l7 + %o1],	%l3
	set	0x38, %l6
	swapa	[%l7 + %l6] 0x88,	%i5
	nop
	set	0x30, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x80,	 3
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x81
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x81,	 0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%o3
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%g3
	set	0x1E, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g5
	set	0x50, %o3
	stxa	%i0,	[%l7 + %o3] 0x89
	nop
	set	0x48, %g1
	prefetch	[%l7 + %g1],	 1
	nop
	set	0x2E, %i6
	lduh	[%l7 + %i6],	%g2
	nop
	set	0x28, %o0
	lduw	[%l7 + %o0],	%i6
	st	%f5,	[%l7 + 0x70]
	nop
	set	0x38, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x14, %i2
	ldstub	[%l7 + %i2],	%l6
	nop
	set	0x6A, %o4
	lduh	[%l7 + %o4],	%i3
	and	%i7,	%l5,	%l0
	nop
	set	0x46, %g4
	ldsh	[%l7 + %g4],	%o4
	and	%o1,	%o6,	%l2
	set	0x30, %o7
	sta	%f14,	[%l7 + %o7] 0x88
	nop
	set	0x59, %i0
	ldstub	[%l7 + %i0],	%g1
	bleu	%xcc,	loop_168
	nop
	set	0x70, %l3
	std	%f0,	[%l7 + %l3]
	nop
	set	0x4E, %i7
	lduh	[%l7 + %i7],	%o7
	nop
	set	0x38, %g5
	lduw	[%l7 + %g5],	%g7
loop_168:
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%o4
	ld	[%l7 + 0x38],	%f21
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i2
	nop
	set	0x40, %l1
	std	%o2,	[%l7 + %l1]
	bg	%icc,	loop_169
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f6
	nop
	set	0x60, %i3
	lduh	[%l7 + %i3],	%g4
	set	0x50, %i4
	lda	[%l7 + %i4] 0x89,	%f20
loop_169:
	nop
	set	0x17, %g6
	stba	%g6,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x72, %l4
	stha	%o0,	[%l7 + %l4] 0xeb
	membar	#Sync
	wr	%i5,	%l3,	%clear_softint
	nop
	set	0x30, %o5
	std	%l0,	[%l7 + %o5]
	nop
	set	0x62, %o1
	ldsb	[%l7 + %o1],	%i1
	nop
	set	0x7A, %l6
	ldsh	[%l7 + %l6],	%o3
	set	0x1C, %l0
	swapa	[%l7 + %l0] 0x88,	%i4
	set	0x60, %l2
	stda	%g2,	[%l7 + %l2] 0x81
	wr	%l4,	%g5,	%set_softint
	set	0x14, %g3
	lda	[%l7 + %g3] 0x89,	%f15
	set	0x14, %i5
	stha	%g2,	[%l7 + %i5] 0x89
	nop
	set	0x0C, %g2
	stb	%i6,	[%l7 + %g2]
	set	0x78, %i1
	stda	%i6,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x18, %g1
	std	%f2,	[%l7 + %g1]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%i3
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x28, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x0C, %o0
	sth	%l5,	[%l7 + %o0]
	nop
	set	0x7C, %o2
	stw	%i7,	[%l7 + %o2]
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x88,	%f30
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%o1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%l2
	set	0x1D, %o4
	ldstuba	[%l7 + %o4] 0x89,	%g1
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xe2,	%o6
	set	0x68, %g4
	ldxa	[%l7 + %g4] 0x89,	%g7
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc0
	nop
	set	0x6A, %l3
	ldsh	[%l7 + %l3],	%o5
	set	0x62, %i7
	ldstuba	[%l7 + %i7] 0x81,	%o7
	or	%i2,	%o2,	%g6
	nop
	set	0x47, %o7
	ldsb	[%l7 + %o7],	%g4
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%o0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%l1
	nop
	set	0x38, %l5
	stb	%i1,	[%l7 + %l5]
	set	0x68, %l1
	stda	%o2,	[%l7 + %l1] 0x80
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x80,	%i4
	and	%i4,	%l4,	%g5
	nop
	set	0x22, %i3
	sth	%g2,	[%l7 + %i3]
	nop
	set	0x24, %i4
	prefetch	[%l7 + %i4],	 1
	wr	%i6,	%l6,	%ccr
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x80,	%f16
	nop
	set	0x3C, %g6
	ldsw	[%l7 + %g6],	%i0
	nop
	set	0x50, %l4
	swap	[%l7 + %l4],	%g3
	nop
	set	0x6A, %o5
	sth	%l5,	[%l7 + %o5]
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	bleu	%xcc,	loop_170
	nop
	set	0x66, %o1
	lduh	[%l7 + %o1],	%i7
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%i3
	nop
	set	0x10, %g3
	std	%f2,	[%l7 + %g3]
loop_170:
	nop
	set	0x10, %l2
	std	%l0,	[%l7 + %l2]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x89
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l2
	set	0x4B, %i5
	ldstuba	[%l7 + %i5] 0x80,	%g1
	nop
	set	0x76, %i1
	sth	%o1,	[%l7 + %i1]
	set	0x68, %g1
	stxa	%g7,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%o4
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f8
	nop
	set	0x34, %o3
	ldsw	[%l7 + %o3],	%o6
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	add	%o7,	%i2,	%g6
	nop
	set	0x68, %o4
	ldsw	[%l7 + %o4],	%g4
	set	0x24, %g4
	sta	%f1,	[%l7 + %g4] 0x88
	bl	%icc,	loop_171
	nop
	set	0x78, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x48, %i2
	sth	%o2,	[%l7 + %i2]
	nop
	set	0x14, %i7
	swap	[%l7 + %i7],	%l3
loop_171:
	nop
	set	0x7E, %l3
	ldsh	[%l7 + %l3],	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%o3
	or	%l1,	%i5,	%i4
	nop
	set	0x30, %o7
	ldsb	[%l7 + %o7],	%g5
	nop
	set	0x60, %o6
	std	%g2,	[%l7 + %o6]
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f22
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f16
	fpadd32	%f8,	%f26,	%f4
	st	%f19,	[%l7 + 0x7C]
	st	%f25,	[%l7 + 0x7C]
	set	0x68, %i3
	stxa	%l4,	[%l7 + %i3] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%l6
	bge,a,pn	%icc,	loop_172
	nop
	set	0x20, %i4
	lduw	[%l7 + %i4],	%i0
	set	0x62, %g5
	stha	%l5,	[%l7 + %g5] 0x89
loop_172:
	nop
	set	0x64, %g6
	lduw	[%l7 + %g6],	%i7
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%g2
	set	0x64, %o5
	stwa	%l0,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x20, %l6
	stda	%i2,	[%l7 + %l6] 0x80
	nop
	nop
	setx	0xE8443042,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x49516B8E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f11,	%f9
	nop
	set	0x10, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%l2
	or	%g1,	%o4,	%o1
	nop
	set	0x58, %l4
	stx	%g7,	[%l7 + %l4]
	set	0x48, %l2
	stxa	%o6,	[%l7 + %l2] 0x89
	set	0x38, %g2
	ldxa	[%l7 + %g2] 0x89,	%o7
	nop
	set	0x4F, %i5
	ldsb	[%l7 + %i5],	%o5
	nop
	set	0x48, %i1
	std	%f30,	[%l7 + %i1]
	add	%g6,	%i2,	%o2
	nop
	set	0x78, %g1
	stx	%l3,	[%l7 + %g1]
	nop
	nop
	setx	0xA203E4D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x3968DB37,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f15,	%f8
	set	0x7E, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g4
	ld	[%l7 + 0x34],	%f11
	or	%i1,	%o0,	%o3
	nop
	set	0x28, %g3
	std	%f20,	[%l7 + %g3]
	nop
	set	0x68, %o3
	ldx	[%l7 + %o3],	%l1
	bne,a	%icc,	loop_173
	nop
	set	0x50, %i6
	std	%f28,	[%l7 + %i6]
	ld	[%l7 + 0x5C],	%f10
	st	%fsr,	[%l7 + 0x60]
loop_173:
	nop
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf8,	%f0
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%i4
	or	%i5,	%g5,	%l4
	nop
	set	0x40, %i0
	stx	%g2,	[%l7 + %i0]
	wr	%l6,	%i6,	%sys_tick
	nop
	nop
	setx	0x4C81A79A0E237719,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x1E1D2EED1FECCEC6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f2,	%f24
	or	%l5,	%i7,	%g3
	nop
	set	0x78, %i2
	prefetch	[%l7 + %i2],	 1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l0,	%i0
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x70, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x68, %l3
	stx	%i3,	[%l7 + %l3]
	nop
	set	0x76, %i7
	lduh	[%l7 + %i7],	%g1
	set	0x11, %o6
	ldstuba	[%l7 + %o6] 0x80,	%o4
	nop
	set	0x70, %o7
	ldsw	[%l7 + %o7],	%l2
	nop
	set	0x70, %l1
	lduw	[%l7 + %l1],	%o1
	nop
	set	0x10, %l5
	ldsw	[%l7 + %l5],	%g7
	ld	[%l7 + 0x14],	%f24
	set	0x68, %i4
	ldxa	[%l7 + %i4] 0x89,	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%g6
	add	%i2,	%o5,	%l3
	nop
	set	0x6C, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x64, %g6
	lduw	[%l7 + %g6],	%g4
	set	0x1E, %g7
	ldstuba	[%l7 + %g7] 0x88,	%i1
	set	0x6C, %o5
	lda	[%l7 + %o5] 0x80,	%f23
	nop
	set	0x18, %l6
	ldub	[%l7 + %l6],	%o0
	set	0x60, %g5
	swapa	[%l7 + %g5] 0x81,	%o2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%i4
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%l0
	fpadd16	%f20,	%f4,	%f4
	nop
	set	0x48, %l4
	stx	%i5,	[%l7 + %l4]
	nop
	set	0x53, %l2
	ldsb	[%l7 + %l2],	%l4
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x89,	 2
	set	0x56, %o1
	stba	%l6,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x50, %i5
	std	%g4,	[%l7 + %i5]
	set	0x30, %g1
	stda	%i6,	[%l7 + %g1] 0x89
	fpsub16	%f14,	%f30,	%f18
	ld	[%l7 + 0x24],	%f17
	nop
	set	0x28, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x58, %o0
	stxa	%l5,	[%l7 + %o0] 0x89
	and	%g3,	%l0,	%i7
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%i2
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%g0
	nop
	set	0x4C, %o4
	stw	%o4,	[%l7 + %o4]
	wr	%i0,	%o1,	%set_softint
	fpsub32s	%f9,	%f25,	%f2
	nop
	set	0x2C, %o3
	stw	%g7,	[%l7 + %o3]
	add	%l2,	%o6,	%o7
	ba,pt	%xcc,	loop_174
	nop
	set	0x64, %i0
	lduw	[%l7 + %i0],	%g6
	set	0x50, %i2
	stda	%o4,	[%l7 + %i2] 0xea
	membar	#Sync
loop_174:
	nop
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f16
	set	0x78, %o2
	stxa	%l3,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x88,	%i2
	nop
	set	0x48, %o6
	stx	%i1,	[%l7 + %o6]
	fpsub32s	%f31,	%f5,	%f22
	set	0x1C, %o7
	sta	%f1,	[%l7 + %o7] 0x88
	set	0x1C, %i7
	lda	[%l7 + %i7] 0x81,	%f2
	nop
	set	0x3A, %l5
	ldstub	[%l7 + %l5],	%o0
	ld	[%l7 + 0x4C],	%f16
	set	0x64, %i4
	sta	%f0,	[%l7 + %i4] 0x88
	set	0x08, %i3
	stxa	%g4,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x48, %g6
	stx	%o2,	[%l7 + %g6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%l1
	or	%i5,	%i4,	%g2
	nop
	set	0x50, %g7
	lduw	[%l7 + %g7],	%l4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%i6
	nop
	set	0x50, %o5
	swap	[%l7 + %o5],	%l6
	set	0x64, %l6
	lda	[%l7 + %l6] 0x88,	%f7
	set	0x18, %g5
	lda	[%l7 + %g5] 0x88,	%f19
	nop
	set	0x58, %l0
	stx	%l5,	[%l7 + %l0]
	fpadd16s	%f12,	%f7,	%f7
	nop
	set	0x14, %l1
	ldsw	[%l7 + %l1],	%g3
	nop
	set	0x7C, %l4
	ldsb	[%l7 + %l4],	%l0
	nop
	set	0x60, %l2
	ldsb	[%l7 + %l2],	%i3
	set	0x58, %g2
	stda	%g0,	[%l7 + %g2] 0x89
	st	%fsr,	[%l7 + 0x38]
	st	%f25,	[%l7 + 0x60]
	set	0x24, %o1
	stwa	%o4,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x11, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i7
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x88,	 3
	fpsub32	%f20,	%f30,	%f2
	or	%g7,	%o1,	%o6
	nop
	set	0x30, %g1
	std	%o6,	[%l7 + %g1]
	nop
	set	0x49, %g3
	ldsb	[%l7 + %g3],	%g6
	nop
	set	0x68, %i6
	std	%l2,	[%l7 + %i6]
	nop
	set	0x38, %o0
	ldsh	[%l7 + %o0],	%l3
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f0
	set	0x48, %i2
	stxa	%o5,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x44, %o4
	swapa	[%l7 + %o4] 0x81,	%i1
	wr	%i2,	%o0,	%clear_softint
	nop
	nop
	setx	0x3440EB00,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x07E00987,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f16,	%f20
	nop
	set	0x30, %g4
	std	%f18,	[%l7 + %g4]
	nop
	set	0x56, %l3
	sth	%o2,	[%l7 + %l3]
	set	0x4F, %o6
	stba	%g4,	[%l7 + %o6] 0x80
	set	0x50, %o2
	stxa	%o3,	[%l7 + %o2] 0x80
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%l1
	nop
	set	0x18, %o7
	lduh	[%l7 + %o7],	%i4
	nop
	set	0x0C, %l5
	stw	%l4,	[%l7 + %l5]
	nop
	set	0x20, %i7
	stx	%g5,	[%l7 + %i7]
	nop
	set	0x0F, %i4
	ldub	[%l7 + %i4],	%g2
	or	%i6,	%l6,	%g3
	nop
	set	0x20, %i3
	ldub	[%l7 + %i3],	%l5
	set	0x44, %g7
	sta	%f3,	[%l7 + %g7] 0x81
	nop
	set	0x2C, %g6
	ldstub	[%l7 + %g6],	%l0
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x81,	%i3
	nop
	set	0x58, %g5
	lduw	[%l7 + %g5],	%g1
	ld	[%l7 + 0x24],	%f21
	nop
	set	0x7A, %l0
	sth	%i7,	[%l7 + %l0]
	nop
	set	0x4C, %l6
	stw	%o4,	[%l7 + %l6]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xc0
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x81,	%g6
	and	%o1,	%o6,	%o7
	set	0x62, %g2
	stha	%g6,	[%l7 + %g2] 0x81
	add	%i0,	%l2,	%o5
	ld	[%l7 + 0x10],	%f9
	set	0x44, %o1
	swapa	[%l7 + %o1] 0x80,	%i1
	set	0x48, %i5
	stda	%i2,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x78, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x20, %g1
	std	%o0,	[%l7 + %g1]
	nop
	set	0x78, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x80,	%o2
	ba	%xcc,	loop_175
	ld	[%l7 + 0x28],	%f2
	wr	%l3,	%g4,	%y
	nop
	set	0x48, %g3
	lduw	[%l7 + %g3],	%o3
loop_175:
	nop
	set	0x2A, %o0
	lduh	[%l7 + %o0],	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%l4
	set	0x17, %i0
	stba	%g5,	[%l7 + %i0] 0x81
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%i4
	nop
	set	0x28, %o3
	std	%g2,	[%l7 + %o3]
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%i6
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x80,	%g3
	or	%l6,	%l0,	%l5
	nop
	set	0x7A, %o6
	ldsh	[%l7 + %o6],	%g1
	nop
	set	0x70, %l3
	std	%f0,	[%l7 + %l3]
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%i6
	st	%fsr,	[%l7 + 0x54]
	set	0x20, %l5
	lda	[%l7 + %l5] 0x89,	%f20
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%i2
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x80,	%g6
	set	0x27, %i3
	ldstuba	[%l7 + %i3] 0x80,	%o1
	nop
	set	0x38, %i4
	stw	%o4,	[%l7 + %i4]
	add	%o7,	%g6,	%i0
	nop
	set	0x4C, %g6
	ldub	[%l7 + %g6],	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%l2
	and	%i2,	%o0,	%i1
	wr	%o2,	%l3,	%softint
	set	0x08, %o5
	lda	[%l7 + %o5] 0x89,	%f19
	set	0x60, %g5
	lda	[%l7 + %g5] 0x80,	%f6
	ld	[%l7 + 0x24],	%f2
	or	%o3,	%i5,	%l1
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%g4
	set	0x38, %l6
	stxa	%l4,	[%l7 + %l6] 0x88
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%g2
	nop
	set	0x2A, %l0
	sth	%i4,	[%l7 + %l0]
	nop
	set	0x48, %l4
	std	%g2,	[%l7 + %l4]
	set	0x16, %g2
	stha	%i6,	[%l7 + %g2] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x38]
	set	0x53, %l1
	stba	%l6,	[%l7 + %l1] 0x89
	nop
	set	0x20, %o1
	std	%l0,	[%l7 + %o1]
	nop
	set	0x18, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%i7
	fpadd32	%f14,	%f8,	%f22
	nop
	set	0x20, %i1
	std	%i2,	[%l7 + %i1]
	nop
	set	0x78, %l2
	std	%g0,	[%l7 + %l2]
	set	0x40, %g1
	stwa	%g7,	[%l7 + %g1] 0x80
	set	0x2C, %g3
	swapa	[%l7 + %g3] 0x89,	%o1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%g6
	nop
	set	0x7E, %i6
	sth	%i0,	[%l7 + %i6]
	nop
	set	0x5C, %i0
	ldsb	[%l7 + %i0],	%o6
	nop
	set	0x21, %i2
	ldsb	[%l7 + %i2],	%o5
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f16
	nop
	set	0x50, %o0
	std	%f18,	[%l7 + %o0]
	nop
	set	0x7C, %g4
	ldsw	[%l7 + %g4],	%o7
	nop
	set	0x3C, %o4
	swap	[%l7 + %o4],	%i2
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc8
	set	0x24, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o0
	nop
	set	0x64, %o6
	sth	%i1,	[%l7 + %o6]
	set	0x28, %o2
	stda	%l2,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x3C, %l5
	ldsw	[%l7 + %l5],	%o2
	nop
	set	0x70, %i7
	std	%f4,	[%l7 + %i7]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%l3
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x88,	 3
	nop
	set	0x35, %i3
	ldsb	[%l7 + %i3],	%g4
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc2
	nop
	nop
	setx	0xFA8821235E75B6ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB79AF54E82653EBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f2,	%f18
	nop
	set	0x40, %g6
	std	%i4,	[%l7 + %g6]
	nop
	set	0x68, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x6B, %g5
	ldub	[%l7 + %g5],	%l4
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x74, %l0
	sth	%g5,	[%l7 + %l0]
	set	0x78, %l4
	ldxa	[%l7 + %l4] 0x80,	%g2
	nop
	set	0x54, %g2
	lduw	[%l7 + %g2],	%g3
	set	0x44, %l1
	sta	%f13,	[%l7 + %l1] 0x80
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%f12
	set	0x37, %i5
	stba	%i6,	[%l7 + %i5] 0x89
	set	0x1C, %l2
	swapa	[%l7 + %l2] 0x88,	%i4
	set	0x50, %i1
	stda	%i6,	[%l7 + %i1] 0x88
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%l5
	nop
	set	0x64, %g1
	ldsh	[%l7 + %g1],	%i7
	or	%i3,	%g1,	%l0
	fpadd32s	%f20,	%f22,	%f23
	nop
	set	0x6C, %i6
	stw	%g7,	[%l7 + %i6]
	set	0x28, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x81,	 3
	nop
	set	0x70, %o0
	swap	[%l7 + %o0],	%i0
	and	%g6,	%o6,	%o5
	or	%i2,	%o0,	%o7
	ld	[%l7 + 0x14],	%f12
	nop
	set	0x7D, %g4
	ldsb	[%l7 + %g4],	%l2
	set	0x10, %o3
	stxa	%o2,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x80,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%l3
	set	0x4A, %l3
	stha	%l1,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x4D, %o7
	ldstub	[%l7 + %o7],	%i5
	st	%fsr,	[%l7 + 0x24]
	add	%g4,	%g5,	%g2
	set	0x42, %o2
	stba	%l4,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x58, %o6
	lduw	[%l7 + %o6],	%i6
	nop
	set	0x70, %i7
	stb	%g3,	[%l7 + %i7]
	nop
	set	0x6C, %l5
	swap	[%l7 + %l5],	%l6
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x88,	%i4
	and	%l5,	%i3,	%g1
	nop
	set	0x4A, %o5
	stb	%l0,	[%l7 + %o5]
	set	0x28, %g6
	lda	[%l7 + %g6] 0x89,	%f19
	set	0x48, %i4
	stda	%g6,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x28, %g7
	ldsb	[%l7 + %g7],	%o1
	set	0x56, %l6
	stha	%i7,	[%l7 + %l6] 0x81
	set	0x30, %l0
	swapa	[%l7 + %l0] 0x81,	%o4
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xc0
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%i0
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f18
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f16
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x88,	%o6
	nop
	set	0x77, %l2
	ldstub	[%l7 + %l2],	%o5
	nop
	set	0x68, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x21, %g3
	ldsb	[%l7 + %g3],	%i2
	nop
	set	0x44, %g1
	swap	[%l7 + %g1],	%g6
	nop
	set	0x08, %i5
	ldsh	[%l7 + %i5],	%o0
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x60, %i6
	stda	%o6,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc2
	add	%l2,	%i1,	%o3
	nop
	set	0x58, %i0
	std	%f12,	[%l7 + %i0]
	nop
	set	0x5C, %o3
	swap	[%l7 + %o3],	%o2
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x81,	 4
	ld	[%l7 + 0x24],	%f10
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xe3,	%i4
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x81,	%l3
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x1E, %o7
	ldstub	[%l7 + %o7],	%g5
	nop
	set	0x51, %o6
	ldsb	[%l7 + %o6],	%g4
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xcc
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f30
	set	0x22, %i3
	stha	%l4,	[%l7 + %i3] 0x88
	nop
	set	0x4C, %i7
	stw	%i6,	[%l7 + %i7]
	set	0x0E, %o5
	stha	%g2,	[%l7 + %o5] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%l6
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%l5
	set	0x28, %g7
	lda	[%l7 + %g7] 0x81,	%f1
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%i3
	nop
	nop
	setx	0xD54F6730,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x7B640ABB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f18,	%f4
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc8
	st	%f2,	[%l7 + 0x5C]
	set	0x6C, %l0
	sta	%f17,	[%l7 + %l0] 0x89
	set	0x30, %g5
	stda	%i4,	[%l7 + %g5] 0x89
	fpsub32	%f30,	%f0,	%f12
	set	0x64, %l1
	stwa	%g1,	[%l7 + %l1] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x18]
	set	0x74, %o1
	lda	[%l7 + %o1] 0x88,	%f23
	set	0x38, %g2
	swapa	[%l7 + %g2] 0x88,	%g7
	set	0x40, %l4
	stwa	%o1,	[%l7 + %l4] 0x80
	nop
	set	0x10, %i1
	stx	%i7,	[%l7 + %i1]
	nop
	set	0x3C, %l2
	stw	%o4,	[%l7 + %l2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%l0
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xca
	bl,a	%xcc,	loop_176
	nop
	set	0x34, %i5
	sth	%o5,	[%l7 + %i5]
	set	0x3C, %i2
	sta	%f26,	[%l7 + %i2] 0x80
loop_176:
	or	%i2,	%o6,	%o0
	set	0x50, %i6
	stwa	%g6,	[%l7 + %i6] 0x80
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%i1
	nop
	set	0x10, %g3
	ldsh	[%l7 + %g3],	%o3
	nop
	set	0x38, %o0
	ldsh	[%l7 + %o0],	%o7
	set	0x38, %i0
	stwa	%o2,	[%l7 + %i0] 0x89
	nop
	set	0x4E, %o3
	sth	%l1,	[%l7 + %o3]
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%i5
	nop
	set	0x40, %o4
	lduw	[%l7 + %o4],	%g5
	bl,a,pn	%xcc,	loop_177
	nop
	set	0x1C, %o7
	ldstub	[%l7 + %o7],	%l3
	add	%l4,	%g4,	%i6
	nop
	set	0x1E, %l3
	lduh	[%l7 + %l3],	%g3
loop_177:
	nop
	set	0x48, %o2
	std	%f24,	[%l7 + %o2]
	set	0x44, %l5
	sta	%f3,	[%l7 + %l5] 0x88
	and	%l6,	%l5,	%g2
	or	%i4,	%i3,	%g7
	nop
	set	0x7C, %i3
	ldsw	[%l7 + %i3],	%o1
	nop
	set	0x50, %o6
	sth	%i7,	[%l7 + %o6]
	set	0x20, %o5
	ldda	[%l7 + %o5] 0xe3,	%o4
	fpsub16	%f16,	%f16,	%f30
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x81,	%g0
	st	%f20,	[%l7 + 0x44]
	nop
	set	0x68, %i4
	lduw	[%l7 + %i4],	%i0
	wr	%o5,	%l0,	%softint
	set	0x40, %g7
	sta	%f29,	[%l7 + %g7] 0x89
	nop
	set	0x60, %g6
	lduw	[%l7 + %g6],	%o6
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f0
	nop
	set	0x56, %g5
	ldsh	[%l7 + %g5],	%i2
	set	0x36, %l0
	stha	%o0,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x34, %o1
	ldstuba	[%l7 + %o1] 0x81,	%l2
	nop
	set	0x50, %g2
	lduw	[%l7 + %g2],	%g6
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f30
	st	%fsr,	[%l7 + 0x48]
	add	%o3,	%o7,	%i1
	nop
	nop
	setx	0x3B0AA3001FBBAA82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x8C11D3AC615F552D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f6,	%f22
	nop
	set	0x60, %i1
	stw	%l1,	[%l7 + %i1]
	nop
	set	0x30, %l2
	lduw	[%l7 + %l2],	%i5
	nop
	set	0x32, %l1
	lduh	[%l7 + %l1],	%o2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd8,	%f0
	nop
	set	0x0A, %g1
	ldsh	[%l7 + %g1],	%l3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%g5
	set	0x6B, %i6
	ldstuba	[%l7 + %i6] 0x88,	%g4
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	nop
	set	0x64, %i2
	lduh	[%l7 + %i2],	%i6
	set	0x28, %o0
	stwa	%g3,	[%l7 + %o0] 0x81
	nop
	set	0x16, %o3
	ldsh	[%l7 + %o3],	%l5
	or	%l6,	%i4,	%g2
	st	%fsr,	[%l7 + 0x50]
	set	0x54, %g4
	lda	[%l7 + %g4] 0x88,	%f26
	ble	%icc,	loop_178
	nop
	set	0x7C, %o4
	sth	%g7,	[%l7 + %o4]
	set	0x53, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o1
loop_178:
	nop
	set	0x08, %l3
	std	%f28,	[%l7 + %l3]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xca
	add	%i7,	%o4,	%g1
	nop
	set	0x5C, %i0
	ldsb	[%l7 + %i0],	%i3
	st	%f30,	[%l7 + 0x7C]
	or	%o5,	%l0,	%i0
	add	%i2,	%o0,	%l2
	nop
	set	0x1A, %i3
	lduh	[%l7 + %i3],	%g6
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f16
	set	0x14, %o5
	swapa	[%l7 + %o5] 0x80,	%o6
	nop
	set	0x48, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x22, %i7
	sth	%o3,	[%l7 + %i7]
	nop
	set	0x67, %g7
	stb	%i1,	[%l7 + %g7]
	set	0x18, %i4
	stwa	%l1,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x26, %l6
	lduh	[%l7 + %l6],	%o7
	nop
	set	0x0C, %g5
	lduw	[%l7 + %g5],	%o2
	set	0x20, %l0
	stda	%l2,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x20, %g2
	stda	%l4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x20, %l4
	std	%f30,	[%l7 + %l4]
	nop
	set	0x28, %i1
	ldub	[%l7 + %i1],	%g5
	nop
	set	0x22, %o1
	sth	%i5,	[%l7 + %o1]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
	nop
	set	0x24, %l2
	stw	%i6,	[%l7 + %l2]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f0
	and	%g3,	%g4,	%l5
	st	%fsr,	[%l7 + 0x20]
	set	0x58, %i5
	swapa	[%l7 + %i5] 0x88,	%l6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	nop
	set	0x16, %i2
	stb	%i4,	[%l7 + %i2]
	ld	[%l7 + 0x54],	%f1
	set	0x14, %o0
	lda	[%l7 + %o0] 0x89,	%f9
	nop
	set	0x6C, %i6
	swap	[%l7 + %i6],	%g7
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%f30
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xcc
	nop
	set	0x7A, %o4
	lduh	[%l7 + %o4],	%g2
	nop
	set	0x68, %o7
	ldsw	[%l7 + %o7],	%o1
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf9
	membar	#Sync
	nop
	set	0x14, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x74, %i3
	sta	%f23,	[%l7 + %i3] 0x81
	nop
	set	0x78, %o5
	ldsw	[%l7 + %o5],	%i7
	nop
	set	0x4C, %l5
	lduh	[%l7 + %l5],	%o4
	nop
	set	0x73, %i7
	stb	%g1,	[%l7 + %i7]
	nop
	set	0x59, %o6
	stb	%o5,	[%l7 + %o6]
	set	0x6C, %g7
	stba	%i3,	[%l7 + %g7] 0x80
	st	%f27,	[%l7 + 0x24]
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x80,	%l0
	set	0x68, %g5
	stxa	%i0,	[%l7 + %g5] 0x81
	and	%o0,	%l2,	%g6
	set	0x10, %i4
	ldxa	[%l7 + %i4] 0x88,	%i2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%i1
	nop
	set	0x58, %g6
	std	%f24,	[%l7 + %g6]
	nop
	set	0x48, %l0
	ldsb	[%l7 + %l0],	%l1
	nop
	set	0x40, %l4
	std	%f0,	[%l7 + %l4]
	ld	[%l7 + 0x64],	%f11
	nop
	set	0x4C, %g2
	ldsh	[%l7 + %g2],	%o7
	nop
	set	0x18, %i1
	std	%o2,	[%l7 + %i1]
	add	%l3,	%o3,	%g5
	set	0x74, %l1
	swapa	[%l7 + %l1] 0x88,	%i5
	and	%i6,	%g3,	%g4
	st	%f18,	[%l7 + 0x30]
	nop
	set	0x38, %l2
	sth	%l5,	[%l7 + %l2]
	nop
	set	0x60, %g1
	ldub	[%l7 + %g1],	%l6
	nop
	set	0x3C, %i5
	ldsh	[%l7 + %i5],	%i4
	nop
	set	0x0A, %g3
	ldsh	[%l7 + %g3],	%g7
	nop
	set	0x70, %o1
	std	%l4,	[%l7 + %o1]
	nop
	set	0x70, %o0
	std	%f10,	[%l7 + %o0]
	nop
	set	0x55, %i2
	ldub	[%l7 + %i2],	%g2
	and	%i7,	%o4,	%g1
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x88,	%o5
	nop
	set	0x10, %o3
	std	%i2,	[%l7 + %o3]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%o1
	set	0x3F, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g6
	set	0x08, %o7
	swapa	[%l7 + %o7] 0x88,	%l2
	nop
	set	0x32, %o4
	sth	%o6,	[%l7 + %o4]
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%i0
	set	0x70, %o2
	stxa	%l1,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x78, %i3
	stha	%o7,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x88,	%o2
	nop
	set	0x30, %l5
	stx	%l3,	[%l7 + %l5]
	set	0x30, %l3
	lda	[%l7 + %l3] 0x80,	%f24
	set	0x08, %i7
	lda	[%l7 + %i7] 0x80,	%f4
	nop
	set	0x50, %g7
	stw	%o3,	[%l7 + %g7]
	set	0x66, %o6
	stba	%i2,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x43, %l6
	stba	%g5,	[%l7 + %l6] 0x88
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	set	0x25, %g5
	stba	%i6,	[%l7 + %g5] 0x80
	add	%g4,	%g3,	%l5
	nop
	set	0x38, %g6
	ldsh	[%l7 + %g6],	%i4
	set	0x78, %l4
	ldxa	[%l7 + %l4] 0x88,	%g7
	nop
	set	0x54, %g2
	ldsb	[%l7 + %g2],	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%i7
	add	%l6,	%o4,	%o5
	nop
	set	0x10, %i1
	stw	%g1,	[%l7 + %i1]
	nop
	set	0x50, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x08, %l2
	stw	%i3,	[%l7 + %l2]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%o0
	nop
	set	0x56, %g1
	ldsh	[%l7 + %g1],	%o1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l0,	%g6
	nop
	set	0x50, %g3
	std	%o6,	[%l7 + %g3]
	or	%l2,	%i1,	%l1
	set	0x70, %i5
	sta	%f10,	[%l7 + %i5] 0x88
	and	%o2,	%l3,	%o3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x81,	%f16
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x80,	 4
	fpadd16s	%f14,	%f2,	%f18
	or	%g5,	%i5,	%i6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o7
	add	%g3,	%i4,	%g7
	nop
	set	0x46, %i2
	ldstub	[%l7 + %i2],	%l4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xcc
	add	%g2,	%i7,	%l6
	set	0x08, %i6
	ldxa	[%l7 + %i6] 0x89,	%o4
	set	0x20, %g4
	lda	[%l7 + %g4] 0x81,	%f18
	nop
	set	0x20, %o7
	ldsw	[%l7 + %o7],	%o5
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%l5
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f0
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%g1
	nop
	set	0x38, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x16, %l5
	ldstub	[%l7 + %l5],	%i0
	set	0x24, %l3
	lda	[%l7 + %l3] 0x81,	%f30
	nop
	set	0x30, %i7
	lduh	[%l7 + %i7],	%o0
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x28, %o5
	swapa	[%l7 + %o5] 0x81,	%i3
	set	0x28, %o6
	stxa	%o1,	[%l7 + %o6] 0xea
	membar	#Sync
	fpsub16s	%f10,	%f25,	%f7
	wr	%g6,	%o6,	%y
	and	%l2,	%i1,	%l0
	nop
	set	0x38, %i4
	stb	%l1,	[%l7 + %i4]
	nop
	set	0x18, %g5
	lduw	[%l7 + %g5],	%o2
	and	%o3,	%i2,	%g5
	nop
	set	0x08, %l6
	lduh	[%l7 + %l6],	%l3
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf0
	membar	#Sync
	nop
	set	0x68, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x74, %l4
	ldub	[%l7 + %l4],	%i5
	nop
	set	0x68, %l1
	lduh	[%l7 + %l1],	%g4
	nop
	set	0x30, %i1
	swap	[%l7 + %i1],	%o7
	ld	[%l7 + 0x68],	%f14
	nop
	set	0x0C, %l0
	lduw	[%l7 + %l0],	%g3
	or	%i6,	%i4,	%g7
	set	0x2C, %l2
	swapa	[%l7 + %l2] 0x81,	%g2
	nop
	set	0x74, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x81,	 0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f0
	nop
	set	0x67, %o0
	ldsb	[%l7 + %o0],	%l6
	st	%fsr,	[%l7 + 0x3C]
	and	%o4,	%o5,	%l5
	or	%g1,	%l4,	%o0
	add	%i3,	%i0,	%o1
	nop
	set	0x16, %o1
	stb	%g6,	[%l7 + %o1]
	nop
	set	0x18, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x16, %g4
	stba	%l2,	[%l7 + %g4] 0x88
	nop
	set	0x3D, %o7
	ldsb	[%l7 + %o7],	%o6
	nop
	set	0x77, %i6
	ldub	[%l7 + %i6],	%l0
	or	%i1,	%l1,	%o2
	nop
	set	0x70, %i0
	std	%f14,	[%l7 + %i0]
	nop
	set	0x74, %o4
	stw	%o3,	[%l7 + %o4]
	set	0x18, %o2
	sta	%f28,	[%l7 + %o2] 0x81
	nop
	set	0x70, %i3
	swap	[%l7 + %i3],	%g5
	set	0x50, %l5
	stda	%l2,	[%l7 + %l5] 0x81
	nop
	set	0x24, %i7
	ldstub	[%l7 + %i7],	%i2
	st	%fsr,	[%l7 + 0x3C]
	set	0x5E, %l3
	stba	%g4,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%i4
	and	%g3,	%o7,	%i6
	nop
	set	0x30, %g7
	stx	%g7,	[%l7 + %g7]
	set	0x18, %i4
	stxa	%g2,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x50, %o6
	stxa	%i7,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x2C, %l6
	lduw	[%l7 + %l6],	%l6
	set	0x5E, %g6
	stha	%o4,	[%l7 + %g6] 0x89
	nop
	set	0x62, %g2
	ldsb	[%l7 + %g2],	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g1
	set	0x08, %l4
	stda	%l4,	[%l7 + %l4] 0x81
	ld	[%l7 + 0x3C],	%f0
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%o0
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%i2
	set	0x0C, %l0
	swapa	[%l7 + %l0] 0x89,	%l5
	ld	[%l7 + 0x78],	%f4
	nop
	set	0x34, %l2
	ldsw	[%l7 + %l2],	%i0
	fpsub16	%f22,	%f2,	%f16
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x80,	%o0
	nop
	set	0x30, %g3
	sth	%g6,	[%l7 + %g3]
	nop
	set	0x08, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%l2
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x64, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i1
	nop
	set	0x62, %o3
	lduh	[%l7 + %o3],	%l1
	nop
	set	0x32, %o7
	ldsh	[%l7 + %o7],	%l0
	and	%o3,	%g5,	%o2
	nop
	set	0x08, %g4
	ldsw	[%l7 + %g4],	%i2
	and	%g4,	%i5,	%g3
	nop
	set	0x69, %i0
	stb	%o7,	[%l7 + %i0]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%l3
	nop
	set	0x0C, %o4
	swap	[%l7 + %o4],	%g2
	fpadd16	%f6,	%f28,	%f26
	nop
	set	0x18, %o2
	std	%i6,	[%l7 + %o2]
	and	%l6,	%g7,	%o4
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x89,	%i4
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%g1
	fpsub16s	%f13,	%f2,	%f14
	nop
	set	0x79, %i7
	ldub	[%l7 + %i7],	%o5
	set	0x78, %l3
	stxa	%l4,	[%l7 + %l3] 0x88
	nop
	set	0x4A, %o5
	ldsb	[%l7 + %o5],	%o0
	bg,a	%xcc,	loop_179
	add	%l5,	%i3,	%o1
	set	0x6C, %g7
	lda	[%l7 + %g7] 0x80,	%f16
loop_179:
	nop
	set	0x68, %i6
	stda	%i0,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f0
	nop
	set	0x52, %l6
	ldsb	[%l7 + %l6],	%o6
	set	0x58, %o6
	ldxa	[%l7 + %o6] 0x89,	%l2
	set	0x10, %g2
	prefetcha	[%l7 + %g2] 0x80,	 0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%l0
	nop
	set	0x4C, %l4
	ldsb	[%l7 + %l4],	%i1
	set	0x14, %g6
	stwa	%g5,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x74, %i1
	lduw	[%l7 + %i1],	%o3
	set	0x2C, %l0
	stba	%i2,	[%l7 + %l0] 0x81
	nop
	set	0x75, %l2
	stb	%o2,	[%l7 + %l2]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%g3
	nop
	set	0x28, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x48, %g3
	std	%o6,	[%l7 + %g3]
	nop
	set	0x28, %o0
	lduw	[%l7 + %o0],	%i5
	set	0x2A, %i5
	stba	%l3,	[%l7 + %i5] 0x89
	nop
	set	0x3A, %g1
	ldsh	[%l7 + %g1],	%g2
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x81
	st	%fsr,	[%l7 + 0x7C]
	ld	[%l7 + 0x60],	%f0
	set	0x56, %o3
	stha	%i7,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf8
	membar	#Sync
	set	0x3C, %o1
	swapa	[%l7 + %o1] 0x88,	%l6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f0
	set	0x4C, %g4
	sta	%f24,	[%l7 + %g4] 0x88
	nop
	set	0x76, %o2
	ldstub	[%l7 + %o2],	%i6
	nop
	set	0x74, %i3
	lduh	[%l7 + %i3],	%o4
	fpsub32s	%f12,	%f10,	%f10
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x80
	or	%i4,	%g7,	%g1
	set	0x0C, %i7
	stwa	%o5,	[%l7 + %i7] 0x88
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f30
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf9
	membar	#Sync
	nop
	set	0x50, %l5
	lduw	[%l7 + %l5],	%l4
	set	0x26, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l5
	set	0x75, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i3
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f12
	nop
	set	0x20, %l6
	stw	%o1,	[%l7 + %l6]
	nop
	set	0x48, %g2
	ldx	[%l7 + %g2],	%o0
	nop
	set	0x71, %l4
	ldub	[%l7 + %l4],	%o6
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xda
	set	0x67, %o6
	stba	%i0,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x70, %g5
	std	%f26,	[%l7 + %g5]
	fpsub32s	%f6,	%f10,	%f0
	set	0x34, %i1
	lda	[%l7 + %i1] 0x81,	%f7
	set	0x50, %l2
	stxa	%g6,	[%l7 + %l2] 0x81
	ld	[%l7 + 0x20],	%f12
	ld	[%l7 + 0x34],	%f31
	nop
	set	0x5A, %l0
	ldub	[%l7 + %l0],	%l1
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x89,	%l2
	nop
	set	0x5C, %o0
	swap	[%l7 + %o0],	%i1
	set	0x30, %g3
	stwa	%l0,	[%l7 + %g3] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x2C]
	bne,a	%icc,	loop_180
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f20
	nop
	set	0x0C, %i5
	stb	%g5,	[%l7 + %i5]
	bleu,a	%icc,	loop_181
loop_180:
	bleu,a,pt	%xcc,	loop_182
	or	%i2,	%o2,	%g4
	nop
	set	0x50, %o3
	swap	[%l7 + %o3],	%g3
loop_181:
	nop
	set	0x2D, %o7
	ldstub	[%l7 + %o7],	%o3
loop_182:
	nop
	set	0x6A, %i2
	ldsh	[%l7 + %i2],	%i5
	wr	%l3,	%o7,	%ccr
	set	0x3A, %o1
	stha	%g2,	[%l7 + %o1] 0x80
	nop
	set	0x60, %g4
	lduh	[%l7 + %g4],	%i7
	set	0x24, %i0
	lda	[%l7 + %i0] 0x88,	%f29
	nop
	set	0x10, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x3C, %o4
	swapa	[%l7 + %o4] 0x81,	%l6
	nop
	set	0x3C, %o2
	ldsw	[%l7 + %o2],	%i6
	nop
	set	0x6A, %i7
	ldsh	[%l7 + %i7],	%o4
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x48, %o5
	prefetch	[%l7 + %o5],	 2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%g1
	set	0x18, %l3
	stxa	%o5,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x68, %g7
	prefetch	[%l7 + %g7],	 1
	or	%l4,	%g7,	%i3
	nop
	set	0x70, %l5
	stw	%o1,	[%l7 + %l5]
	nop
	set	0x48, %i6
	sth	%l5,	[%l7 + %i6]
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x89,	%o0
	nop
	set	0x15, %l6
	ldsb	[%l7 + %l6],	%o6
	set	0x6C, %g2
	ldstuba	[%l7 + %g2] 0x89,	%g6
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xe2,	%l0
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%l2
	set	0x78, %o6
	swapa	[%l7 + %o6] 0x81,	%i1
	and	%i0,	%l0,	%i2
	nop
	set	0x64, %i1
	stw	%o2,	[%l7 + %i1]
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x80,	 0
	and	%g3,	%g5,	%i5
	nop
	set	0x08, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x72, %l1
	ldub	[%l7 + %l1],	%l3
	set	0x58, %o0
	stda	%o2,	[%l7 + %o0] 0x81
	nop
	set	0x78, %g3
	swap	[%l7 + %g3],	%o7
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%i7
	nop
	set	0x48, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x30, %o3
	ldx	[%l7 + %o3],	%l6
	set	0x60, %g1
	ldda	[%l7 + %g1] 0xe3,	%g2
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%o4
	set	0x17, %o1
	stba	%i4,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x5D, %g4
	ldstub	[%l7 + %g4],	%i6
	nop
	set	0x6D, %i0
	stb	%o5,	[%l7 + %i0]
	ld	[%l7 + 0x50],	%f12
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%l4
	nop
	set	0x29, %i3
	stb	%g1,	[%l7 + %i3]
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 0
	set	0x48, %i7
	stwa	%i3,	[%l7 + %i7] 0x88
	set	0x74, %o2
	swapa	[%l7 + %o2] 0x89,	%o1
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%g6
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xd0
	set	0x20, %g7
	stxa	%o0,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x5C, %l5
	sta	%f7,	[%l7 + %l5] 0x89
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf1
	membar	#Sync
	st	%f11,	[%l7 + 0x30]
	nop
	set	0x4E, %l6
	ldsh	[%l7 + %l6],	%l5
	nop
	set	0x24, %g2
	sth	%o6,	[%l7 + %g2]
	set	0x6C, %g6
	stwa	%g6,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x70, %i6
	prefetcha	[%l7 + %i6] 0x81,	 4
	add	%l1,	%i0,	%i1
	set	0x0E, %o6
	stba	%i2,	[%l7 + %o6] 0x88
	nop
	set	0x44, %i1
	swap	[%l7 + %i1],	%o2
	nop
	set	0x50, %g5
	ldsh	[%l7 + %g5],	%l0
	set	0x70, %l4
	stda	%g4,	[%l7 + %l4] 0x88
	set	0x0C, %l1
	stwa	%g5,	[%l7 + %l1] 0x89
	nop
	set	0x2C, %o0
	swap	[%l7 + %o0],	%g3
	set	0x7F, %g3
	ldstuba	[%l7 + %g3] 0x81,	%l3
	fpadd32s	%f20,	%f10,	%f14
	nop
	set	0x71, %l2
	ldstub	[%l7 + %l2],	%o3
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%i7
	set	0x1D, %l0
	ldstuba	[%l7 + %l0] 0x81,	%l6
	set	0x74, %o3
	lda	[%l7 + %o3] 0x81,	%f14
	set	0x58, %i5
	stxa	%g2,	[%l7 + %i5] 0x88
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc2
	fpsub16	%f28,	%f22,	%f24
	nop
	set	0x4C, %g1
	sth	%o4,	[%l7 + %g1]
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	st	%f2,	[%l7 + 0x2C]
	nop
	set	0x7C, %o1
	stw	%i6,	[%l7 + %o1]
	nop
	set	0x34, %o7
	lduh	[%l7 + %o7],	%i4
	nop
	set	0x40, %i3
	std	%f0,	[%l7 + %i3]
	set	0x68, %o4
	stda	%l4,	[%l7 + %o4] 0x88
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%g0
	or	%o5,	%i3,	%o1
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%g7
	add	%o6,	%g6,	%l2
	set	0x34, %i7
	swapa	[%l7 + %i7] 0x81,	%l5
	ld	[%l7 + 0x1C],	%f26
	nop
	set	0x1E, %o2
	stb	%l1,	[%l7 + %o2]
	nop
	set	0x1C, %o5
	swap	[%l7 + %o5],	%i0
	fpsub16	%f20,	%f4,	%f22
	set	0x14, %l3
	lda	[%l7 + %l3] 0x80,	%f30
	or	%i1,	%i2,	%l0
	set	0x78, %g7
	stwa	%o2,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x08, %l5
	ldstub	[%l7 + %l5],	%g5
	wr	%g4,	%g3,	%sys_tick
	fpadd32	%f30,	%f20,	%f6
	fpsub16s	%f12,	%f31,	%f10
	nop
	set	0x68, %l6
	stx	%l3,	[%l7 + %l6]
	set	0x74, %i4
	stwa	%o3,	[%l7 + %i4] 0x88
	nop
	set	0x20, %g2
	std	%f0,	[%l7 + %g2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l6
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%o6
	or	%o4,	%i5,	%g2
	set	0x68, %g6
	prefetcha	[%l7 + %g6] 0x89,	 1
	nop
	set	0x40, %i1
	stw	%l4,	[%l7 + %i1]
	nop
	set	0x30, %g5
	swap	[%l7 + %g5],	%g1
	set	0x40, %o6
	lda	[%l7 + %o6] 0x88,	%f4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%i3
	set	0x48, %l4
	stda	%o0,	[%l7 + %l4] 0x80
	and	%i6,	%g7,	%o0
	nop
	set	0x4D, %l1
	ldstub	[%l7 + %l1],	%o6
	wr	%l2,	%g6,	%clear_softint
	set	0x6D, %g3
	stba	%l5,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x81,	 2
	nop
	set	0x74, %l2
	sth	%i1,	[%l7 + %l2]
	nop
	set	0x1D, %l0
	ldstub	[%l7 + %l0],	%i2
	or	%l1,	%o2,	%l0
	nop
	set	0x18, %i5
	stw	%g5,	[%l7 + %i5]
	nop
	set	0x48, %i2
	std	%g2,	[%l7 + %i2]
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x80,	%g4
	nop
	set	0x10, %g4
	ldx	[%l7 + %g4],	%o3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%l3
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xd2
	nop
	set	0x30, %o3
	ldstub	[%l7 + %o3],	%o7
	or	%o4,	%i5,	%g2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i4
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf8
	membar	#Sync
	set	0x14, %o7
	stwa	%l4,	[%l7 + %o7] 0xe3
	membar	#Sync
	st	%f27,	[%l7 + 0x1C]
	nop
	set	0x1E, %o4
	stb	%g1,	[%l7 + %o4]
	set	0x48, %i0
	stxa	%i3,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x44, %i7
	ldsw	[%l7 + %i7],	%o5
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f0
	set	0x30, %l3
	stda	%o0,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xda,	%f16
	set	0x0C, %g7
	stwa	%g7,	[%l7 + %g7] 0x88
	ld	[%l7 + 0x20],	%f15
	nop
	set	0x5C, %l5
	ldsw	[%l7 + %l5],	%o0
	bleu,a	%xcc,	loop_183
	ld	[%l7 + 0x0C],	%f30
	nop
	set	0x20, %i4
	std	%f24,	[%l7 + %i4]
	nop
	set	0x68, %g2
	stw	%i6,	[%l7 + %g2]
loop_183:
	nop
	set	0x38, %i6
	ldsw	[%l7 + %i6],	%l2
	bg	%icc,	loop_184
	nop
	set	0x2C, %g6
	lduw	[%l7 + %g6],	%g6
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x76, %g5
	ldsh	[%l7 + %g5],	%o6
loop_184:
	nop
	set	0x0E, %i1
	ldsh	[%l7 + %i1],	%l5
	set	0x64, %l4
	sta	%f27,	[%l7 + %l4] 0x88
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x81
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x89,	 3
	nop
	set	0x5A, %g3
	ldsh	[%l7 + %g3],	%i2
	nop
	set	0x4A, %o0
	lduh	[%l7 + %o0],	%i1
	or	%o2,	%l0,	%g5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%g3
	nop
	set	0x7C, %l0
	stw	%g4,	[%l7 + %l0]
	nop
	set	0x30, %i5
	stb	%i7,	[%l7 + %i5]
	nop
	set	0x28, %i2
	std	%o2,	[%l7 + %i2]
	set	0x54, %g1
	stwa	%l3,	[%l7 + %g1] 0xea
	membar	#Sync
	ld	[%l7 + 0x20],	%f19
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%o4
	set	0x35, %o1
	stba	%i5,	[%l7 + %o1] 0x80
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x88,	%o7
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%g2
	nop
	set	0x58, %i3
	stx	%l6,	[%l7 + %i3]
	nop
	set	0x24, %o4
	swap	[%l7 + %o4],	%i4
	set	0x57, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g1
	nop
	set	0x60, %i0
	stx	%fsr,	[%l7 + %i0]
	ld	[%l7 + 0x3C],	%f28
	set	0x40, %i7
	stwa	%l4,	[%l7 + %i7] 0x80
	set	0x0C, %l3
	sta	%f28,	[%l7 + %l3] 0x89
	nop
	set	0x52, %o5
	sth	%i3,	[%l7 + %o5]
	nop
	set	0x08, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x2E, %l5
	stb	%g7,	[%l7 + %l5]
	st	%f2,	[%l7 + 0x70]
	st	%f14,	[%l7 + 0x34]
	nop
	set	0x5F, %g7
	ldsb	[%l7 + %g7],	%o0
	ld	[%l7 + 0x4C],	%f5
	nop
	set	0x5A, %i4
	ldub	[%l7 + %i4],	%o1
	nop
	set	0x10, %i6
	std	%l2,	[%l7 + %i6]
	nop
	set	0x45, %g6
	ldstub	[%l7 + %g6],	%g6
	set	0x0E, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i6
	nop
	set	0x28, %g5
	stx	%o6,	[%l7 + %g5]
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%f4
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x89,	%i0
	set	0x44, %o6
	lda	[%l7 + %o6] 0x88,	%f20
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%i1
	fpadd16	%f20,	%f14,	%f30
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xd0
	nop
	set	0x2C, %g3
	sth	%o2,	[%l7 + %g3]
	nop
	set	0x57, %l4
	stb	%l0,	[%l7 + %l4]
	set	0x29, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g5
	set	0x74, %i5
	stwa	%i2,	[%l7 + %i5] 0x89
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%g4
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x88
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x40, %l2
	prefetcha	[%l7 + %l2] 0x89,	 3
	nop
	set	0x50, %o1
	lduh	[%l7 + %o1],	%i7
	nop
	set	0x54, %g4
	swap	[%l7 + %g4],	%o3
	set	0x46, %l0
	stha	%l3,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x7C, %o3
	ldsh	[%l7 + %o3],	%o4
	st	%f29,	[%l7 + 0x58]
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x81,	%i5
	nop
	set	0x0C, %o4
	ldub	[%l7 + %o4],	%g2
	fpsub16s	%f18,	%f16,	%f26
	nop
	set	0x10, %i0
	ldstub	[%l7 + %i0],	%l6
	nop
	set	0x34, %o7
	prefetch	[%l7 + %o7],	 4
	nop
	set	0x34, %i7
	ldsh	[%l7 + %i7],	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%l4
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x81,	 4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%o5
	set	0x3D, %o2
	stba	%g7,	[%l7 + %o2] 0x88
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x81,	 3
	nop
	set	0x13, %g7
	ldstub	[%l7 + %g7],	%o0
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x89,	%l2
	set	0x54, %l5
	lda	[%l7 + %l5] 0x88,	%f12
	or	%g6,	%i6,	%i0
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x89,	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%i1
	nop
	set	0x68, %i6
	stx	%o2,	[%l7 + %i6]
	nop
	set	0x10, %g5
	stw	%g5,	[%l7 + %g5]
	or	%l0,	%i2,	%g3
	set	0x1C, %i1
	swapa	[%l7 + %i1] 0x80,	%g4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%i7
	nop
	set	0x35, %g2
	ldub	[%l7 + %g2],	%o3
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x89,	%o4
	or	%i5,	%l3,	%g2
	nop
	set	0x14, %l6
	prefetch	[%l7 + %l6],	 4
	nop
	set	0x7E, %l1
	sth	%o7,	[%l7 + %l1]
	set	0x1C, %g3
	swapa	[%l7 + %g3] 0x81,	%g1
	set	0x58, %o0
	stwa	%l4,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x0C, %l4
	ldub	[%l7 + %l4],	%i4
	nop
	set	0x60, %i5
	std	%i6,	[%l7 + %i5]
	set	0x08, %i2
	stwa	%i3,	[%l7 + %i2] 0xeb
	membar	#Sync
	or	%g7,	%o5,	%o1
	nop
	set	0x73, %l2
	stb	%o0,	[%l7 + %l2]
	ld	[%l7 + 0x60],	%f10
	set	0x24, %o1
	stha	%l2,	[%l7 + %o1] 0x89
	set	0x1C, %g1
	swapa	[%l7 + %g1] 0x80,	%i6
	set	0x28, %l0
	stxa	%g6,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%l5
	nop
	set	0x1C, %i3
	prefetch	[%l7 + %i3],	 2
	set	0x20, %o4
	stxa	%o6,	[%l7 + %o4] 0xeb
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%o2
	nop
	set	0x70, %i0
	stw	%g5,	[%l7 + %i0]
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%i0
	nop
	set	0x0C, %g4
	lduw	[%l7 + %g4],	%l0
	set	0x56, %o5
	stba	%i2,	[%l7 + %o5] 0x89
	set	0x66, %i7
	ldstuba	[%l7 + %i7] 0x80,	%g4
	nop
	set	0x16, %o2
	lduh	[%l7 + %o2],	%l1
	set	0x38, %g7
	ldxa	[%l7 + %g7] 0x81,	%i7
	nop
	set	0x48, %i4
	sth	%g3,	[%l7 + %i4]
	add	%o3,	%i5,	%l3
	wr	%g2,	%o4,	%sys_tick
	set	0x57, %l3
	stba	%g1,	[%l7 + %l3] 0x81
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i4
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	and	%l4,	%l6,	%g7
	nop
	set	0x70, %l5
	stx	%o5,	[%l7 + %l5]
	ld	[%l7 + 0x60],	%f10
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf1
	membar	#Sync
	nop
	set	0x23, %i1
	ldsb	[%l7 + %i1],	%o1
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f16
	nop
	set	0x40, %o6
	lduw	[%l7 + %o6],	%o0
	set	0x38, %g2
	stwa	%l2,	[%l7 + %g2] 0x80
	nop
	nop
	setx	0x991C67F0F307987B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x7A299141E6ACCA9F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f16
	set	0x20, %l1
	ldda	[%l7 + %l1] 0xea,	%i2
	nop
	set	0x4A, %g3
	sth	%g6,	[%l7 + %g3]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xca
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x81,	 1
	set	0x20, %i5
	ldxa	[%l7 + %i5] 0x81,	%o6
	add	%l5,	%o2,	%g5
	ld	[%l7 + 0x18],	%f25
	st	%fsr,	[%l7 + 0x0C]
	set	0x08, %i2
	lda	[%l7 + %i2] 0x80,	%f16
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%f18
	set	0x60, %o1
	prefetcha	[%l7 + %o1] 0x81,	 4
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x89,	%f29
	set	0x3C, %l0
	sta	%f17,	[%l7 + %l0] 0x80
	set	0x60, %g1
	stda	%i0,	[%l7 + %g1] 0xe3
	membar	#Sync
	ld	[%l7 + 0x3C],	%f28
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%g4
	set	0x78, %o3
	stwa	%l1,	[%l7 + %o3] 0x81
	set	0x60, %o4
	stxa	%l0,	[%l7 + %o4] 0x81
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%o3
	set	0x78, %o7
	stxa	%i5,	[%l7 + %o7] 0x81
	set	0x7D, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l3
	set	0x60, %o5
	stba	%g2,	[%l7 + %o5] 0x80
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%i7
	set	0x10, %i7
	stwa	%o7,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x64, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x28, %g7
	std	%g0,	[%l7 + %g7]
	nop
	set	0x28, %i4
	std	%l4,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x10, %l3
	lduw	[%l7 + %l3],	%i4
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x80,	%l6
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xca
	set	0x48, %o2
	stxa	%g7,	[%l7 + %o2] 0x89
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x88,	%o4
	set	0x20, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o0
	set	0x34, %i1
	swapa	[%l7 + %i1] 0x81,	%o1
	nop
	set	0x5C, %g2
	ldsw	[%l7 + %g2],	%i3
	nop
	set	0x48, %o6
	swap	[%l7 + %o6],	%g6
	set	0x10, %l1
	lda	[%l7 + %l1] 0x89,	%f7
	nop
	set	0x38, %g3
	stx	%l2,	[%l7 + %g3]
	nop
	set	0x18, %l4
	ldx	[%l7 + %l4],	%o6
	set	0x5C, %o0
	swapa	[%l7 + %o0] 0x88,	%l5
	nop
	set	0x6E, %i2
	lduh	[%l7 + %i2],	%o2
	set	0x40, %l2
	stha	%i6,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x50, %o1
	stda	%g4,	[%l7 + %o1] 0x81
	set	0x10, %i5
	stda	%i0,	[%l7 + %i5] 0xe3
	membar	#Sync
	or	%i1,	%i2,	%l1
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x4C, %g1
	swap	[%l7 + %g1],	%g4
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f0
	nop
	set	0x0A, %i3
	sth	%l0,	[%l7 + %i3]
	nop
	set	0x3A, %o7
	ldsh	[%l7 + %o7],	%o3
	nop
	set	0x10, %o4
	ldsw	[%l7 + %o4],	%g3
	nop
	set	0x62, %i0
	sth	%l3,	[%l7 + %i0]
	set	0x70, %o5
	stda	%i4,	[%l7 + %o5] 0x81
	nop
	set	0x30, %i7
	std	%g2,	[%l7 + %i7]
	set	0x74, %g4
	sta	%f13,	[%l7 + %g4] 0x88
	add	%i7,	%o4,	%o7
	nop
	set	0x3B, %i4
	ldub	[%l7 + %i4],	%g1
	nop
	set	0x5D, %g7
	ldsb	[%l7 + %g7],	%i4
	nop
	set	0x1C, %g6
	ldstub	[%l7 + %g6],	%l6
	set	0x18, %l5
	lda	[%l7 + %l5] 0x80,	%f11
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%o5
	nop
	set	0x50, %o2
	ldsw	[%l7 + %o2],	%g7
	ld	[%l7 + 0x78],	%f5
	set	0x30, %l3
	lda	[%l7 + %l3] 0x89,	%f17
	nop
	set	0x16, %i6
	sth	%o0,	[%l7 + %i6]
	nop
	set	0x62, %i1
	ldsh	[%l7 + %i1],	%o1
	set	0x20, %g2
	stxa	%i3,	[%l7 + %g2] 0x89
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%g6
	set	0x52, %l1
	stha	%o6,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x50, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x58, %l4
	std	%f28,	[%l7 + %l4]
	nop
	set	0x68, %o0
	std	%l2,	[%l7 + %o0]
	ld	[%l7 + 0x28],	%f27
	nop
	set	0x6C, %g3
	sth	%o2,	[%l7 + %g3]
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%i6
	nop
	set	0x16, %i2
	lduh	[%l7 + %i2],	%g5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%l5
	nop
	set	0x70, %o1
	std	%f26,	[%l7 + %o1]
	nop
	set	0x7C, %i5
	swap	[%l7 + %i5],	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%l1
	set	0x43, %g1
	ldstuba	[%l7 + %g1] 0x80,	%l0
	nop
	set	0x50, %l0
	std	%f28,	[%l7 + %l0]
	nop
	set	0x10, %o3
	ldx	[%l7 + %o3],	%g4
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f0
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	st	%f13,	[%l7 + 0x6C]
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%o3
	st	%fsr,	[%l7 + 0x44]
	set	0x44, %o4
	swapa	[%l7 + %o4] 0x89,	%l3
	set	0x2D, %o5
	stba	%g2,	[%l7 + %o5] 0x81
	set	0x08, %i0
	stda	%i4,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f0
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%i7
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xe3,	%o6
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x89,	 1
	st	%f29,	[%l7 + 0x34]
	set	0x18, %l5
	ldxa	[%l7 + %l5] 0x81,	%i4
	add	%l6,	%l4,	%o5
	and	%o4,	%o0,	%g7
	set	0x58, %g6
	stwa	%i3,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x20, %l3
	swapa	[%l7 + %l3] 0x81,	%o1
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
	st	%f5,	[%l7 + 0x14]
	nop
	set	0x2C, %i1
	lduw	[%l7 + %i1],	%l2
	nop
	set	0x28, %g2
	std	%f0,	[%l7 + %g2]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%i6
	set	0x4D, %o6
	stba	%o6,	[%l7 + %o6] 0x81
	nop
	set	0x18, %l1
	stx	%i0,	[%l7 + %l1]
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x88,	%g4
	ld	[%l7 + 0x20],	%f19
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%l4
	nop
	set	0x3C, %o0
	lduh	[%l7 + %o0],	%i2
	set	0x1C, %l4
	stwa	%i1,	[%l7 + %l4] 0x88
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%g4
	nop
	set	0x78, %g3
	std	%f20,	[%l7 + %g3]
	set	0x24, %l2
	sta	%f16,	[%l7 + %l2] 0x89
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x2C, %i2
	lda	[%l7 + %i2] 0x80,	%f13
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%l1
	ld	[%l7 + 0x60],	%f15
	nop
	set	0x32, %i5
	sth	%l3,	[%l7 + %i5]
	nop
	set	0x4B, %g1
	ldstub	[%l7 + %g1],	%o3
	set	0x60, %o3
	sta	%f10,	[%l7 + %o3] 0x81
	nop
	set	0x20, %l0
	lduh	[%l7 + %l0],	%i5
	nop
	set	0x78, %i3
	std	%g2,	[%l7 + %i3]
	st	%f26,	[%l7 + 0x74]
	nop
	set	0x44, %o7
	stb	%o7,	[%l7 + %o7]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xca
	set	0x6C, %o5
	lda	[%l7 + %o5] 0x89,	%f5
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x80,	 3
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f2
	nop
	set	0x10, %i7
	std	%g0,	[%l7 + %i7]
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f12
	ld	[%l7 + 0x44],	%f1
	nop
	set	0x14, %i4
	stw	%i4,	[%l7 + %i4]
	set	0x68, %g6
	sta	%f27,	[%l7 + %g6] 0x88
	nop
	set	0x20, %l5
	std	%f8,	[%l7 + %l5]
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc2
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o5
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%o4
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%l4
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%o0
	and	%g7,	%i3,	%o1
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0
	set	0x30, %g5
	sta	%f16,	[%l7 + %g5] 0x81
	nop
	set	0x70, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f16
	nop
	set	0x62, %g3
	ldstub	[%l7 + %g3],	%o2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%i6
	set	0x3C, %l2
	swapa	[%l7 + %l2] 0x89,	%o6
	and	%i0,	%g5,	%l5
	st	%fsr,	[%l7 + 0x20]
	set	0x68, %o0
	stwa	%i1,	[%l7 + %o0] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%i2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xeb,	%g4
	nop
	set	0x61, %o1
	ldstub	[%l7 + %o1],	%l1
	st	%fsr,	[%l7 + 0x70]
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x88,	%l3
	nop
	set	0x10, %o3
	stw	%g3,	[%l7 + %o3]
	and	%o3,	%g2,	%o7
	nop
	set	0x2C, %l0
	swap	[%l7 + %l0],	%i7
	set	0x08, %i5
	stxa	%g1,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%i5,	%i4,	%o5
	nop
	set	0x22, %o7
	ldstub	[%l7 + %o7],	%o4
	set	0x48, %o4
	stwa	%l6,	[%l7 + %o4] 0x80
	nop
	set	0x58, %i3
	lduw	[%l7 + %i3],	%o0
	nop
	set	0x38, %o5
	std	%f14,	[%l7 + %o5]
	set	0x08, %l6
	sta	%f18,	[%l7 + %l6] 0x81
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%g7
	nop
	set	0x1C, %i7
	ldsw	[%l7 + %i7],	%l4
	add	%i3,	%g6,	%o2
	set	0x3F, %g7
	stba	%o1,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%i6
	nop
	set	0x68, %i0
	std	%l2,	[%l7 + %i0]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd8,	%f16
	and	%i0,	%g5,	%o6
	ld	[%l7 + 0x0C],	%f10
	and	%i1,	%l0,	%i2
	nop
	set	0x50, %l3
	swap	[%l7 + %l3],	%g4
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	wr	%l1,	%l3,	%ccr
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x89
	nop
	set	0x50, %g2
	stx	%l5,	[%l7 + %g2]
	set	0x58, %o6
	stxa	%o3,	[%l7 + %o6] 0xe3
	membar	#Sync
	and	%g2,	%g3,	%o7
	set	0x78, %i6
	stba	%g1,	[%l7 + %i6] 0x89
	set	0x70, %l1
	stxa	%i7,	[%l7 + %l1] 0x89
	nop
	set	0x38, %o2
	ldx	[%l7 + %o2],	%i4
	nop
	set	0x6E, %l4
	sth	%i5,	[%l7 + %l4]
	set	0x40, %g5
	lda	[%l7 + %g5] 0x81,	%f28
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x18]
	set	0x70, %o0
	swapa	[%l7 + %o0] 0x88,	%o4
	set	0x10, %i2
	stda	%i6,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x50, %o1
	stxa	%o5,	[%l7 + %o1] 0x80
	set	0x4C, %g1
	sta	%f17,	[%l7 + %g1] 0x80
	nop
	set	0x58, %o3
	ldx	[%l7 + %o3],	%o0
	set	0x14, %l0
	stwa	%g7,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x54, %i5
	swap	[%l7 + %i5],	%l4
	nop
	set	0x6C, %l2
	stw	%i3,	[%l7 + %l2]
	nop
	set	0x40, %o7
	std	%f0,	[%l7 + %o7]
	st	%f9,	[%l7 + 0x78]
	set	0x58, %i3
	lda	[%l7 + %i3] 0x89,	%f25
	nop
	set	0x30, %o5
	ldsh	[%l7 + %o5],	%g6
	nop
	set	0x38, %o4
	ldsb	[%l7 + %o4],	%o2
	nop
	set	0x40, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x4C, %i7
	lduw	[%l7 + %i7],	%i6
	set	0x6C, %g4
	lda	[%l7 + %g4] 0x81,	%f16
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%l2
	add	%o1,	%g5,	%o6
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x89,	%i0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f0
	nop
	set	0x6C, %l3
	swap	[%l7 + %l3],	%l0
	nop
	set	0x08, %i4
	std	%i0,	[%l7 + %i4]
	set	0x58, %i1
	stda	%i2,	[%l7 + %i1] 0x88
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%g4
	nop
	set	0x70, %g2
	stw	%l5,	[%l7 + %g2]
	set	0x18, %l5
	lda	[%l7 + %l5] 0x81,	%f26
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%o2
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x80,	 4
	nop
	set	0x1C, %o2
	ldsb	[%l7 + %o2],	%l3
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xda,	%f0
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xe3,	%g2
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x88,	%o7
	nop
	set	0x4C, %o0
	sth	%i7,	[%l7 + %o0]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%i5
	nop
	set	0x5C, %i2
	stw	%g1,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x08, %g5
	stx	%l6,	[%l7 + %g5]
	nop
	nop
	setx	0x05E64FF707EEDCE6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA4C9DA301A106679,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f30,	%f12
	nop
	nop
	setx	0xC928B82836748308,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xAF8ADD2585C0CAD3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f22,	%f30
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%o4
	and	%g7,	%o0,	%l4
	nop
	set	0x31, %g1
	ldsb	[%l7 + %g1],	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%o2
	nop
	set	0x28, %o3
	stx	%l2,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x10]
	wr	%i6,	%o1,	%softint
	set	0x3C, %l0
	sta	%f4,	[%l7 + %l0] 0x88
	nop
	set	0x2C, %o1
	ldstub	[%l7 + %o1],	%g5
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%f14
	set	0x52, %o7
	stba	%i0,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x78, %i3
	stxa	%o6,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x79, %l2
	stba	%i1,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x50, %o5
	stha	%i2,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x0C, %o4
	stha	%l1,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x38, %i7
	stb	%g4,	[%l7 + %i7]
	set	0x54, %l6
	swapa	[%l7 + %l6] 0x81,	%l5
	set	0x24, %g7
	stwa	%l0,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x50, %i0
	stx	%o3,	[%l7 + %i0]
	nop
	set	0x50, %g4
	ldsb	[%l7 + %g4],	%l3
	add	%g2,	%g3,	%i7
	set	0x18, %g6
	lda	[%l7 + %g6] 0x89,	%f19
	nop
	set	0x52, %l3
	sth	%o7,	[%l7 + %l3]
	nop
	set	0x64, %i4
	ldsh	[%l7 + %i4],	%i5
	nop
	nop
	setx	0x15D67D65,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB6C37CB4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f1,	%f28
	set	0x60, %g2
	prefetcha	[%l7 + %g2] 0x89,	 0
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f16
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x88,	%i4
	nop
	set	0x3C, %o6
	stw	%l6,	[%l7 + %o6]
	and	%o5,	%o4,	%g7
	set	0x48, %l1
	stda	%o0,	[%l7 + %l1] 0x80
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x89,	%l4
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x89
	st	%fsr,	[%l7 + 0x54]
	set	0x2C, %i6
	stwa	%i3,	[%l7 + %i6] 0x81
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f14
	nop
	set	0x0F, %i2
	ldsb	[%l7 + %i2],	%g6
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f16
	nop
	set	0x60, %g3
	std	%f8,	[%l7 + %g3]
	nop
	set	0x78, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x38, %l0
	prefetcha	[%l7 + %l0] 0x80,	 3
	nop
	set	0x1F, %o3
	ldub	[%l7 + %o3],	%i6
	nop
	set	0x33, %o1
	stb	%o1,	[%l7 + %o1]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%o2
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x81,	%o6
	set	0x74, %i5
	lda	[%l7 + %i5] 0x80,	%f27
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xca
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
	ld	[%l7 + 0x48],	%f26
	nop
	set	0x3D, %o4
	stb	%i1,	[%l7 + %o4]
	nop
	set	0x37, %i7
	ldsb	[%l7 + %i7],	%i2
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf0
	membar	#Sync
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xca
	nop
	set	0x64, %o5
	stw	%l1,	[%l7 + %o5]
	ld	[%l7 + 0x10],	%f2
	set	0x50, %i0
	stda	%g4,	[%l7 + %i0] 0x80
	nop
	set	0x26, %g4
	stb	%i0,	[%l7 + %g4]
	nop
	set	0x58, %g6
	swap	[%l7 + %g6],	%l0
	nop
	set	0x66, %i4
	lduh	[%l7 + %i4],	%l5
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xda
	nop
	set	0x08, %i1
	lduh	[%l7 + %i1],	%l3
	nop
	set	0x30, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x58, %o6
	std	%f10,	[%l7 + %o6]
	nop
	set	0x3E, %l1
	ldstub	[%l7 + %l1],	%o3
	nop
	set	0x34, %l5
	ldub	[%l7 + %l5],	%g2
	nop
	set	0x1E, %o2
	sth	%g3,	[%l7 + %o2]
	set	0x5C, %l4
	stha	%o7,	[%l7 + %l4] 0x89
	and	%i7,	%g1,	%i5
	set	0x10, %i6
	lda	[%l7 + %i6] 0x81,	%f26
	nop
	set	0x6C, %o0
	sth	%i4,	[%l7 + %o0]
	nop
	set	0x48, %i2
	prefetch	[%l7 + %i2],	 0
	nop
	set	0x73, %g5
	ldub	[%l7 + %g5],	%l6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc0
	or	%o5,	%o4,	%o0
	set	0x0C, %l0
	stba	%g7,	[%l7 + %l0] 0x81
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x80,	%i3
	and	%l4,	%g6,	%l2
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%o1
	nop
	nop
	setx	0xD1D1C1CA5EE7BDC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xEAC153DF87A6A29F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f8,	%f4
	nop
	set	0x5A, %o7
	stb	%i6,	[%l7 + %o7]
	nop
	set	0x1C, %i5
	stw	%o2,	[%l7 + %i5]
	set	0x18, %o1
	swapa	[%l7 + %o1] 0x81,	%o6
	set	0x10, %i3
	ldxa	[%l7 + %i3] 0x80,	%g5
	or	%i2,	%l1,	%i1
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%g4
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f16
	st	%f11,	[%l7 + 0x70]
	set	0x3C, %l2
	lda	[%l7 + %l2] 0x81,	%f3
	set	0x48, %l6
	ldstuba	[%l7 + %l6] 0x89,	%l0
	nop
	set	0x66, %o5
	stb	%i0,	[%l7 + %o5]
	set	0x58, %g7
	stxa	%l5,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x0E, %g4
	ldstub	[%l7 + %g4],	%l3
	set	0x76, %i0
	stha	%o3,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x6A, %g6
	stb	%g3,	[%l7 + %g6]
	nop
	set	0x5C, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x34, %i1
	lduw	[%l7 + %i1],	%o7
	fpadd16	%f0,	%f12,	%f6
	nop
	set	0x7B, %l3
	ldub	[%l7 + %l3],	%i7
	set	0x5C, %o6
	stba	%g1,	[%l7 + %o6] 0x80
	set	0x40, %g2
	stda	%i4,	[%l7 + %g2] 0x81
	nop
	set	0x45, %l5
	ldub	[%l7 + %l5],	%i4
	nop
	set	0x58, %l1
	std	%g2,	[%l7 + %l1]
	nop
	set	0x2F, %o2
	ldsb	[%l7 + %o2],	%l6
	and	%o5,	%o4,	%o0
	nop
	set	0x1E, %i6
	ldsh	[%l7 + %i6],	%g7
	nop
	set	0x0C, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x7C, %l4
	swap	[%l7 + %l4],	%l4
	set	0x40, %g5
	lda	[%l7 + %g5] 0x89,	%f1
	nop
	set	0x68, %g1
	ldsw	[%l7 + %g1],	%i3
	wr	%g6,	%l2,	%ccr
	nop
	set	0x20, %i2
	std	%i6,	[%l7 + %i2]
	or	%o2,	%o1,	%g5
	nop
	set	0x4A, %l0
	lduh	[%l7 + %l0],	%o6
	set	0x74, %o3
	lda	[%l7 + %o3] 0x88,	%f8
	nop
	set	0x6E, %o7
	ldsb	[%l7 + %o7],	%i2
	add	%i1,	%l1,	%g4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%l5
	fpadd32	%f18,	%f26,	%f10
	set	0x38, %g3
	stxa	%l3,	[%l7 + %g3] 0x89
	nop
	nop
	setx	0x26AC277EDD16C9F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF2ED2428EC5F43F6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f4,	%f26
	nop
	set	0x78, %i5
	stw	%l0,	[%l7 + %i5]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%o7
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%i7
	set	0x0E, %o4
	stha	%g3,	[%l7 + %o4] 0x89
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%f20
	ld	[%l7 + 0x30],	%f28
	set	0x20, %i7
	stxa	%i5,	[%l7 + %i7] 0x80
	wr	%i4,	%g1,	%sys_tick
	nop
	set	0x48, %l2
	ldsw	[%l7 + %l2],	%l6
	nop
	set	0x54, %l6
	lduw	[%l7 + %l6],	%o5
	nop
	set	0x60, %o5
	lduw	[%l7 + %o5],	%g2
	fpadd32s	%f17,	%f6,	%f13
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%o4
	bg,a	%icc,	loop_185
	nop
	set	0x1C, %g7
	stw	%g7,	[%l7 + %g7]
	or	%l4,	%i3,	%l2
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f16
loop_185:
	nop
	set	0x38, %i0
	lda	[%l7 + %i0] 0x81,	%f28
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 0
	ble	%xcc,	loop_186
	add	%g6,	%i6,	%o1
	st	%f15,	[%l7 + 0x58]
	nop
	set	0x24, %i1
	prefetch	[%l7 + %i1],	 1
loop_186:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%o2
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%i2
	nop
	set	0x7C, %i4
	lduh	[%l7 + %i4],	%i1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%g4
	fpadd32s	%f24,	%f16,	%f11
	set	, %o6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1261
!	Type a   	: 18
!	Type cti   	: 21
!	Type x   	: 547
!	Type f   	: 45
!	Type i   	: 108
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


EXIT_GOOD	/* test finish  */

  /************************************************************************
  Test case data start
  ************************************************************************/
  .data
user_data_start:
scratch_area:
!! thread 0 data, 64 words.
.word 0xDB2335CA
.word 0x2831DF8C
.word 0x3383316E
.word 0x53AFD9E9
.word 0x08E52B20
.word 0x30ABCAF8
.word 0x6B01255B
.word 0xE06D201C
.word 0xE932293C
.word 0xE450BC99
.word 0x5DACC622
.word 0x446984C4
.word 0xF7B4FFC0
.word 0x9B707A68
.word 0x39D9A24A
.word 0x50D63C10
.word 0xB38F2BFA
.word 0xEE1A3E8C
.word 0xDFC8D05D
.word 0x91EC7C03
.word 0x785ADED1
.word 0x7439F85D
.word 0xCA5BF95F
.word 0x4C11E13C
.word 0x78D2E655
.word 0xB263B73C
.word 0x15A8067D
.word 0x4488B684
.word 0x7ADC45A5
.word 0x672A4C97
.word 0x8B342BC6
.word 0xE2517C95
.word 0x0A996F4F
.word 0x9F52773B
.word 0x67166086
.word 0x1A6E3268
.word 0x9BF08B6F
.word 0xA4AEE3D4
.word 0xFC7B52B8
.word 0x0920CD6D
.word 0x9E40DE46
.word 0xB0D45F45
.word 0xADF82A2D
.word 0x4C036002
.word 0x749EC434
.word 0xA56499FD
.word 0xA6B17E3E
.word 0xB01C9DB1
.word 0xED0567C9
.word 0x2D09A297
.word 0x0EEF8B75
.word 0xA66301A6
.word 0x816183FD
.word 0x05431341
.word 0xE19AA808
.word 0x11B5C88D
.word 0xF5A67A97
.word 0xA7221450
.word 0x32733517
.word 0x4F496461
.word 0xCE09A34B
.word 0x9F8988BA
.word 0x5EA5B248
.word 0x0D31F2FF
!! thread 1 data, 64 words.
.word 0x65B5F637
.word 0x1B65AA0F
.word 0xE5E55EEE
.word 0x5FD5AFE5
.word 0xE2BBA270
.word 0x1D1B32D5
.word 0x3FDB02B6
.word 0x1DBB2BA0
.word 0xDB4A68FD
.word 0x8B191AD7
.word 0xFD1B7718
.word 0x75DB56BC
.word 0xB5BAF649
.word 0x877C72EC
.word 0x91AC9297
.word 0xE024EA6E
.word 0xD3CB4815
.word 0xEBAAB155
.word 0xD658C08F
.word 0x65C16A4C
.word 0xA4F9646C
.word 0x2A8FC373
.word 0x42FB4504
.word 0x0F819AB8
.word 0x36EE4847
.word 0x805485DD
.word 0x23CAB0CE
.word 0x5913C093
.word 0xB192A2A5
.word 0x1F9C4CCD
.word 0x3436FD8A
.word 0x6EF3FD08
.word 0x011B62FF
.word 0xD1E463A3
.word 0x96E11CF2
.word 0xE054740A
.word 0x6699A8EE
.word 0x4495C3C9
.word 0xAB8248CE
.word 0x3D494037
.word 0x9B09A7B7
.word 0x6CB69B1F
.word 0xBB1E364F
.word 0xD0AD50FC
.word 0xFBF99251
.word 0x2253EC47
.word 0x691772C7
.word 0x8D23B443
.word 0xEFEBBD9A
.word 0x58D3F1E6
.word 0xB760F7F6
.word 0x30843D53
.word 0x6549852C
.word 0x5D53C225
.word 0xBC6F9D20
.word 0x32E06B85
.word 0x4ED7EF15
.word 0xE4B3BEE4
.word 0xCD81F685
.word 0xF8219322
.word 0x13BFE85B
.word 0xBC5AE054
.word 0x57F6D246
.word 0xE788018C
!! thread 2 data, 64 words.
.word 0x970ABC18
.word 0xD7561034
.word 0x49E48459
.word 0x05E1C075
.word 0x41B7265E
.word 0x98CB44C3
.word 0x363C2897
.word 0xC64C1136
.word 0x1A424537
.word 0x727A768B
.word 0x257ECCA9
.word 0x57B0492C
.word 0xA5856D76
.word 0xACA8060F
.word 0xB0D4D36E
.word 0x688BA679
.word 0x034E6642
.word 0xDA30C07B
.word 0xE61EE89F
.word 0x65AF8293
.word 0x68613681
.word 0xAAB4F6F2
.word 0xEE80767B
.word 0x9A532A7A
.word 0xEA950ADC
.word 0x7B1F8EB2
.word 0x4A4301F1
.word 0x5C4A0A76
.word 0x35C7EA90
.word 0xDCF18933
.word 0x0B5639CC
.word 0xEFD7EB20
.word 0x953A2CF0
.word 0xE5333814
.word 0x06A35722
.word 0xEE3D1671
.word 0x268CBA48
.word 0x2E7E88CA
.word 0xD2D6F4AB
.word 0x6A347211
.word 0xA7010072
.word 0x4489F406
.word 0x4D4865B3
.word 0x8921425A
.word 0x3277A78E
.word 0x85CE7E8B
.word 0x91334DBB
.word 0xD8B7610E
.word 0x522C1544
.word 0x2EC8AEDE
.word 0xFED79FA9
.word 0xE18E7F1F
.word 0xB23FDE07
.word 0x2C61AF89
.word 0x665EE85E
.word 0xB94A7CA5
.word 0xCC04AC03
.word 0xDF544BD2
.word 0x484BE1B6
.word 0x0E0F2E43
.word 0x531CC3C8
.word 0x31A0C5D6
.word 0xA2759E89
.word 0x09D4F075
!! thread 3 data, 64 words.
.word 0x7FB61F11
.word 0x38E96524
.word 0x088C6013
.word 0xC2365079
.word 0xAC5CA788
.word 0x3EA834A7
.word 0x08A15F93
.word 0xC1B8AA75
.word 0xA49F15F0
.word 0xF79CDAFE
.word 0xAA56F0C5
.word 0xADC0F83A
.word 0x6EA29EE8
.word 0x30F06170
.word 0x62B894D7
.word 0x898EEDF7
.word 0x00613D30
.word 0x6A6DAEEC
.word 0x28657A3F
.word 0x8D87EBC3
.word 0xE3CB0322
.word 0x0A1F8172
.word 0x94E9E553
.word 0xBD19F08B
.word 0x384B7216
.word 0xCF9EC911
.word 0xB319DDA8
.word 0x1E9B8CC1
.word 0x2D9F0793
.word 0x5399F18D
.word 0x5E6ADA46
.word 0xD1C276A6
.word 0x28BFB516
.word 0x0BC95250
.word 0xE7C7F57F
.word 0xDDF5B5DF
.word 0x60B6219B
.word 0xFC8A9582
.word 0x290D3EC2
.word 0xE23CF72D
.word 0x44E9CB6F
.word 0xE7404D67
.word 0xBB6E3042
.word 0x5167494A
.word 0x4049661E
.word 0xF970812C
.word 0xB6E91D50
.word 0x5E2DD08F
.word 0x03CD3BFB
.word 0x4A2A070F
.word 0x23AEF109
.word 0x80D3A5B6
.word 0xFEDB9D3A
.word 0x8469D5B7
.word 0x22BAF6EA
.word 0xB2D78BEE
.word 0xDB67485B
.word 0x138DD483
.word 0x2A112EFF
.word 0x48CD21C1
.word 0xFEE2996D
.word 0xCDC152B3
.word 0x849F36B3
.word 0x303F0DA1
!! thread 4 data, 64 words.
.word 0x3DA9A7B8
.word 0x24006522
.word 0x6F13CDE9
.word 0x4A39085D
.word 0x1DEF5BDE
.word 0x34BAA1C9
.word 0xA22AFF65
.word 0x7441E4F1
.word 0x76431D58
.word 0x08FCABA0
.word 0x3382DAA4
.word 0x6C7D5AF5
.word 0x9BDCBBCB
.word 0xC038DA1A
.word 0x5E1F369D
.word 0x4380AEFB
.word 0x2BAB88FA
.word 0x61D110B7
.word 0xC80E360F
.word 0x3248D92E
.word 0x2F25A406
.word 0x87FD1EBE
.word 0x21432BB5
.word 0xEE3EB3C2
.word 0xA0E3C457
.word 0x9BB04062
.word 0xC4324A59
.word 0x833877D0
.word 0x4E688599
.word 0x0E9E92E9
.word 0x33145FCD
.word 0x2D748692
.word 0xA8B884FA
.word 0xFE907114
.word 0x9EBF26BB
.word 0x06A48BC7
.word 0x26A55AF4
.word 0x354723CA
.word 0xEE42CD6C
.word 0xCABF855E
.word 0x86BC8E6E
.word 0x38938291
.word 0x33CCCDD5
.word 0xBE8577AA
.word 0x1CBC846B
.word 0x7217DFB6
.word 0xEA52965E
.word 0x63FB956E
.word 0xBD01C4FD
.word 0xA24FC0DA
.word 0x6CC4A436
.word 0x3B2DA5F6
.word 0x1848E1E2
.word 0x4A7FB7F7
.word 0x98C93730
.word 0x31A36DF4
.word 0x015E2655
.word 0x5A4A762A
.word 0xA0C5BC1B
.word 0x83350347
.word 0x2CDCDBC1
.word 0xC318A162
.word 0x71B14848
.word 0xE5402417
!! thread 5 data, 64 words.
.word 0x4801510F
.word 0x1240C534
.word 0x5C943CD3
.word 0xA5070788
.word 0x86388809
.word 0x7EC50E77
.word 0xA0626C64
.word 0x7B927DB7
.word 0xFC351936
.word 0xFD2E8380
.word 0x130B5433
.word 0xD9A9A6EE
.word 0xC2F6C620
.word 0xA708B3EF
.word 0x2EEF55E6
.word 0x3C2FD394
.word 0x23E7AC64
.word 0xB93FFA71
.word 0xBF630112
.word 0x2AE53E0C
.word 0x28C8080A
.word 0x6FFD6F8B
.word 0xF37FC3BA
.word 0x16C6FD56
.word 0x453FFC04
.word 0x55029386
.word 0xC503966D
.word 0xB0DBB75C
.word 0x545B8BF3
.word 0x1A61FF0D
.word 0x008FFFF8
.word 0x1C59E4BF
.word 0x793F896C
.word 0xAB99838A
.word 0x50CA174E
.word 0xB595C265
.word 0x364D0605
.word 0xBE6DFC24
.word 0x0DE2C26C
.word 0xF8E3EFC8
.word 0x21794399
.word 0x47A68639
.word 0x31A27BC8
.word 0x5F33FF8C
.word 0x55FF268A
.word 0xEA9D484B
.word 0x3D9561AF
.word 0x107A73F7
.word 0x39F9EB1B
.word 0xC955AAF4
.word 0x87359076
.word 0xEBCB7E52
.word 0x720B04F5
.word 0x3996BA2A
.word 0xC58CF664
.word 0x38CCD773
.word 0x3C3D64F1
.word 0x6FA21148
.word 0xC6CF7195
.word 0x0C0ED570
.word 0xADA34543
.word 0x72B674DC
.word 0x634D7C44
.word 0xF66DE757
!! thread 6 data, 64 words.
.word 0xFABF89F1
.word 0xE1D0429A
.word 0x6FE7A430
.word 0x843D77EC
.word 0x8945C8F9
.word 0x9125D753
.word 0x15001512
.word 0xAB853CC9
.word 0xC85A5469
.word 0xA9A394DD
.word 0x5ADA7F8F
.word 0xED1FB3A3
.word 0xEC73EA7A
.word 0x2D476931
.word 0x5FF55AA3
.word 0x43AA4D3E
.word 0xA1A8D29E
.word 0xFBCCB0D5
.word 0xD5BEFA37
.word 0x38F300FE
.word 0x854F9CA6
.word 0x3D0690C4
.word 0x721E2503
.word 0x9F12F461
.word 0xEA0FF915
.word 0x6FC7F470
.word 0xC457FDFE
.word 0x8283F5EF
.word 0xBA5B56B8
.word 0xEF513400
.word 0xA95E5288
.word 0x4D52E944
.word 0xA13253DA
.word 0x24CCF8D9
.word 0xB1B92702
.word 0xA6E9483A
.word 0x59C16F65
.word 0x8FA4AD4E
.word 0x805FF856
.word 0x0E60A239
.word 0xC0D7AAEE
.word 0x85E101FD
.word 0x32FA426A
.word 0x3C9FD6BC
.word 0x18D577D0
.word 0xDEAFB32A
.word 0x8E91E9AF
.word 0x0EA6ADA6
.word 0xB69DF220
.word 0x6AEE8BFA
.word 0x241501BD
.word 0xA4E8AA66
.word 0xD5B542E1
.word 0x2541F840
.word 0x2D7ABDF5
.word 0xE92678B5
.word 0xA8035160
.word 0xB9948921
.word 0x28CF2864
.word 0x36C34B87
.word 0x64539209
.word 0x7720601F
.word 0x734F6493
.word 0x2924DEF0
!! thread 7 data, 64 words.
.word 0x6291B6C8
.word 0xE412323E
.word 0x7540F983
.word 0xDCBAA178
.word 0x7F21DD6C
.word 0x237DAB01
.word 0x87A1EF81
.word 0x4AD9B0B1
.word 0x85333872
.word 0xB95E888C
.word 0x3285DC90
.word 0xF194DDFD
.word 0x3B49594E
.word 0x3107720B
.word 0xE4988516
.word 0x190BA053
.word 0x9319908D
.word 0xE57AD830
.word 0xDD600FD0
.word 0xB181AF7D
.word 0x1F3B3785
.word 0xFC003334
.word 0xDC03622A
.word 0xBB9DB949
.word 0x3B98325D
.word 0x4575A799
.word 0xBE11D024
.word 0x3835204E
.word 0xB1B93065
.word 0x9CB5038B
.word 0xB51D7EF2
.word 0xD970A610
.word 0x35F7DBE0
.word 0xCEBB8FA2
.word 0x11A29E5E
.word 0xBE652389
.word 0x06FB9A45
.word 0xA53C43A4
.word 0xECEFC025
.word 0xD6329CC6
.word 0x9B121BCE
.word 0x3D9975E2
.word 0xAE5E3A81
.word 0x9B2DDA2D
.word 0x785BC445
.word 0x056E6A35
.word 0x90A8A7DE
.word 0x72DACCA3
.word 0xAA4B0880
.word 0x0B2191C4
.word 0xD63A8E26
.word 0x78911676
.word 0x52AFE4E5
.word 0x7C669DB4
.word 0x4E4A3109
.word 0xEE009927
.word 0x6223589B
.word 0x4EC48338
.word 0x8B560F40
.word 0x2C228CD6
.word 0xDE5DB94A
.word 0xEF0C6D94
.word 0xB57EE987
.word 0x2F59D20B
.end
